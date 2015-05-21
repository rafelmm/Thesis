#include "SM_image.h"
#include <stdlib.h>
#include <math.h>

#include "SM_SRAM.h"
#include "SM_camera.h"
#include "SM_ConfigParams.h"

window_t CURRENT_WINDOW;
window_t CURRENT_WINDOW_11;
window_t CURRENT_WINDOW_12;
window_t CURRENT_WINDOW_21;
window_t CURRENT_WINDOW_22;
uint8_t  POSICION_BARRA_ABAJO;
uint8_t  CAMERA_FREE;
uint32_t PIXELS_MARTILLO_1;
uint32_t PIXELS_MARTILLO_2;
float   PENDIENTE_LASER_1;
float   PENDIENTE_LASER_2;
float   ANGULO_MARTILLO_1;
float   ANGULO_MARTILLO_2;
float	 SIZE_PIXEL;
float   ALTURA_CAMARA;
float   ALTURA_MARTILLO;
float   FILTRO_MARTILLO_ALPHA;
float    CDX;
float 	 HOLGURA_MAX_1;
float    HOLGURA_MAX_2;
uint32_t MAX_PIXELS_EN_LABEL;


static Semaphore sem_camera_free;

static WORKING_AREA(waThreadGetDatosHolgura, 80000);
__attribute__((noreturn))
static void getDatosHolgura(void *arg){
	(void)arg;
	chRegSetThreadName("GetDatosHolgura");

	extern window_t WINDOW;
	extern window_t WINDOW_11;
	extern window_t WINDOW_12;
	extern window_t WINDOW_21;
	extern window_t WINDOW_22;
	extern window_t WINDOW_SMALL;
	extern window_t WINDOW_11_SMALL;
	extern window_t WINDOW_12_SMALL;
	extern window_t WINDOW_21_SMALL;
	extern window_t WINDOW_22_SMALL;

	Thread *tp;
	calculaHolguraRequest * msg;
	uint8_t modo_continuo = 0;

	do {
		modo_continuo = 0;

		//esperamos un mensage
	    tp = chMsgWait();
	    msg = (calculaHolguraRequest*)chMsgGet(tp);

	    uint32_t img_x;
	    uint32_t img_y;

	    if (msg->modo_continuo == 1 && msg->posicion_motor != POSICION_MOTOR_DESCONOCIDA) {
	    	//En modo continuo solamente miramos la ventana de la holgura si conocemos la posicion del motor
	    	modo_continuo = 1;
	    	if (msg->posicion_motor == POSICION_MOTOR_BARRAS_DENTRO){
	    		CURRENT_WINDOW = WINDOW_12;
	    	} else if(msg->posicion_motor == POSICION_MOTOR_BARRAS_FUERA){
	    		CURRENT_WINDOW = WINDOW_22;
	    	}
	    	msg->imagen.data  = Dest_Image_1;
	    	msg->imagen.width = CURRENT_WINDOW.width + 2*OFFSET_WINDOWS;
	    	msg->imagen.height = CURRENT_WINDOW.height + 2*OFFSET_WINDOWS;
	    	img_x = CURRENT_WINDOW.x-OFFSET_WINDOWS;
	    	img_y = CURRENT_WINDOW.y-OFFSET_WINDOWS;
	    } else {
			if (msg->tipo_imagen == BIG) {

				CURRENT_WINDOW = WINDOW;
				CURRENT_WINDOW_11 = WINDOW_11;
				CURRENT_WINDOW_12 = WINDOW_12;
				CURRENT_WINDOW_21 = WINDOW_21;
				CURRENT_WINDOW_22 = WINDOW_22;
			} else {

				CURRENT_WINDOW = WINDOW_SMALL;
				CURRENT_WINDOW_11 = WINDOW_11_SMALL;
				CURRENT_WINDOW_12 = WINDOW_12_SMALL;
				CURRENT_WINDOW_21 = WINDOW_21_SMALL;
				CURRENT_WINDOW_22 = WINDOW_22_SMALL;
			}
			msg->imagen.data   = Dest_Image_1;
			msg->imagen.width  = CURRENT_WINDOW.width;
			msg->imagen.height = CURRENT_WINDOW.height;
			img_x = CURRENT_WINDOW.x;
			img_y = CURRENT_WINDOW.y;
	    }

	    if (msg->con_flash == 1) {
	    	// Enciendo el LED del flash
	    	flashOn();
	    }

	    uint8_t ae_mode = AE_WINDOW_MEDIUM;
	    if (modo_continuo == 1){
	    	ae_mode = AE_WINDOW_SMALL;
	    } else if (msg->tipo_imagen == BIG && msg->con_laser == 1){
	    	ae_mode = AE_WINDOW_BIG_HALF;
	    } else if (msg->tipo_imagen == BIG && msg->con_laser == 0){
	    	ae_mode = AE_WINDOW_BIG;
	    } else if (msg->tipo_imagen == SMALL && msg->con_laser == 1){
	    	ae_mode = AE_WINDOW_MED_HALF;
	    } else {
	    	ae_mode = AE_WINDOW_MEDIUM;
	    }

	    if (modo_continuo == 0 && msg->con_laser == 1) {
	    	msg->imagen.data = getImageDoubleExposition(&msg->imagen.size,img_x,img_y,msg->imagen.width,msg->imagen.height, msg->imagen.data, msg->modo_continuo==0?1:0, ae_mode);
	    } else {
	    	msg->imagen.data = getImageYCbCr(&msg->imagen.size, img_x, img_y, msg->imagen.width, msg->imagen.height, ae_mode, msg->imagen.data);
	    }


	    if (msg->con_flash == 1){
	    	//Apago el LED del flash
	    	flashOff();
	    }

	    if (modo_continuo == 1 && msg->posicion_motor != POSICION_MOTOR_DESCONOCIDA){
	    	calcular_holgura_continuo(msg->imagen.data, &msg->posicion_motor, &msg->holgura);
	    } else if (msg->con_calculo_holgura == 1){
	    	calcular_holgura(msg->imagen.data, msg->aplicar_correccion, msg->con_realidad_aumentada, &msg->posicion_motor, &msg->holgura);
	    }

	    if (modo_continuo == 0 && msg->con_realidad_aumentada == 1){
	    	sm_ycbcr_t color = sm_rgb2ycbcr((sm_rgb_t){255,255,255});
			sm_plot_windows(msg->imagen, color);
			if (get_laser_potencia2_value() != get_laser_potencia1_value()){
				uint32_t x = (CURRENT_WINDOW_11.x+CURRENT_WINDOW_12.x+CURRENT_WINDOW_12.width)/2;
				sm_plot_linea_v(msg->imagen, x,0,msg->imagen.height, color);
			}
	    }

	    if (msg->comprimida == 1) {
	    	//Cuando comprimimos la imagen el resultado se queda en el segundo bloque de la SRAM
	    	msg->imagen.size = comprimeYCbCr(msg->imagen.width,msg->imagen.height,msg->imagen.data, Dest_Image_2); // Comprimimos la imagen
	    	msg->imagen.data = Dest_Image_2;
	    }

	    /* answering with the same message */
	    chMsgRelease(tp, msg);
	} while (msg);
}

Thread* getDatosHolguraThread;
void initGetDatosHolgura(void){

	POSICION_BARRA_ABAJO = get_posicion_barra_abajo();
	PIXELS_MARTILLO_1 = 383;
	PIXELS_MARTILLO_2 = 383;
	ANGULO_MARTILLO_1 = get_angulo_martillo_1();
	ANGULO_MARTILLO_2 = get_angulo_martillo_2();
	SIZE_PIXEL = get_size_pixel();
	ALTURA_CAMARA = 135.4;
	ALTURA_MARTILLO = 17.5;
	FILTRO_MARTILLO_ALPHA = 0.6;
	CDX = get_CDX();
	HOLGURA_MAX_1 = get_holgura_maxima_1();
	HOLGURA_MAX_2 = get_holgura_maxima_2();
	MAX_PIXELS_EN_LABEL=5;
	CAMERA_FREE = 1;
	PENDIENTE_LASER_1 = 0;
	PENDIENTE_LASER_2 = 0;
	chSemInit(&sem_camera_free, 1);

	getDatosHolguraThread = chThdCreateStatic(waThreadGetDatosHolgura, sizeof(waThreadGetDatosHolgura), NORMALPRIO, getDatosHolgura, NULL);
}

void block_camera(){
	chSemWait(&sem_camera_free);
	CAMERA_FREE = 0;
	chSemSignal(&sem_camera_free);
}

void free_camera(){
	chSemWait(&sem_camera_free);
	CAMERA_FREE = 1;
	chSemSignal(&sem_camera_free);
}

