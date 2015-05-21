/**
  ******************************************************************************
  * @file    Lib/src/DCMI_Aptina_MT9M131.c
  * @author  Miquel Mas
  * @author  Ezio Cappellino
  * @author  Rafel Mormeneo}
  * @version V1.0
  * @date    13-Noviembre-2014
  * @brief   Este fichero contiene las funciones especificas para el sensor
  * 		 Aptina MT9M131
  ******************************************************************************
  */


#include "DCMI_Aptina_MT9M131.h"
#include "hal.h"
#include "stm32f4xx_dcmi.c"

/**
 * \defgroup Configuraciones Conjuntos de comandos de configuración del Aptina
 * @{
 */


AptinaConfig_t APTINA_CONFIG_SXGA = {
		APTINA_FORMAT_DEFAULT_CMD,
		APTINA_FORMAT_A_565RGB_CMD,
		APTINA_FORMAT_B_565RGB_CMD,
		APTINA_CONTEXT_B_CMD,
		APTINA_ENABLE_AWB_CMD,
};

AptinaConfig_t APTINA_CONFIG_DEFAULT = {
		(AptinaCommand_t){REG_CONTEXT_CONTROL, 		0x0000},
		(AptinaCommand_t){REG_WB_LIMITS, 			0x7F00},
		(AptinaCommand_t){REG_OP_MODE_CTRL, 		0x700E},
		(AptinaCommand_t){REG_AE_BIG_WIN_H, 		0x8000},
		(AptinaCommand_t){REG_AE_BIG_WIN_V, 		0x8008},
		(AptinaCommand_t){REG_AE_GAIN_ZONE_LIMITS, 	0x0300},
};

/*
 * @}
 */




/**
 * \defgroup Privado Funciones privadas que no se deberían acceder desde fuera.
 * 					 Son utilizadas por las funciones publicas
 * @{
 */

static Semaphore sem_snapshot;


#define DIM_MAX_BUFF_DMA 0x3FFFC

unsigned int num_buffer_actual;
unsigned int dimension_buffer;
uint32_t mem_pos_base;
void DMA_interrupt_handler(void *p, uint32_t flags){

	char target;
	if ((STM32_DMA2_STREAM1->stream->CR & DMA_SxCR_CT) != 0){
		target = 1;
	} else {
		target = 0;
	}
	if (flags & STM32_DMA_ISR_TCIF){
		chSysLockFromIsr();
		chSemSignalI(&sem_snapshot);
		chSysUnlockFromIsr();
		num_buffer_actual++;
		if (target == 1){
			dmaStreamSetMemory0(STM32_DMA2_STREAM1, mem_pos_base+(num_buffer_actual+1)*dimension_buffer);
		} else {
			dmaStreamSetMemory1(STM32_DMA2_STREAM1, mem_pos_base+(num_buffer_actual+1)*dimension_buffer);
		}
	}

}


/************************************************************************************//**
* \fn int GetNumBuffersMin ( int BytesImagen)
* \brief Calcula el numero de buffers necesarion para la imagen
*
* Devuelve el numero de buffers minimo necesarios para obtenener la imagen mediante DMA
*
* \param  data1 primer dato del paquete
* \return	numero de buffers minimo
****************************************************************************************/
int GetNumBuffersMin ( int BytesImagen)
{
	int numbuffers = 1;
	while (BytesImagen%numbuffers != 0 || BytesImagen / numbuffers > DIM_MAX_BUFF_DMA ){
		numbuffers++;
	}
	return numbuffers;
}

/**
 * @brief  Aplica todos los comandos de configuración al aptina
 * @param  config_commands[] Array de comandos a aplicar al Aptina
 */
