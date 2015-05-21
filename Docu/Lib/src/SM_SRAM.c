#include "SM_SRAM.h"
#include "stm32f4xx_fsmc.h"

void SM_initMem() {

	rccEnableAHB3(RCC_AHB3ENR_FSMCEN, 0);
	FSMC_NORSRAMInitTypeDef FSMC_NORSRAMInitStructure;

	//-- PSRAM ISSI66WVE4M16BLL ----------------------------------------//
	//-- 8MBytes (4MDirecciones x 16Bits)   ----------------------------------------/
	//-- 70nS Access time                 ----------------------------------------//


	FSMC_NORSRAMTimingInitTypeDef pR;

	//-- FSMC Configuration ------------------------------------------------------//
	//@TODO: Ajustar los parametros de la memoria (70ns)
	pR.FSMC_AddressSetupTime =9;  //12*5.952 >70 ns Taa READ
	pR.FSMC_AddressHoldTime = 0x01;  //don't care en una PSRAM
	pR.FSMC_DataSetupTime = 4;		//8*5.952 > 46ns  Twp
	pR.FSMC_BusTurnAroundDuration = 2;  // 1 * 5.952 > 5 ns Tcph (read y write)
	pR.FSMC_CLKDivision = 2;			//no hay clock en uns psram
	pR.FSMC_DataLatency = 2;			//no hay en la PSRAM
	pR.FSMC_AccessMode = FSMC_AccessMode_A;

	FSMC_NORSRAMTimingInitTypeDef pW;

	//-- FSMC Configuration ------------------------------------------------------//
	//@TODO: Ajustar los parametros de la memoria (70ns)
	pW.FSMC_AddressSetupTime = 15;  //12*5.952 >70 ns Taa READ
	pW.FSMC_AddressHoldTime = 0x01;  //don't care en una PSRAM
	pW.FSMC_DataSetupTime = 11;		//8*5.952 > 46ns  Twp
	pW.FSMC_BusTurnAroundDuration = 2;  // 1 * 5.952 > 5 ns Tcph (read y write)
	pW.FSMC_CLKDivision = 2;			//no hay clock en uns psram
	pW.FSMC_DataLatency = 2;			//no hay en la PSRAM
	pW.FSMC_AccessMode = FSMC_AccessMode_A;

	FSMC_NORSRAMInitStructure.FSMC_Bank = FSMC_Bank1_NORSRAM1;
	FSMC_NORSRAMInitStructure.FSMC_DataAddressMux = FSMC_DataAddressMux_Disable;
	FSMC_NORSRAMInitStructure.FSMC_MemoryType = FSMC_MemoryType_PSRAM;
	FSMC_NORSRAMInitStructure.FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_16b;
	FSMC_NORSRAMInitStructure.FSMC_BurstAccessMode =
			FSMC_BurstAccessMode_Disable;
	FSMC_NORSRAMInitStructure.FSMC_AsynchronousWait =
			FSMC_AsynchronousWait_Disable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalPolarity =
			FSMC_WaitSignalPolarity_Low;
	FSMC_NORSRAMInitStructure.FSMC_WrapMode = FSMC_WrapMode_Disable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalActive =
			FSMC_WaitSignalActive_BeforeWaitState;
	FSMC_NORSRAMInitStructure.FSMC_WriteOperation = FSMC_WriteOperation_Enable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignal = FSMC_WaitSignal_Disable;
	FSMC_NORSRAMInitStructure.FSMC_ExtendedMode = FSMC_ExtendedMode_Enable;
	FSMC_NORSRAMInitStructure.FSMC_WriteBurst = FSMC_WriteBurst_Disable;
	FSMC_NORSRAMInitStructure.FSMC_ReadWriteTimingStruct = &pR;
	FSMC_NORSRAMInitStructure.FSMC_WriteTimingStruct = &pW;

	FSMC_NORSRAMInit(&FSMC_NORSRAMInitStructure);

	//!< Enable FSMC Bank1_SRAM2 Bank //
	FSMC_NORSRAMCmd(FSMC_Bank1_NORSRAM1, ENABLE);


	//uint16_t *ppo = (uint16_t *) Bank1_SRAM2_ADDR; // As a pointer to 16-bit WORDS
	//uint8_t *q = (uint8_t *) Bank1_SRAM2_ADDR; // As a pointer to 8-bit BYTES

}