void wait_until_camera_free(){
	chSemWait(&sem_camera_free);
	uint8_t estadoCamara = CAMERA_FREE;
	chSemSignal(&sem_camera_free);

	while (estadoCamara == 0){
		chThdSleep(10);
		chSemWait(&sem_camera_free);
		estadoCamara = CAMERA_FREE;
		chSemSignal(&sem_camera_free);
	}

	//Lo último que hace la función es bloquear la cámara nuevamente. Despues de hacer el wait, siempre habrá que hacer un free para volver a usar la cámara
	block_camera();
}

void sm_actualizar_posicion_barra_abajo(uint8_t nueva_posicion){
	POSICION_BARRA_ABAJO = nueva_posicion;
	set_posicion_barra_abajo(nueva_posicion);
}

void sm_actualizar_angulo_martillo_1(float value){
	ANGULO_MARTILLO_1 = value;
	set_angulo_martillo_1(value);
}

void sm_actualizar_angulo_martillo_2(float value){
	ANGULO_MARTILLO_2 = value;
	set_angulo_martillo_2(value);
}

void sm_actualizar_CDX(float value){
	CDX = value;
	set_CDX(value);
}

void sm_actualizar_holgura_max_1(float value){
	HOLGURA_MAX_1 = value;
	set_holgura_maxima_1(value);
}

void sm_actualizar_holgura_max_2(float value){
	HOLGURA_MAX_2 = value;
	set_holgura_maxima_2(value);
}


void sm_actualizar_size_pixel(float value){
	SIZE_PIXEL = value;
	set_size_pixel(value);
}

sm_image_t getImage(uint8_t con_flash, uint8_t con_laser, uint8_t con_realidad_aumentada, tipoImage_t tipo_imagen, uint8_t comprimida){
	calculaHolguraRequest r;
	r.tipo_imagen = tipo_imagen;
	r.con_calculo_holgura = con_realidad_aumentada;
	r.aplicar_correccion = 1;
	r.con_flash = con_flash;
	r.con_laser = con_laser;
	r.con_realidad_aumentada = con_realidad_aumentada;
	r.modo_continuo = 0 ;
	r.comprimida = comprimida;
	//Esperamos que se libere la cámara
	wait_until_camera_free();

	//Enviamos el mensage al thread de captura para que capture la imagen y calcule la holgura.
	chMsgSend(getDatosHolguraThread,&r);

	return r.imagen;
}

sm_image_t getHolgura(uint8_t aplicar_correccion, uint8_t modo_continuo, float *holgura, uint8_t *posicion_motor, uint8_t send_image, uint8_t con_realidad_aumentada, uint8_t comprimida){
	calculaHolguraRequest r;
	r.tipo_imagen = SMALL;
	r.con_calculo_holgura = 1;
	r.aplicar_correccion = aplicar_correccion;
	r.con_flash = 0;
	r.con_laser = 1;
	r.con_realidad_aumentada = con_realidad_aumentada;
	r.modo_continuo = modo_continuo;
	r.posicion_motor = *posicion_motor;
	r.comprimida = comprimida;

	//Esperamos que se libere la cámara
	wait_until_camera_free();

	//Enviamos el mensage al thread de captura para que capture la imagen y calcule la holgura.
	chMsgSend(getDatosHolguraThread,&r);


	if (send_image == FALSE){
		//Solamente si no se tiene que enviar la imagen
		//liberamos directamente la cámara ya que en este caso no nos interesa la imagen y los datos calculados ya los tenemos. Dejamos que cualquier otro thread pueda usar la cámara
		free_camera();
	}

	*holgura = r.holgura;
	*posicion_motor = r.posicion_motor;

	return r.imagen;
}

