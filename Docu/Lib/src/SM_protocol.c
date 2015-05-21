/*
 * SM_protocol.c
 *
 *  Created on: 25/07/2014
 *      Author: ezio
 */
#include "SM_protocol.h"
#include "SM_ConfigParams.h"
#include "main.h"
#include "SM_trap.h"

uint16_t sid_list[NUM_TIPOS_DAEN] = {SID_SOC2DAENSPDR,SID_SOC2DAENNDP};

/**
* \brief Paquete Start
*
* Envia el paquete de start al ECON cuando el SOC se enciende o resetea
*
*/
void sendStart(void){
	can_data_t msg;
	extern float HOLGURA_MAX_1;
	extern float HOLGURA_MAX_2;
	extern uint8_t POSICION_BARRA_ABAJO;
	extern uint32_t EID_DISP;

	uint8_t holgura_max_fuera;
	uint8_t holgura_max_dentro;
	if (POSICION_BARRA_ABAJO == PARAM_POSICION_BARRA_ABAJO_V22){
		holgura_max_fuera = HOLGURA_MAX_2;
		holgura_max_dentro = HOLGURA_MAX_1;
	}else{
		holgura_max_fuera = HOLGURA_MAX_1;
		holgura_max_dentro = HOLGURA_MAX_2;
	}
	msg.SID=SID_SOC2ECON;
	msg.EID=EID_DISP;

	msg.data.data8U[0]=PAQTX_START;
	msg.data.data8U[1]=VERSION;
	msg.data.data8U[2]=0;
	msg.data.data8U[3]=TIPO_SOC;
	msg.data.data8U[4]=getResetTrap();
	msg.data.data8U[5]=0;
	msg.data.data8U[6]=0;
	msg.data.data8U[7]=0;

	queueSendMessage(&msg);
}

/**
* \brief Message Wait Movement
*
* Avisa que no tiene este movimiento y esperará a tenerlo disponible para enviarlo.
* \param mov_type 	tipo de movimiento esperado
* \param data_type 	tipo de datos esperados
*
*/
void sendWaitImage(uint8_t mov_type, uint8_t data_type)
{
	extern uint32_t EID_DISP;
	can_data_t msg;
	msg.SID=SID_SOC2ECON;
	msg.EID = EID_DISP;

	msg.data.data8U[0]=PAQTX_SENDA_DATA_WAIT_IMAGE;
	msg.data.data8U[1]=0;
	msg.data.data8U[2]=0;
	msg.data.data8U[3]=0;
	msg.data.data8U[4]=0;
	msg.data.data8U[5]=0;
	msg.data.data8U[6]=0;
	msg.data.data8U[7]=data_type & 0x3F;//data type bits 5:7
	msg.data.data8U[7]<<=2;
	msg.data.data8U[7]+=(mov_type & 0x03);//mov_type bits 8
	queueSendMessage(&msg);
}

/**
 * \brief Actividad SOC
 *
 * Envia un paquete de actividad al ECON con la holgura y posicion motor calculadas
 * \param idActividad Id de actividad que le ha pasado el DAEN
 * \param posicion_motor Posición motor calculada por el SOC
 * \param holgura Holgura calculada por el SOC
 */
void sendActividad(uint8_t idActividad, uint8_t posicion_motor, float holgura){

	can_data_t msg;
	extern uint32_t EID_DISP;

	msg.SID=SID_SOC2ECON;
	msg.EID=EID_DISP;

	msg.data.data8U[0]=PAQTX_ACTIVIDAD;
	msg.data.data8U[1]=VERSION;
	msg.data.data8U[2]=((posicion_motor<<6)&0xC0) | (idActividad&0x07);
	msg.data.data8U[3]=(uint8_t)roundf(holgura*10.0);
	msg.data.data8U[4]=(uint8_t)roundf(get_holgura_maxima_fuera()*10.0);
	msg.data.data8U[5]=(uint8_t)roundf(get_holgura_maxima_dentro()*10.0);
	msg.data.data8U[6]=0;
	msg.data.data8U[7]=0;

	queueSendMessage(&msg);

}

/**
 * \brief Envia los datos de holgura al DAEN
 *
 * Envia un paquete al DAEN con los datos de holgura
 * \param idMovimiento id de movimiento que le ha pasado el DAEN
 * \param posicion_motor Posición detectada del motor
 * \param holgura Holgura actual en la posición en la que se encuentra el motor
 */
void sendDatosHolgura(uint8_t idMovimiento, uint8_t posicion_motor, float holgura){
	can_data_t msg;
	extern uint32_t EID_DISP;

	msg.SID = SID_SOC2ECON;
	msg.EID = EID_DISP;

	msg.data.data8U[0] = PAQTX_DATOS_SOC_HOLGURA;
	msg.data.data8U[1] = VERSION;
	msg.data.data8U[2] = idMovimiento;
	msg.data.data8U[3] = (uint8_t)roundf(holgura*10.0);
	msg.data.data8U[4] = (uint8_t)roundf(get_holgura_maxima_fuera()*10.0);
	msg.data.data8U[5] = (uint8_t)roundf(get_holgura_maxima_dentro()*10.0);
	msg.data.data8U[6] = (posicion_motor<<6)&0xC0;
	msg.data.data8U[7] = 0;

	queueSendMessage(&msg);

}









