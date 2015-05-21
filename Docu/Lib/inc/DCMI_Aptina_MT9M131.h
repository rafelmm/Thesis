/**
  ******************************************************************************
  * @file    Lib/inc/DCMI_Aptina_MT9M131.h
  * @author  Miquel
  * @author	 Ezio
  * @author  Rafel
  * @version V1.0
  * @date    25/08/2014
  * @brief   Header for DCMI_Aptina_MT9M131.h module
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DCMI_APTINA_MT9M131_H
#define __DCMI_APTINA_MT9M131_H

/* Includes ------------------------------------------------------------------*/
#include "ch.h"
#include "SM_tipos.h"


/*! \enum ImageFormat_TypeDef
 * Image Sizes enumeration
 */
typedef enum
{
  BMP_QQVGA             =   0x00,	    /* BMP Image QQVGA 160x120 Size */
  BMP_QVGA              =   0x01,       /* BMP Image QVGA 320x240 Size */
  JPEG_160x120          =   0x02,	    /* JPEG Image 160x120 Size */
  JPEG_176x144          =   0x03,	    /* JPEG Image 176x144 Size */
  JPEG_320x240          =   0x04,	    /* JPEG Image 320x240 Size */
  JPEG_352x288          =   0x05,	    /* JPEG Image 352x288 Size */
  BMP_640x512			=   0x06
}ImageFormat_TypeDef;

/*! \typedef AptinaCommand_t
 * Estructura para un comando del Aptina
 */
typedef struct
{
  uint16_t REG_ADDR;      /*!< Especifica la dirección del registro que se quiere escribir */
  uint16_t REG_VALUE;  	  /*!< Especifica el valor que se debe escribir en el registro */
} AptinaCommand_t;

/*! \typedef AptinaConfig_t
 * Configuración del Aptina. Se trata de un array de comandos
 */
typedef AptinaCommand_t AptinaConfig_t[];


#define DCMI_TIMEOUT_MAX  10000		/*!< Timeout maximo del I2C*/

#define AE_TARGET_TOLERANCE 0x01

#define AE_WINDOW_NOCHANGE 			100
#define AE_WINDOW_BIG 				0
#define AE_WINDOW_MEDIUM 			1
#define AE_WINDOW_SMALL 			2
#define AE_WINDOW_BIG_HALF			3
#define AE_WINDOW_MED_HALF			4