void calcular_holgura(uint8_t* imagen, uint8_t aplicar_correccion, uint8_t con_realidad_aumentada,  uint8_t *posicion_motor, float *holgura){

	sm_image_t img;
	img.data = imagen;
	img.width = CURRENT_WINDOW.width;
	img.height = CURRENT_WINDOW.height;

	uint32_t window_width = CURRENT_WINDOW.width;
	uint32_t window_height = CURRENT_WINDOW.height;
	uint32_t offset_windows = OFFSET_WINDOWS;

	uint8_t* slots_ventanas[8];

	uint32_t bytes_ventana = 2*(CURRENT_WINDOW_11.width+2*offset_windows)*(CURRENT_WINDOW_11.height+2*offset_windows);
	uint8_t i=0;

	for (i=0;i<8;i++){
		slots_ventanas[i] = Dest_Image_3+bytes_ventana*i;
	}

	uint8_t *ventanas = slots_ventanas[0];

	sm_getWindows(imagen, window_width, ventanas, bytes_ventana, offset_windows);

	window_width = CURRENT_WINDOW_11.width+2*offset_windows;
	window_height = CURRENT_WINDOW_11.height+2*offset_windows;

	uint32_t w_width, w_height;
	int16_t label_left[4];
	int16_t label_right[4];
	uint8_t ventana_con_linea[4];
	//Para no tenen que construir una matriz de 4xMAX_NUM_LABELS guardaremos las areas de los labels en variables diferentes.
	uint32_t labels_area[4][MAX_LABELS];
	int16_t background_label[4];

	for (i=0;i<4;i++){
		//sm_imfilter(window_width, window_height, slots_ventanas[i], &w_width, &w_height, slots_ventanas[i+4]);
		uint8_t nivel_binarizacion = sm_otsuLevel(window_width, window_height, slots_ventanas[i]);
		sm_binarization(nivel_binarizacion, window_width, window_height, slots_ventanas[i]);
		sm_close(window_width, window_height,slots_ventanas[i], &w_width, &w_height, slots_ventanas[i+4], Bank1_SRAM2_END);
		uint32_t num_labels=0;
		background_label[i]=-1;
		sm_labelImage(w_width, w_height, slots_ventanas[i+4], &w_width, &w_height, slots_ventanas[i], &num_labels, &(background_label[i]), &(labels_area[i][0]));
		//NOTA: A partir de ahora tratamos las imagenes como int16 ya que contienen labels y no pixels
		sm_filter_by_zone(w_width, w_height, slots_ventanas[i], num_labels, background_label[i], labels_area[i], &(label_left[i]), &(label_right[i]));

		ventana_con_linea[i]=0;
		if (label_left[i] == label_right[i]){
			ventana_con_linea[i]=1;
		}
	}

	int8_t posicion_martillo = sm_get_posicion_martillo(ventana_con_linea);

	uint8_t martillo_valido;
	uint32_t win_hdistance = CURRENT_WINDOW_22.x-(CURRENT_WINDOW_21.x+CURRENT_WINDOW_21.width);
	uint32_t final_martillo[2];
	uint32_t inicio_martillo[2];
	uint32_t final_holgura[2];
	float m;
	if (posicion_martillo == 0){
		//El martillo cerrado se encuentra en las ventanas de abajo (v21 y v22)
		//Si la ventana 22 tiene linea horizontal, significa que no hay holgura
		if (ventana_con_linea[3] == 1){
			*holgura = 0.0;
		} else {

			if (label_right[2] == -1 && label_left[3] == -1){
				//Si la ventana 21 no tiene linea por la derecha y la ventana 22 no tiene linea por la izquierda, no hay martillo -> posicion desconocida
				*holgura = -1;
				*posicion_motor = POSICION_MOTOR_DESCONOCIDA;
			} else {
				//Si la ventana 21 tiene una linea horizontal, significa que no podemos detectar el final del martillo
				martillo_valido = 1;
				if (ventana_con_linea[2] == 1){
					martillo_valido = 0;
				}
				PENDIENTE_LASER_2 = sm_buscar_pendiente(slots_ventanas[3],slots_ventanas[2], w_width, w_height, label_left[3], label_right[2], win_hdistance);
				m = PENDIENTE_LASER_2;
				uint8_t correccion=0;
				if (POSICION_BARRA_ABAJO == PARAM_POSICION_BARRA_ABAJO_V22){
					correccion = aplicar_correccion;
					*posicion_motor = POSICION_MOTOR_BARRAS_FUERA;
				} else {
					*posicion_motor = POSICION_MOTOR_BARRAS_DENTRO;
				}
				uint8_t error = sm_calcula_holgura(slots_ventanas[2], slots_ventanas[3], w_width, w_height, label_right[2], label_left[3], label_right[3], win_hdistance, martillo_valido, &PIXELS_MARTILLO_2, ANGULO_MARTILLO_2, labels_area[2], labels_area[3], aplicar_correccion, PENDIENTE_LASER_2, HOLGURA_MAX_2, holgura, final_martillo, inicio_martillo, final_holgura);
				if (error == 1){
					*posicion_motor = POSICION_MOTOR_DESCONOCIDA;
				}

			}
		}
	} else if (posicion_martillo==1){
		//Si la ventana 12 tiene linea horizontal, significa que no hay holgura
		if (ventana_con_linea[1] == 1){
			*holgura = 0.0;

		} else {
			if (label_right[0] == -1 && label_left[1]==-1){
				//Si la ventana 11 no tiene linea por la derecha y la ventana 12 no tiene linea por la izquierda, no hay martillo -> posicion desconocida
				*holgura = -1;
				*posicion_motor = POSICION_MOTOR_DESCONOCIDA;
			} else {
				//Si la ventana 11 tiene una linea horizontal, significa que no podemos detectar el final del martillo
				martillo_valido = 1;
				if (ventana_con_linea[0] == 1){
					martillo_valido = 0;
				}
				PENDIENTE_LASER_1 = sm_buscar_pendiente(slots_ventanas[1],slots_ventanas[0],w_width, w_height, label_left[1], label_right[0], win_hdistance);
				m = PENDIENTE_LASER_1;
				uint8_t correccion = 0;
				if (POSICION_BARRA_ABAJO == PARAM_POSICION_BARRA_ABAJO_V11){
					correccion = 1*aplicar_correccion;
					*posicion_motor = POSICION_MOTOR_BARRAS_FUERA;
				} else {
					*posicion_motor = POSICION_MOTOR_BARRAS_DENTRO;
				}
				uint8_t error = sm_calcula_holgura(slots_ventanas[0], slots_ventanas[1], w_width, w_height, label_right[0], label_left[1], label_right[1], win_hdistance, martillo_valido, &PIXELS_MARTILLO_1, ANGULO_MARTILLO_1, labels_area[0], labels_area[1], correccion, PENDIENTE_LASER_1, HOLGURA_MAX_1, holgura, final_martillo, inicio_martillo, final_holgura);
				if (error == 1){
					*posicion_motor = POSICION_MOTOR_DESCONOCIDA;
				}
			}
		}
	}

	if (con_realidad_aumentada == 1)
	{
		window_t window[4];
		window[0] = CURRENT_WINDOW_11;
		window[1] = CURRENT_WINDOW_12;
		window[2] = CURRENT_WINDOW_21;
		window[3] = CURRENT_WINDOW_22;


		uint32_t x,y;
		//Pintamos los pixeles correspondientes a las etiquetas
		for (i=0;i<4;i++){
			int16_t* tmp = slots_ventanas[i];
			uint32_t painted = 0;
			for(y=window[i].y;y<window[i].y+w_height;y++){
				for (x=window[i].x;x<window[i].x+w_width;x+=2){
					if (*tmp != background_label[i]){
						sm_set_pixel_color(img, x,y,COLOR_GREEN);
						painted++;
					}
					tmp+=2;
				}
			}
		}

		if (*holgura>0){
			//Solamente pintamos las lineas si la holgura que se ha detectado es mayor que 0
			sm_ycbcr_t color = COLOR_BLUE;

			if (posicion_martillo == 0){
				uint32_t xini, xfin;
				float b;
				//Linea horizontal inicio martillo
				xini = CURRENT_WINDOW_22.x;
				xfin = CURRENT_WINDOW_22.x+inicio_martillo[1];
				b = CURRENT_WINDOW_22.y+inicio_martillo[0]-m*(CURRENT_WINDOW_22.x+inicio_martillo[1]);
				sm_plot_linea(img, xini, xfin, m, b, color);

				//Linea vertical inicio martillo
				float angulo = ANGULO_MARTILLO_2;
				float mm = fabs(tanf(angulo));
				b = CURRENT_WINDOW_22.y+inicio_martillo[0]-mm*(CURRENT_WINDOW_22.x+inicio_martillo[1]);
				xini = roundf((CURRENT_WINDOW_22.y+CURRENT_WINDOW_22.height-b)/mm);
				xfin = roundf((CURRENT_WINDOW_22.y-b)/mm);
				sm_plot_linea(img, xini, xfin, mm, b, color);

				//Linea horizontal holgura
				xini = CURRENT_WINDOW_22.x + final_holgura[1];
				xfin = CURRENT_WINDOW_22.x+CURRENT_WINDOW_22.width;
				b = CURRENT_WINDOW_22.y+final_holgura[0]-m*(CURRENT_WINDOW_22.x+final_holgura[1]);
				sm_plot_linea(img, xini, xfin, m, b, color);

				//Linea vertical holgura
				b = CURRENT_WINDOW_22.y+final_holgura[0]-mm*(CURRENT_WINDOW_22.x+final_holgura[1]);
				xini = roundf((CURRENT_WINDOW_22.y+CURRENT_WINDOW_22.height-b)/mm);
				xfin = roundf((CURRENT_WINDOW_22.y-b)/mm);
				sm_plot_linea(img, xini, xfin, mm, b, color);

				if (martillo_valido == 1){
					//Linea horizontal final martillo
					xini = CURRENT_WINDOW_21.x+final_martillo[1];
					xfin = CURRENT_WINDOW_21.x+CURRENT_WINDOW_21.width;
					b = CURRENT_WINDOW_21.y+final_martillo[0]-m*(CURRENT_WINDOW_21.x+final_martillo[1]);
					sm_plot_linea(img, xini, xfin, m, b, color);

					//Linea vertical final martillo
					b = CURRENT_WINDOW_21.y+final_martillo[0]-mm*(CURRENT_WINDOW_21.x+final_martillo[1]);
					xini = roundf((CURRENT_WINDOW_21.y+CURRENT_WINDOW_21.height-b)/mm);
					xfin = roundf((CURRENT_WINDOW_21.y - b)/mm);
					sm_plot_linea(img, xini, xfin, mm, b, color);
				}
			} else if (posicion_martillo == 1) {
				uint32_t xini, xfin;
				float b;
				//Linea horizontal inicio martillo
				xini = CURRENT_WINDOW_12.x;
				xfin = CURRENT_WINDOW_12.x+inicio_martillo[1];
				b = CURRENT_WINDOW_12.y+inicio_martillo[0]-m*(CURRENT_WINDOW_12.x+inicio_martillo[1]);
				sm_plot_linea(img, xini, xfin, m, b, color);

				//Linea vertical inicio martillo
				float angulo = ANGULO_MARTILLO_1;
				float mm = -fabs(tanf(angulo));
				b = CURRENT_WINDOW_12.y+inicio_martillo[0]-mm*(CURRENT_WINDOW_12.x+inicio_martillo[1]);
				xini = roundf((CURRENT_WINDOW_12.y+CURRENT_WINDOW_12.height-b)/mm);
				xfin = roundf((CURRENT_WINDOW_12.y-b)/mm);
				sm_plot_linea(img, xini, xfin, mm, b, color);

				//Linea horizontal holgura
				xini = CURRENT_WINDOW_12.x + final_holgura[1];
				xfin = CURRENT_WINDOW_12.x+CURRENT_WINDOW_12.width;
				b = CURRENT_WINDOW_12.y+final_holgura[0]-m*(CURRENT_WINDOW_12.x+final_holgura[1]);
				sm_plot_linea(img, xini, xfin, m, b, color);

				//Linea vertical holgura
				b = CURRENT_WINDOW_12.y+final_holgura[0]-mm*(CURRENT_WINDOW_12.x+final_holgura[1]);
				xini = roundf((CURRENT_WINDOW_12.y+CURRENT_WINDOW_12.height-b)/mm);
				xfin = roundf((CURRENT_WINDOW_12.y-b)/mm);
				sm_plot_linea(img, xini, xfin, mm, b, color);

				if (martillo_valido == 1){
					//Linea horizontal final martillo
					xini = CURRENT_WINDOW_11.x+final_martillo[1];
					xfin = CURRENT_WINDOW_11.x+CURRENT_WINDOW_11.width;
					b = CURRENT_WINDOW_11.y+final_martillo[0]-m*(CURRENT_WINDOW_11.x+final_martillo[1]);
					sm_plot_linea(img, xini, xfin, m, b, color);

					//Linea vertical final martillo
					b = CURRENT_WINDOW_11.y+final_martillo[0]-mm*(CURRENT_WINDOW_11.x+final_martillo[1]);
					xini = roundf((CURRENT_WINDOW_11.y+CURRENT_WINDOW_11.height-b)/mm);
					xfin = roundf((CURRENT_WINDOW_11.y - b)/mm);
					sm_plot_linea(img, xini, xfin, mm, b, color);
				}
			}
		}
	}

	extern uint8_t POSICION_MOTOR;
	extern float HOLGURA;

	POSICION_MOTOR = *posicion_motor;
	HOLGURA = *holgura;
}

