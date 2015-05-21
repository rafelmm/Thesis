/*
 * SM_senda.h
 *
 *  Created on: 05/02/2015
 *      Author: rafel
 */

#ifndef SM_IMAGE_H_
#define SM_IMAGE_H_
#include "ch.h"
#include "SM_camera.h"

typedef enum estadosMemoria {DISPONIBLE, CAPTURANDO, PROCESANDO, READY} estadosMemoria_t;
typedef struct{
	uint8_t*  			img;
	estadosMemoria_t 	estado;
}memoriaImagen_t;

typedef struct {
	uint8_t* data;
	uint32_t size;
	uint32_t width;
	uint32_t height;
}sm_image_t;

typedef struct{
	uint8_t r;
	uint8_t g;
	uint8_t b;
}sm_rgb_t;

typedef struct{
	uint8_t y;
	uint8_t cb;
	uint8_t cr;
}sm_ycbcr_t;

typedef struct{
	uint32_t x;
	uint32_t y;
}sm_point_t;

//#define COLOR_GREEN (sm_ycbcr_t){171,110,121} //Original
#define COLOR_GREEN (sm_ycbcr_t){100,100,100} //De momento gris por que los colores no funcionan bien en la compresión JPG

//#define COLOR_BLUE (sm_ycbcr_t){143,155,123} //Original
#define COLOR_BLUE (sm_ycbcr_t){80,220,110} //Tuneado

#define COLOR_GRAY (sm_ycbcr_t){160,128,128}

typedef enum tiposImage { BIG = 0, SMALL = 1 } tipoImage_t;
typedef struct {
	tipoImage_t tipo_imagen;
	uint8_t con_realidad_aumentada;
	uint8_t con_calculo_holgura;
	uint8_t con_laser;
	uint8_t con_flash;
	uint8_t aplicar_correccion;
	uint8_t posicion_motor;
	uint8_t modo_continuo;
	float holgura;
	sm_image_t imagen;
	uint8_t comprimida;
} calculaHolguraRequest;

void initGetDatosHolgura(void);
void sm_actualizar_posicion_barra_abajo(uint8_t nueva_posicion);
void sm_actualizar_angulo_martillo_1(float value);
void sm_actualizar_angulo_martillo_2(float value);
void sm_actualizar_CDX(float value);
void sm_actualizar_holgura_max_1(float value);
void sm_actualizar_holgura_max_2(float value);
void sm_actualizar_size_pixel(float value);

void calcular_holgura(uint8_t* imagen, uint8_t aplicar_correccion, uint8_t con_realidad_aumentada, uint8_t *posicion_motor, float *holgura);
void calcular_holgura_continuo(uint8_t* imagen, uint8_t *posicion_motor, float *holgura);
sm_image_t getImage(uint8_t con_flash, uint8_t con_laser, uint8_t con_realidad_aumentada, tipoImage_t tipo_imagen, uint8_t comprimida);
sm_image_t getHolgura(uint8_t aplicar_correccion, uint8_t modo_continuo, float *holgura, uint8_t *posicion_motor, uint8_t send_image, uint8_t con_realidad_aumentada, uint8_t comprimida);

void sm_getWindows(uint8_t *img_in, uint32_t in_width, uint8_t* img_out, uint32_t bytes_ventana, uint32_t offset_ventanas);
void sm_getWindow(uint8_t *_img_in, uint32_t in_width, uint8_t *img_out, window_t v, uint32_t offset_ventana);

void sm_im2gray(uint32_t *size, uint32_t width, uint32_t height, uint8_t* img);
void sm_imhist(uint32_t *hist, uint32_t width, uint32_t height, uint8_t* img);
uint8_t sm_otsuLevel(uint32_t width, uint32_t height, uint8_t* img);
void sm_binarization(uint8_t level, uint32_t width, uint32_t height, uint8_t* img);

void sm_imfilter(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out);

void sm_erode(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out);
void sm_dilate(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out);
void sm_close(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out, uint8_t *memoria_procesado);
void sm_open(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out, uint8_t *memoria_procesado);

#define MAX_LABELS 500
void sm_rename_labels(int16_t* _img_in,
					  uint32_t width_in,
					  uint32_t height_in,
					  uint32_t* width_out,
					  uint32_t* height_out,
					  int16_t* correspondencias,
					  uint32_t num_labels,
					  uint32_t area_labels[],
					  int16_t *background_label);

void sm_labelImage(uint32_t width_in, uint32_t height_in, uint8_t *_img_in, uint32_t *width_out, uint32_t *height_out, uint8_t *_img_out, uint32_t *num_labels, int16_t *background_label, uint32_t labels_area[]);

void sm_filter_by_zone(uint32_t width,
					   uint32_t height,
					   uint8_t *_img,
					   uint32_t num_labels,
					   int16_t background_label,
					   uint32_t labels_area[],
					   int16_t* label_left,
					   int16_t*  label_right);
float sm_distancia(int32_t p0[], int32_t p1[], float angulo_martillo);
float sm_buscar_pendiente(int16_t *_v1, int16_t *_v2, uint32_t win_width, uint32_t win_height, int16_t label_1, int16_t label_2, uint32_t window_hdistance);

int8_t sm_get_posicion_martillo(uint8_t ventana_con_linea[]);
uint8_t sm_calcula_holgura(int16_t *_ventana_final_martillo,
						   int16_t* _ventana_holgura,
						   uint32_t win_width,
						   uint32_t win_height,
						   int16_t label_final_martillo,
						   int16_t label_inicio_martillo,
						   int16_t label_holgura,
						   uint32_t distancia_ventanas,
						   uint8_t martillo_valido,
						   uint32_t *pixels_martillo,
						   float angulo_martillo,
						   uint32_t areas_final_martillo[],
						   uint32_t areas_holguras[],
						   uint8_t aplicar_correccion,
						   float m_laser,
						   float holgura_max,
						   float *holgura,
						   uint32_t final_martillo[],
						   uint32_t inicio_martillo[],
						   uint32_t final_holgura[]);

uint8_t sm_calcula_holgura_continuo(int16_t* ventana_holgura,
									uint32_t win_width,
									uint32_t win_height,
									int16_t label_martillo,
									int16_t label_holgura,
									uint32_t pixels_martillo,
									float angulo_martillo,
									uint32_t areas_holguras[],
									uint8_t aplicar_correccion,
									float m_laser,
									float holgura_max,
									float *holgura);

float sm_calibracion_geometria(float holgura_real, float holgura_calculada);
sm_ycbcr_t sm_rgb2ycbcr(sm_rgb_t color);
void sm_set_pixel_color(sm_image_t img, uint32_t x, uint32_t y, sm_ycbcr_t color);
void sm_plot_windows(sm_image_t img, sm_ycbcr_t color);
void sm_plot_window(sm_image_t img, window_t win, sm_ycbcr_t color);
void sm_plot_linea(sm_image_t img, uint32_t xini, uint32_t xfin, float m, float b, sm_ycbcr_t color);
void sm_plot_linea_h(sm_image_t img, uint32_t y, uint32_t x1, uint32_t x2, sm_ycbcr_t color);
void sm_plot_linea_v(sm_image_t img, uint32_t x, uint32_t y1, uint32_t y2, sm_ycbcr_t color);

#endif /* SM_IMAGE_H_ */
