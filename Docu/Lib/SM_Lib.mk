# List of all the ChibiOS/RT test files.
SMLIBSRC = 	Lib/src/SM_SRAM.c \
			Lib/src/stm32f4xx_fsmc.c \
			Lib/src/DCMI_Aptina_MT9M131.c \
			Lib/src/SM_protocol.c \
			Lib/src/SM_activity.c \
			Lib/src/SM_senda_interface.c \
			Lib/src/SM_processMessages.c \
			Lib/src/SM_camera.c \
			Lib/JPEGLib/src/Huffman.c \
			Lib/JPEGLib/src/JPEG_Encoder.c \
			Lib/JPEGLib/JPEGLib.c \
			Lib/src/SM_ConfigParams.c \
			Lib/src/stm32f4xx_flash.c \
			Lib/src/SM_stm32f4xx_iwdg.c \
			Lib/src/SM_image.c \
			Lib/src/SM_CAN_interface.c \
			Lib/src/SM_ImagerConfig.c \
			Lib/src/SM_trap.c
				
          
# Required include directories
SMLIBINC = Lib/inc \
			Lib/JPEGLib \
			Lib/JPEGLib/inc