void calcular_holgura_continuo(uint8_t* imagen, uint8_t *posicion_motor, float *holgura){

	sm_image_t img;
	img.data = imagen;
	img.width = CURRENT_WINDOW.width + 2*OFFSET_WINDOWS;
	img.height = CURRENT_WINDOW.height + 2*OFFSET_WINDOWS;

	uint8_t* slots_ventanas[2];

	uint32_t bytes_ventana = 2*img.width*img.height;
	uint8_t i=0;

	for (i=0;i<2;i++){
		slots_ventanas[i] = Dest_Image_3+bytes_ventana*i;
	}

	sm_getWindow(imagen, img.width, slots_ventanas[0], (window_t){0,0,img.width, img.height}, 0);

	uint32_t w_width, w_height;
	int16_t label_left;
	int16_t label_right;
	//Para no tenen que construir una matriz de 4xMAX_NUM_LABELS guardaremos las areas de los labels en variables diferentes.
	uint32_t labels_area[MAX_LABELS];
	int16_t background_label = -1;

	uint8_t nivel_binarizacion = sm_otsuLevel(img.width, img.height, slots_ventanas[0]);
	sm_binarization(nivel_binarizacion, img.width, img.height, slots_ventanas[0]);
	sm_close(img.width, img.height,slots_ventanas[0], &w_width, &w_height, slots_ventanas[1], Bank1_SRAM2_END);
	uint32_t num_labels=0;
	sm_labelImage(w_width, w_height, slots_ventanas[1], &w_width, &w_height, slots_ventanas[0], &num_labels, &background_label, &(labels_area[0]));

	//NOTA: A partir de ahora tratamos las imagenes como int16 ya que contienen labels y no pixels
	sm_filter_by_zone(w_width, w_height, slots_ventanas[0], num_labels, background_label, labels_area, &label_left, &label_right);

	if (label_left == -1 || label_right == -1){
		//Necesitamos las dos lineas para poder calcular la holgura. Si falta alguna, la posición pasa a ser desconocida
		*holgura = -1;
		*posicion_motor = POSICION_MOTOR_DESCONOCIDA;
	} else if (label_left == label_right){
			//Si se han encontrado labels y los labels por la izquierda y por la derecha son el mismo.
			*holgura = 0;
	} else {
		uint8_t error;
		if (*posicion_motor == POSICION_MOTOR_BARRAS_FUERA){
			error = sm_calcula_holgura_continuo(slots_ventanas[0], w_width, w_height, label_left, label_right, PIXELS_MARTILLO_2, ANGULO_MARTILLO_2, labels_area, 1, PENDIENTE_LASER_2, HOLGURA_MAX_2, holgura);

		} else {
			error = sm_calcula_holgura_continuo(slots_ventanas[0], w_width, w_height, label_left, label_right, PIXELS_MARTILLO_1, ANGULO_MARTILLO_1, labels_area, 0, PENDIENTE_LASER_1, HOLGURA_MAX_1, holgura);
		}
		if (error == 1){
			*posicion_motor = POSICION_MOTOR_DESCONOCIDA;
		}
	}

	extern float HOLGURA;
	extern uint8_t POSICION_MOTOR;
	HOLGURA = *holgura;
	POSICION_MOTOR = *posicion_motor;
}



/**
 * @brief Extrae las 4 ventanas en escala de grises de la imagen img_in en color y deja el resultado
 * en img_out. En img_out tendremos las ventanas en el orden v_11, v_12, v_21, v_22
 * @param *img_in Puntero a la imagen original en color en formato YCbCr
 * @param in_width Ancho de la imagen original
 * @param *img_out Puntero a la posicion de memoria donde quedaran las ventanas
 * @para offset_ventanas Tamaño extra por cada lado en x e y de las ventanas resultado.
 */
void sm_getWindows(uint8_t *img_in, uint32_t in_width, uint8_t *img_out, uint32_t bytes_ventana , uint32_t offset_ventanas){

	uint8_t *tmp = img_out;
	sm_getWindow(img_in, in_width, img_out, CURRENT_WINDOW_11, offset_ventanas);
	tmp += bytes_ventana;
	sm_getWindow(img_in, in_width, tmp, CURRENT_WINDOW_12, offset_ventanas);
	tmp += bytes_ventana;
	sm_getWindow(img_in, in_width, tmp, CURRENT_WINDOW_21, offset_ventanas);
	tmp += bytes_ventana;
	sm_getWindow(img_in, in_width, tmp, CURRENT_WINDOW_22, offset_ventanas);

}

/**
 * @brief Extrae la ventana en escala de grises de la imagen img_in en color y deja el resultado
 * en img_out.
 * @param *img_in Puntero a la imagen original en color en formato YCbCr
 * @param in_width Ancho de la imagen original
 * @param *img_out Puntero a la posicion de memoria donde quedara la ventana
 * @para offset_ventana Tamaño extra por cada lado en x e y de la ventana resultado.
 */
void sm_getWindow(uint8_t *_img_in, uint32_t in_width, uint8_t *img_out, window_t v, uint32_t offset_ventana){
	uint8_t (*img_in)[in_width*2] = _img_in;
	uint8_t *tmp = img_out;

	uint32_t yfin = v.y+v.height+offset_ventana;
	uint32_t xfin = 2*(v.x+v.width+offset_ventana);

	uint32_t x,y;

	for (y=v.y-offset_ventana; y<yfin;y++){
		for(x=2*(v.x-offset_ventana)+1;x<xfin+1;x+=2){
			*tmp = img_in[y][x];
			tmp++;
		}
	}
}

/**
 * @brief Devuelve la componente Y de una imagen YCbCr
 * La imagen de entrada esta en formato YCbCr. Esto significa que cada pixel ocupa dos bytes y estan ordenados segun la
 * secuencia Y[0]Cb[0]Y[1]Cr[0]Y[2]Cb[1]Y[3]Cr[1]Y[4].
 * @param size Devuelve el tamaño de la imagen en escala de grises
 * @param width Ancho de la imagen
 * @param height Alto de la imagen
 * @para *img Puntero a la imagen
 * @return Posición en la memoria de la imagen en escala de grises
 */
void sm_im2gray(uint32_t *size, uint32_t width, uint32_t height, uint8_t* img){
	uint8_t *result = img;
	uint8_t *input = img;

	*size = width*height;
	uint32_t k;
	for (k=0;k<*size;k++){
		*result = *input;
		input = input+2; //Salto una posición ya que solo quiero el componente
		result++;
	}

}

/**
 * @brief Calcula el histograma de una imagen
 * @param Histograma. Vector de 256 posiciones que contiene la frecuencia con la que aparecen los valores de los pixeles
 * @param width Ancho de la imagen
 * @param height Alto de la imagen
 * @param *img Puntero a la imagen
 */
void sm_imhist(uint32_t *hist, uint32_t width, uint32_t height, uint8_t* img){

	uint32_t k;
	//Inicializamos el histograma a zeros
	for (k=0;k<256;k++){
		hist[k]=0;
	}

	for (k=0;k<width*height;k++){
		hist[*img]++;
		img++;
	}
}
/**
 * @brief Calcula el nivel de binarización que separa las dos clases segun su varianza
 * @param width Ancho de la imagen
 * @param height Alto de la imagen
 * @param *img Puntero a la imagen
 * @return Nivel de binarización entre 0 y 255
 */
uint8_t sm_otsuLevel(uint32_t width, uint32_t height, uint8_t* img){

	//Calulamos el histograma
	uint32_t histogram[256];
	sm_imhist(histogram, width, height, img);

	uint64_t total = width*height;

	float sum = 0;
	uint16_t i;

	for (i = 1; i <= 255; ++i){
		sum += i * histogram[i];
	}
	float sumB = 0;
	float wB = 0;
	float wF = 0;
	float mB;
	float mF;
	float max = 0;
	float between = 0;
	uint16_t threshold1 = 0;
	uint16_t threshold2 = 0;
	for (i = 0; i <= 255; ++i) {
		wB += histogram[i];
	    if (wB == 0)
	        continue;
	    wF = total - wB;
	    if (wF == 0)
	        break;
	    sumB += i * histogram[i];
	    mB = sumB / wB;
	    mF = (sum - sumB) / wF;
	    between = (uint64_t)wB * wF * (mB - mF) * (mB-mF);
	    if ( between >= max ) {
	        threshold1 = i;
	        if ( between > max ) {
	            threshold2 = i;
	        }
	        max = between;
	    }
	}

	return ( threshold1 + threshold2 ) / 2;

}

/**
 * @brief Binariza una imagen con el level que se le pasa. El resultado tiene los valores 0 y 1 dependiendo
 * si el valor de entrada es menor o mayor que el nivel level.
 * @param level Nivel de binarización entre 0 y 255
 * @param width Ancho de la imagen
 * @param height Alto de la imagen
 * @param *img Puntero a la imagen
 */
void sm_binarization(uint8_t level, uint32_t width, uint32_t height, uint8_t* img){

	uint32_t k;
	uint32_t fin = img + width*height;
	for (;img<fin;img++){
		*img = *img>level?1:0;
	}
}

/**
 * @brief Filtra una imagen con un filtro gaussiano. La imagen resultado es mas pequeña que la imagen original
 * @param width_in Ancho de la imagen original
 * @param height_in Alto de la imagen original
 * @param *_img_in Puntero a la imagen original
 * @param *width_out Devuelve el ancho de la imagen resultado
 * @param *height_out Devuelve el alto de la imagen resultado
 * @param *_img_out Puntero a la imagen resultado
 */