void Aptina_Set_Config(AptinaConfig_t config_commands)
{
	 uint32_t i;

	  Aptina_Reset_Hard();
	  chThdSleepMilliseconds(200);


	  /* Initialize OV9655 */
	  for(i=0; i<(sizeof(config_commands)/sizeof(AptinaCommand_t)); i++)
	  {
		  Aptina_Set_Command(config_commands[i]);
		  chThdSleepMilliseconds(100);
	  }
}

/**
  * @brief  Writes a byte at a specific Camera register
  * @param  Addr: OV9655 register address
  * @param  Data: data to be written to the specific register
  * @retval 0x00 if write operation is OK
  *         0xFF if timeout condition occured (device not connected or bus error).
  * @note   Función privada. Utilice Aptina_Set_Command en su lugar.
  */
uint8_t Aptina_WriteReg(uint16_t Addr, uint16_t Data)
{

	#define WRITEREG_APTINA_MESSAGE_SIZE	3
	uint8_t page = (Addr & 0xff00)>>8;

	uint8_t output_data[WRITEREG_APTINA_MESSAGE_SIZE];
	output_data[0] = 0xF0;
	output_data[1] = 0x00;
	output_data[2] = page;

	msg_t rt = i2cMasterTransmitTimeout(&I2CD2, (0x90>>1), output_data,WRITEREG_APTINA_MESSAGE_SIZE,NULL,0,DCMI_TIMEOUT_MAX);


	output_data[0] = (uint8_t)(Addr);
	output_data[1] = Data >>8;
	output_data[2] = Data & 0x00FF;

	rt = i2cMasterTransmitTimeout(&I2CD2, (0x90>>1), output_data,WRITEREG_APTINA_MESSAGE_SIZE,NULL,0,DCMI_TIMEOUT_MAX);

	if (rt != RDY_OK) return 0xFF;

	return 0;
}


/**@}*/


/**
 * \defgroup Publico Funciones públicas
 * @{
 */


uint8_t *q = (uint8_t *) ((uint32_t)0x60000000);

void  resettestmem(void){
	q = (uint8_t *) ((uint32_t)0x60000000);
}

void * gettestmem(void){
	void * rt_value = q;
	q+= (640*128*2);
	return rt_value;
}

void Aptina_Reset_Hard(void){

	//Me aseguro que el clock está activo
	pwmEnableChannel(&PWMD3, 0, 1);

	//To activate a hard reset sequence to the camera:
	// 1. Wait for all supplies to be stable
	chThdSleepMilliseconds(1);

	// 2. Assert RESET_BAR (active LOW) for at least 1us
	palClearPad(GPIOB, GPIOB_CAM_RST);
	chThdSleepMicroseconds(10);

	// 3. De-assert RESET_BAR(input clock must be running)
	palSetPad(GPIOB, GPIOB_CAM_RST);

	// 4. Wait 24 clock cycles before using the two-wire serial interface
	chThdSleepMilliseconds(1);
}


void Aptina_Reset_Soft(void){
}

/**
 * \brief Devuelve el contexto actual
 * \return Valor del registro del conttrol de contexto
 */
uint16_t Aptina_GetCurrentContext(void){
	return Aptina_ReadReg(REG_CONTEXT_CONTROL);
}




