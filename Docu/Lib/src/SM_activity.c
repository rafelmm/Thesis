/*
 * SM_activity.c
 *
 *  Created on: 25/07/2014
 *      Author: ezio
 */
#include "SM_activity.h"
#include "SM_tipos.h"
#include "stdbool.h"
#include "SM_image.h"

Mailbox MB_LEDs_COMMAND;
msg_t LEDs_buffer[1];

Mailbox MB_ACTIVITY;
msg_t activity_buff[ACTIVITY_BUF_LEN];

Thread*  activityThread;

uint8_t idUltimaActividad;

static WORKING_AREA(waThreadACT, 256);
static msg_t T_ACTTX(void *arg) {

	extern modoSOC_t MODO_SOC;

	chRegSetThreadName("ACTTX");
	ActivityRequest_t* activityRequest;

	while(!chThdShouldTerminate()){

		//esperamos un mensage o timeout
		msg_t result = chMBFetch(&MB_ACTIVITY, (msg_t *)&activityRequest, MS2ST(PERIODO_ACTIVIDAD));

		//Si el SOC esta en modo de configuración desde PC no enviamos actividades
		if (MODO_SOC != NORMALOPERATION) continue;

		if (result == RDY_OK){ //Se ha recibido una mensaje

			switch(activityRequest->command_activity) {
				case CA_SEND: {
					//Guardamos el id de actividad enviado
					idUltimaActividad = activityRequest->idActividad;

					//Tomamos foto y calculamos holgura
					uint8_t posicion_motor = POSICION_MOTOR_DESCONOCIDA;
					float holgura = 0.0;
					getHolgura(1,0,&holgura, &posicion_motor, FALSE,FALSE,FALSE);

					//Enviamos el mensaje CAN de actividad
					sendActividad(activityRequest->idActividad, posicion_motor, holgura);
					break;
				}
			case CA_RESET_TIMER:{
					//No hacemos nada. Volvemos a esperar a recibir un mensaje o timeout
					break;
				}
			}

		} else if (result == RDY_TIMEOUT){ //No se ha recibido petición de actividad y ha saltado el timeout

			//Calculamos el siguiente id de actividad
			idUltimaActividad = (idUltimaActividad%6)+1;

			//Tomamos foto y calculamos holgura
			uint8_t posicion_motor = POSICION_MOTOR_DESCONOCIDA;
			float holgura = 0.0;
			getHolgura(1,0,&holgura, &posicion_motor, FALSE,FALSE,FALSE);

			//Enviamos el mensaje CAN de actividad
			sendActividad(idUltimaActividad, posicion_motor, holgura);

		} else { //El Mailbox se ha reseteado mientras se esperaba
			//todo: Controlar este caso
		}
	}

	return true;
}

void initActivity(void){
	//Pongo la variable idUltimaActividad a 7. Cuando se reinicia el dispositivo la primera actividad que se envia tiene que tener id = 7
	idUltimaActividad = 7;

	//Inicio el Mailbox de actividad
	chMBInit(&MB_ACTIVITY, activity_buff, ACTIVITY_BUF_LEN);

	//Creo el Thread que envia una actividad
	activityThread = chThdCreateStatic(waThreadACT, sizeof(waThreadACT), NORMALPRIO, T_ACTTX, NULL);
}

void postActividad(uint8_t idActividad){
	//Preparamos el mensaje
	ActivityRequest_t activityRequest;
	activityRequest.command_activity = CA_SEND;
	activityRequest.idActividad = idActividad;

	//Enviamos el mensaje al Mailbox para que se procese en el Thread
	msg_t result = chMBPost(&MB_ACTIVITY, (msg_t)&activityRequest, TIME_IMMEDIATE);
	if (result != RDY_OK){
		//todo: hacer algo por que ha ido mal
		result = 0;
	}
}

void resetTimerActividad(void) {
	ActivityRequest_t activityRequest;
	activityRequest.command_activity = CA_RESET_TIMER;

	msg_t result = chMBPost(&MB_ACTIVITY, (msg_t)&activityRequest, TIME_IMMEDIATE);
	if (result != RDY_OK){
		//todo: hacer algo por que ha ido mal
	}
}