void sm_imfilter(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out){

	double h[7][7] = {	{1.94254715494870e-07,	9.65682563843305e-06,	0.000100626433878643,	0.000219788338467216,	0.000100626433878643,	9.65682563843305e-06,	1.94254715494870e-07},
						{9.65682563843305e-06,	0.000480061867087909,	0.00500235952629437	,	0.0109261577333234	,	0.00500235952629437	,	0.000480061867087909,	9.65682563843305e-06},
						{0.000100626433878643,	0.00500235952629437	,	0.0521257832497778	,	0.113853178038564	,	0.0521257832497778	,	0.00500235952629437	,	0.000100626433878643},
						{0.000219788338467216,	0.0109261577333234	,	0.113853178038564	,	0.248678203785766	,	0.113853178038564	,	0.0109261577333234	,	0.000219788338467216},
						{0.000100626433878643,	0.00500235952629437	,	0.0521257832497778	,	0.113853178038564	,	0.0521257832497778	,	0.00500235952629437	,	0.000100626433878643},
						{9.65682563843305e-06,	0.000480061867087909,	0.00500235952629437	,	0.0109261577333234	,	0.00500235952629437	,	0.000480061867087909,	9.65682563843305e-06},
						{1.94254715494870e-07,	9.65682563843305e-06,	0.000100626433878643,	0.000219788338467216,	0.000100626433878643,	9.65682563843305e-06,	1.94254715494870e-07}};
	uint8_t pad = 3; // = floor(filter_size/2)

	//Convertimos los punteros para poder acceder tipo matriz
	uint8_t (*img_in)[width_in] = _img_in;
	uint8_t (*img_out)[width_in-2*pad] = _img_out;


	int16_t x,y;
	int16_t xx,yy;
	for(y=pad;y<height_in-pad;y++){
		for(x=pad;x<width_in-pad;x++){
			float value = 0.0;
			for (yy=-pad;yy<=pad;yy++){
				for (xx=-pad;xx<=pad;xx++){
					value += h[yy+pad][xx+pad]*img_in[y+yy][x+xx];
				}
			}
			img_out[y-pad][x-pad]=(uint8_t)roundf(value);
		}
	}

	*width_out = width_in - 2*pad;
	*height_out = height_in - 2*pad;

}
/**
 * @brief Aplica un erode a una imagen binaria
 * @param width_in Ancho de la imagen original
 * @param height_in Alto de la imagen original
 * @param *_img_in Puntero a la imagen original
 * @param *width_out Devuelve el ancho de la imagen resultado
 * @param *height_out Devuelve el alto de la imagen resultado
 * @param *_img_out Puntero a la imagen resultado
 */
void sm_erode(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out){
	/*
	float se[5][5] = { {0,0,1,0,0},
						{0,1,1,1,0},
						{1,1,1,1,1},
						{0,1,1,1,0},
						{0,0,1,0,0}};
	*/
	uint8_t se_dim = 2;

	//Convertimos los punteros para poder acceder tipo matriz
	uint8_t (*img_in)[width_in] = _img_in;
	uint8_t (*img_out)[width_in-2*se_dim] = _img_out;

	int16_t x,y;
	for(y=se_dim;y<height_in-se_dim;y++){
		for(x=se_dim;x<width_in-se_dim;x++){
			if (				 					        img_in[y-2][x]==0 ||
								     img_in[y-1][x-1]==0 || img_in[y-1][x]==0 || img_in[y-1][x+1]==0 ||
				img_in[y][x-2]==0 || img_in[y][x-1]==0   || img_in[y][x]==0   || img_in[y][x+1]==0   || img_in[y][x+2]==0 ||
								     img_in[y+1][x-1]==0 || img_in[y+1][x]==0 || img_in[y+1][x+1]==0 ||
								   	   	   	   	   	        img_in[y+2][x]==0)
			{
				img_out[y-se_dim][x-se_dim] = 0;
			} else {
				img_out[y-se_dim][x-se_dim] = 1;
			}
		}
	}
	*width_out = width_in - 2*se_dim;
	*height_out = height_in - 2*se_dim;
}

/**
 * @brief Aplica un dilate a una imagen binaria
 * @param width_in Ancho de la imagen original
 * @param height_in Alto de la imagen original
 * @param *_img_in Puntero a la imagen original
 * @param *width_out Devuelve el ancho de la imagen resultado
 * @param *height_out Devuelve el alto de la imagen resultado
 * @param *_img_out Puntero a la imagen resultado
 */
void sm_dilate(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out){
	/*
	float se[5][5] = { {0,0,1,0,0},
							{0,1,1,1,0},
							{1,1,1,1,1},
							{0,1,1,1,0},
							{0,0,1,0,0}};
	*/
	uint8_t se_dim = 2;

	//Convertimos los punteros para poder acceder tipo matriz
	uint8_t (*img_in)[width_in] = _img_in;
	uint8_t (*img_out)[width_in-2*se_dim] = _img_out;

	int16_t x,y;
	for(y=se_dim;y<height_in-se_dim;y++){
		for(x=se_dim;x<width_in-se_dim;x++){
			if (				 					        img_in[y-2][x]==1 ||
									 img_in[y-1][x-1]==1 || img_in[y-1][x]==1 || img_in[y-1][x+1]==1 ||
				img_in[y][x-2]==1 || img_in[y][x-1]==1   || img_in[y][x]==1   || img_in[y][x+1]==1   || img_in[y][x+2]==1 ||
									 img_in[y+1][x-1]==1 || img_in[y+1][x]==1 || img_in[y+1][x+1]==1 ||
															img_in[y+2][x]==1)
			{
				img_out[y-se_dim][x-se_dim] = 1;
			} else {
				img_out[y-se_dim][x-se_dim] = 0;
			}
		}
	}
	*width_out = width_in - 2*se_dim;
	*height_out = height_in - 2*se_dim;

}

/**
 * @brief Aplica un close a una imagen binaria
 * @param width_in Ancho de la imagen original
 * @param height_in Alto de la imagen original
 * @param *_img_in Puntero a la imagen original
 * @param *width_out Devuelve el ancho de la imagen resultado
 * @param *height_out Devuelve el alto de la imagen resultado
 * @param *_img_out Puntero a la imagen resultado
 * @param *memoria_procesado Puntero a la memoria disponible para procesado
 */
void sm_close(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out, uint8_t *memoria_procesado){
	uint8_t* img_tmp = memoria_procesado;
	img_tmp -= height_in*width_in;
	uint32_t width_tmp, height_tmp;
	sm_dilate(width_in,height_in, _img_in, &width_tmp, &height_tmp, img_tmp);
	sm_erode(width_tmp,height_tmp,img_tmp, width_out, height_out, _img_out);
}

/**
 * @brief Aplica un open a una imagen binaria
 * @param width_in Ancho de la imagen original
 * @param height_in Alto de la imagen original
 * @param *_img_in Puntero a la imagen original
 * @param *width_out Devuelve el ancho de la imagen resultado
 * @param *height_out Devuelve el alto de la imagen resultado
 * @param *_img_out Puntero a la imagen resultado
 * @param *memoria_procesado Puntero a la memoria disponible para procesado
 */
void sm_open(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out, uint8_t *memoria_procesado){
	uint8_t* img_tmp = memoria_procesado;
	img_tmp -= height_in*width_in;
	uint32_t width_tmp, height_tmp;
	sm_erode(width_in, height_in, _img_in, &width_tmp, &height_tmp, img_tmp);
	sm_dilate(width_tmp, height_tmp, img_tmp, width_out, height_out, _img_out);
}

void sm_insertCorrespondence(int16_t label1, int16_t label2, int16_t correspondence_list[][2], uint32_t *num_correspondences){
	uint32_t index = 0;
	// Las correspondencias estan ordenadas. Incrementamos el indice mientras el
	// primer punto sea inferior al primer punto de la nueva correspondencia
	while (correspondence_list[index][0]<label1 && correspondence_list[index][0] != -1){
	    index = index +1;
	}

	// El sitio para insertar la nueva correspondencia será entre los puntos con
	// el primer número igual al primer número de la nueva correspondencia
	while (correspondence_list[index][0]==label1){
	    if (label2 == correspondence_list[index][1]){
	        // La correspondencia ya existe, no la volvemos a insertar
	        return;
	    }

	    if (label2 < correspondence_list[index][1]){
	        // La correspondencia debe insertarse en este punto, acabamos el
	        // bucle y procedemos a la inserción
	        break;
	    }
	    index = index + 1;
	}


	// Si se tiene que insertar la correspondencia desplazamos todos los
	// puntos poseteriores y la insertamos en su sitio

	uint32_t index2 = *num_correspondences;
	while (index2 > index){

	    correspondence_list[index2][0] = correspondence_list[index2-1][0];
	    correspondence_list[index2][1] = correspondence_list[index2-1][1];
	    index2 = index2 -1;
	}
	correspondence_list[index][0] = label1;
	correspondence_list[index][1] = label2;
	*num_correspondences += 1;
}

