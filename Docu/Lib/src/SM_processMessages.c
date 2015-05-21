/*
 * processMessages.c
 *
 *  Created on: 30/07/2014
 *      Author: ezio
 */
#include "SM_processMessages.h"
#include "stdbool.h"
#include "SM_senda.h"
#include "SM_image.h"
#include "SM_protocol.h"
#include "SM_tipos.h"

struct{
	uint8_t indParam;
	bool fpr;
	union{
		uint8_t d8[8];
		uint64_t  d64[1];
	}data;

}  auxParamRX = {.fpr = false};


sm_image_t enviaDatosHolgura(uint8_t idMovimiento){
	uint8_t posicion_motor = POSICION_MOTOR_DESCONOCIDA;
	float holgura = 0.0;
	sm_image_t imagen = getHolgura(1,0,&holgura, &posicion_motor, TRUE,TRUE,TRUE);
	sendDatosHolgura(idMovimiento, posicion_motor, holgura);
	return imagen;
}

Mailbox MB_ENVIA_DATOS_HOLGURA;
msg_t envia_datos_holgura_buffer[ENVIA_DATOS_HOLGURA_MB_SIZE];
static WORKING_AREA(waThreadEnviaDatosHolgura, 512);
static msg_t T_enviaDatosHolgura(void *arg){
	chRegSetThreadName("EnviaDatosHolgura");
	uint8_t *idMovimiento = arg;

	extern uint8_t POSICION_MOTOR;
	msg_t result,msg;

	//Enviamos los datos de holgura y esperamos el ACK, si no se recibe el ACK se vuelve a enviar el paquete con los datos de holgura tomados nuevamente
	sm_image_t image = enviaDatosHolgura(*idMovimiento);

	//Esperamos a recibir el ACK
	while(!chThdShouldTerminate()){

		result = chMBFetch(&MB_ENVIA_DATOS_HOLGURA, &msg, MS2ST(TIMEOUT_ACK_HOLGURA));//@:todo config[PERIODO_ACTIVIDAD]
		if(result == RDY_OK){ //Se ha recivido un mensaje de ACK
			 switch(msg){
			 case ACK_HOLGURA_RECEIVED:{
				 //Se ha recibido un mensaje de ACK, enviamos la imagen comprimida


				 senda_request sendaRequest;
				 sendaRequest.id_senda = *idMovimiento;;
				 sendaRequest.data_type = SENDA_DATA_TYPE_IMAGE;
				 sendaRequest.senda_type = POSICION_MOTOR;
				 sendaRequest.data_length = image.size;
				 sendaRequest.datos = image.data;
				 sendaRequest.parameters[SENDA_PARAMETER_TIPOIMAGEN] = SENDA_TIPOIMAGEN_COMPLETA;
				 signalSendaStart(sendaRequest);

				 return (msg_t)(*idMovimiento);
			 }
			 default: break;
			 }
		} else { //Ha saltado el timeout sin recibir ACK, volvemos a enviar el paquete
			image = enviaDatosHolgura(*idMovimiento);
		}
	}
	return (msg_t)0;
}

