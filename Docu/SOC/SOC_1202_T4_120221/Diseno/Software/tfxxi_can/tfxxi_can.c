/*
 * tfxxi_can.c
 *
 *  Created on: 09/07/2012
 *      Author: rafel
 */

#include "can.h"
#include "canif.h"
#include "scif_uc3c.h"
#include "gpio.h"
#include "intc.h"

#include "tfxxi_can.h"
#include "conf_can.h"
#include "MyCAN_conf.h"

void tfxxi_can_initialization(U8 ch,
		U32 can_msg_ram_add, U8 operating_mode,__int_handler handler,
		void(*can_msg_callback_channel)(U8 handle, U8 event)) {

	//1. Habilitar generic clock GCLK_CANIF
	// Setup the generic clock for CAN
	scif_gc_setup(AVR32_SCIF_GCLK_CANIF, SCIF_GCCTRL_OSC0,
			AVR32_SCIF_GC_NO_DIV_CLOCK, 0);
	// Now enable the generic clock
	scif_gc_enable(AVR32_SCIF_GCLK_CANIF);

	//2. Registrar interrupciones 290 (Mob Rx) y 291 (Mob Tx) y asignar el handler
	Disable_global_interrupt();
	INTC_register_interrupt(handler, MOB_TX_INTERRUPT_IRQ, AVR32_INTC_INT1); //Tx CAN
	INTC_register_interrupt(handler, MOB_RX_INTERRUPT_IRQ, AVR32_INTC_INT1); //Rx CAN
	Enable_global_interrupt();

	//3. Inicializar pines CAN del módulo GPIO
	static const gpio_map_t CAN_GPIO_MAP = { { AVR32_CANIF_RXLINE_0_0_PIN,
			AVR32_CANIF_RXLINE_0_0_FUNCTION }, { AVR32_CANIF_TXLINE_0_0_PIN,
			AVR32_CANIF_TXLINE_0_0_FUNCTION } };
	// Assign GPIO to CAN.
	gpio_enable_module(CAN_GPIO_MAP, sizeof(CAN_GPIO_MAP)
			/ sizeof(CAN_GPIO_MAP[0]));

	//Initialize channel
	can_init(ch, can_msg_ram_add, operating_mode, can_msg_callback_channel);

}

int tfxxi_can_tx(U8 ch, can_mob_t *appli_tx_msg, U8 data[]) {

	// Allocate one mob for TX
	appli_tx_msg->handle = can_mob_alloc(ch);

	// Check return if no mob are available
	if (appli_tx_msg->handle == CAN_CMD_REFUSED) {
		return -1;
	}

	//Get can message
	can_msg_t can_message = tfxxi_get_can_message(data, appli_tx_msg->dlc);
	appli_tx_msg->can_msg = &can_message;

	if(can_tx(ch, appli_tx_msg->handle, appli_tx_msg->dlc, appli_tx_msg->req_type,
			appli_tx_msg->can_msg)==CAN_CMD_ACCEPTED)
	{
		return 0;
	}
	else
	{
		can_mob_free(ch,appli_tx_msg->handle);
		return -1;
	}
}

void tfxxi_can_rx(U8 ch, can_mob_t *appli_rx_msg) {

	// Allocate one mob for RX
	appli_rx_msg->handle = can_mob_alloc(ch);

	//Use extended id
	appli_rx_msg->can_msg->ide_bit = 1;
	appli_rx_msg->can_msg->sid = CAN_RX_SID;
	appli_rx_msg->can_msg->eid = CAN_RX_EID;
	appli_rx_msg->can_msg->ide_mask_bit = 1;
	appli_rx_msg->can_msg->eid_mask_bit = CAN_RX_EID_MASK;
	appli_rx_msg->can_msg->sid_mask_bit = CAN_RX_SID_MASK;

	can_rx(ch, appli_rx_msg->handle, appli_rx_msg->req_type,
			appli_rx_msg->can_msg);
}

can_msg_t tfxxi_get_can_message(U8 data[], int dlc) {
	can_msg_t can_message;
	can_message.ide_bit = 1;
	can_message.sid = CAN_TX_SID;
	can_message.eid = CAN_TX_EID;
	can_message.ide_mask_bit = 1;
	can_message.eid_mask_bit = CAN_TX_EID_MASK;
	can_message.sid_mask_bit = CAN_TX_SID_MASK;

	int i;
	for (i = 0; i < dlc; i++) {
		can_message.data.u8[i] = data[i];
	}
	return can_message;
}
