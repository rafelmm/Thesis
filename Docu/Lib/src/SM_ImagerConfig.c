#include "ch.h"
#include "hal.h"

#include "SM_ImagerConfig.h"
#include "DCMI_Aptina_MT9M131.h"
#include "chprintf.h"
#include "usbconf.h"
#include "JPEGLib.h"
#include "SM_camera.h"
#include "SM_ConfigParams.h"
#include "SM_image.h"
#include "SM_SRAM.h"
#include "main.h"
#include "SM_protocol.h"
#include "SM_stm32f4xx_iwdg.h"

BinarySemaphore controlEstadosSem;
void cambiarModoSOC(modoSOC_t nuevoModo, uint8_t fromISR){
	extern modoSOC_t MODO_SOC;
	if (MODO_SOC != nuevoModo){
		MODO_SOC = nuevoModo;
		if (MODO_SOC == ACTIVIDAD || MODO_SOC == CONTINUO){
			if (fromISR == TRUE){
				chSysLockFromIsr();
				chBSemSignalI(&controlEstadosSem);
				chSysUnlockFromIsr();
			} else {
				chBSemSignal(&controlEstadosSem);
			}
		}
	}
}

static WORKING_AREA(waThreadControlEstados, 256);
__attribute__((noreturn))
static void ThreadControlEstados(void *arg) {
	chRegSetThreadName("ThreadControlEstados");
	extern uint8_t POSICION_BARRA_ABAJO;
	extern float HOLGURA;
	extern modoSOC_t MODO_SOC;
	extern uint8_t POSICION_MOTOR;
	while (!chThdShouldTerminate()){
		//Esperamos a que alguien notifique que se ha cambiado el modo SOC
		if( chBSemWait(&controlEstadosSem) == RDY_OK){

			while (MODO_SOC == CONTINUO || MODO_SOC == ACTIVIDAD){

				//tmStartMeasurement(&tm);
				getHolgura(1, MODO_SOC, &HOLGURA,&POSICION_MOTOR,FALSE,FALSE,FALSE);
				//tmStopMeasurement(&tm);

				//unsigned long elapsed_time = RTT2US(tm.last);

				chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "POSICION",POSICION_MOTOR);
				chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "HOLGURA",(uint32_t)(HOLGURA*100));

				if (MODO_SOC == ACTIVIDAD){

					//esperamos los 10 segundos de la actividad a menos que se cambie de estado
					uint32_t tiempo = 0;
					while (tiempo<1000 && MODO_SOC == ACTIVIDAD){
						chThdSleep(MS2ST(10));
						tiempo++;
					}
				}
			}
		}
	}
}


static WORKING_AREA(waThreadWB, 256);
__attribute__((noreturn))
static void ThreadWB(void *arg) {
	chRegSetThreadName("ThreadWB");
	uint16_t target_wb = get_manual_wb() & 0x00FF;
	uint16_t wb_matrix_position = Aptina_ReadReg(REG_WB_MATRIX_POSITION);
	uint16_t wb_matrix_position_prev = 0;
	uint16_t milis_sin_cambios = 0;

	while( wb_matrix_position != target_wb && milis_sin_cambios < 5000){
		chThdSleepMilliseconds(50);
		wb_matrix_position = Aptina_ReadReg(REG_WB_MATRIX_POSITION);
		chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "WB", wb_matrix_position);

		if (wb_matrix_position == wb_matrix_position_prev) {
			milis_sin_cambios += 50;
		} else {
			milis_sin_cambios = 0;
			wb_matrix_position_prev = wb_matrix_position;
		}
	}
	//Volvemos a poner WB Manual
	Aptina_Set_Command(APTINA_DISABLE_AWB_CMD);
}

VirtualTimer connectionStatusVT;
void connectionStatusVT_callback(void *p){

	cambiarModoSOC(NORMALOPERATION, TRUE);
}

/*
 *
 * Serial USB
 */