void sm_rename_labels(int16_t* _img_in, uint32_t width_in, uint32_t height_in, uint32_t *width_out, uint32_t *height_out, int16_t *correspondencias, uint32_t num_labels, uint32_t area_labels[], int16_t *background_label){

	*height_out = height_in-2;
	*width_out  = width_in-2;

	int16_t (*img_in)[width_in] = _img_in;
	int16_t (*img_out)[*width_out] = _img_in; //Podemos sobreescribir los pixeles en la misma posición
	int16_t (*c)[2]=correspondencias;

	uint32_t index = 0;
	uint32_t i;
	int16_t labels[num_labels];
	for(index = 0; index < num_labels; index++){
		labels[index]=-1;
	}

	index = 0;
	while (c[index][0] != -1){
	    if (labels[c[index][0]] == -1 && labels[c[index][1]] == -1){
	        labels[c[index][0]]=c[index][0];
	        labels[c[index][1]]=c[index][0];
	    } else if (labels[c[index][0]] != -1 && labels[c[index][1]] != -1 && labels[c[index][0]] != labels[c[index][1]]){
	        int16_t new_label = labels[c[index][0]];
	        int16_t old_label = labels[c[index][1]];

	        for (i=0;i<num_labels;i++){
	            if (labels[i] == old_label){
	                labels[i] = new_label;
	            }
	        }
	    } else if (labels[c[index][0]] != -1){
	        labels[c[index][1]] = labels[c[index][0]];
	    } else {
	        labels[c[index][0]] = labels[c[index][1]];
	    }

	    index = index + 1;
	}

	for (i=0;i<num_labels;i++){
	    if (labels[i]==-1){
	        labels[i]=i;
		}
	    area_labels[i]=0;
	}

	uint32_t x,y;

	//Modificamos los labels y además quitamos los pixeles de los bordes ya que no los hemos etiquetado para evitar ifs dentro del etiquetado.
	for (y=1;y<height_in-1;y++){
		for (x=1;x<width_in-1;x++){
			int16_t label = labels[img_in[y][x]];
			img_out[y-1][x-1] = label;
			area_labels[label]++;
		}
	}

	*background_label = -1; //En esta variable dejaremos el label correspondiente al background, que es el label con más area
	uint32_t background_area = 0; //En esta variable iremos calculando el label que tenga el area mayor para saber cual es el background
	for (i=0;i<num_labels;i++){
		if (area_labels[i] > background_area){
			background_area = area_labels[i];
			*background_label = labels[i];
		}
	}

}

/**
 * Convierte una imagen en escala de grises _img_in en un mapa de labels. Cada label representa una zona de la imagen de entrada.
 * Quita un pixel por cada lado de la imagen original.
 * @param width_in Ancho de la imagen original
 * @param height_in Alto de la imagen original
 * @param *_img_in Puntero a la imagen de entrada
 * @param *width_out Devuelve el ancho de la imagen de salida
 * @param *height_out Devuelve el alto de la imagen de salida
 * @param *_img_out Puntero al mapa de labels de salida
 * @param *num_labels Devuelve el numero de labels
 * @param *background_label Devuelve el valor del label del background (el que tiene mayor area)
 * @return Vector con las areas de cada label
 */
void sm_labelImage(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out, uint32_t *num_labels, int16_t *background_label, uint32_t labels_area[]){

	// De momento el mapa de labels tendrá el mismo tamaño que la imagen original.
	// A posteriori quitaremos un pixel del borde para poder evitar if en el algoritmo de etiquetado.
	*width_out = width_in;
	*height_out = height_in;

	// Construimos estas variables para poder acceder a los pixels de la imagen de forma más cómoda como in[y][x] y out[y][x
	uint8_t (*in)[width_in] = _img_in;
	int16_t (*out)[width_in] = _img_out;

	int16_t correspondencias[MAX_LABELS][2]; //En esta matriz guardaremos los pares de labels que se tocan y que se tendran que juntar a posteriori


	uint32_t y,x; //Indices para los bucles

	uint32_t num_correspondencias;

	//Inicializamos la matriz de correspondencias y el vector de areas.
	for(y=0;y<MAX_LABELS;y++)
	{
		labels_area[y]=0;

		for (x=0;x<2;x++)
			correspondencias[y][x]=-1;
	}

	//Inicializamos la imagen resultado, de labels, a -1. El valor -1 indica que a un pixel todavia no se le ha asignado ningun label
	for (y=0;y<*height_out;y++){
		for (x=0;x<*width_out;x++){
			out[y][x]=-1;
		}
	}


	// Algoritmo de etiquetado
	num_correspondencias = 0;
	*num_labels = 0;

	for (y=1; y < height_in-1; y++){
		for (x=1; x < width_in-1; x++){
			if (in[y][x] == in[y-1][x-1] && out[y-1][x-1] != -1){
				out[y][x] = out[y-1][x-1];
			}

			if (in[y][x] == in[y-1][x] && out[y-1][x] != -1){
				if (out[y][x] == -1){
					out[y][x] = out[y-1][x];
				}
				else if(out[y][x] != out[y-1][x]){
					if (out[y][x]<out[y-1][x]){
						sm_insertCorrespondence(out[y][x],out[y-1][x],correspondencias,&num_correspondencias);
					} else {
						sm_insertCorrespondence(out[y-1][x],out[y][x],correspondencias,&num_correspondencias);
					}
				}

			}
			if (in[y][x] == in[y-1][x+1] && out[y-1][x+1] != -1){
				if (out[y][x] == -1){
					out[y][x] = out[y-1][x+1];
				}
				else if (out[y][x] != out[y-1][x+1]){
					if (out[y][x]<out[y-1][x+1]){
						sm_insertCorrespondence(out[y][x],out[y-1][x+1],correspondencias,&num_correspondencias);
					} else {
						sm_insertCorrespondence(out[y-1][x+1],out[y][x],correspondencias,&num_correspondencias);
					}

				}

			}
			if (in[y][x] == in[y][x-1] && out[y][x-1] != -1){
				if (out[y][x] == -1){
					out[y][x] = out[y][x-1];
				}
				else if (out[y][x] != out[y][x-1]){
					if (out[y][x]<out[y][x-1]){
						sm_insertCorrespondence(out[y][x],out[y][x-1],correspondencias,&num_correspondencias);
					} else {
						sm_insertCorrespondence(out[y][x-1],out[y][x],correspondencias,&num_correspondencias);
					}

				}

			}
			if (out[y][x] == -1){
				// Región nueva
				out[y][x] = *num_labels;
				*num_labels = *num_labels + 1;

			}

		}
	}

	uint16_t back_label;
	sm_rename_labels(out, width_in, height_in, width_out, height_out, correspondencias, *num_labels, labels_area, &back_label);
	*background_label = back_label;

}

/**
 * @brief  Filtra una imagen. Elimina las zonas conectadas al margen inferior
 * y conserva solamente las zonas conectadas al margen lateral. A las zonas
 * eliminadas les asigna el label correspondiente al background.
 * @param width Ancho de la imagen
 * @param height Alto de la imagen
 * @param *_img Puntero a la posicion de memoria donde empieza el mapa de labels
 * @param num_labels Numero de labels que contiene el mapa _img
 * @param background_label Valor del label del background (El que tiene más area)
 * @param labels_area[] Vector de las areas de los labels del mapa _img
 * @param *label_left Devuelve el valor del label conectado al margen izquierdo
 * @param *label_right Devuelve el valor del label conectado al marge derecho
 */