/************************************************************************************//**
* \fn uint8_t cropSnapshot(uint16_t x_start, uint16_t y_start, uint16_t width, uint16_t height)
* \brief Coge una ventana de una imagen
*
* Captura una ventana de tamaño width x height mediante el DMA
*
* \param x_start Posición horizontal dónde empieza la ventana
* \param y_start Posición vertical dónde empieza la ventana
* \param width Ancho de la ventana
* \param height Alto de la ventana
* \param mem_pos Dirección de memoria donde se graba la imagen
* \return 0 si va bien, -1 si el tamaño no es correcto, -2 si la ventana no está dentro del área de la imagen
* TODO: comprobar si la ventana está dentro del área de la imagen
****************************************************************************************/
window_t current_aptina_window;
msg_t cropSnapshot(uint16_t x_start, uint16_t y_start, uint16_t width, uint16_t height, uint8_t ae_mode, uint32_t mem_pos){


	mem_pos_base = mem_pos;
	window_t win = {x_start, y_start, width, height};
	if (IS_WINDOW_EQUAL(current_aptina_window, win) == 0){
		Aptina_setSensorWindow(win);
		Aptina_waitOneFrame();
	}
	x_start = 0;
	y_start = 0;

	unsigned int dimension_imagen = (width)*(height)*2;
	unsigned int nBuffers = GetNumBuffersMin(dimension_imagen);
	dimension_buffer = dimension_imagen/nBuffers;


	//reseteamos el "contador" de interrupciones DMA
	resetSnapshotInCourse();


	//reservamos un stream dma
	dmaStreamAllocate(STM32_DMA2_STREAM1, 0, DMA_interrupt_handler, NULL);
	dmaStreamSetPeripheral(STM32_DMA2_STREAM1,&(DCMI->DR));

	//seteamos los dos primeros buffers del doble buffer dma
	dmaStreamSetMemory0(STM32_DMA2_STREAM1, mem_pos);
	dmaStreamSetMemory1(STM32_DMA2_STREAM1, mem_pos+dimension_buffer);

	//El tamaño de la transacción esta calculada en WORDS (4 bytes) porque
	//luego configuramos el DMA con STM32_DMA_CR_MSIZE_WORD (Memory Data Size = 4bytes)
	dmaStreamSetTransactionSize(STM32_DMA2_STREAM1, dimension_buffer/4);

	dmaStreamSetMode(STM32_DMA2_STREAM1,		STM32_DMA_CR_CHSEL(1) |
									STM32_DMA_CR_PBURST_SINGLE |
									STM32_DMA_CR_MBURST_SINGLE |
									STM32_DMA_CR_DIR_P2M |
									STM32_DMA_CR_MSIZE_WORD |
									STM32_DMA_CR_PSIZE_WORD |
									STM32_DMA_CR_MINC |
									STM32_DMA_CR_DBM |
									STM32_DMA_CR_TCIE
									//STM32_DMA_CR_HTIE
									); //chanel 1 (DCMI)


	dmaStreamSetFIFO(STM32_DMA2_STREAM1, STM32_DMA_FCR_FTH_FULL | STM32_DMA_FCR_DMDIS);
	//DMA2->LISR |=  DMA_LISR_TCIF1;
	//DMA2->LISR |=  DMA_LISR_TEIF1;
	//DMA2->LISR |=  DMA_LISR_HTIF1;
	//DMA2->LISR |=  DMA_LISR_TCIF1;
	//DMA2->LISR |=  DMA_LISR_TCIF1;


	DCMI_CROPInitTypeDef DCMI_CROPInitStruct;
	DCMI_CROPInitStruct.DCMI_HorizontalOffsetCount = x_start*2;
	DCMI_CROPInitStruct.DCMI_VerticalStartLine = y_start;
	DCMI_CROPInitStruct.DCMI_CaptureCount = (width*2)   -1;
	DCMI_CROPInitStruct.DCMI_VerticalLineCount = (height)-1 ;


	DCMI_CROPConfig(&DCMI_CROPInitStruct);
	DCMI_CROPCmd(ENABLE);
	DCMI_Cmd(ENABLE);

	dmaStreamEnable(STM32_DMA2_STREAM1);

	DCMI_CaptureCmd(ENABLE);

	//Esperamos a tener toda la imagen
	msg_t result = waitSnapshotInCourse(nBuffers);


	DCMI_CaptureCmd(DISABLE);
	dmaStreamDisable(STM32_DMA2_STREAM1);

	dmaStreamRelease(STM32_DMA2_STREAM1);

	DCMI_Cmd(DISABLE);

	DCMI_CROPCmd(DISABLE);

	return result;

}