static WORKING_AREA(waThreadProcessMessage, 256);
static msg_t T_ProcessMessage(void *arg) {

	extern uint8_t POSICION_MOTOR;
	uint8_t idUltimoMovimiento = 0;

	(void) arg;
	can_data_t msg;
	chRegSetThreadName("ProcessMessage");

	while(!chThdShouldTerminate()){
		dequeueReceiveMessage(&msg);


		//Si el mensaje es de SENDA paso al siguiente, en caso contrario lo proceso
		if (processSendaMessage(msg) == TRUE )
			continue;

		if ((msg.SID & SID_MASK) == (SID_FILTER_MSG2DISP)){ //Mensajes que van destinados a SOC
			switch(msg.data.data8U[0]){
				case PAQRX_GET_IMAGE://paquete de peticion de datos
				{
					uint8_t data_type = msg.data.data8U[1];
					uint8_t mov_type = msg.data.data8U[2];
					uint8_t id_mov = msg.data.data8U[3];
					uint8_t image_properties = msg.data.data8U[4];
					//TODO:comprobar que los datos que llegan son correctos antes de hacer nada más

					//Hacemos que el econ espere la imagen evitando que la pida constantemente mientras pedimos y procesamos la imagen
					sendWaitImage(mov_type, data_type);


					//Tomamos la imagen
					sm_image_t image = getImage(0,1,1,BIG,1);

					senda_request sendaRequest;
					sendaRequest.id_senda = id_mov;
					sendaRequest.data_type = SENDA_DATA_TYPE_IMAGE;
					sendaRequest.senda_type = POSICION_MOTOR;
					sendaRequest.data_length = image.size;
					sendaRequest.datos = image.data;
					sendaRequest.parameters[SENDA_PARAMETER_TIPOIMAGEN] = SENDA_TIPOIMAGEN_COMPLETA;
					signalSendaStart(sendaRequest);

					break;
				}
				case PAQRX_GET_HOLGURA:
				{
					uint8_t idMovimiento = msg.data.data8U[1];
					chSysLock();
					if (idMovimiento != idUltimoMovimiento){
						//Solamente enviamos el movimiento si no se habia enviado
						idUltimoMovimiento = idMovimiento;
						chSysUnlock();
						chThdCreateStatic(waThreadEnviaDatosHolgura, sizeof(waThreadEnviaDatosHolgura), NORMALPRIO, T_enviaDatosHolgura, &idMovimiento);
					} else {
						chSysUnlock();
					}
					break;
				}
				case PAQRX_ACK_HOLGURA: {
					//Si recibimos el ACK paramos el thread
					chMBPost(&MB_ENVIA_DATOS_HOLGURA, ACK_HOLGURA_RECEIVED ,TIME_IMMEDIATE);
					break;
				}
				default: break;
			}

		} else { //Mensajes que el DAEN envia al ECON y que escucha el SOC (oreja)

			//Si el SOC esta en modo de configuración desde PC no escuchamos los paquetes que el DAEN envia al SOC
			extern modoSOC_t MODO_SOC;
			if (MODO_SOC != NORMALOPERATION) continue;

			switch(msg.data.data8U[0]){
				case PAQSPDR_ACTIVIDAD_MONO :
				case PAQSPDR_ACTIVIDAD_TRI	:
				case PAQNDP_ACTIVIDAD_MONO	:
				case PAQNDP_ACTIVIDAD_TRI	:
				case PAQLITE_ACTIVIDAD_MONO	:
				case PAQLITE_ACTIVIDAD_TRI	: {
					//El DAEN Acaba de enviar una actividad, envio la mia
					uint8_t idActividad = (msg.data.data8U[2]>>3)&0x07;
					postActividad(idActividad);
					break;
				}
				case PAQSPDR_DATOSDISP_MONO:
				case PAQSPDR_DATOSDISP_TRI:
				case PAQNDP_DATOSDISP_MONO:
				case PAQNDP_DATOSDISP_TRI:
				case PAQLITE_DATOSDISP_MONO:
				case PAQLITE_DATOSDISP_TRI: {
					//Se ha escuchado un paquete de datos disponibles de movimiento. Si este movimiento no se ha enviado, lo enviamos ahora
					uint8_t idMovimiento = msg.data.data8U[2];
					chSysLock();
					if (idMovimiento != idUltimoMovimiento){
						//Solamente enviamos el movimiento si no se habia enviado
						idUltimoMovimiento = idMovimiento;
						chSysUnlock();
						chThdCreateStatic(waThreadEnviaDatosHolgura, sizeof(waThreadEnviaDatosHolgura), NORMALPRIO, T_enviaDatosHolgura, &idMovimiento);
					} else {
						chSysUnlock();
					}
					break;
				}
				default:{
					resetTimerActividad();
					break;
				}
			}
		}
	}
	return 0;
}

void initProcessMessage(void){

	//iniciamos el thread de proceso de tramas CAN
	chThdCreateStatic(waThreadProcessMessage, sizeof(waThreadProcessMessage), NORMALPRIO, T_ProcessMessage, NULL);

	//Iniciamos el Mailbox para enviar mensajes al Thread que envia datos de holgura
	chMBInit(&MB_ENVIA_DATOS_HOLGURA, envia_datos_holgura_buffer, ENVIA_DATOS_HOLGURA_MB_SIZE);
}


