/*
 * SM_ConfigParams.c
 *
 *  Created on: 30/07/2014
 *      Author: ezio
 */

#include "SM_ConfigParams.h"
#include "SM_stm32f4xx_iwdg.h"
#include <math.h>

uint32_t configParam[NUM_MAX_CONFIG_PARAM];

Semaphore semPC;

/**
 * @brief   Inicializa los praemtros de configuración
 * @details Inicializa los parametros, los semaforos y el checksum de los prametros de configuración
 * @note    Si es la primera vez que se ejecuta inicailiza los parametros a un valor por defecto.
 *
 * @api
 */
void initConfigParams(void){
	//Inicializo el semaforo
	chSemInit(&semPC, MAX_READER_CONC);
	//Leo los parametros de la memoria SPI
	int result=memcpy(configParam,PARAM_CONF_FLASH_START_ADDR, sizeof(configParam));
	//@TODO: Gestionar el resultado
	//Si es la primera vez que los leo Inicializo
	//Si no compruebo el checksum para ver que no sean corruptos.
}
/**
 * @brief   devuelve un parametro
 * @details Gestiona los semaforos para permitir lecturas en paralelo
  *
 * @param[out] numParam El numero de parametro que quiero leer
 *                      .
 * @return              El valor del parametro.
 *
 * @api
 */

uint32_t getParam(uint8_t numParam){
	chSemWait(&semPC);
	uint32_t value=configParam[numParam];
	chSemSignal(&semPC);
	return value;
}

float getFloatParam(uint8_t numParam){
	uint32_t value = getParam(numParam);
	float* fvalue = &value;
	return (float)*fvalue;
}
/**
 * @brief   escribe un parametro
 * @details Escribe el parametro en la variable global(despues de comprobar su valor) , en la memoria SPI y recalcula el checksum
  *
 * @param[out] numParam El numero de parametro que quiero escribir
 * @param[out] value    El valor de parametro que quiero escribir
 *                      .
 * @return              El valor del parametro.
 * @retval PARAM_OK     El parametro se ha escrito perfectamente
 * @retval PARAM_ERR    El parametro no estaba dentro de los limites, se ha escrito el valor mas cercano
 *
 * @api
 */

msg_t setParam(uint8_t numParam, uint32_t value){
	int i=0;

	IWDG_ReloadCounter();

	for(i=0;i<MAX_READER_CONC;i++){
		chSemWait(&semPC);
	}
	//@TODOComprueba que el parametro esté bien

	//Escribe el parametro en el array
	configParam[numParam]=value;

	for(i=0;i<MAX_READER_CONC;i++){
		chSemSignal(&semPC);
	}

	chSemWait(&semPC);//bloquea el semaforo en lectura para leer configParam

	//Escribe el parametro en la memoria

	FLASH_Unlock();// you need to unlcok flash first
	/* Clear All pending flags */
	FLASH_ClearFlag( FLASH_FLAG_EOP |  FLASH_FLAG_WRPERR |
			FLASH_FLAG_PGAERR | FLASH_FLAG_PGPERR | FLASH_FLAG_PGSERR);

	//you need to erase entire sector before write anything
	FLASH_EraseSector(FLASH_SECTOR_NUMBER, VoltageRange_3);

	for (i = 0; i <NUM_MAX_CONFIG_PARAM; i++){
		FLASH_ProgramWord(PARAM_CONF_FLASH_START_ADDR + 4*i,configParam[i]);
	}


	FLASH_Lock();//lock flash at the end

	//flash_subsector_erase(SPI_PARAM_CONF_START_ADDR);
	//flash_program_area(SPI_PARAM_CONF_START_ADDR,(uint8_t*)configParam,sizeof(configParam));
	//@TODORecalcula el checksum

	//@TODOGuarda el checksum

	//Libera el semaforo de lectura
	chSemSignal(&semPC);
	return PARAM_OK;

}

