/*
 * SM_activity.h
 *
 *  Created on: 25/07/2014
 *      Author: ezio
 */

#ifndef SM_ACTIVITY_H_
#define SM_ACTIVITY_H_

#include "ch.h"
#include "SM_protocol.h"

#define LED_IDENTIFICAR 0

#define ACTIVITY_BUF_LEN 1

typedef enum Command_Activity {CA_SEND = 0, CA_RESET_TIMER = 1} command_activity_t;

typedef struct{
	command_activity_t command_activity;
	uint8_t idActividad;
}ActivityRequest_t;

void initActivity(void);
void postActividad(uint8_t idActividad);
void resetTimerActividad(void);

#endif /* SM_ACTIVITY_H_ */