static WORKING_AREA(waUSBThread, 1024);
__attribute__((noreturn))
static void USBThread(void *arg) {

	chRegSetThreadName("usb");

	extern uint8_t POSICION_BARRA_ABAJO;
	extern float HOLGURA;
	extern modoSOC_t MODO_SOC;
	extern uint8_t POSICION_MOTOR;

	sduObjectInit(&SDU1);
	sduStart(&SDU1,&serusbcfg);

	while (!chThdShouldTerminate()){
		/*
		 * Activates the USB driver and then the USB bus pull-up on D+.
		 * Note, a delay is inserted in order to not have to disconnect the cable
		 * after a reset.
		 */
		usbDisconnectBus(serusbcfg.usbp);
		chThdSleepMilliseconds(1500);
		usbStart(serusbcfg.usbp, &usbcfg);
		usbConnectBus(serusbcfg.usbp);

		// Wait USB ready
		while (SDU1.config->usbp->state != USB_ACTIVE)
		{
			chThdSleepMilliseconds(1000);
		}

		chThdSleepMilliseconds(10);

		while (SDU1.config->usbp->state == USB_ACTIVE) {

			uint32_t size = 0;
			uint8_t command;

			if (chSequentialStreamRead(&SDU1,&command,1) == 0)
				continue;

			switch(command){
				case CMD_CONNECT:{
					cambiarModoSOC(SNAPSHOT, FALSE);
					//Reiniciamos el timeout de desconexión
					//chVTReset(&connectionStatusVT);
					//chVTSet(&connectionStatusVT, MS2ST(IMAGER_CONNECTION_TIMEOUT),connectionStatusVT_callback,NULL);
					continue;
				}
				case CMD_DISCONNECT:{
					//Paramos el timeout de desconexión
					//chVTReset(&connectionStatusVT);
					cambiarModoSOC(NORMALOPERATION, FALSE);
					continue;
				}
				default:{
					if (MODO_SOC == NORMALOPERATION){
						//Si el MODO_SOC es operación normal no procesamos el comando USB
						chprintf((BaseSequentialStream *)&SDU1, "SOC no conectado\n");
						continue;
					}
					break;
				}
			}

			switch(command){
				case CMD_READ_CONFIG:{

					//chThdSleepMilliseconds(100);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "FLASH",get_flash_value());
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "DELAY",get_flash_delay());
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "IDDAEN",get_id_daen());
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "TIPODAEN",get_tipo_daen());
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n%u\n%u\n%u\n%u\n%u\n", "VENTANA",
							get_ventana_x(),
							get_ventana_y(),
							get_ventana_width(),
							get_ventana_height(),
							get_ventana_distance_x(),
							get_ventana_distance_y());
					uint16_t wb_matrix_position = Aptina_ReadReg(REG_WB_MATRIX_POSITION);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "WB", wb_matrix_position);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "EXPOSICION", get_manual_exposicion());
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "LASER1", get_laser_potencia1_value());
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "LASER2", get_laser_potencia2_value());
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "CALIBLASERS", get_calibrado_potenciaLaser_value());
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "MODO", MODO_SOC);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "POSICION", POSICION_MOTOR);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "HOLGURA",(uint32_t)(HOLGURA*100));
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "HOLGURAMAX1",(uint32_t)(get_holgura_maxima_1()*100));
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "HOLGURAMAX2",(uint32_t)(get_holgura_maxima_2()*100));
					break;
				}
				case CMD_TAKE_PICTURE:
				case CMD_TAKE_PICTURE_NOAR:
				case CMD_TAKE_PICTURE_NOLASER:{

					//extern window_t WINDOW_12;
					//camera_set_small_window(WINDOW_12);

					cambiarModoSOC(SNAPSHOT, FALSE);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "MODO", MODO_SOC); //Escribimos MODO_SOC para cambiar la interficie gráfica
					uint8_t con_realidad_aumentada = 1;
					uint8_t con_laser = 1;
					uint8_t con_flash = 0;
					if (command == CMD_TAKE_PICTURE_NOAR){
						con_realidad_aumentada = 0;
					} else if (command == CMD_TAKE_PICTURE_NOLASER){
						con_realidad_aumentada = 0;
						con_laser = 0;
						con_flash = 1;
					}
					uint8_t comprimida = 1;
					sm_image_t image = getImage(con_flash, con_laser, con_realidad_aumentada, BIG, comprimida);


					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "IMAGEHEIGHT", image.height);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "IMAGEWIDTH",image.width);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "IMAGESTART",image.size);
					chnWrite((BaseSequentialStream *)&SDU1, image.data, image.size);
					if (comprimida == 0){
						chprintf((BaseSequentialStream *)&SDU1, "%s,\n", "IMAGEENDYCBCR");
					} else {
						chprintf((BaseSequentialStream *)&SDU1, "%s,\n", "IMAGEENDJPEG");
					}

					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "POSICION",POSICION_MOTOR);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "HOLGURA",(uint32_t)(HOLGURA*100));

					//Una vez enviada la imagen liberamos la cámara
					free_camera();
					break;
				}
				case 'e':{
					extern window_t WINDOW_12;
					uint32_t img_x = WINDOW_12.x - OFFSET_WINDOWS;
					uint32_t img_y = WINDOW_12.y - OFFSET_WINDOWS;
					sm_image_t image;
					image.width = WINDOW_12.width + 2*OFFSET_WINDOWS;
					image.height = WINDOW_12.height + 2*OFFSET_WINDOWS;
					image.data = Dest_Image_1;

					lasersOn(get_laser_potencia1_value());
					image.data = getImageYCbCr(&image.size, img_x, img_y, image.width, image.height, AE_WINDOW_SMALL, image.data);
					lasersOff();


					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "IMAGEHEIGHT", image.height);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "IMAGEWIDTH",image.width);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "IMAGESTART",image.size);
					chnWrite((BaseSequentialStream *)&SDU1, image.data, image.size);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n", "IMAGEENDYCBCR");

					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "POSICION",POSICION_MOTOR);
					chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "HOLGURA",(uint32_t)(HOLGURA*100));
					break;
				}
				case CMD_SNAPSHOT_MODE:{ // Modo Snapshot
					cambiarModoSOC(SNAPSHOT, FALSE);
					Aptina_setAEWindowMode(SMALL_WINDOW);
					lasersOff();
					break;
				}
				case CMD_ACTIVITY_MODE:{ // Modo Actividad
					cambiarModoSOC(ACTIVIDAD,FALSE);
					Aptina_setAEWindowMode(SMALL_WINDOW);
					lasersOff();
					break;
				}
				case CMD_CONTINUOUS_MODE:{ // Modo Continuo

					cambiarModoSOC(CONTINUO, FALSE);
					Aptina_setAEWindowMode(BIG_WINDOW);
					lasersOn(get_laser_potencia1_value());
					break;
				}
				case CMD_FLASH_OFF:{
					flashOff();
					break;
				}
				case CMD_FLASH_ON:{
					//Flash on
					flashOn();
					break;
				}
				case CMD_LASERS_OFF:{
					//Lasers off
					lasersOff();
					break;
				}
				case CMD_LASERS_ON:{
					//Lasers on
					lasersOn(get_laser_potencia2_value());
					break;
				}
				case CMD_WRITE_CONFIG_PARAM:{
					IWDG_ReloadCounter();
					chSequentialStreamRead(&SDU1,&command,1);

					switch(command){
						case CP_LASER_POTENCIA1:{
							uint8_t recv_value;
							chSequentialStreamRead(&SDU1,&recv_value,1);
							set_laser_potencia1_value(recv_value);
							if (isLasersOn()==1) lasersOn(recv_value);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", recv_value);
							break;
						}
						case CP_LASER_POTENCIA2:{
							uint8_t recv_value;
							chSequentialStreamRead(&SDU1,&recv_value,1);
							set_laser_potencia2_value(recv_value);
							if (isLasersOn()==1) lasersOn(recv_value);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", recv_value);
							break;
						}
						case CP_FLASH_DELAY:{
							uint16_t recv_value;
							chSequentialStreamRead(&SDU1,&recv_value,sizeof(uint16_t));
							set_flash_delay(recv_value);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", recv_value);
							break;
						}
						case CP_MANUAL_EXPOSITION:{
							uint8_t exposicion;
							chSequentialStreamRead(&SDU1, &exposicion, sizeof(uint8_t));
							set_manual_exposicion(exposicion);
							Aptina_setManualExposicion(exposicion);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", exposicion);
							break;
						}
						case CP_FLASH_POTENCIA:{
							uint8_t recv_value;
							chSequentialStreamRead(&SDU1,&recv_value,1);
							set_flash_value(recv_value);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", recv_value);
							break;
						}
						case CP_LASER_CALIB:{
							uint8_t recv_value;
							chSequentialStreamRead(&SDU1,&recv_value,1);
							set_calibrado_potenciaLaser_value(recv_value);
							if (isLasersOn()==1) lasersOn(recv_value);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", recv_value);
							break;
						}
						case CP_CDX:{
							//Leemos la holgura real que se pasa desde el PC
							float holgura_real;
							chSequentialStreamRead(&SDU1,&holgura_real, sizeof(float));

							//Calculamos la holgura sin aplicar la corrección
							float holgura_calculada;
							uint8_t posicion_motor;
							getHolgura(0,0,&holgura_calculada, &posicion_motor,FALSE,FALSE,FALSE);

							if (posicion_motor == POSICION_MOTOR_BARRAS_FUERA) {
								//Solamente actualizamos el CDX si el motor está barras fuera
								float cdx = sm_calibracion_geometria(holgura_real, holgura_calculada);
								sm_actualizar_CDX(cdx);

								//Escribimos por serie el CDX calculado
								chprintf((BaseSequentialStream *)&SDU1, "%s,\n%s%u\n", "MSGBOX", "Se ha grabado el valor de CDX (mm*100): ", (uint32_t)(cdx*100));
							} else {
								//El motor no está en la posición correcta para actualizar la medida de CDX
								chprintf((BaseSequentialStream *)&SDU1, "%s,\n%s\n", "MSGBOX","El motor debe estar en posición barras fuera para calcular el CDX");
							}
							break;
						}
						case CP_ID_DAEN:{
							uint32_t recv_value;
							chSequentialStreamRead(&SDU1,&recv_value,sizeof(uint32_t));
							uint32_t prev_id_daen = get_id_daen();
							//Solo reseteo el CAN si ha cambiado el id de daen asociado
							if (recv_value != prev_id_daen) {
								extern uint32_t EID_DISP;
								EID_DISP = recv_value;
								set_id_daen(recv_value);
								reinitCANIO(&CAND1);
							}
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", recv_value);
							break;
						}
						case CP_ANGULO_MARTILLO:{
							float angulo_martillo;
							chSequentialStreamRead(&SDU1, &angulo_martillo, sizeof(float));
							if (POSICION_MOTOR == POSICION_MOTOR_BARRAS_FUERA){
								sm_actualizar_angulo_martillo_2(angulo_martillo);
							} else if (POSICION_MOTOR == POSICION_MOTOR_BARRAS_DENTRO){
								sm_actualizar_angulo_martillo_1(angulo_martillo);
							}
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", (uint32_t)(angulo_martillo*10));
							break;
						}
						case CP_HOLGURA_MAX1:{
							float holgura_max_1;
							chSequentialStreamRead(&SDU1, &holgura_max_1, sizeof(float));
							sm_actualizar_holgura_max_1(holgura_max_1);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", (uint32_t)(holgura_max_1*10));
							break;
						}
						case CP_HOLGURA_MAX2:{
							float holgura_max_2;
							chSequentialStreamRead(&SDU1, &holgura_max_2, sizeof(float));
							sm_actualizar_holgura_max_2(holgura_max_2);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", (uint32_t)(holgura_max_2*10));
							break;
						}
						case CP_TIPO_DAEN:{
							uint8_t tipo_daen;
							chSequentialStreamRead(&SDU1,&tipo_daen,sizeof(uint8_t));
							extern uint16_t sid_list[NUM_TIPOS_DAEN];
							uint8_t prev_tipo_daen = get_tipo_daen();
							if ((prev_tipo_daen != tipo_daen) && (tipo_daen>=0) && (tipo_daen < NUM_TIPOS_DAEN) ){
								set_tipo_daen(tipo_daen);
								reinitCANIO(&CAND1);
							}
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", tipo_daen);
							break;
						}
						case CP_VENTANAS:{
							uint32_t startx=0;
							uint32_t starty=0;
							uint32_t width=0;
							uint32_t height=0;
							uint32_t distance_x=0;
							uint32_t distance_y=0;

							IWDG_ReloadCounter();
						 	chSequentialStreamRead(&SDU1, &startx,	  sizeof(uint32_t));
							chSequentialStreamRead(&SDU1, &starty,	  sizeof(uint32_t));
							chSequentialStreamRead(&SDU1, &width,	  sizeof(uint32_t));
							chSequentialStreamRead(&SDU1, &height,	  sizeof(uint32_t));
							chSequentialStreamRead(&SDU1, &distance_x, sizeof(uint32_t));
							chSequentialStreamRead(&SDU1, &distance_y, sizeof(uint32_t));


							set_ventana_x(startx);
							set_ventana_y(starty);
							set_ventana_width(width);
							set_ventana_height(height);
							set_ventana_distance_x(distance_x);
							set_ventana_distance_y(distance_y);

							reload_camera_windows();

							//Calculamos la nueva posicion del divisor del laser y la grabamos en la EPROM
							uint32_t divisor_laser = startx + (width + distance_x)/2;
							divisor_laser -= divisor_laser%8;
							set_divisorLaser_value(divisor_laser);

							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u %u %u %u %u %u\n", "RESP", startx, starty, width, height, distance_x, distance_y);
							break;

						}
						case CP_MANUAL_WB:{
							uint8_t wb_position;
							chSequentialStreamRead(&SDU1, &wb_position, sizeof(uint8_t));
							set_manual_wb(wb_position);
							Aptina_setManualWB(wb_position);
							chThdCreateStatic(waThreadWB, sizeof(waThreadWB), NORMALPRIO, ThreadWB, NULL);
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", wb_position);
							break;
						}
						case CP_INVERTIR_POSICION:{
							uint8_t nueva_posicion = (get_posicion_barra_abajo()+1)%2;
							sm_actualizar_posicion_barra_abajo(nueva_posicion);
							if (POSICION_MOTOR == POSICION_MOTOR_BARRAS_FUERA){
								POSICION_MOTOR = POSICION_MOTOR_BARRAS_DENTRO;
							} else if (POSICION_MOTOR == POSICION_MOTOR_BARRAS_DENTRO){
								POSICION_MOTOR = POSICION_MOTOR_BARRAS_FUERA;
							}
							chprintf((BaseSequentialStream *)&SDU1, "%s,\n%u\n", "RESP", nueva_posicion);
							break;
						}
						case CP_SIZE_PIXEL:{

							//Leemos la holgura real que se pasa desde el PC
							float holgura_real;
							chSequentialStreamRead(&SDU1,&holgura_real, sizeof(float));

							//Calculamos la holgura
							float holgura_calculada;
							uint8_t posicion_motor;
							getHolgura(1,0,&holgura_calculada, &posicion_motor, FALSE,FALSE,FALSE);

							if (posicion_motor == POSICION_MOTOR_BARRAS_DENTRO) {
								//Solamente actualizamos el tamaño del pixel si el motor está barras dentro
								extern float SIZE_PIXEL;
								SIZE_PIXEL = (SIZE_PIXEL * holgura_real)/holgura_calculada;
								sm_actualizar_size_pixel(SIZE_PIXEL);

								//Escribimos por serie el tamaño de pixel calculado
								chprintf((BaseSequentialStream *)&SDU1, "%s,\n%s%u\n", "MSGBOX", "Se ha grabado el tamano de pixel (mm*100): ", (uint32_t)(SIZE_PIXEL*100));
							} else {
								//El motor no está en la posición correcta para actualizar el tamaño del pixel
								chprintf((BaseSequentialStream *)&SDU1, "%s,\n%s\n", "MSGBOX","El motor debe estar en posición barras dentro para calcular el tamaño del pixel");
							}
							break;
						}
						default: break;
					}
					break;
				}
				default: break;
			}
		}
	}
}

void initImagerConfig(void){

	//Inicializamos el semaforo de sincronizacion del Thread de control de estados. Lo inicializamos a TRUE para que el ThreadControlEstados se bloquee en el al inicio del programa
	chBSemInit(&controlEstadosSem, TRUE);

	//Creamos el thread de control de estados del soc
	chThdCreateStatic(waThreadControlEstados, sizeof(waThreadControlEstados), NORMALPRIO, ThreadControlEstados, NULL);

	// Creates the usb thread.
	chThdCreateStatic(waUSBThread, sizeof(waUSBThread), NORMALPRIO, USBThread, NULL);
}

