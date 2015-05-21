/*
 * SM_camera.c
 *
 *  Created on: 29/08/2014
 *      Author: miquel
 */

#include "main.h"
#include "SM_camera.h"
#include "SM_SRAM.h"
#include "usbconf.h"

window_t WINDOW;
window_t WINDOW_11;
window_t WINDOW_12;
window_t WINDOW_21;
window_t WINDOW_22;
window_t WINDOW_SMALL;
window_t WINDOW_11_SMALL;
window_t WINDOW_12_SMALL;
window_t WINDOW_21_SMALL;
window_t WINDOW_22_SMALL;

/*@TODO:revisar los settings del pwm*/

static PWMConfig pwmcfgCAMERA_CLK = {
		42000000, 	/* Frecuencia en Hz del clock del PWM */
		4, 			/* Periodo del PWM. En esta caso cada ciclo contendrá dos clocks de la frecuencia seleccionada arriba*/
		NULL, 		/* No callback */
		/* Only channel 1 enabled */
		{
				{PWM_OUTPUT_ACTIVE_HIGH, NULL},
				{PWM_OUTPUT_DISABLED, NULL},
				{PWM_OUTPUT_DISABLED, NULL},
				{PWM_OUTPUT_DISABLED, NULL},
		},
		0
};

static PWMConfig pwmcfgFlash = {
		100000, 	/* 100khz PWM clock frequency */
		100, 		/* Periodo. Cada ciclo contendrá 100 clocks de la frecuencia de 100khz */
		NULL, 		/* No callback */
		{
		{PWM_COMPLEMENTARY_OUTPUT_ACTIVE_HIGH, NULL}, /* LED FLASH de la placa*/
		{PWM_COMPLEMENTARY_OUTPUT_ACTIVE_HIGH, NULL}, /* Laser 1 */
		{PWM_COMPLEMENTARY_OUTPUT_ACTIVE_HIGH, NULL}, /* Laser 2 */
		{PWM_OUTPUT_DISABLED, NULL},
		},
		0,
		0
};

static WORKING_AREA(waCameraShot, 6000);
static msg_t CameraShot(void *arg) {

	chRegSetThreadName("CameraShot");


	Thread *tp;
	cameraRequest * msg;


	do {
		//esperamos un memsaja
		tp = chMsgWait();
		msg = (cameraRequest*)chMsgGet(tp);


		/* process message here */
		switch (msg->id_req_type){
		case ID_REQ_IMAGEN_JPEG:
		{
			// Nos piden capturar una imagen en JPEG

			//Comprobamos que el tamaño de la imagen sea múltiplo de 8x8 pixels
			if (msg->width % 8 != 0 || msg->height % 8 != 0){
				//Para comprimir una imagen en JPEG el tamaño debe ser múltiplo de 8 pixels
				msg->length = 0;
			} else {
				uint8_t *img  = captureImage(msg->x_start,msg->y_start,msg->width,msg->height, msg->ae_mode, Dest_Image_1); // Capturamos la imagen
				int size = comprimeYCbCr(msg->width,msg->height,img,Dest_JPEG); // Comprimimos la imagen
				msg->length = size;
				msg->result = Dest_JPEG;
			}
		}
		break;
		case ID_REQ_IMAGEN_JPEG_EXISTENTE:
		{
			// Nos piden una imagen existente en JPEG
			if (msg->width % 8 != 0 || msg->height % 8 != 0){
				//Para comprimir una imagen en JPEG el tamaño debe ser múltiplo de 8 pixels
				msg->length = 0;
			} else {
				uint8_t *img  = Bank1_SRAM2_ADDR;  //@TODO: Obtener la direccion correcta
				int size = comprimeYCbCr(msg->width,msg->height,img,Dest_JPEG); // Comprimimos la imagen
				msg->length = size;
				msg->result = Dest_JPEG;
			}
		}
		break;
		case ID_REQ_IMAGEN_YCbCr:
		{
			// Nos piden capturar una imagen en YCbCr
			if (msg->width % 4 != 0 || msg->height % 4 != 0){
				//Para capturar una imagen en YCbCr el tamaño debe ser múltiplo de 4 pixels
				msg->length = 0;
			} else {
				uint8_t *img = captureImage(msg->x_start,msg->y_start,msg->width,msg->height, msg->ae_mode, msg->result);
				msg->length = msg->width*msg->height*2;
			}
		}
		break;
		default:
			break;
		}

		/* answering with the same message */
		chMsgRelease(tp, msg);
	} while (msg);
}

