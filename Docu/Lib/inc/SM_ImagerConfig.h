/**
  ******************************************************************************
  * @file    SM_ImagerConfig.h
  * @author  rafel
  * @version V1.0
  * @date    24-04-2015
  * @brief   Este fichero contiene la interfice de configuración del SOC mediante
  * 		 el programa Imager.
  *
  * Este fichero contiene las funciones y interficie de comunicación a través de
  * Serial USB para comunicarse con el programa de PC escrito en Python con el
  * que se puede configurar los parámetros de instalación del SOC
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SM_IMAGERCONFIG_H
#define __SM_IMAGERCONFIG_H

#include "SM_tipos.h"

#define IMAGER_CONNECTION_TIMEOUT 20000 //Miliseconds

#define CMD_ACTIVITY_MODE		 'a'
#define CMD_TAKE_PICTURE_NOAR	 'b'
#define CMD_TAKE_PICTURE 		 'c'
#define CMD_CONTINUOUS_MODE		 'C'
#define CMD_TAKE_PICTURE_NOLASER 'd'
#define CMD_FLASH_OFF			 'f'
#define CMD_FLASH_ON			 'F'
#define CMD_LASERS_OFF			 'l'
#define CMD_LASERS_ON			 'L'
#define CMD_CONNECT				 'm'
#define CMD_DISCONNECT			 'n'
#define CMD_READ_CONFIG 		 'r'
#define CMD_SNAPSHOT_MODE		 's'
#define CMD_WRITE_CONFIG_PARAM   'w'


#define CP_LASER_POTENCIA1 		'a'
#define CP_LASER_POTENCIA2 		'b'
#define CP_INVERTIR_POSICION	'c'
#define CP_FLASH_DELAY			'd'
#define CP_MANUAL_EXPOSITION	'e'
#define CP_FLASH_POTENCIA		'f'
#define CP_LASER_CALIB			'g'
#define CP_CDX					'h'
#define CP_ID_DAEN				'i'
#define CP_ANGULO_MARTILLO		'j'
#define CP_SIZE_PIXEL			'k'
#define CP_HOLGURA_MAX1			'o'
#define CP_HOLGURA_MAX2			'p'
#define CP_TIPO_DAEN			't'
#define CP_VENTANAS				'v'
#define CP_MANUAL_WB			'w'


void initImagerConfig(void);

void cambiarModoSOC(modoSOC_t nuevoModo, uint8_t fromISR);








#endif
