/*
 * SM_ConfigParams.h
 *
 *  Created on: 30/07/2014
 *      Author: ezio
 */

#ifndef SM_CONFIGPARAMS_H_
#define SM_CONFIGPARAMS_H_

#include "ch.h"
#include "stm32f4xx_flash.h"


#define NUM_MAX_CONFIG_PARAM 50
#define MAX_READER_CONC 5
#define FACTOR_CALIBRACION 10000000

#define PARAM_OK 0
#define PARAM_ERR 1

#define PARAM_CONF_FLASH_START_ADDR     0x080E0000
#define FLASH_SECTOR_NUMBER 			FLASH_Sector_11


#define PARAM_TIEMPO_FLASH_MILISEC		0	/*!< El tiempo de flash antes de una fotor*/
#define PARAM_INTENSIDAD_FLASH			1	/*!< La intensidad del flash   (0-99)   */
#define PARAM_ID_DAEN					2	/*!< La EID del daen asociado   */
#define PARAM_TIPO_DAEN					3	/*!< EL tipo de daen asociado   */
#define PARAM_VENTANA_X					4	/*!< X inicial de la ventana de imagen superior izquierda (11)*/
#define PARAM_VENTANA_Y					5	/*!< Y inicial de la ventana de imagen superior izquierda (11)  */
#define PARAM_VENTANA_DIM_X				6	/*!< Longitud en x de las ventanas de imagen (pixels) */
#define PARAM_VENTANA_DIM_Y				7	/*!< Longitud en y de las ventanas de imagen (pixels) */
#define PARAM_VENTANA_DISTANCE_X		8	/*!< Separación en x de las ventanas 11 y 12, 21 y 22 */
#define PARAM_VENTANA_DISTANCE_Y		9	/*!< Separación en y de las ventanas 11 y 21, 12 y 22 */
#define PARAM_MANUAL_WB					10 	/*!< Valor de la posición de la matriz en WB manual */
#define PARAM_MANUAL_EXPOSICION			11	/*!< Valor de la exposición manual. */
#define PARAM_INTENSIDAD_LASER_1		12	/*!< La intensidad del laser 1  (0-99)   */
#define PARAM_INTENSIDAD_LASER_2		13	/*!< La intensidad del laser 2  (0-99)   */
#define PARAM_DIVISOR_LASER				14	/*!< Indica el punto donde se divide la imagen para la intensidad del laser */
#define PARAM_CALIBRADO_POTENCIA_LASER 	15	/*!< Indica el valor de calibrado entre los dos laseres para que se vean con la misma intensidad*/
#define PARAM_POSICION_BARRA_ABAJO		16  /*!< Indica la posición dónde se encuentra la barra de abajo. 0 -> Abajo, v21 y v22; 1 -> Arriba, v11 y v12 */
#define PARAM_CDX						17	/*!< Indica el desplazamiento de la camara respecto el martillo. Se calcula en la instalación y se carga en una variable global cuando se resetea el SOC */
#define PARAM_ANGULO_MARTILLO_1			18	/*!< Indica el angulo del martillo 1 */
#define PARAM_ANGULO_MARTILLO_2			19  /*!< Indica el angulo del martillo 2 */
#define PARAM_HOLGURA_MAXIMA_1			20  /*!< Indica la holgura máxima de la barra de comprobación 1 */
#define PARAM_HOLGURA_MAXIMA_2			21  /*!< Indica la holgura máxima de la barra de comprobación 2 */
#define PARAM_SIZE_PIXEL				22  /*!< Indica el tamaño en milimetros de un pixel */

