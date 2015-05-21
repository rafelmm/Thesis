#include "SM_senda_interface.h"
#include "SM_protocol.h"
#include "main.h"

void getDataProperties(senda_request* dataRequest, unsigned char dataProperties[], unsigned int *SID, unsigned long *EID){

	extern uint32_t EID_DISP;

	*SID=SID_SOC2ECON;
	*EID=EID_DISP;

	//Id de movimiento asociado a la imagen. Si se ha pedido desde el server será 255
	dataProperties[0] = dataRequest->id_senda;

	//tipo de movimiento
	dataProperties[1] = dataRequest->senda_type;

	//Este byte no se usa
	dataProperties[2] = 0;

	//Este byte no se usa
	dataProperties[3] = 0;

	//Numero de frames
	uint16_t nframes= ceil(dataRequest->data_length / 4);
	dataProperties[4] = (nframes>>8)&0xFF;
	dataProperties[5] = nframes&0xFF;

	//Tipo de datos
	dataProperties[6] = (dataRequest->data_type&0x3F) << 2;

	//Tipo de movimiento
	dataProperties[6] |= dataRequest->parameters[SENDA_PARAMETER_TIPOIMAGEN]&0x3;

}

unsigned char data_type_verification(senda_request request){
	//Comprobamos que el tipo de datos sea vàlido
	if (request.data_type != 63){
		return FALSE;
	} else {
		return TRUE;
	}
}


void callbackFinalSenda(uint8_t estado_final_senda){
	//El SENDA ha acabado de enviar la imagen, liberamos la memoria de la camara
	free_camera();
}
