/*
 * tfxxi_can.h
 *
 *  Created on: 09/07/2012
 *      Author: rafel
 */

#ifndef TFXXI_CAN_H_
#define TFXXI_CAN_H_

#define MOB_RX_INTERRUPT_IRQ	290
#define MOB_TX_INTERRUPT_IRQ	291

void tfxxi_can_initialization(U8 ch,
		U32 can_msg_ram_add, U8 operating_mode,__int_handler handler,
		void(*can_msg_callback_channel)(U8 handle, U8 event));

int tfxxi_can_tx(U8 ch, can_mob_t *appli_tx_msg,U8 data[]);

void tfxxi_can_rx(U8 ch, can_mob_t *appli_rx_msg);

can_msg_t tfxxi_get_can_message(U8 data[],int dlc);

#endif /* TFXXI_CAN_H_ */