/**
 * \defgroup Registros Aptina MT9M131 REGISTERS
 * @{
 */

	/**
	 * \defgroup CoreRegs Sensor Core Registers
	 * @{
	 */
	#define REG_CHIP_VERSION	0x000
	#define REG_ROW_START		0x001
	#define REG_COL_START		0x002
	#define REG_WIN_HEIGHT		0x003
	#define REG_WIN_WIDTH		0x004
	#define REG_HOR_BLANK_B		0x005
	#define REG_VER_BLANK_B		0x006
	#define REG_HOR_BLANK_A		0x007
	#define REG_VER_BLANK_A		0x008
	#define REG_SHUTTER_WIDTH	0x009
	#define REG_ROW_SPEED		0x00A
	#define REG_EXTRA_DELAY		0x00B
	#define REG_SHUTTER_DELAY	0x00C
	#define REG_RESET			0x00D
	#define REG_READ_MODE_B		0x020
	#define REG_READ_MODE_A		0x021
	#define REG_FLASH_CONTROL	0x023
	#define REG_GREEN1_GAIN		0x02B
	#define REG_BLUE_GAIN		0x02C
	#define REG_RED_GAIN		0x02D
	#define REG_GREEN2_GAIN		0x02E
	#define REG_GLOBAL_GAIN		0x02F
	#define REG_PAGE_MAP		0x0F0
	/**@}*/

	/**
	 * \defgroup ColorpipeRegs Colorpipe Registers
	 * @{
	 */

	#define REG_APERTURE_CORR		0x105
	#define REG_OP_MODE_CTRL		0x106
	#define REG_OUT_FORMAT_CTRL		0x108
	#define REG_COLOR_SAT_CTRL		0x125
	#define REG_APERTURE_CORR		0x105
	#define REG_LUMA_OFFSET			0x134
	#define REG_LUMA_CLIP			0x135
	#define REG_OUT_FORMAT_CTRL2_A	0x13A
	#define REG_TEST_PATT_GEN_CTRL	0x148
	#define REG_DEFECT_CORRECTION_A	0x14C
	#define REG_DEFECT_CORRECTION_B	0x14D
	#define REG_LINE_COUNTER		0x199
	#define REG_FRAME_COUNTER		0x19A
	#define REG_OUT_FORMAT_CTRL2_B 	0x19B
	#define REG_GLOBAL_CLOCK_CTRL	0x1B3
	#define REG_EFFECTS_MODE		0x1E2
	#define REG_EFFECTS_SEPIA		0x1E3
	/**@}*/

	/**
	 * \defgroup CamControlRegs Camera Control Registers
	 * @{
	 */
	#define REG_WB_MATRIX_POSITION	0x212
	#define REG_WB_LIMITS			0x224
	#define REG_AE_BIG_WIN_H		0x226
	#define REG_AE_BIG_WIN_V		0x227
	#define REG_AE_LITTLE_WIN_H		0x22B
	#define REG_AE_LITTLE_WIN_V		0x22C
	#define REG_AE_TARGET_PRECISION	0x22E
	#define REG_AE_SENSITIVITY_A	0x22F
	#define REG_AE_GAIN_ZONE_LIMITS	0x237
	#define REG_CURRENT_LUMA		0x24C
	#define REG_AE_DIGITAL_GAINS	0x262
	#define REG_AE_SENSITIVITY_B	0x29C
	#define REG_CONTEXT_CONTROL 	0x2C8
	#define REG_EOF_COUNTER			0x2CA


	/*
	 *@}
	 */

/*
 * @}
 */

#define BIG_WINDOW 0
#define SMALL_WINDOW 1
#define BACKLIGHT_COMPENSATION 3


#define CONTEXT_B 0x8F0B
#define CONTEXT_A 0x0800