Thread *shooter;
void 	initCamera(uint8_t auto_mode){

	// Inicializa el PWM del clock de la camara
	pwmStart(&PWMD3, &pwmcfgCAMERA_CLK);

	//En pwmcfgCAMERA_CLK tenemos configurado una frecuencia de 16MHz y un periodo de 2 ciclos. Si ponemos width=1 tendremos un clock
	//resultante de 16Mhz con un duty cycle de 50%.
	pwmEnableChannel(&PWMD3, 0, 2);

	// Inicializa el PWM del flash de la camara
	pwmStart(&PWMD8, &pwmcfgFlash);

	//configuramos el i2c
	I2CConfig I2C_conf_struct;
	I2C_conf_struct.op_mode = OPMODE_I2C;
	I2C_conf_struct.clock_speed = 200000;
	//I2C_conf_struct.duty_cycle = STD_DUTY_CYCLE;
	I2C_conf_struct.duty_cycle = FAST_DUTY_CYCLE_2;
	i2cStart(&I2CD2, &I2C_conf_struct);

	//Hacemos un reset de la camara
	Aptina_Reset_Hard();

	//Inicializa el DCMI
	Aptina_Init();

	//Iniciamos el Thread que toma las imagenes
	shooter = chThdCreateStatic(waCameraShot, sizeof(waCameraShot), NORMALPRIO, CameraShot, NULL);

	//Inicializacion de las ventanas. Dentro de esta función se setea la ventana pequeña de AE que engloba las 4 ventanas
	reload_camera_windows();

	//Configuración de la camara
	if (auto_mode == 1){
		Aptina_DefaultConfig();

		Aptina_Set_Command(APTINA_CONTEXT_B_CMD);
	} else {

		Aptina_Set_Command(APTINA_CONTEXT_B_CMD);

		//Pone el WB en modo manual y con el valor leido de los parámetros de configuración
		Aptina_setManualWB(get_manual_wb());

		//Seteamos los registros para que el sensor coja toda la imagen entera
		Aptina_setSensorWindow((window_t){0,0,1280,1024});

		//Seteamos la AE para que se adapte rápidamente: Factor of reduction: 100, AE update every 0 frames, AE luma = current luma
		Aptina_Set_Command(APTINA_AE_A_FAST_CMD);
		Aptina_Set_Command(APTINA_AE_B_FAST_CMD);

		//Configuración de las ventanas de autoexposición grande y pequeña
		Aptina_setAEWindow(BIG_WINDOW, (window_t){0,0,1280,1024}, 1280,1024);
		Aptina_setAEWindow(SMALL_WINDOW, WINDOW_12, 1280,1024);
		//Seteamos la ventana pequeña como ventana para controlar la exposición
		Aptina_setAEWindowMode(SMALL_WINDOW);

		//Pone el target del AE de forma que obetenemos la exposición deseada segun los parámetros de configuración
		Aptina_Set_Command((AptinaCommand_t){REG_AE_GAIN_ZONE_LIMITS, 0x0000}); //No se si es necesario fijar a 0 la zona AE, en principio no
		Aptina_setManualExposicion(get_manual_exposicion());
	}

	if(CAMARA_STANDBY){
		//ponemos en standby
		palSetPad(GPIOB,GPIOB_CAM_STANDBY);
	}


}





void readCameraConfigRegs(void){
	uint32_t param = 0;
	param = Aptina_ReadReg(0x106);
	chprintf((BaseSequentialStream *)&SDU1, "Operation Mode Control (R0x106): 0x%04x\n", param);
	param = Aptina_ReadReg(0x22E);
	chprintf((BaseSequentialStream *)&SDU1, "AE Target luma (R0x22E): 0x%04x\n", param);
	param = Aptina_ReadReg(0x24D);
	chprintf((BaseSequentialStream *)&SDU1, "AE Time averaged luma (R0x24D): 0x%04x\n", param);
	param = Aptina_ReadReg(0x24C);
	chprintf((BaseSequentialStream *)&SDU1, "AE Current luma (R0x24C): 0x%04x\n", param);
	param = Aptina_ReadReg(0x237);
	chprintf((BaseSequentialStream *)&SDU1, "AE zone limits (R0x237): 0x%04x\n", param);
	param = Aptina_ReadReg(0x23F);
	chprintf((BaseSequentialStream *)&SDU1, "AE Current Zone (R0x23F): 0x%04x\n", param);
	param = Aptina_ReadReg(REG_CONTEXT_CONTROL);
	chprintf((BaseSequentialStream *)&SDU1, "Global Context Control (R0x2C8): 0x%04x\n", param);
}

