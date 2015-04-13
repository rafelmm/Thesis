/* This source file is part of the ATMEL AVR-UC3-SoftwareFramework-1.7.0 Release */

/*This file is prepared for Doxygen automatic documentation generation.*/
/*! \file *********************************************************************
 *
 * \brief CANIF driver for AVR32 UC3.
 *
 * This file contains basic functions for the AVR32 CAN, with support for all
 * modes, settings and clock speeds.
 *
 * - Compiler:           IAR EWAVR32 and GNU GCC for AVR32
 * - Supported devices:  All AVR32 devices with a CANIF module can be used.
 * - AppNote:
 *
 * \author               Atmel Corporation: http://www.atmel.com \n
 *                       Support and FAQ: http://support.atmel.no/
 *
 ******************************************************************************/

/* Copyright (c) 2009 Atmel Corporation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * 3. The name of Atmel may not be used to endorse or promote products derived
 * from this software without specific prior written permission.
 *
 * 4. This software may only be redistributed and used in connection with an Atmel
 * AVR product.
 *
 * THIS SOFTWARE IS PROVIDED BY ATMEL "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT ARE
 * EXPRESSLY AND SPECIFICALLY DISCLAIMED. IN NO EVENT SHALL ATMEL BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
 *
 */

//_____ I N C L U D E S ________________________________________________________
#include "compiler.h"
#include "preprocessor.h"
#include "canif.h"
//_____ D E F I N I T I O N S __________________________________________________

//_____ F U N C T I O N S ______________________________________________________

void canif_clear_all_mob(U8 ch,
                       U8 nb_mob)
{
    unsigned char  mob_number;
    for (mob_number = 0; mob_number < nb_mob; mob_number++)
    {
        CANIF_clr_mob(ch,mob_number)
    }
}

U8 canif_get_mob_free(U8 ch)
{
    unsigned char mob_number;
    mob_number = CANIF_mob_get_mob_free(ch);
    if ((mob_number&0x20) == 0x20) 
    {
        return (NO_MOB);
    }
    return (mob_number);
}

U8 canif_get_mob_status(U8 ch,
                      U8 mob)
{
    U8 mob_status;
    // Test if MOb ENABLE or DISABLE
    if (!(CANIF_mob_enable_status(ch,mob))){return(MOB_DISABLE);}
    
    mob_status = CANIF_mob_get_status(ch,mob);

    mob_status = mob_status & ((1<<AVR32_CANIF_MOBSR_DLCW_OFFSET)|
                               (1<<AVR32_CANIF_MOBSR_TXOK_OFFSET)|
                               (1<<AVR32_CANIF_MOBSR_RXOK_OFFSET));
    if ( (mob_status==MOB_RX_COMPLETED) ||   \
         (mob_status==MOB_TX_COMPLETED) ||   \
         (mob_status==MOB_RX_COMPLETED_DLCW) ) { return(mob_status); }

    // Test if last mob selected is the mob interested
    if ( CANIF_get_interrupt_lastmob_selected(ch) != mob) {
      return(MOB_NOT_COMPLETED);
    }

    // If MOb is ENABLE & NOT_COMPLETED, test if CAN is in ERROR
    mob_status = CANIF_get_interrupt_error_status(ch);
    if (mob_status != 0) { 
      return(mob_status); 
    }

    // If CANSTMOB = 0 then MOB_NOT_COMPLETED
    return(MOB_NOT_COMPLETED);
}