/**
 * \defgroup Commands Camera Commands
 * @{
 */



	/**
	 * \defgroup CoreCommands Sensor Core Commands
	 * @{
	 */
	#define APTINA_RESTART_CMD 	(AptinaCommand_t){REG_RESET, 0x000A}		/*!< Write this command to restart Aptina. */
	#define APTINA_DISABLE_CMD 	(AptinaCommand_t){REG_RESET, 0x0001}		/*!< Write this command to disable Aptina. */
	#define APTINA_ENABLE_CMD 	(AptinaCommand_t){REG_RESET, 0x0008}		/*!< Write this command to enable Aptina. */
	/*
	 * @}
	 */

	/**
	 * \defgroup ColorPipeCommands Colorpipe Commands
	 * @{
	 */
	#define APTINA_FORMAT_DEFAULT_CMD  (AptinaCommand_t){REG_OUT_FORMAT_CTRL, 0x0080}	  /*!< Write this command to set the Default Output Format. */
	#define APTINA_FORMAT_A_YCBCR_CMD  (AptinaCommand_t){REG_OUT_FORMAT_CTRL2_A, 0x0200}  /*!< Write this command to set YCbCr Output Format for Context A. */
	#define APTINA_FORMAT_A_565RGB_CMD (AptinaCommand_t){REG_OUT_FORMAT_CTRL2_A, 0x0300}  /*!< Write this command to set 565RGB Output Format for Context A. */
	#define APTINA_FORMAT_B_YCBCR_CMD  (AptinaCommand_t){REG_OUT_FORMAT_CTRL2_B, 0x0200}  /*!< Write this command to set YCbCr Output Format for Context B. */
	#define APTINA_FORMAT_B_565RGB_CMD (AptinaCommand_t){REG_OUT_FORMAT_CTRL2_B, 0x0300}  /*!< Write this command to set 565RGB Output Format for Context B. */
	#define APTINA_ENABLE_AWB_CMD 	   (AptinaCommand_t){REG_OP_MODE_CTRL, 0x700E}		  /*!< Write this command to enable the AWB function. */
	#define APTINA_DISABLE_AWB_CMD	   (AptinaCommand_t){REG_OP_MODE_CTRL, 0x300C}		  /*!< Write this command to disable the AWB function.*/

	/*
	 * @}
	 */

	/**
	 * \defgroup CameraControlCommands Camera Control Commands
	 * @{
	 */
	#define APTINA_CONTEXT_B_CMD (AptinaCommand_t){REG_CONTEXT_CONTROL, CONTEXT_B} 	/*!< Write this command to set Context B (snapshot). */
	#define APTINA_CONTEXT_A_CMD (AptinaCommand_t){REG_CONTEXT_CONTROL, CONTEXT_A} 	/*!< Write this command to set Context A (preview). */
	#define APTINA_WB_DAYLIGHT_CMD (AptinaCommand_t){REG_WB_LIMITS, 0x7F7F}			/*!< Write this command to set Manual WB to Daylight Position. */
	#define APTINA_WB_FLUORESCENT_CMD (AptinaCommand_t){REG_WB_LIMITS, 0x2D2D}		/*!< Write this command to set Manual WB to Compact White Fluorescent position. */
	#define APTINA_WB_INCANDESCENT_CMD (AptinaCommand_t){REG_WB_LIMITS, 0x0000}		/*!< Write this command to set Manual WB to Incandescent light position. */
	#define APTINA_AE_A_FAST_CMD (AptinaCommand_t){REG_AE_SENSITIVITY_A, 0xDF20}	/*!< Write this command to set Luma Adaptation Fast for context A. */
	#define APTINA_AE_A_SLOW_CMD (AptinaCommand_t){REG_AE_SENSITIVITY_A, 0x9E27}	/*!< Write this command to set Luma Adaptation Slow for context A. */
	#define APTINA_AE_B_FAST_CMD (AptinaCommand_t){REG_AE_SENSITIVITY_B, 0xDF20}	/*!< Write this command to set Luma Adaptation Fast for context B. */
	#define APTINA_AE_B_SLOW_CMD (AptinaCommand_t){REG_AE_SENSITIVITY_B, 0x9E27}	/*!< Write this command to set Luma Adaptation Slow for context B. */
	/*
	 * @}
	 */

/*
 * @}
 */


/**
 * \defgroup Prototipos Prototipos de las funciones públicas
 * @{
 */
void * gettestmem(void);
void  resettestmem(void);

void Aptina_Reset_Hard(void);
void Aptina_Reset_Soft(void);

void Aptina_Init(void);
uint8_t Aptina_Set_Command(AptinaCommand_t command);
void Aptina_SXGAConfig(void);
void Aptina_DefaultConfig(void);

uint16_t Aptina_ReadReg(uint16_t Addr);
uint16_t Aptina_GetCurrentContext(void);

msg_t cropSnapshot(uint16_t x_start, uint16_t y_start, uint16_t width, uint16_t height,  uint8_t ae_mode, uint32_t mem_pos);
msg_t waitSnapshotInCourse(int numero_bloques);
void resetSnapshotInCourse(void);

uint16_t Aptina_getEOFCounter(void);

void Aptina_waitOneFrame(void);

void Aptina_setManualWB(uint8_t wb_position);
void Aptina_setManualExposicion(uint8_t exposicion);
void Aptina_setAEWindowMode(uint8_t mode);
void Aptina_setAEWindow(uint8_t ventana, window_t ae_window, uint32_t width, uint32_t height);


void Aptina_setSensorWindow(window_t win);
window_t Aptina_getSensorWindow(uint8_t readReg);

/*
 * @}
 */

#endif /* __DCMI_APTINA_MT9M131_H */

/****************************END OF FILE****/