void reload_camera_windows(void){
	WINDOW = (window_t){0,0,1280,1024};
/*
	//todo: Optimizar
	WINDOW_11 = (window_t){get_ventana_x(),							get_ventana_y(),							get_ventana_width(), get_ventana_height()};
	WINDOW_12 = (window_t){get_ventana_x() + get_ventana_distance_x(),get_ventana_y(),							get_ventana_width(), get_ventana_height()};
	WINDOW_21 = (window_t){get_ventana_x(),							get_ventana_y() + get_ventana_distance_y(),	get_ventana_width(), get_ventana_height()};
	WINDOW_22 = (window_t){get_ventana_x() + get_ventana_distance_x(),get_ventana_y() + get_ventana_distance_y(),	get_ventana_width(), get_ventana_height()};

	WINDOW_SMALL = (window_t){get_ventana_x()-OFFSET_WINDOWS, get_ventana_y()-OFFSET_WINDOWS, get_ventana_width()+get_ventana_distance_x()+2*OFFSET_WINDOWS, get_ventana_height()+get_ventana_distance_y()+2*OFFSET_WINDOWS};

	WINDOW_11_SMALL = (window_t){OFFSET_WINDOWS,				OFFSET_WINDOWS,					get_ventana_width(), get_ventana_height()};
	WINDOW_12_SMALL = (window_t){get_ventana_distance_x(),	OFFSET_WINDOWS,					get_ventana_width(), get_ventana_height()};
	WINDOW_21_SMALL = (window_t){OFFSET_WINDOWS,				get_ventana_distance_y(),		get_ventana_width(), get_ventana_height()};
	WINDOW_22_SMALL = (window_t){get_ventana_distance_x(),	get_ventana_distance_y(),		get_ventana_width(), get_ventana_height()};
*/

	uint32_t ventana_x = get_ventana_x();
	uint32_t ventana_y = get_ventana_y();
	uint32_t ventana_width = get_ventana_width();
	uint32_t ventana_height = get_ventana_height();
	uint32_t ventana_distance_x = get_ventana_distance_x();
	uint32_t ventana_distance_y = get_ventana_distance_y();

	WINDOW_11 = (window_t){ventana_x,					  ventana_y,						ventana_width, ventana_height};
	WINDOW_12 = (window_t){ventana_x + ventana_distance_x,ventana_y,						ventana_width, ventana_height};
	WINDOW_21 = (window_t){ventana_x,					  ventana_y + ventana_distance_y,	ventana_width, ventana_height};
	WINDOW_22 = (window_t){ventana_x + ventana_distance_x,ventana_y + ventana_distance_y,	ventana_width, ventana_height};

	uint32_t ventana_small_w0 = ventana_width + ventana_distance_x + 2*OFFSET_WINDOWS;
	uint32_t ventana_small_h0 = ventana_height + ventana_distance_y + 2*OFFSET_WINDOWS;
	uint32_t ventana_small_w = 0;
	uint32_t ventana_small_h = 0;
	uint32_t ventana_small_x = 0;
	uint32_t ventana_small_y = 0;
	uint32_t tamano_extra    = 0;
	uint32_t offset_x = 0;
	uint32_t offset_y = 0;

	if (ventana_small_h0 < 1.25*((float)ventana_small_w0)){
		//Hay que aumentar el height
		ventana_small_h = roundf((float)ventana_small_w0*1.25);
		ventana_small_h -= (ventana_small_h%4); //El tamaño tiene que ser siempre multiplo de 4
		if (ventana_small_h > WINDOW.height){
			//El height no puede ser superior al height total disponible
			ventana_small_h = WINDOW.height;
		}
		//Calculamos la posición 'Y' repartiendo la altura sobrante entre la parte superior e inferior de la imagen
		tamano_extra = roundf(((float)(ventana_small_h - ventana_small_h0))/2.0);
		if (tamano_extra > ventana_y-OFFSET_WINDOWS){
			//Controlamos que la ventna no salga de los límites
			ventana_small_y = 0;
			offset_y = ventana_y;
		} else {
			ventana_small_y = ventana_y - OFFSET_WINDOWS - tamano_extra;
			ventana_small_y -= ventana_small_y % 4;
			offset_y = ventana_y - ventana_small_y; //La posicion inicial tiene que ser multiplo de 4
		}

		//El width no cambia y por lo tanto la posición x tampoco.
		ventana_small_w = ventana_small_w0;;
		ventana_small_x = ventana_x - OFFSET_WINDOWS;
		offset_x = OFFSET_WINDOWS;
	} else {
		//Hay que aumentar el width
		ventana_small_w = roundf((float)ventana_small_h0/1.25);
		ventana_small_w -= ventana_small_w%4; //El tamaño de la ventana tiene que ser siempre multiplo de 4
		if (ventana_small_w > WINDOW.width){
			//El width no puede ser superior al del width total disponible
			ventana_small_w = WINDOW.width;
		}
		//Calculamos la posición 'X' repartiendo el ancho sobrante entre la parte derecha e izquierda de la ventana
		tamano_extra = roundf(((float)(ventana_small_w - ventana_small_w0))/2.0);
		if (tamano_extra > ventana_x-OFFSET_WINDOWS){
			//Controlamos que la ventana no salga de los límites
			ventana_small_x = 0;
			offset_x = ventana_x;
		} else {
			ventana_small_x = ventana_x -OFFSET_WINDOWS - tamano_extra;
			ventana_small_x -= ventana_small_x % 4; //La posicion inicial de la ventna tiene que ser multiplo de 4
			offset_x = ventana_x - ventana_small_x;
		}

		//El height no cambia y por lo tanto la posición y tampoco. El offset es el mínimo necesario para los pixels que se pierden en el procesado
		ventana_small_h = ventana_small_h0;
		ventana_small_y = ventana_y - OFFSET_WINDOWS;
		offset_y = OFFSET_WINDOWS;
	}

	WINDOW_SMALL = (window_t){ventana_small_x, ventana_small_y, ventana_small_w, ventana_small_h};
	WINDOW_11_SMALL = (window_t){offset_x,						offset_y,						ventana_width, ventana_height};
	WINDOW_12_SMALL = (window_t){offset_x + ventana_distance_x,	offset_y,						ventana_width, ventana_height};
	WINDOW_21_SMALL = (window_t){offset_x,						offset_y + ventana_distance_y,	ventana_width, ventana_height};
	WINDOW_22_SMALL = (window_t){offset_x + ventana_distance_x,	offset_y + ventana_distance_y,	ventana_width, ventana_height};

}