U8 canif_auto_baudrate (U8 ch)
{
/*
    U8  u8_temp0;                               //! Temporary variable
    U8  brp, prs, ntq, phs1, phs2;              //! Bit timing segment variables
    U8  phs1_inc;                               //! Computing needed
    U8  bt_not_found, wait_for_rx, evaluate;    //! Keys for "while()" loops
    U8  try_conf;                               //! Key for configurate CAN
    U8  ovrtim_flag=0;                          //! Timer overflow count
    U16 conf_index;                             //! Count of bit timing configuration tried
    U8  bt_performed;                           //! Return flag

    //! --- Default setting
    phs1_inc = evaluate = 0;
    bt_performed = 0;
    conf_index = 0;
    bt_not_found = 1;

    //! --- Init segment variables with MIN values if mode=0
    //!     or init segment variables with CANBTx if mode=1
    if (mode==0)
    {
        brp  = BRP_MIN;
        ntq  = NTQ_MIN;
        phs1 = PHS1_MIN;
        phs2 = PHS2_MIN;
        prs  = ntq - ( phs1 + phs2 + 1 );
        try_conf = 1;       //! Try this configuration
        wait_for_rx = 1;    //! Enable "while (wait_for_rx ..." loop
    }
    else //! mode = 1
    {
        brp  = Max ((((PRES &  BRP_MSK) >> 1) +1) , BRP_MIN );
        prs  = Max ((((PRS &  PRS_MSK) >> 1) +1) , PRS_MIN );
        phs1 = Max ((((PHS1 & PHS1_MSK) >> 1) +1) , PHS1_MIN);
        phs2 = Max ((((PHS2 & PHS2_MSK) >> 4) +1) , PHS2_MIN);
        ntq  = Max ((prs + phs1 + phs2 + 1) , NTQ_MIN);
        phs1_inc = evaluate = 1;   //! To enter in "while (evaluate ..." loop
        try_conf = 0;       //! Look for the next configuration
        wait_for_rx = 0;    //! Skip "while (wait_for_rx ..." loop
    }

    //! --- Clear all MOb's (CANMSG not cleared)
    can_clear_all_mob(mob_ram);

    while (bt_not_found == 1)
    {
        if (try_conf == 1)
        {
            Can_reset();
            conf_index++;
            ovrtim_flag=0;

            //! --- CANBTx registers update (sjw = phs2/2, 3 sample points)
            PRES = ((brp-1) << PRES);
            PHS1 = (((phs2 >> 1)-1) << SJW) |((prs-1) << PRS);
            PHS2 = (((phs2-1) << PHS2) | ((phs1-1) << PHS1) | (1<<SMP));

            //! --- Set CAN-Timer - Used for time-out
            //!     There are 641 (0x281) possible evaluations. The first one provides the faster
            //!         the faster bit timing, the last one gives the slower. It is necessary to
            //!         modulate the time-out versus bit timing (0x281>>3=0x50, matching an U8).
            CANTCON = (U8)(conf_index >> 3);

            //! --- MOb configuration
            Can_set_mob(MOB_0);                 //! Use MOb-0
            CANSTMOB = 0;                       //! Reset MOb status (undone by "Can_reset()")
            CANCDMOB = (MOB_Rx_ENA  << CONMOB); //! MOb 0 in receive mode

            //! CAN controller configuration
            CANGCON = (1<<LISTEN) | (1<<ENASTB);//! Enable CAN controller in "listen" mode
            while ((CANGSTA & (1<<ENFG)) == 0); //! Wait for Enable OK
            CANGIT = 0xFF;                      //! Reset General errors and OVRTIM flag
        }

        //! --- WAIT_FOR_RX LOOP:
        //!     ================
        //!     Try to perform a CAN message reception in "LISTEN" mode without error and
        //!     before a time_out done by CAN-Timer.
        //!     Else gives the hand to "EVALUATE LOOP" to have a new set of bit timing.
        while (wait_for_rx == 1)
        {
            u8_temp0 = CANSTMOB;
            //! --- RxOK received ?
            if ((u8_temp0 & (1<<RXOK)) != 0)
            {   //! --- It is the successful output of "can_auto_baudrate" function
                wait_for_rx = 0;    //! Out of "while (wait_for_rx ..." loop
                evaluate = 0;       //! Will skip "while (evaluate ..." loop
                bt_not_found = 0;   //! Out of "while (bt_not_found ..." loop
                bt_performed = 1;   //! Return flag = TRUE
                DISABLE_MOB;        //! Disable MOb-0
                CANGCON = 0x00;     //! Disable CAN controller & reset "listen" mode
                while ((CANGSTA & (1<<ENFG)) != 0); //! Wait for Disable OK
            }
             //! --- Else stop if any errors
             else
            {
                //! --- MOb error ?
                if ((u8_temp0 & ((1<<BERR)|(1<<SERR)|(1<<CERR)|(1<<FERR)|(1<<AERR))) !=0)
                {
                    evaluate = 1;       //! Will enter in "while (evaluate ..." loop
                    wait_for_rx = 0;    //! Out of "while (wait_for_rx ..." loop
                }

                u8_temp0 = CANGIT;

                //! --- Time_out reached ?
                if ((u8_temp0 & (1<<OVRTIM)) !=0 )
                {
                    if (ovrtim_flag==0)
                    {
                        //! --- First Time_out
                        CANGIT |= (1<<OVRTIM);  // Reset OVRTIM
                        ovrtim_flag++;
                    }
                    else
                    {
                        //! --- Second Time_out
                        CANGIT |= (1<<OVRTIM);  // Reset OVRTIM
                        evaluate = 1;           //! Will enter in "while (evaluate ..." loop
                        wait_for_rx = 0;        //! Out of "while (wait_for_rx ..." loop
                    }
                }

                //! --- General error ?
                if ((u8_temp0 & ((1<<SERG)|(1<<CERG)|(1<<FERG)|(1<<AERG))) !=0)
                {
                    evaluate = 1;       //! Will enter in "while (evaluate ..." loop
                    wait_for_rx = 0;    //! Out of "while (wait_for_rx ..." loop
                    try_conf = 1;       //! Try this configuration
                }
            }
        } // while wait_for_rx ...

        //! --- EVALUATE LOOP:
        //!     =============
        //!     Compute a new bit timing configuration. First, Phase 1 is increased,
        //!     then Phase2=Phase1 and if Phase1>5, Phase1 can be equal to Phase2 or
        //!     Phase2+1. After this, the number of TQ is increased up to its high
        //!     limit and after it is the Prescaler. During the computing high (80%)
        //!     and low (75%) limits of sampling point location are tested. SJW and
        //!     the number of sampling points are not calculated in this loop.
        while (evaluate == 1)
        {
            if (phs1_inc != 0) phs1++;
            phs1_inc = 1;

            // --- The following test takes into account the previous incrementation of phs1
            if ((phs1 > PHS1_MAX) && (phs2 >= PHS2_MAX))
            {
                phs1 = PHS1_MIN;
                phs2 = PHS2_MIN;
                phs1_inc = 0;
                if (ntq != NTQ_MAX) ntq++;
                else
                {
                    ntq = NTQ_MIN;
                    if (brp != BRP_MAX) brp++;
                    else
                    {
                        //! --- It is the failing of "can_auto_baudrate" function
                        evaluate = 0;       //! Out of "while (evaluate ..." loop
                        bt_performed = 0;   //! Return flag = FALSE
                        bt_not_found = 0;   //! Out of "while (bt_not_found ..." loop
                        DISABLE_MOB;        //! Disable MOb-0
                        CANGCON = 0x00;     //! Disable CAN controller & reset "listen" mode
                        while ((CANGSTA & (1<<ENFG)) != 0); //! Wait for Disable OK
                    }
                }
            }
            else    // if (phs1 > PHS1_MAX ...
            {
                //! --- If psh1 > 5 then phs1 =phs2 or =phs2+1, else phs1=phs2
                if (phs1>5)
                {
                    if (phs1>(phs2+1)) phs1=(++phs2);
                }
                else
                {
                phs2=phs1;
                }
                prs = ntq - ( phs1 + phs2 + 1 );

                //! --- Test PRS limits
                if ((prs <= PRS_MAX) && (prs >= PRS_MIN))
                {
                    //! --- Values  accepted if  80% >= sampling point >= 75%
                    if (((phs2<<2) >= (1+prs+phs1)) && ((phs2+phs2+phs2) <= (1+prs+phs1)))
                    {
                        evaluate = 0;     //! Out of "while (evaluate ..." loop &
                        wait_for_rx = 1;  //!    new "while (bt_not_found ..." loop
                    }
                }
            }
        } // while (evaluate ...
    } // while (bt_not_found ...

    return (bt_performed);
*/
  return 1;
}

U8 canif_fixed_baudrate(U8 ch)
{
  CANIF_conf_bt(ch);
  /*CAN_enable(ch);   
  while(!CAN_channel_enable_status(ch));*/ 
  return 1;
}