void sm_filter_by_zone(uint32_t width, uint32_t height, uint8_t *_img, uint32_t num_labels, int16_t background_label, uint32_t labels_area[], int16_t* label_left, int16_t*  label_right){

	int16_t (*in)[width] = _img;
	int16_t (*out)[width] = _img;

	int16_t mantain_zone_derecha[num_labels];
	int16_t mantain_zone_izquierda[num_labels];

	uint32_t x,y;
	for (y=0;y<num_labels;y++){
		mantain_zone_derecha[y]=0;
		mantain_zone_izquierda[y]=0;
	}

	// Conservamos las zonas conectadas a los margenes laterales
	for (y=0; y< height; y++){
	    if (in[y][0] != background_label){
	        mantain_zone_izquierda[in[y][0]] = 1;
	    }
	    if (in[y][width-1] != background_label){
	        mantain_zone_derecha[in[y][width-1]] = 1;
	    }
	}

	// Eliminamos las zonas conectados a los márgenes superior e inferior
	for (x=0;x<width;x++){
	    if (in[0][x] != background_label){
	        mantain_zone_izquierda[in[0][x]] = 0;
	        mantain_zone_derecha[in[0][x]] = 0;
	    }
	    if (in[height-1][x] != background_label){
	        mantain_zone_izquierda[in[height-1][x]] = 0;
	        mantain_zone_derecha[in[height-1][x]] = 0;
	    }
	}

	uint32_t max_derecha = 0;
	uint32_t max_izquierda = 0;
	int32_t max_derecha_label = -1;
	int32_t max_izquierda_label = -1;
	uint32_t i;
	for (i=0;i<num_labels;i++){
	   if (mantain_zone_izquierda[i] == 1 && labels_area[i]>max_izquierda){
	       max_izquierda = labels_area[i];
	       max_izquierda_label = i;
	   }
	   if (mantain_zone_derecha[i] == 1 && labels_area[i]>max_derecha){
	       max_derecha = labels_area[i];
	       max_derecha_label = i;
	   }
	}


	for (y=0;y<height;y++){
	    for (x=0;x<width;x++){
	        if (in[y][x] != max_izquierda_label && in[y][x] !=max_derecha_label){
	            out[y][x]=background_label;
	    	}
	    }
	}


	*label_left = max_izquierda_label;
	*label_right = max_derecha_label;

}

float sm_buscar_pendiente(int16_t *_v1, int16_t *_v2, uint32_t win_width, uint32_t win_height, int16_t label_1, int16_t label_2, uint32_t window_hdistance){

	int16_t (*v1)[win_width] = _v1;
	int16_t (*v2)[win_width] = _v2;


	float suma_y = 0.0;
	float area_y = 0.0;
	uint8_t num_pixels = 30;
	int32_t x,y;

	for (x = 0; x<num_pixels;x++){
	    for (y=0;y<win_height;y++){
	        if (v1[y][x]==label_1){
	            suma_y +=  y;
	            area_y++;
	        }
	    }
	}
	float y_media_1 = suma_y/area_y;

	suma_y = 0.0;
	area_y = 0.0;
	for (x = win_width-1; x>=win_width-num_pixels;x--){
	    for (y=0; y<win_height; y++){
	        if (v2[y][x]==label_2){
	            suma_y += y;
	            area_y++;
	        }
	    }
	}

	float y_media_2 = suma_y/area_y;

	float m = (y_media_1 - y_media_2)/((float)num_pixels+(float)window_hdistance);

	return m;

}

int8_t sm_get_posicion_martillo(uint8_t ventana_con_linea[]){

	uint8_t posicion_motor = POSICION_MOTOR_DESCONOCIDA;
	if ((ventana_con_linea[0] == 1 && ventana_con_linea[1] == 1) || (ventana_con_linea[0] == 1 && ventana_con_linea[1] == 0 && ventana_con_linea[2] == 0 && ventana_con_linea[3] == 0) || (ventana_con_linea[0] == 0 && ventana_con_linea[1] == 1 && ventana_con_linea[2] == 0 && ventana_con_linea[3] == 0)){
		posicion_motor = 0;

	} else if ((ventana_con_linea[2] == 1 && ventana_con_linea[3] == 1) || (ventana_con_linea[0] == 0 && ventana_con_linea[1] == 0 && ventana_con_linea[2] == 1 && ventana_con_linea[3] == 0) || (ventana_con_linea[0] == 0 && ventana_con_linea[1] == 0 && ventana_con_linea[2] == 0 && ventana_con_linea[3] == 1)){
		posicion_motor = 1;
	}

	return posicion_motor;
}
#define BUSCAR_FINAL_ETIQUETA_DERECHA 0
#define BUSCAR_FINAL_ETIQUETA_IZQUIERDA 1
void sm_buscar_final_etiqueta(int16_t *_image, uint32_t im_width, uint32_t im_height, int16_t label, uint32_t area_label, uint8_t inicio, float m_laser, uint32_t control_picos, uint32_t result[]){

	int16_t (*image)[im_width] = _image;
	result[0]=0;
	result[1]=0;
	int32_t x,y;

	if (inicio == BUSCAR_FINAL_ETIQUETA_DERECHA){
	    uint32_t suma_y = 0;
	    for (x = im_width-1;x>=0;x--){
	        uint8_t y_encontrada = 0;
	        for (y=0;y<im_height;y++){
	            if (image[y][x]==label){
	                suma_y += y;
	                y_encontrada = 1;
	            }
	        }
	        if (y_encontrada == 0) break;
	    }

	    float x_media = x + roundf((im_width - x)/2);
	    float y_media = roundf(suma_y/area_label);

	    float b = y_media - m_laser*x_media;

	    uint8_t final_encontrado = 0;
	    uint32_t pixels_en_label = 0;
	    while(final_encontrado == 0 && x < im_width){
	        if (control_picos == 1){
	            uint32_t pixels_arriba = 0;
	            uint32_t pixels_abajo = 0;
	            uint32_t y_eje = roundf(m_laser*x+b);
	            y = y_eje-1;
	            while(image[y][x]==label){
	                pixels_arriba++;
	                y--;
	            }
	            y = y_eje+1;
	            while(image[y][x]==label){
	                pixels_abajo++;
	                y++;
	            }
	            if (pixels_arriba!=0 && pixels_abajo!=0 && abs(pixels_arriba-pixels_abajo)<=1)
	                final_encontrado = 1;

	            // Limitamos los pixeles atrás que puede avanzar si que se
	            // cumpla la condición
	            if (final_encontrado == 0 && image[y_eje][x]==label){
	                pixels_en_label++;;
	                if (pixels_en_label >= MAX_PIXELS_EN_LABEL)
	                    final_encontrado = 1;
	            }
	        } else {
	            y = roundf(m_laser*x+b);
	            if (image[y][x]==label)
	                final_encontrado = 1;

	        }
	        x++;
	    }
	    result[0] = roundf(m_laser*x+b);
	    result[1] = x-1;

	} else if (inicio == BUSCAR_FINAL_ETIQUETA_IZQUIERDA){
		uint32_t suma_y = 0;
	    for (x=0;x<im_width;x++){
	    	uint8_t y_encontrada = 0;
	        for (y=0; y < im_height; y++){
	            if (image[y][x] == label){
	                suma_y += y;
	                y_encontrada = 1;
	            }
	        }
	        if (y_encontrada == 0) break;

	    }
	    float x_media = roundf(x/2.0);
	    float y_media = roundf(suma_y/area_label);
	    float b = y_media - m_laser*x_media;

	    uint8_t final_encontrado = 0;
	    uint32_t pixels_en_label = 0;
	    while(final_encontrado == 0 && x >= 0){
	        if (control_picos == 1){
	            uint32_t pixels_arriba = 0;
	            uint32_t pixels_abajo = 0;
	            uint32_t y_eje = roundf(m_laser*x+b);
	            uint32_t y = y_eje-1;
	            while(image[y][x]==label){
	                pixels_arriba++;
	                y--;
	            }
	            y = y_eje+1;
	            while(image[y][x]==label){
	                pixels_abajo++;
	                y++;
	            }
	            if (pixels_arriba !=0 && pixels_abajo !=0 && abs(pixels_arriba-pixels_abajo)<=1)
	                final_encontrado = 1;

	            // Limitamos los pixeles atrás que puede avanzar si que se
	            // cumpla la condición
	            if (final_encontrado == 0 && image[y_eje][x]==label){
	                pixels_en_label++;
	                if (pixels_en_label >= MAX_PIXELS_EN_LABEL)
	                    final_encontrado = 1;

	            }
	        } else {
	            y = roundf(m_laser*x+b);
	            if (image[y][x]==label)
	                final_encontrado = 1;
	        }

	        x--;
	    }
	    result[0] = roundf(m_laser*x+b);
	    result[1] = x+1;
	}

}

float sm_distancia(int32_t p0[], int32_t p1[], float angulo_martillo){
	float pixels_holgura = 0.0;
	// Calcula la distancia entre la recta que pasa por p1 con pendiente de angulo_martillo
	// y el punto p0 que se toma como orgien de cordenadas
	// p0 = punto inicial [p0y p0x]
	// p1 = punto recta [p1y p1x]


	float M = tanf(angulo_martillo);
	float p[2];
	p[0] = (float)p0[0]-(float)p1[0];
	p[1] = (float)p1[1]-(float)p0[1];
	if (p[1]-p[0]/M>0){
		float a = ((float)p1[0]-(float)p0[0]);
		float b = ((float)p1[1]-(float)p0[1]);
		float c = M*b;
		c = abs(a+c);
		float d = sqrtf(M*M+1);
	    pixels_holgura=c/d;
	}

	return pixels_holgura;
}