void flashOn(){
	//Encendemos el flash con el valor configurado
	pwmEnableChannel(&PWMD8, 0,get_flash_value());

	//esperamos el tiempo requerido
	chThdSleepMilliseconds(get_flash_delay()+1);

}
void flashOff(){
	//Apagamos el flash
	pwmDisableChannel(&PWMD8, 0);
}

uint8_t laserOn = 0;
void lasersOn(uint32_t potencia){

	//Encendemos los lasers
	uint8_t calibrado_potencia = get_calibrado_potenciaLaser_value();
	pwmEnableChannel(&PWMD8,1, potencia*2*calibrado_potencia/100);
	pwmEnableChannel(&PWMD8,2, potencia*2*(100-calibrado_potencia)/100);

	//esperamos el tiempo requerido
	chThdSleepMilliseconds(get_flash_delay()+1);
	laserOn = 1;
}

void lasersOff(){

	//Apagamos los lasers
	pwmDisableChannel(&PWMD8, 1);
	pwmDisableChannel(&PWMD8, 2);
	laserOn = 0;
}

uint8_t isLasersOn(){
	return laserOn;
}

void * captureImage(uint32_t x_start, uint32_t y_start, uint32_t width, uint32_t height, uint8_t ae_mode, uint32_t mem_pos){

	if (CAMARA_STANDBY){
		palClearPad(GPIOB,GPIOB_CAM_STANDBY);
	}

	msg_t result;
	do {
		result = cropSnapshot(x_start,y_start, width, height, ae_mode, mem_pos);
		//Controlar en el resultado de la función los siguientes casi;
		//TODO:El tamaño no es múltiplo de 8x8 pixels
		//TODO:La ventana está fuera del area de la imagen
	} while (result != RDY_OK);

	if (CAMARA_STANDBY){
		palSetPad(GPIOB,GPIOB_CAM_STANDBY);
	}


	return mem_pos;
}

void * getExistingImageJPEG(uint32_t *size,uint32_t width, uint32_t height){
	cameraRequest r;
	r.id_req_type = ID_REQ_IMAGEN_JPEG_EXISTENTE;
	r.width = width;
	r.height = height;
	r.x_start = 0;
	r.y_start = 0;
	r.ae_mode = AE_WINDOW_BIG;
	chMsgSend(shooter,&r);
	*size = r.length;
	return r.result;
}


void * getImageJPEG(uint32_t *size,uint32_t x_start, uint32_t y_start,uint32_t width, uint32_t height, uint8_t ae_mode){
	cameraRequest r;
	r.id_req_type = ID_REQ_IMAGEN_JPEG;
	r.width = width;
	r.height = height;
	r.x_start = x_start;
	r.y_start = y_start;
	r.ae_mode = ae_mode;
	chMsgSend(shooter,&r);
	*size = r.length;
	return r.result;
}