/*
void testmem(void) {

	rccEnableAHB3(RCC_AHB3ENR_FSMCEN, 0);
	FSMC_NORSRAMInitTypeDef FSMC_NORSRAMInitStructure;

	//@TODO: hacer que funcione con la memoria de 16MB(creo que ahora solo una direcicones de 18 bits

	//-- PSRAM Type : EM7644SU16 ANP 70LF ----------------------------------------//
	//-- 8M (512K x 16Bits)                ----------------------------------------//
	//-- 70nS Access time                 ----------------------------------------//

	FSMC_NORSRAMTimingInitTypeDef p;

	//-- FSMC Configuration ------------------------------------------------------//
	p.FSMC_AddressSetupTime = 0x02;
	p.FSMC_AddressHoldTime = 0x00;
	p.FSMC_DataSetupTime = 0x06;
	p.FSMC_BusTurnAroundDuration = 0x01;
	p.FSMC_CLKDivision = 0;
	p.FSMC_DataLatency = 0;
	p.FSMC_AccessMode = FSMC_AccessMode_A;

	FSMC_NORSRAMInitStructure.FSMC_Bank = FSMC_Bank1_NORSRAM1;
	FSMC_NORSRAMInitStructure.FSMC_DataAddressMux = FSMC_DataAddressMux_Disable;
	FSMC_NORSRAMInitStructure.FSMC_MemoryType = FSMC_MemoryType_PSRAM;
	FSMC_NORSRAMInitStructure.FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_16b;
	FSMC_NORSRAMInitStructure.FSMC_BurstAccessMode =
			FSMC_BurstAccessMode_Disable;
	FSMC_NORSRAMInitStructure.FSMC_AsynchronousWait =
			FSMC_AsynchronousWait_Disable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalPolarity =
			FSMC_WaitSignalPolarity_Low;
	FSMC_NORSRAMInitStructure.FSMC_WrapMode = FSMC_WrapMode_Disable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalActive =
			FSMC_WaitSignalActive_BeforeWaitState;
	FSMC_NORSRAMInitStructure.FSMC_WriteOperation = FSMC_WriteOperation_Enable;
	FSMC_NORSRAMInitStructure.FSMC_WaitSignal = FSMC_WaitSignal_Disable;
	FSMC_NORSRAMInitStructure.FSMC_ExtendedMode = FSMC_ExtendedMode_Disable;
	FSMC_NORSRAMInitStructure.FSMC_WriteBurst = FSMC_WriteBurst_Disable;
	FSMC_NORSRAMInitStructure.FSMC_ReadWriteTimingStruct = &p;
	FSMC_NORSRAMInitStructure.FSMC_WriteTimingStruct = &p;

	FSMC_NORSRAMInit(&FSMC_NORSRAMInitStructure);

	//!< Enable FSMC Bank1_SRAM2 Bank //
	FSMC_NORSRAMCmd(FSMC_Bank1_NORSRAM1, ENABLE);


	uint8_t ReadRam[10] = { 0 };
	uint16_t vectorpene[10] = { 0 };
	uint16_t *ppo = (uint16_t *) Bank1_SRAM2_ADDR; // As a pointer to 16-bit WORDS
	uint8_t *q = (uint8_t *) Bank1_SRAM2_ADDR; // As a pointer to 8-bit BYTES

	int h;

	for (h = 0; h < 10; h++) {
		ppo[h] = h;
	}

	for (h = 0; h < 10; h++) {
		vectorpene[h] = ppo[h];
	}

	ppo[0] = 0x1234;
	ppo[1] = 0x5678;
	ppo[2] = 0x9ABC;
	ppo[3] = 0xDEF0;

	vectorpene[0] = ppo[0];
	vectorpene[1] = ppo[2];
	vectorpene[2] = ppo[4];
	vectorpene[3] = ppo[6];

}
*/