msg_t setFloatParam(uint8_t numParam, float value){
	uint32_t* ivalue = &value;
	return setParam(numParam, (uint32_t)*ivalue);
}

/**
 * @brief Lee el valor de configuracion del Flash
 * @return Valor de configuración del flash entre 0 y 99. Si el valor leido no es correcto devuelve el valor maximo
 */
uint8_t get_flash_value(void ) {
	uint8_t param = getParam(PARAM_INTENSIDAD_FLASH);
	if (param >= PARAM_INTENSIDAD_FLASH_MIN && param <=PARAM_INTENSIDAD_FLASH_MAX) return param;
	return PARAM_INTENSIDAD_FLASH_MAX;
}

/**
 * @brief Lee el valor de configuracion del Laser 1
 * @return Valor de configuración del laser 1 entre 0 y 99. Si el valor leido no es correcto devuelve el valor maximo
 */
uint8_t get_laser_potencia1_value(void ) {
	uint8_t param = getParam(PARAM_INTENSIDAD_LASER_1);
	if (param >= PARAM_INTENSIDAD_LASER_1_MIN && param <=PARAM_INTENSIDAD_LASER_1_MAX) return param;
	return PARAM_INTENSIDAD_LASER_1_MAX;
}

/**
 * @brief Lee el valor de configuracion del Laser 2
 * @return Valor de configuración del laser 2 entre 0 y 99. Si el valor leido no es correcto devuelve el valor maximo
 */
uint8_t get_laser_potencia2_value(void ) {
	uint8_t param = getParam(PARAM_INTENSIDAD_LASER_2);
	if (param >= PARAM_INTENSIDAD_LASER_2_MIN && param <=PARAM_INTENSIDAD_LASER_2_MAX) return param;
	return PARAM_INTENSIDAD_LASER_2_MAX;
}

/**
 * @brief Lee el valor de configuracion del Delay del Flash
 * @return Valor de configuración del delay del flash entre 0 y 2000. Si el valor leido no es correcto devuelve el valor mínimo
 */
uint16_t get_flash_delay(void ) {
	uint16_t param = getParam(PARAM_TIEMPO_FLASH_MILISEC);
	if (param >= PARAM_TIEMPO_FLASH_MILISEC_MIN && param <= PARAM_TIEMPO_FLASH_MILISEC_MAX) return param;
	return PARAM_TIEMPO_FLASH_MILISEC_MIN;
}

/**
 * @brief Lee el tipo de daen
 * @return Valor de tipo de daen. Si el valor leido no es correcto devuelve el valor maximo
 */
uint8_t get_tipo_daen(void ) {
	uint8_t param = getParam(PARAM_TIPO_DAEN);
	if (param >= PARAM_TIPO_DAEN_MIN && param <= PARAM_TIPO_DAEN_MAX) return param;
	return PARAM_TIPO_DAEN_MIN;
}

/**
 * @brief Lee el valor de la posición X de la ventana
 * @return Valor de la posición X de la ventana. Si el valor leido no es correcto devuelve 0
 */
uint32_t get_ventana_x(void ) {
	uint32_t param = getParam(PARAM_VENTANA_X);
	if (param >= PARAM_VENTANA_X_MIN && param <= PARAM_VENTANA_X_MAX) return param;
	return PARAM_VENTANA_X_DEFAULT;
}

/**
 * @brief Lee el valor de la posición Y de la ventana
 * @return Valor de la posición Y de la ventana. Si el valor leido no es correcto devuelve 0
 */
uint32_t get_ventana_y(void ) {
	uint32_t param = getParam(PARAM_VENTANA_Y);
	if (param >= PARAM_VENTANA_Y_MIN && param <= PARAM_VENTANA_Y_MAX) return param;
	return PARAM_VENTANA_Y_DEFAULT;
}

/**
 * @brief Lee el valor de la dimensión X de la ventana
 * @return Valor de la dimensión X de la ventana. Si el valor leido no es correcto devuelve el máximo
 */