void * getImageYCbCr(uint32_t *size, uint32_t x_start, uint32_t y_start,uint32_t width, uint32_t height, uint8_t ae_mode, uint32_t mem_pos){
	cameraRequest r;
	r.result = mem_pos;
	r.id_req_type = ID_REQ_IMAGEN_YCbCr;
	r.width = width;
	r.height = height;
	r.x_start = x_start;
	r.y_start = y_start;
	r.ae_mode = ae_mode;
	chMsgSend(shooter,&r);
	*size = r.length;
	return r.result;
}


/**
  * @brief  Toma una imagen con dos exposiciones distintas. La imagen queda en la posición de memoria Dest_Image_1.
  * @param size Puntero para devolver el tamaño en bytes de la imagen
  * @param x_start Cordenada x donde se empieza a tomar la imagen
  * @param y_start Cordenada y donde se empieza a tomar la imagen
  * @param width Ancho de la imagen
  * @param height Alto de la imagen
  */

void * getImageDoubleExposition(uint32_t *size, uint32_t x_start, uint32_t y_start,uint32_t width, uint32_t height, uint32_t mem_pos, uint8_t apaga_lasers, uint8_t ae_mode){


	uint32_t width1 = get_divisorLaser_value()-x_start;
	uint32_t width2 = width - width1;

	uint8_t potencia2 = get_laser_potencia2_value();
	uint8_t potencia1 = get_laser_potencia1_value();

	uint8_t *bloque_mem_1;
	uint32_t bloque_mem_2;
	uint32_t bloque_mem_3;
	uint32_t result = mem_pos;

	//Si el tamaño de la imagen que se pide supera el tamaño de un bloque (Size_Block) usamos toda la memoria para capturar la imagen
	if (width*height*2>Size_Block){
		bloque_mem_1 = Dest_Image_1;
		bloque_mem_2 = Dest_Image_2;
		bloque_mem_3 = Dest_Image_3;
		result = Dest_Image_1;
	} else {
		bloque_mem_1 = mem_pos;
		bloque_mem_2 = mem_pos+Size_Block;
		bloque_mem_3 = mem_pos+2*Size_Block;
	}

	if (potencia2 != potencia1) {
		//Enciendo los lasers
		lasersOn(potencia1);

		// Tomo la segunda parte de la imagen
		uint32_t size2=0;

		uint8_t *tmp_2 = getImageYCbCr(&size2,x_start+width1,y_start,width2, height, ae_mode, bloque_mem_3);

		if (size2 == 0){
			//Algo ha ido mal, la imagen no se ha capturado
			*size = 0;
			lasersOff();
			return NULL;
		}

		//Nos esperamos al siguiente Frame
		Aptina_waitOneFrame();

		// Cambio la iluminación
		lasersOn(potencia2);

		//Tomo la primera parte de la imagen
		uint32_t size1=0;
		uint8_t *tmp_1 =  getImageYCbCr(&size1,x_start,y_start,width1, height, AE_WINDOW_NOCHANGE, bloque_mem_2);

		if (apaga_lasers == 1){
			lasersOff();
		}

		if (size1 == 0){
			//Algo ha ido mal, la imagen no se ha capturado
			*size = 0;
			return NULL;
		}

		*size = size1 + size2;
		uint32_t x = 0;
		uint32_t k = 0;
		for (k=0;k<*size;k++){
			if (x<width1*2){
				*bloque_mem_1 = *tmp_1;
				tmp_1++;
			} else {
				*bloque_mem_1 = *tmp_2;
				tmp_2++;
			}
			bloque_mem_1++;
			x++;
			if (x == width*2){
				x=0;
			}
		}
	} else {
		//Si la potencia de las dos partes de la imagen es la misma solamente tomamos una foto
		//Enciendo los lasers
		lasersOn(potencia1);

		//Cambiamos el tipo de ventana de AE ya que la potencia de los lasers es igual y tomamos una foto entera
		if (ae_mode == AE_WINDOW_BIG_HALF) ae_mode = AE_WINDOW_BIG;
		else if (ae_mode == AE_WINDOW_MED_HALF) ae_mode = AE_WINDOW_MEDIUM;

		getImageYCbCr(size,x_start,y_start,width, height, ae_mode, bloque_mem_1);
		if (apaga_lasers == 1){
			lasersOff();
		}
		chThdSleep(MS2ST(200));

	}

	return result;
}
