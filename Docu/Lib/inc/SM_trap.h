#ifndef SM_TRAP_H
#define SM_TRAP_H

#include "stm32f4xx.h"

/********************************************************************************************************************************/
/* Tipo de TRAPs    					                                      													*/
/********************************************************************************************************************************/
/**
 * \defgroup DefTipoTrap Tipo de Traps del DAEN SPDR
 * @{
 */

#define NO_TRAP					         0 /**<El reset del ECON ha sido normal*/
#define TRAP_CONFLICT_EVENT 	         1 /**<Error conflict event: no se que es??*/
#define TRAP_IOPUWR 			         2 /**<Error: Illegal operation trap*/
#define TRAP_WDT 				         3 /**<Error Watch dog timer ha caducado*/
#define TRAP_MATHERR			         4 /**<Conflict event: Error de calculo, division por zero, overflow etc...*/
#define TRAP_POWER_ON_RESET		         5 /**<Ha fallado la alimentación */
#define TRAP_BROWN_OUT_RESET	         6 /**<Ha bajado la alimentación */
#define TRAP_MCLR_NORMAL		         7 /**<MCLR reset durante modo normal de operación */
#define TRAP_SOFTWARE_NORMAL	         8 /**<Software reset durante modo normal de operación */
#define TRAP_MCLR_SLEEP			         9 /**<MCLR reset durante sleep */
#define TRAP_MCLR_IDLE		            10 /**<MCLR reset durante idle */
#define TRAP_WDT_WAKEUP		            11 /**<Watchdog wakeup */
#define TRAP_INTERRUPT_WAKEUP           12 /**<Interrupt wakeup from sleep */
#define TRAP_CLOCK_FAILURE	            13 /**<Clock Failure Trap */
#define TRAP_ADDRERR		            14 /**<Conflict event: Address Error */
#define TRAP_STACK_ERROR	            15 /**<Conflict event: Stack Error */
#define TRAP_OSC_FAIL		            16 /**<Conflict event: Oscillator Error */
#define TRAP_LOW_POWER_MANAGEMENT_RESET	17
#define TRAP_START_REQUEST				255 /**< Petición de START del ECON */
/**@}*/

/** @defgroup RCC_Flag
  * @{
  */
#define RCC_FLAG_HSIRDY                  ((uint8_t)0x21)
#define RCC_FLAG_HSERDY                  ((uint8_t)0x31)
#define RCC_FLAG_PLLRDY                  ((uint8_t)0x39)
#define RCC_FLAG_PLLI2SRDY               ((uint8_t)0x3B)
#define RCC_FLAG_LSERDY                  ((uint8_t)0x41)
#define RCC_FLAG_LSIRDY                  ((uint8_t)0x61)
#define RCC_FLAG_BORRST                  ((uint8_t)0x79)
#define RCC_FLAG_PINRST                  ((uint8_t)0x7A)
#define RCC_FLAG_PORRST                  ((uint8_t)0x7B)
#define RCC_FLAG_SFTRST                  ((uint8_t)0x7C)
#define RCC_FLAG_IWDGRST                 ((uint8_t)0x7D)
#define RCC_FLAG_WWDGRST                 ((uint8_t)0x7E)
#define RCC_FLAG_LPWRRST                 ((uint8_t)0x7F)
#define IS_RCC_FLAG(FLAG) (((FLAG) == RCC_FLAG_HSIRDY) || ((FLAG) == RCC_FLAG_HSERDY) || \
                           ((FLAG) == RCC_FLAG_PLLRDY) || ((FLAG) == RCC_FLAG_LSERDY) || \
                           ((FLAG) == RCC_FLAG_LSIRDY) || ((FLAG) == RCC_FLAG_BORRST) || \
                           ((FLAG) == RCC_FLAG_PINRST) || ((FLAG) == RCC_FLAG_PORRST) || \
                           ((FLAG) == RCC_FLAG_SFTRST) || ((FLAG) == RCC_FLAG_IWDGRST)|| \
                           ((FLAG) == RCC_FLAG_WWDGRST)|| ((FLAG) == RCC_FLAG_LPWRRST)|| \
                           ((FLAG) == RCC_FLAG_PLLI2SRDY))
#define IS_RCC_CALIBRATION_VALUE(VALUE) ((VALUE) <= 0x1F)
/**@}*/


/* RCC Flag Mask */
#define FLAG_MASK                 ((uint8_t)0x1F)


void RCC_ClearFlag(void);
uint8_t getResetTrap(void);
#endif
