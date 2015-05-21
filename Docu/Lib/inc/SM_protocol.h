/*! \file SM_protocols.h
    \brief Protocolo comunicación SMART MOTORs

	Definiciones de constantes para DAEN
	\author Ezio Cappellino
	\author Miquel Mas
	\author Thinking Forward XXI
	\date 24/07/2014
	\version 1
	\revision 1
*/

/*! \mainpage www.tfxxi.com
 *
 * \section Proyecto TFSIM
 *
 * DAEN BEE / BEELITE
 *
 */

#ifndef SM_PROTOCOL_H_
#define SM_PROTOCOL_H_

#include "ch.h"
#include "SM_CANIO.h"

#define NUM_TIPOS_DAEN 2

extern uint16_t sid_list[NUM_TIPOS_DAEN];

/**
 * \defgroup DefDIrection Definición de direcciones de comunicación
 * @{
 */

#define SID_SOC2ECON					0x0B  								/**< SID de la comunicación SOC a ECON  */


#define SID_SOC2DAENNDP					0x143  								/**< SID de la comunicación SOC a NDP   */
#define SID_SOC2DAENSPDR				0x83								/**< SID de la comunicación SOC a SPDR  */

#define SID_FILTER_MSG2DISP				0x0C0								/**< SID de mensajes destinado a un SOC */
/**@}*/

/**
 * \defgroup DefParametrosSendaRequest Posición de los parametros en el senda request
 */
#define SENDA_PARAMETER_TIPOIMAGEN 		0
/** @} */

/**
 * \defgroup DefMessageTX Mensajes. Tipo de paquetes transmitidos
 * @{
 */
#define PAQTX_START						0 		/**< Start SOC destinado a ECON */
#define PAQTX_ACTIVIDAD					180		/**< Actividad destinada a ECON */
#define PAQTX_DATOS_SOC_HOLGURA		 	39		/**< Datos de holgura a ECON */
#define PAQTX_SENDA_DATA_WAIT_IMAGE   	73		/**< Notifica al ECON que ha recibido el paquete de envio de imagen y que la va a tomar y enviar */

/**@}*/


/**
 * \defgroup DefMessageRX Mensajes. Tipo de paquetes recibidos
 * @{
 */
#define PAQRX_GET_HOLGURA		 38	 /**< Petición de envio de holgura al DAEN */
#define PAQRX_ACK_HOLGURA		 40  /**< ACK del ECON de recepción de paquete de datos de holgura */
#define PAQRX_ACK_TO_DAEN		159  /**< Paquete de ACK a DAEN */
#define PAQRX_GET_IMAGE			170	 /**< Petición de envio de imagen */
/**@}*/

/**
 * \defgroup DefMessageDAEN Mensajes. Tipo de paquetes de DAEN a ECON que escucha el SOC
 * @{
 */
#define PAQSPDR_ACTIVIDAD_MONO 	11
#define PAQSPDR_ACTIVIDAD_TRI	12
#define PAQNDP_ACTIVIDAD_MONO	31
#define PAQNDP_ACTIVIDAD_TRI	32
#define PAQLITE_ACTIVIDAD_MONO	21
#define PAQLITE_ACTIVIDAD_TRI	22
#define PAQBEE_ACTIVIDAD_MONO	31
#define PAQBEE_ACTIVIDAD_TRI	32

#define PAQSPDR_DATOSDISP_MONO 	3
#define PAQSPDR_DATOSDISP_TRI	4
#define PAQNDP_DATOSDISP_MONO	33
#define PAQNDP_DATOSDISP_TRI	34
#define PAQLITE_DATOSDISP_MONO	23
#define PAQLITE_DATOSDISP_TRI	24
#define PAQBEE_DATOSDISP_MONO	33
#define PAQBEE_DATOSDISP_TRI	34
/**@} */

/**
 * \defgroup DefSendaDataType SENDA. Tipo de datos para SENDA que identifican la imagen
 */
#define SENDA_DATA_TYPE_IMAGE 63
/**@}*/

/**
 * \defgroup DefSendaTipoImagen SENDA. Tipo de imagen que se envia
 */
#define SENDA_TIPOIMAGEN_COMPLETA 0
#define SENDA_TIPOIMAGEN_VENTANAS 1
#define SENDA_TIPOIMAGEN_VENTANAS_FUERA 2
#define SENDA_TIPOIMAGEN_VENTANAS_DENTRO 3
/**@}*/


/**
 * \defgroup DefMessageFunc Mensajes. Funciones de creacion de mensajes
 * @{
 */
void sendStart(void);
void sendActividad(uint8_t idActividad, uint8_t posicion_motor, float holgura);
void sendDatosHolgura(uint8_t idMovimiento, uint8_t posicion_motor, float holgura);
void sendWaitImage(uint8_t mov_type, uint8_t data_type);

/**@}*/

/**
 * \defgroup DefMessageFunc Mensajes. Funciones de procesado de mensajes
 * @{
 */

/**@}*/


/**
 * \defgroup DefTimeDefault Mensajeria- Tiempos por defecto
 * @{
 */
#define PERIODO_ACTIVIDAD 10000    	/**< Periodo entre actividades(ms)*/
/**@}*/

/**
 * \defgroup DefTimeouts Mensajeria- Timeouts de recepción de mensajes
 * @{
 */
#define TIMEOUT_ACK_HOLGURA 5000
/**@}*/

#endif



