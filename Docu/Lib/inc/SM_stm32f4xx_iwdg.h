/**
  ******************************************************************************
  * @file    stm32f4xx_iwdg.h
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    30-September-2011
  * @brief   This file contains all the functions prototypes for the IWDG 
  *          firmware library.
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM32F4xx_IWDG_H
#define __STM32F4xx_IWDG_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx.h"
#include "stm32f4xx_conf_SM.h"

/** @addtogroup STM32F4xx_StdPeriph_Driver
  * @{
  */

/** @addtogroup IWDG
  * @{
  */

/* Exported types ------------------------------------------------------------*/
 typedef struct {
	 uint8_t IWDG_Prescaler;
	 uint16_t IWDG_Reload;
 } SM_IWDG_Timeout_Cfg_t;

/* Exported constants --------------------------------------------------------*/

/** @defgroup IWDG_Exported_Constants
  * @{
  */
  
/** @defgroup IWDG_WriteAccess
  * @{
  */
#define IWDG_WriteAccess_Enable     ((uint16_t)0x5555)
#define IWDG_WriteAccess_Disable    ((uint16_t)0x0000)
#define IS_IWDG_WRITE_ACCESS(ACCESS) (((ACCESS) == IWDG_WriteAccess_Enable) || \
                                      ((ACCESS) == IWDG_WriteAccess_Disable))
/**
  * @}
  */


/** @defgroup IWDG_prescaler 
  * @{
  */
#define IWDG_Prescaler_4            ((uint8_t)0x00)
#define IWDG_Prescaler_8            ((uint8_t)0x01)
#define IWDG_Prescaler_16           ((uint8_t)0x02)
#define IWDG_Prescaler_32           ((uint8_t)0x03)
#define IWDG_Prescaler_64           ((uint8_t)0x04)
#define IWDG_Prescaler_128          ((uint8_t)0x05)
#define IWDG_Prescaler_256          ((uint8_t)0x06)
#define IS_IWDG_PRESCALER(PRESCALER) (((PRESCALER) == IWDG_Prescaler_4)  || \
                                      ((PRESCALER) == IWDG_Prescaler_8)  || \
                                      ((PRESCALER) == IWDG_Prescaler_16) || \
                                      ((PRESCALER) == IWDG_Prescaler_32) || \
                                      ((PRESCALER) == IWDG_Prescaler_64) || \
                                      ((PRESCALER) == IWDG_Prescaler_128)|| \
                                      ((PRESCALER) == IWDG_Prescaler_256))
/**
  * @}
  */

 /** @defgroup IWDG_config. Para calucular el tiempo de watchdog aplicamos la formula
  * Timeout = Reload*Prescaler/32000 seg debido a que el reloj del watchdog funciona
  * a 32Khz
  * @{
  */
#define SM_IWDG_Timeout_100ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_4, 	0x320})
#define SM_IWDG_Timeout_200ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_4, 	0x640})
#define SM_IWDG_Timeout_300ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_4, 	0x960})
#define SM_IWDG_Timeout_400ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_4, 	0xC80})
#define SM_IWDG_Timeout_500ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_4, 	0xFA0})
#define SM_IWDG_Timeout_600ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_8, 	0x960})
#define SM_IWDG_Timeout_700ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_8, 	0xAF0})
#define SM_IWDG_Timeout_800ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_8, 	0xC80})
#define SM_IWDG_Timeout_900ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_8, 	0xE10})
#define SM_IWDG_Timeout_1000ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_8, 	0xFA0})
#define SM_IWDG_Timeout_1500ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_16, 0xBB8})
#define SM_IWDG_Timeout_2000ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_16, 0xFA0})
#define SM_IWDG_Timeout_5000ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_64, 0x9C4})
#define SM_IWDG_Timeout_10000ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_128,0x9C4})
#define SM_IWDG_Timeout_30000ms		((SM_IWDG_Timeout_Cfg_t){IWDG_Prescaler_256,0xEA6})

 /**
  * @}
  */

/** @defgroup IWDG_Flag 
  * @{
  */
#define IWDG_FLAG_PVU               ((uint16_t)0x0001)
#define IWDG_FLAG_RVU               ((uint16_t)0x0002)
#define IS_IWDG_FLAG(FLAG) (((FLAG) == IWDG_FLAG_PVU) || ((FLAG) == IWDG_FLAG_RVU))
#define IS_IWDG_RELOAD(RELOAD) ((RELOAD) <= 0xFFF)
/**
  * @}
  */

/**
  * @}
  */

/* Exported macro ------------------------------------------------------------*/
/* Exported functions --------------------------------------------------------*/

/* SM Functions ***************************************************************/
void SM_IWDG_Config(SM_IWDG_Timeout_Cfg_t cfg);

/* Prescaler and Counter configuration functions ******************************/
void IWDG_WriteAccessCmd(uint16_t IWDG_WriteAccess);
void IWDG_SetPrescaler(uint8_t IWDG_Prescaler);
void IWDG_SetReload(uint16_t Reload);
void IWDG_ReloadCounter(void);

/* IWDG activation function ***************************************************/
void IWDG_Enable(void);

/* Flag management function ***************************************************/
FlagStatus IWDG_GetFlagStatus(uint16_t IWDG_FLAG);

#ifdef __cplusplus
}
#endif

#endif /* __STM32F4xx_IWDG_H */

/**
  * @}
  */

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