#define PARAM_TIEMPO_FLASH_MILISEC_MIN		0
#define PARAM_TIEMPO_FLASH_MILISEC_MAX		2000
#define PARAM_INTENSIDAD_FLASH_MIN			0
#define PARAM_INTENSIDAD_FLASH_MAX			99
#define PARAM_ID_DAEN_MIN					0
#define PARAM_ID_DAEN_MAX					0xFFFFFFFF
#define PARAM_TIPO_DAEN_MIN					0
#define PARAM_TIPO_DAEN_MAX					20
#define PARAM_VENTANA_X_MIN					4
#define PARAM_VENTANA_X_MAX					1279
#define PARAM_VENTANA_X_DEFAULT				440
#define PARAM_VENTANA_Y_MIN					4
#define PARAM_VENTANA_Y_MAX					1023
#define PARAM_VENTANA_Y_DEFAULT				384
#define PARAM_VENTANA_DIM_X_MIN				100
#define PARAM_VENTANA_DIM_X_MAX				640
#define PARAM_VENTANA_DIM_X_DEFAULT			152
#define PARAM_VENTANA_DIM_Y_MIN				80
#define PARAM_VENTANA_DIM_Y_MAX				512
#define PARAM_VENTANA_DIM_Y_DEFAULT			104
#define PARAM_VENTANA_DISTANCE_X_MIN		100
#define PARAM_VENTANA_DISTANCE_X_MAX		1080
#define PARAM_VENTANA_DISTANCE_X_DEFAULT	248
#define PARAM_VENTANA_DISTANCE_Y_MIN		80
#define PARAM_VENTANA_DISTANCE_Y_MAX		860
#define PARAM_VENTANA_DISTANCE_Y_DEFAULT	152
#define PARAM_MANUAL_WB_MIN					0
#define PARAM_MANUAL_WB_MAX					127
#define PARAM_MANUAL_EXPOSICION_MIN			0x00
#define PARAM_MANUAL_EXPOSICION_MAX			0xFF
#define PARAM_INTENSIDAD_LASER_1_MIN		0
#define PARAM_INTENSIDAD_LASER_1_MAX		99
#define PARAM_INTENSIDAD_LASER_2_MIN		0
#define PARAM_INTENSIDAD_LASER_2_MAX		99
#define PARAM_DIVISOR_LASER_MIN				0
#define PARAM_DIVISOR_LASER_MAX				1280
#define PARAM_DIVISOR_LASER_DEFAULT			640
#define PARAM_CALIBRADO_POTENCIA_LASER_MIN	0
#define PARAM_CALIBRADO_POTENCIA_LASER_MAX	99
#define PARAM_POSICION_BARRA_ABAJO_V22		1
#define PARAM_POSICION_BARRA_ABAJO_V11		0
#define PARAM_CDX_MAX						20.0
#define PARAM_CDX_DEFAULT					6.5
#define PARAM_ANGULO_MARTILLO_1_DEFAULT		1.1809
#define PARAM_ANGULO_MARTILLO_2_DEFAULT		1.9524
#define PARAM_HOLGURA_MAXIMA_DEFAULT		5.0
#define PARAM_HOLGURA_MAXIMA_MAX			25.0
#define PARAM_SIZE_PIXEL_MAX				1.0
#define PARAM_SIZE_PIXEL_MIN				0.0
#define PARAM_SIZE_PIXEL_DEFAULT			0.068

void initConfigParams(void);
uint32_t getParam(uint8_t numParam);
float getFloatParam(uint8_t numParam);
msg_t setParam(uint8_t numParam, uint32_t value);
msg_t setFloatParam(uint8_t numParam, float value);

uint8_t  get_flash_value(void);
uint16_t get_flash_delay(void);
uint8_t get_tipo_daen(void);
uint32_t get_ventana_x(void);
uint32_t get_ventana_y(void);
uint32_t get_ventana_width(void);
uint32_t get_ventana_height(void);
uint32_t get_ventana_distance_x(void);
uint32_t get_ventana_distance_y(void);
uint8_t  get_manual_wb(void);
uint8_t  get_manual_exposicion(void);
uint8_t  get_laser_potencia1_value(void);
uint8_t  get_laser_potencia2_value(void);
uint32_t get_divisorLaser_value(void);
uint8_t  get_calibrado_potenciaLaser_value(void);
uint8_t  get_posicion_barra_abajo(void);
uint32_t get_id_daen(void);
float    get_CDX(void);
float	 get_angulo_martillo_1(void);
float	 get_angulo_martillo_2(void);
float 	 get_holgura_maxima_1(void);
float 	 get_holgura_maxima_2(void);
float 	 get_size_pixel(void);
float    get_holgura_maxima_fuera(void);
float 	 get_holgura_maxima_dentro(void);

void  set_flash_value(uint8_t value);
void  set_flash_delay(uint16_t value);
void  set_id_daen(uint32_t value);
void  set_tipo_daen(uint8_t value);
void  set_ventana_x(uint32_t value);
void  set_ventana_y(uint32_t value);
void  set_ventana_width(uint32_t value);
void  set_ventana_height(uint32_t value);
void  set_ventana_distance_x(uint32_t value);
void  set_ventana_distance_y(uint32_t value);
void  set_manual_wb(uint8_t value);
void  set_manual_exposicion(uint8_t value);
void  set_laser_potencia1_value(uint8_t value);
void  set_laser_potencia2_value(uint8_t value);
void  set_divisorLaser_value(uint32_t value);
void  set_calibrado_potenciaLaser_value(uint8_t value);
void  set_posicion_barra_abajo(uint8_t value);
void  set_CDX(float value);
void  set_angulo_martillo_1(float value);
void  set_angulo_martillo_2(float value);
void  set_holgura_maxima_1(float value);
void  set_holgura_maxima_2(float value);
void  set_size_pixel(float value);

#endif /* SM_CONFIGPARAMS_H_ */