/**
  * @brief  Espera a que la foto haya terminado de tomarse.
  * @param numero_bloques Numero de bloques del DMA
  * @retval None
  */
msg_t waitSnapshotInCourse(int numero_bloques){
	int i;
	msg_t val;
	for (i = 0; i < numero_bloques; i++){
		//val = chSemWait(&sem_snapshot);
		val = chSemWaitTimeout (&sem_snapshot, MS2ST(600));
		if (val!=RDY_OK){
			return val;
		}
	}
	return val;
}

/**
  * @brief  Cancela la captura de una foto
  */
void resetSnapshotInCourse(void){
	chSemReset(&sem_snapshot,0);
	num_buffer_actual = 0;
}

/**
  * @brief  Configures the DCMI/DMA to capture image from the OV9655 camera.
  * @retval None
  */
void Aptina_Init(void)
{
  DCMI_InitTypeDef DCMI_InitStructure;
  //DMA_InitTypeDef  DMA_InitStructure;

  /*** Configures the DCMI to interface with the OV9655 camera module ***/
  /* Enable DCMI clock */
  rccEnableAHB2(RCC_AHB2ENR_DCMIEN,0);
  //RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_DCMI, ENABLE);

  /* DCMI configuration */
  DCMI_InitStructure.DCMI_CaptureMode = DCMI_CaptureMode_SnapShot; //FOTO, no video
  DCMI_InitStructure.DCMI_SynchroMode = DCMI_SynchroMode_Hardware;
  DCMI_InitStructure.DCMI_PCKPolarity = DCMI_PCKPolarity_Rising;
  DCMI_InitStructure.DCMI_VSPolarity = DCMI_VSPolarity_Low;
  DCMI_InitStructure.DCMI_HSPolarity = DCMI_HSPolarity_Low;
  DCMI_InitStructure.DCMI_CaptureRate = DCMI_CaptureRate_All_Frame;
  DCMI_InitStructure.DCMI_ExtendedDataMode = DCMI_ExtendedDataMode_8b;


  /* Configures the DMA2 to transfer Data from DCMI */
  /* Enable DMA2 clock */
  //RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2, ENABLE);



  /** DMA INIT

  /* DCMI configuration */
  DCMI_Init(&DCMI_InitStructure);
  //dmaStreamEnable(STM32_DMA2_STREAM1);



  /* DMA2 IRQ channel Configuration */
  //DMA_Init(DMA2_Stream1, &DMA_InitStructure);

  chSemInit(&sem_snapshot,0);


}

/**
 * \brief Setea un valor de configuración a un registro
 * \param command Dirección y valor del registro a configurar
 * \return 0x00 if write operation is OK
 *         0xFF if timeout condition occured (device not connected or bus error).
 */
uint8_t Aptina_Set_Command(AptinaCommand_t command){
	return Aptina_WriteReg(command.REG_ADDR, command.REG_VALUE);
}


/**
  * @brief  Configures the Aptina camera in SXGA
  * @param  None
  * @retval None
  */
void Aptina_SXGAConfig(void)
{

	Aptina_Set_Config(APTINA_CONFIG_SXGA);
}


/**
  * @brief  Reads a byte from a specific Camera register
  * @param  Addr: OV9655 register address.
  * @retval data read from the specific register or 0xFF if timeout condition
  *         occured.
  */
