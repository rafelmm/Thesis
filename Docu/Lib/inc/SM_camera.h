/*
 * SM_camera.h
 *
 *  Created on: 29/08/2014
 *      Author: miquel
 */

#ifndef SM_CAMERA_H_
#define SM_CAMERA_H_

#include "ch.h"
#include "SM_tipos.h"
#include "DCMI_Aptina_MT9M131.h"
#include "SM_ConfigParams.h"
#include "hal.h"


#define ID_REQ_IMAGEN_JPEG				0	/*!< Pide a la cámara que capture una imagen en formato JPEG. */
#define ID_REQ_IMAGEN_YCbCr				1	/*!< Pide a la cámara que capture una imagen en formato YCbCr. */
#define ID_REQ_IMAGEN_JPEG_EXISTENTE	2	/*!< Pide a la cámara que envie la última imagen JPEG capturada. */
#define ID_REQ_PREVIEW_JPEG				3	/*!< Pide a la cámara que capture una imagen JPEG en modo Preview. */
#define ID_REQ_PREVIEW_YCbCr			4	/*!< Pide a la cámara que capture una imagen YCbCr en modo Preview. */

typedef struct {
	uint8_t id_req_type;  //tipo de peticion ex: ID_REQ_IMAGEN_JPEG
	uint8_t *result;     //direccion de memoria de donde se encuentra
	uint32_t length;
	uint32_t width;
	uint32_t height;
	uint32_t x_start;
	uint32_t y_start;
	uint8_t ae_mode;
} cameraRequest;

#define OFFSET_WINDOWS 4 //debe ser multiplo de 4 ya que las ventanas en YCbCr deben ser multiplos e 4
#if OFFSET_WINDOWS%4 != 0
#error OFFSET_WINDOWS debe ser multiplo de 4
#endif


#define CAMARA_STANDBY	0 		/*!< Indica que la camara se queda en Standby cuando no se esta haciendo una foto.*/
#define AUTO_MODE		0


void  initCamera(uint8_t auto_mode);

void * captureImage(uint32_t x_start, uint32_t y_start,uint32_t width,uint32_t height,  uint8_t ae_mode, uint32_t mem_pos);

void readCameraConfigRegs(void);

void * getExistingImageJPEG(uint32_t *size,uint32_t width, uint32_t height);

void * getImageJPEG(uint32_t *size,uint32_t x_start, uint32_t y_start,uint32_t width, uint32_t height, uint8_t ae_mode);

void * getImageYCbCr(uint32_t *size, uint32_t x_start, uint32_t y_start,uint32_t width, uint32_t height, uint8_t ae_mode, uint32_t mem_pos);

void * getImageDoubleExposition(uint32_t *size, uint32_t x_start, uint32_t y_start,uint32_t width, uint32_t height, uint32_t mem_pos, uint8_t apaga_lasers, uint8_t ae_mode);


uint8_t isLasersOn();
void flashOn();
void flashOff();
void lasersOn(uint32_t potencia);
void lasersOff();

void reload_camera_windows(void);

#endif /* SM_CAMERA_H_ */