uint8_t sm_calcula_holgura(int16_t *_ventana_final_martillo, int16_t* _ventana_holgura, uint32_t win_width, uint32_t win_height, int16_t label_final_martillo, int16_t label_inicio_martillo, int16_t label_holgura, uint32_t distancia_ventanas, uint8_t martillo_valido, uint32_t *pixels_martillo, float angulo_martillo, uint32_t areas_final_martillo[], uint32_t areas_holguras[], uint8_t aplicar_correccion, float m_laser, float holgura_max, float *holgura, uint32_t final_martillo[], uint32_t inicio_martillo[], uint32_t final_holgura[]){
	uint8_t error = 0;
	int16_t (*ventana_holgura)[win_width] = _ventana_holgura;
	int16_t (*ventana_final_martillo)[win_width] = _ventana_final_martillo;

	*holgura = 0;

	// Buscamos el final del martillo
	sm_buscar_final_etiqueta(ventana_holgura, win_width, win_height, label_inicio_martillo, areas_holguras[label_inicio_martillo], BUSCAR_FINAL_ETIQUETA_IZQUIERDA, m_laser,0, inicio_martillo);
	final_martillo[0] = 0;
	final_martillo[1] = 0;
	uint32_t pixels_martillo_nuevo = 0;
	if (martillo_valido == 1){
		//Buscamos el inicio del martillo
		sm_buscar_final_etiqueta(ventana_final_martillo, win_width, win_height, label_final_martillo, areas_final_martillo[label_final_martillo], BUSCAR_FINAL_ETIQUETA_DERECHA, m_laser,0, final_martillo);
		float dx = (float)win_width -(float)final_martillo[1] + (float)distancia_ventanas + (float)inicio_martillo[1];
		float dy = (float)final_martillo[0]-(float)inicio_martillo[0];
	    float pixels_laser_martillo = sqrtf(dx*dx+dy*dy);
	    float angulo_laser = atanf((float)m_laser);
	    float tmp = sinf((float)angulo_martillo + angulo_laser);
	    pixels_martillo_nuevo = pixels_laser_martillo * tmp;
	    *pixels_martillo = pixels_martillo_nuevo * FILTRO_MARTILLO_ALPHA + (float)(*pixels_martillo) * (1.0-FILTRO_MARTILLO_ALPHA);

	}

	if (*pixels_martillo == 0){
		*holgura=0.0;
	}

	// Buscamos la holgura
	sm_buscar_final_etiqueta(ventana_holgura, win_width, win_height, label_holgura, areas_holguras[label_holgura], BUSCAR_FINAL_ETIQUETA_DERECHA,m_laser,0,final_holgura);
	float pixels_holgura = sm_distancia(inicio_martillo, final_holgura, angulo_martillo);

	if (pixels_holgura > 0){
	    *holgura = pixels_holgura *SIZE_PIXEL;
	    if (aplicar_correccion == 1){
	        *holgura = (*holgura)*(1+ALTURA_MARTILLO/ALTURA_CAMARA)-ALTURA_MARTILLO*CDX/ALTURA_CAMARA;
	    }
	}

	float tolerancia = holgura_max*0.2;
	if (*holgura > holgura_max+tolerancia || *holgura < -tolerancia){
		*holgura = -1;
		error = 1;
	} else	if (*holgura < 0){
	    *holgura=0.0;
	}

	return error;
}

uint8_t sm_calcula_holgura_continuo(int16_t* ventana_holgura, uint32_t win_width, uint32_t win_height, int16_t label_martillo, int16_t label_holgura, uint32_t pixels_martillo, float angulo_martillo, uint32_t areas_holguras[], uint8_t aplicar_correccion, float m_laser, float holgura_max, float *holgura){
	uint8_t error = 0;
	*holgura = 0;

	// Buscamos el final del martillo
	uint32_t inicio_martillo[2];
	sm_buscar_final_etiqueta(ventana_holgura, win_width, win_height, label_martillo, areas_holguras[label_martillo], BUSCAR_FINAL_ETIQUETA_IZQUIERDA, m_laser,0, inicio_martillo);

	// Buscamos la holgura
	uint32_t final_holgura[2];
	sm_buscar_final_etiqueta(ventana_holgura, win_width, win_height, label_holgura, areas_holguras[label_holgura], BUSCAR_FINAL_ETIQUETA_DERECHA,m_laser,0,final_holgura);

	float pixels_holgura = sm_distancia(inicio_martillo, final_holgura, angulo_martillo);

	if (pixels_holgura > 0){
		*holgura = pixels_holgura * SIZE_PIXEL;
	    if (aplicar_correccion == 1){
	        *holgura = (*holgura)*(1+ALTURA_MARTILLO/ALTURA_CAMARA)-ALTURA_MARTILLO*CDX/ALTURA_CAMARA;
	    }
	}

	float tolerancia = holgura_max*0.2;
	if (*holgura > holgura_max+tolerancia || *holgura < -tolerancia){
		*holgura = -1;
		error = 1;
	} else	if (*holgura < 0){
		*holgura=0.0;
	}

	return error;
}


float sm_calibracion_geometria(float holgura_real, float holgura_calculada){

	CDX = (holgura_calculada - holgura_real)*ALTURA_CAMARA/ALTURA_MARTILLO + holgura_calculada;
	return CDX;
}

sm_ycbcr_t sm_rgb2ycbcr(sm_rgb_t color){
	sm_ycbcr_t c;
	float tmp = 0.299*color.r + 0.587*color.g + 0.114*color.b;
	c.y = floor(tmp);
	c.cb = 128 - 0.168736*color.r - 0.331264*color.g + 0.5*color.b;
	c.cr = 128 + 0.5*color.r - 0.41868*color.g - 0.081312*color.b;
	return c;
}

void sm_set_pixel_color(sm_image_t img, uint32_t x, uint32_t y, sm_ycbcr_t color){
	//Debido a que la codificación YCbCr usa un Cr y Cb para cada dos Y tenemos que cambiar el color de dos píxeles consecutivos. Para buscar la posición en bytes del pixel a modificar
	//usamos la siguiente ecuación: pos_pixel = floor(num_pixel/2)*4
	uint32_t pos_pixel = ((y*img.width+x)/2)*4;
	uint8_t* img_data = img.data+pos_pixel;

	*img_data = color.cb;
	img_data++;

	*img_data = color.y;
	img_data++;

	*img_data = color.cr;
	img_data++;

	*img_data = color.y;
}
void sm_plot_linea_v(sm_image_t img, uint32_t x, uint32_t y1, uint32_t y2, sm_ycbcr_t color){
	uint32_t y_ini = y1;
	uint32_t y_fin = y2;
	if (y_fin < y_ini){
		y_ini = y2;
		y_fin = y1;
	}
	uint32_t y;
	for (y=y_ini;y<y_fin;y++){
		sm_set_pixel_color(img, x, y, color);;
	}
}

void sm_plot_linea_h(sm_image_t img, uint32_t y, uint32_t x1, uint32_t x2, sm_ycbcr_t color){
	uint32_t x_ini = x1;
	uint32_t x_fin = x2;
	if (x_fin < x_ini){
		x_ini = x2;
		x_fin = x1;
	}
	uint32_t x;
	for (x=x_ini;x<x_fin;x++){
		sm_set_pixel_color(img, x, y, color);;
	}
}

void sm_plot_linea(sm_image_t img, uint32_t xini, uint32_t xfin, float m, float b, sm_ycbcr_t color){
	uint32_t x;
	if (xini > xfin){
		float tmp = xini;
		xini = xfin;
		xfin = tmp;
	}
	for (x=xini; x<xfin; x++){
		float y = roundf(m*x+b);
		float next_y = roundf(m*(x+1)+b);
		int32_t sign = (next_y-y)/abs(next_y-y);

		sm_set_pixel_color(img, x, y, color);
		if (x<xfin-1 && abs(next_y-y)>1){
			int32_t i;
			for (i=1;i<abs(next_y-y);i++){
				sm_set_pixel_color(img, x, y+sign*i,color);
			}
		}
	}
}

void sm_plot_window(sm_image_t img, window_t win, sm_ycbcr_t color){
	sm_plot_linea_h(img, win.y -1         	, win.x, win.x+win.width, color);
	sm_plot_linea_h(img, win.y          	, win.x, win.x+win.width, color);
	sm_plot_linea_h(img, win.y+win.height   ,win.x, win.x+win.width, color);
	sm_plot_linea_h(img, win.y+win.height +1,win.x, win.x+win.width, color);
	sm_plot_linea_v(img, win.x, win.y, win.y+win.height, color);
	sm_plot_linea_v(img, win.x+win.width, win.y, win.y+win.height, color);
}

void sm_plot_windows(sm_image_t img, sm_ycbcr_t color){
	sm_plot_window(img, CURRENT_WINDOW_11, color);
	sm_plot_window(img, CURRENT_WINDOW_12, color);
	sm_plot_window(img, CURRENT_WINDOW_21, color);
	sm_plot_window(img, CURRENT_WINDOW_22, color);
}