uint32_t get_ventana_width(void ) {
	uint32_t param = getParam(PARAM_VENTANA_DIM_X);
	if (param >= PARAM_VENTANA_DIM_X_MIN && param <= PARAM_VENTANA_DIM_X_MAX) return param;
	return PARAM_VENTANA_DIM_X_DEFAULT;
}

/**
 * @brief Lee el valor de la dimensión Y de la ventana
 * @return Valor de la dimensión Y de la ventana. Si el valor leido no es correcto devuelve el máximo
 */
uint32_t get_ventana_height(void ) {
	uint32_t param = getParam(PARAM_VENTANA_DIM_Y);
	if (param >= PARAM_VENTANA_DIM_Y_MIN && param <= PARAM_VENTANA_DIM_Y_MAX) return param;
	return PARAM_VENTANA_DIM_Y_DEFAULT;
}

/**
 * @brief Lee el valor de la distancia en x entre las ventanas
 * @return Valor de la distancia en x entre las ventanas. Si el valor leido no es correcto devuelve el máximo
 */
uint32_t get_ventana_distance_x(void ) {
	uint32_t param = getParam(PARAM_VENTANA_DISTANCE_X);
	if (param >= PARAM_VENTANA_DISTANCE_X_MIN && param <= PARAM_VENTANA_DISTANCE_X_MAX) return param;
	return PARAM_VENTANA_DISTANCE_X_DEFAULT;
}

/**
 * @brief Lee el valor de la distancia en y entre las ventanas
 * @return Valor de la distancia en y entre las ventanas. Si el valor leido no es correcto devuelve el máximo
 */
uint32_t get_ventana_distance_y(void ) {
	uint32_t param = getParam(PARAM_VENTANA_DISTANCE_Y);
	if (param >= PARAM_VENTANA_DISTANCE_Y_MIN && param <= PARAM_VENTANA_DISTANCE_Y_MAX) return param;
	return PARAM_VENTANA_DISTANCE_Y_DEFAULT;
}

/**
 * @brief Lee el valor de configuracion del balance de blancos manual
 * @return Valor de configuración del balance de blancos manual entre 0 y 127. Si el valor leido no es correcto devuelve el valor minimo
 */
uint8_t  get_manual_wb(void)	{
	uint8_t param = getParam(PARAM_MANUAL_WB);
	if (param >= PARAM_MANUAL_WB_MIN && param <= PARAM_MANUAL_WB_MAX) return param;
	return PARAM_MANUAL_WB_MIN;
}

/**
 * @brief Lee el valor de configuracion de exposición manual
 * @return Valor de configuración de la exposición manual. Si el valor leido no es correcto devuelve el valor minimo
 */
uint8_t  get_manual_exposicion(void)	{
	uint8_t param = getParam(PARAM_MANUAL_EXPOSICION);
	if (param >= PARAM_MANUAL_EXPOSICION_MIN && param <= PARAM_MANUAL_EXPOSICION_MAX) return param;
	return PARAM_MANUAL_EXPOSICION_MIN;
}

/**
 * @brief Lee el valor de configuracion de divisor laser
 * @return Valor de configuración del divisor laser. Si el valor leido no es correcto devuelve 50%
 */
uint32_t  get_divisorLaser_value(void)	{
	uint32_t param = getParam(PARAM_DIVISOR_LASER);
	if (param >= PARAM_DIVISOR_LASER_MIN && param <= PARAM_DIVISOR_LASER_MAX) return param;
	return PARAM_DIVISOR_LASER_DEFAULT;
}

uint8_t  get_calibrado_potenciaLaser_value(void){
	uint8_t param = getParam(PARAM_CALIBRADO_POTENCIA_LASER);
	if (param >= PARAM_CALIBRADO_POTENCIA_LASER_MIN && param <= PARAM_CALIBRADO_POTENCIA_LASER_MAX) return param;
	return 50;
}