uint16_t Aptina_ReadReg(uint16_t Addr)
{

	uint8_t page = (Addr & 0xff00)>>8;

	uint8_t page_data[3];
	page_data[0] = 0xF0;
	page_data[1] = 0x00;
	page_data[2] = page;

	msg_t rt = i2cMasterTransmitTimeout(&I2CD2, (0x90>>1), page_data,3,NULL,0,DCMI_TIMEOUT_MAX);

	#define READREG_APTINA_TX_MESSAGE_SIZE	1
	uint8_t output_data[READREG_APTINA_TX_MESSAGE_SIZE];
	output_data[0] = (uint8_t)(Addr);

	#define READREG_APTINA_RX_MESSAGE_SIZE	2
	uint8_t input_data[READREG_APTINA_RX_MESSAGE_SIZE];

	 rt = i2cMasterTransmitTimeout(&I2CD2, (0x90>>1), output_data,1,NULL,0,DCMI_TIMEOUT_MAX);
	 rt = i2cMasterReceiveTimeout(&I2CD2, (0x90>>1),input_data,READREG_APTINA_RX_MESSAGE_SIZE,DCMI_TIMEOUT_MAX);
	if (rt != RDY_OK){
		int errors = i2cGetErrors(&I2CD2);
		return 0xFF;
	}

	return (input_data[0]<<8) | input_data[1];
}

/**
 * @brief Consulta el valor del registro Rx2CA para detectar el incremento del contador de EOF
 * @retval Valor del registro Rx2CA
 */
uint16_t Aptina_getEOFCounter(void){
	return Aptina_ReadReg(REG_EOF_COUNTER);

}

/**
 * @brief Espera a que termine el Frame actual
 */
void Aptina_waitOneFrame(void){
	uint16_t eofCounter = Aptina_ReadReg(REG_EOF_COUNTER);
	while(Aptina_ReadReg(REG_EOF_COUNTER) == eofCounter){
		chThdSleepMicroseconds(100); //todo: Comprobar que este sleep sea el correcto
	}
}

/**
 * @brief Configura el sensor con los valores por defecto de los principales registros
 */
void Aptina_DefaultConfig(void){
	Aptina_Set_Config(APTINA_CONFIG_DEFAULT);

}

/**
 * @brief Configura el valor de balance de blancos manual
 * @param Valor de balance de blancos
 */
void Aptina_setManualWB(uint8_t wb_position){
	//Ponemos el wb_position como el byte más significativo y menos significativo
	uint16_t wb = wb_position;
	wb = (wb << 8) | wb_position;

	//Activamos el modo de Balance de Blancos Manual
	Aptina_Set_Command((AptinaCommand_t){REG_WB_LIMITS, wb});
	uint16_t regValue = Aptina_ReadReg(REG_OP_MODE_CTRL);
	regValue = regValue & 0x7FFD; //Desactivamos bit 15 y 1, el resto los dejamos igual
	Aptina_WriteReg(REG_OP_MODE_CTRL, regValue);

	//Esperamos al siguiente Frame
	Aptina_waitOneFrame();

	regValue = Aptina_ReadReg(REG_OP_MODE_CTRL);
	regValue = regValue | 0x8002; //Activamos los bits 15 y 1, el resto los dejamos igual
	Aptina_WriteReg(REG_OP_MODE_CTRL, regValue);
}


/**
 * @breif Configura el modo de back light compensation
 * @param mode 0 indica "Big window" (R0x226 y R0x227), 1 indica "Small window" (R0x22B y R0x22C),
 * 2 o 3 indican Backlight compensation(ver Developer Guide pag. 40)
 */
void Aptina_setAEWindowMode(uint8_t mode){
	uint16_t regValue = Aptina_ReadReg(REG_OP_MODE_CTRL);
	if (mode == BIG_WINDOW) { //Big window
		regValue = regValue & 0xFFF3;
	} else if (mode == SMALL_WINDOW) { //Little window
		regValue = (regValue & 0xFFF7) | 0x0004;
	} else { //Backlight compensation mode
		regValue = regValue | 0x000C;
	}
	Aptina_WriteReg(REG_OP_MODE_CTRL, regValue);
}

/**
 * @brief Configura el tamaño de las ventanas de AE
 * @param ventana 0 indica "Big window", 1 indica "Small window"
 * @param ae_window ventana de autoexposición que se quiere configurar
 * @param width ancho de la imagen que se captura
 * @param height alto de la imagen que se captura
 */
