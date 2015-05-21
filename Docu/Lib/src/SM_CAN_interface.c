#include "SM_CAN_interface.h"
#include "SM_CAN.h"
#include "SM_protocol.h"

#define NUM_CAN_FILTERS 2

int getNumCANFilters(){
	return NUM_CAN_FILTERS;
}

void getCANFilters(CANFilter canFilters[], int init_can2_filters) {

	//Filtro para recibir los mensajes dirigidos a SOC
	canFilters[0].filter = 		0; 		//Numero del filtro
	canFilters[0].mode =		0;		//Filter mode: CAN_FM1R register bit associated to this filter (0=mask mode, 1=list mode).
	canFilters[0].scale = 		1;		//Filter scale: This bit represent the CAN_FS1R register bit associated to this filter (0=16 bits mode, 1=32 bits mode).
	canFilters[0].assignment =	0;		//Filter assignment: tiene que ser cero
	canFilters[0].register1 = 	HAL_FILTER_ID(SID_FILTER_MSG2DISP,get_id_daen(),1,0);	//Identificador del filtro (SID,EID,IDE,RTR)
	canFilters[0].register2 = 	HAL_FILTER_ID(SID_MASK,EID_MASK,1,0);					//Mascara del filtro (SID,EID,IDE,RTR)

	//Filtro para escuchar mensajes de DAEN a ECON
	canFilters[1].filter = 		1; 		//Numero del filtro
	canFilters[1].mode =		0;		//Filter mode: CAN_FM1R register bit associated to this filter (0=mask mode, 1=list mode).
	canFilters[1].scale = 		1;		//Filter scale: This bit represent the CAN_FS1R register bit associated to this filter (0=16 bits mode, 1=32 bits mode).
	canFilters[1].assignment =	0;		//Filter assignment: tiene que ser cero
	canFilters[1].register1 = 	HAL_FILTER_ID(get_sid_from_tipo_daen(get_tipo_daen()),get_id_daen(),1,0);	//Identificador del filtro (SID,EID,IDE,RTR)
	canFilters[1].register2 = 	HAL_FILTER_ID(0x7FF,EID_MASK,1,0);					//Mascara del filtro (SID,EID,IDE,RTR)

}