/**
 * @brief Lee el valor de configuración de la posición de la barra de abajo.
 * 0 -> Abajo, v21 y v22; 1 -> Arriba, v11 y v12
 * @return 0 si la barra de abajo está en las ventanas de abajo (v21 y v22), 1 si está en las ventanas de arriba (v11 y v12)
 */
uint8_t  get_posicion_barra_abajo(void){
	uint8_t param  = getParam(PARAM_POSICION_BARRA_ABAJO);
	if (param != PARAM_POSICION_BARRA_ABAJO_V11 && param != PARAM_POSICION_BARRA_ABAJO_V22) return PARAM_POSICION_BARRA_ABAJO_V22;
	return param;
}

float get_CDX(void){
	float param = getFloatParam(PARAM_CDX);
	if (param > 0 && param <= PARAM_CDX_MAX) return param;
	return PARAM_CDX_DEFAULT;
}

float get_angulo_martillo_1(void){
	float param = getFloatParam(PARAM_ANGULO_MARTILLO_1);
	if (param > 0 && param <= M_PI_2) return param;
	return PARAM_ANGULO_MARTILLO_1_DEFAULT;
}

float get_angulo_martillo_2(void){
	float param = getFloatParam(PARAM_ANGULO_MARTILLO_2);
	if (param > M_PI_2 && param <= M_PI) return param;
	return PARAM_ANGULO_MARTILLO_2_DEFAULT;
}
float get_holgura_maxima_1(void){
	float param = getFloatParam(PARAM_HOLGURA_MAXIMA_1);
	if (param > 0 && param <= PARAM_HOLGURA_MAXIMA_MAX) return param;
	return PARAM_HOLGURA_MAXIMA_DEFAULT;
}

float get_holgura_maxima_2(void){
	float param = getFloatParam(PARAM_HOLGURA_MAXIMA_2);
	if (param > 0 && param <= PARAM_HOLGURA_MAXIMA_MAX) return param;
	return PARAM_HOLGURA_MAXIMA_DEFAULT;
}

float get_holgura_maxima_fuera(void){
	if (get_posicion_barra_abajo() == PARAM_POSICION_BARRA_ABAJO_V11){
		return get_holgura_maxima_1();
	} else {
		return get_holgura_maxima_2();
	}
}

float get_holgura_maxima_dentro(void){
	if (get_posicion_barra_abajo() == PARAM_POSICION_BARRA_ABAJO_V11){
		return get_holgura_maxima_2();
	} else {
		return get_holgura_maxima_1();
	}
}

float get_size_pixel(void){
	float param = getFloatParam(PARAM_SIZE_PIXEL);
	if (param >= PARAM_SIZE_PIXEL_MIN && param <= PARAM_SIZE_PIXEL_MAX) return param;
	return PARAM_SIZE_PIXEL_DEFAULT;
}

uint32_t get_id_daen(void) {
	uint32_t param = getParam(PARAM_ID_DAEN);
	//El EID tiene 18 bits, si el parametro que se lee tiene mas no es valido y devolvemos 0
	if (param > 0x3FFFF) param = 0;
	return param;
}

/**
 * @brief graba el valor de configuración del flash
 * @param Valor de configuración del flash
 */
void  set_flash_value(uint8_t value) {
	setParam(PARAM_INTENSIDAD_FLASH,value);
}

/**
 * @brief graba el valor de configuración del laser 1
 * @param Valor de configuración del laser 1
 */
void  set_laser_potencia1_value(uint8_t value) {
	setParam(PARAM_INTENSIDAD_LASER_1,value);
}

/**
 * @brief graba el valor de configuración del laser 2
 * @param Valor de configuración del laser 2
 */
void  set_laser_potencia2_value(uint8_t value) {
	setParam(PARAM_INTENSIDAD_LASER_2,value);
}