void Aptina_setAEWindow(uint8_t ventana, window_t ae_window, uint32_t width, uint32_t height){

	uint16_t reg_h;
	uint16_t reg_v;
	uint16_t h_left = (128*ae_window.x)/width;
	uint16_t h_right = (128*(ae_window.x+ae_window.width))/width;
	uint16_t v_top = (128*ae_window.y)/height;
	uint16_t v_bottom = (128*(ae_window.y+ae_window.height))/height;

	h_left = 10;
	h_right = 100;
	v_top = 10;
	v_bottom = 100;

	reg_h = (h_right<<8) | h_left;
	reg_v = (v_bottom<<8) | v_top;
	if (ventana == 1){
		Aptina_WriteReg(REG_AE_LITTLE_WIN_H, reg_h);
		Aptina_WriteReg(REG_AE_LITTLE_WIN_V, reg_v);
	}
	else{
		Aptina_WriteReg(REG_AE_BIG_WIN_H, reg_h);
		Aptina_WriteReg(REG_AE_BIG_WIN_V, reg_v);
	}

}


void Aptina_setManualExposicion(uint8_t exposicion){
	uint16_t exposicionExt = AE_TARGET_TOLERANCE;
	exposicionExt = exposicionExt<<8 | exposicion;
	Aptina_Set_Command((AptinaCommand_t){REG_AE_TARGET_PRECISION, exposicionExt});

	//Encendemos los lasers para hacer la autoexposición con luz
	
	lasersOn(get_laser_potencia1_value());
	flashOn();
	
	// Ponemos auto exposure. Ponemos el bit 14 a 1
	uint16_t reg_value = Aptina_ReadReg(REG_OP_MODE_CTRL);
	reg_value = reg_value | 0x4000;
	Aptina_Set_Command((AptinaCommand_t){REG_OP_MODE_CTRL, reg_value});

	uint16_t tmp = Aptina_ReadReg(REG_AE_TARGET_PRECISION);

	// Esperamos hasta que llegue al valor deseado.
	uint32_t currentLuma = Aptina_ReadReg(0x24D)&0x00FF;
	uint32_t currentLuma2 = (Aptina_ReadReg(0x24C)&0xFF00)>>8;
	uint32_t timeout_miliseconds = 0;
	while( (timeout_miliseconds < 5000 ) && (currentLuma > exposicion + 3 || currentLuma < exposicion -3 )){
		currentLuma = Aptina_ReadReg(0x24D)&0x00FF;
		chThdSleepMilliseconds(10);
		timeout_miliseconds += 10;
	}
	// Volvemos a poner exposicion manual para que no cambie mas el valor. Ponemos el bit 14 a 0
	reg_value = reg_value & 0xBFFF;
	Aptina_Set_Command((AptinaCommand_t){REG_OP_MODE_CTRL, reg_value});

	lasersOff();
	flashOff();
}


void Aptina_setSensorWindow(window_t win){
	Aptina_WriteReg(REG_ROW_START, win.y+12);
	Aptina_WriteReg(REG_COL_START, win.x+30);
	Aptina_WriteReg(REG_WIN_WIDTH, win.width);
	Aptina_WriteReg(REG_WIN_HEIGHT, win.height);
	Aptina_WriteReg(REG_HOR_BLANK_B, 388+(1280-win.width));

	current_aptina_window = win;

}

window_t Aptina_getSensorWindow(uint8_t readReg){

	if (readReg == 1){
		current_aptina_window.x = Aptina_ReadReg(REG_COL_START);
		current_aptina_window.y = Aptina_ReadReg(REG_ROW_START);
		current_aptina_window.width = Aptina_ReadReg(REG_WIN_WIDTH);
		current_aptina_window.height = Aptina_ReadReg(REG_WIN_HEIGHT);
	}
	return current_aptina_window;
}

/**@}*/

/****************************END OF FILE****/