/**
 * @brief graba el valor de configuración del limite entre la imagen 1 y 2 con intensidades de laser distintas
 * @param Valor de configuración del limite entre la imagen 1 y 2
 */
void set_divisorLaser_value(uint32_t value) {
	setParam(PARAM_DIVISOR_LASER, value);
}

/**
 * @brief graba el valor de configuración del delay delflash
 * @param Valor de configuración del delay del flash
 */
void  set_flash_delay(uint16_t value) {
	setParam(PARAM_TIEMPO_FLASH_MILISEC,value);
}

/**
 * @brief graba el id de daen
 * @param Valor de id de daen
 */
void  set_id_daen(uint32_t value) {
	setParam(PARAM_ID_DAEN,value);
}

/**
 * @brief graba el valor de tipo de daen
 * @param Valor de tipo de daen
 */
void  set_tipo_daen(uint8_t value) {
	setParam(PARAM_TIPO_DAEN,value);
}

/**
 * @brief graba la posición X de la ventana
 * @param Posición X de la ventana
 */
void  set_ventana_x(uint32_t value) {
	setParam(PARAM_VENTANA_X,value);
}

/**
 * @brief graba la posición Y de la ventana
 * @param Posición Y de la ventana
 */
void  set_ventana_y(uint32_t value) {
	setParam(PARAM_VENTANA_Y,value);
}

/**
 * @brief graba el ancho de la ventana
 * @param Ancho de la ventana
 */
void  set_ventana_width(uint32_t value) {
	setParam(PARAM_VENTANA_DIM_X,value);
}

/**
 * @brief graba el alto de la ventana
 * @param Alto de la ventana
 */
void  set_ventana_height(uint32_t value) {
	setParam(PARAM_VENTANA_DIM_Y,value);
}

/**
 * @brief Graba la separación en x entre las ventanas
 * @param Sepración en x expresada en pixels entre las ventanas
 */
void set_ventana_distance_x(uint32_t value) {
	setParam(PARAM_VENTANA_DISTANCE_X,value);
}

/**
 * @brief Graba la separación en y entre las ventanas
 * @param Sepración en y expresada en pixels entre las ventanas
 */
void set_ventana_distance_y(uint32_t value) {
	setParam(PARAM_VENTANA_DISTANCE_Y, value);
}
/**
 * @brief Graba la configuración del balance de blancos manual
 * @param Posición establecida manualmente en la matriz de balance de blancos
 */
void  set_manual_wb(uint8_t value) {
	setParam(PARAM_MANUAL_WB, value);
}

/**
 * @brief Graba la configuración de la exposición manual
 * @param Posición establecida manualmente de la exposición
 */
void set_manual_exposicion(uint8_t value) {
	setParam(PARAM_MANUAL_EXPOSICION, value);
}


void  set_calibrado_potenciaLaser_value(uint8_t value){
	setParam(PARAM_CALIBRADO_POTENCIA_LASER, value);
}

/**
 * @brief Graba la configuración de la posición de la barra de arriba
 * @param Posición de la barra de arriba. 0 -> Abajo, v21 y v22; 1 -> Arriba, v11 y v12
 */
void  set_posicion_barra_abajo(uint8_t value){
	setParam(PARAM_POSICION_BARRA_ABAJO, value);
}

void set_CDX(float value){
	setFloatParam(PARAM_CDX, value);
}

void  set_angulo_martillo_1(float value){
	setFloatParam(PARAM_ANGULO_MARTILLO_1, value);
}

void  set_angulo_martillo_2(float value){
	setFloatParam(PARAM_ANGULO_MARTILLO_2, value);
}

void  set_holgura_maxima_1(float value){
	setFloatParam(PARAM_HOLGURA_MAXIMA_1, value);
}

void  set_holgura_maxima_2(float value){
	setFloatParam(PARAM_HOLGURA_MAXIMA_2, value);
}

void set_size_pixel(float value){
	setFloatParam(PARAM_SIZE_PIXEL, value);
}

