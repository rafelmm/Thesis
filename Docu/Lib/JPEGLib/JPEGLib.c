/*
 * JPEGLib.c
 *
 *  Created on: 05/09/2014
 *      Author: miquel
 */


#include <math.h>
#include <string.h>


#include <stdio.h>
#include <stdlib.h>
#include "JPEGLib.h"
#include "JPEG_Encoder.h"


#include "Huffman.h"

#include "main.h"

/************************************************************************************//**
* \fn void JPEGLib_init(	void *(*alloc)(void),
*							void (*free)(void))
* \brief JPEGLib init function
*
* Inicializa la libreria JPEG. Se encarga de obtener las funciones de reserva y libracion de memoria que
* usara la libreria (malloc/free) durante la codificacion Huffman
* \param idmov 	ID de movimiento
****************************************************************************************/
void JPEGLib_init(void *(*memAllocFunc)(void), void (*memFreeFunc)(void*)){

}






int RLE(int ZZ[64],int RL[64*2])
{
  int rl=1;
  int i=1;
  int num_zeros = 0;

  //copiam el primer caracter (DC value)
  RL[0] = ZZ[0];


  while(i<64) {
      	  num_zeros=0;

		  while((i<64)&&(ZZ[i]==0)&&(num_zeros<15)) {
			  i++;
			  num_zeros++;
		  }

		  if(i==64) {
			  //"EOB"
			  RL[rl++] = 0;
			  RL[rl++] = 0;

		 } else {
			  RL[rl++] = num_zeros;  //Num zeros
			  RL[rl++] = ZZ[i++];	// AC value
		 }
 }

  if((!(RL[rl-1]==0) && RL[rl-2]==0))
    {
      RL[rl++] = 0;
      RL[rl++] = 0;
    }

  if((RL[rl-4]==15)&&(RL[rl-3]==0))
    {
      RL[rl-4]=0;
      rl-=2;
    }
  return rl;
}

void quitaquinces(int matrix[64*2]){
int i,indice;
int continuar = 1;
	for (i = 1; i<(64*2-1) && continuar; i+=2){
		if (matrix[i] == 0 && matrix[i+1] == 0){
			continuar = 0;
			indice = i;
		}
	}
	if (continuar == 0){
		for (i = indice;i>=1; i-=2){
			if (matrix[i] == 15 && matrix[i+1]== 0){
				matrix[i] = 0;
			} else if ( matrix[i] != 0 || matrix[i+1] != 0){
				break;
			}
		}
	}
}

int actualiza_dc(int * dest4,int dc_anterior){
	int dc_actual = *dest4;
	*dest4 = dc_actual -dc_anterior;
	return dc_actual;
}

//http://www.daevius.com/information-jpeg-file-format
int genera_header(const char Quantization_Table_l[8][8],const char Quantization_Table_c[8][8],int height, int width, char * dst){

	int index = 0;
	//Escribimos el magic word
	dst[index++] = 0xFF;
	dst[index++] = 0xD8;

	//APP0
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xE0;

	//segment lengh
	dst[index++] = 0x00;
	dst[index++] = 0x10;

	//reads jFIF
	dst[index++] = 0x4A;
	dst[index++] = 0x46;
	dst[index++] = 0x49;
	dst[index++] = 0x46;
	dst[index++] = 0x00;

	//version
	dst[index++] = 0x01;
	dst[index++] = 0x01;

	//no density units
	dst[index++] = 0x00;

	//scaling 100% X
	dst[index++] = 0x00;
	dst[index++] = 0x01;

	//scaling 100% Y
	dst[index++] = 0x00;
	dst[index++] = 0x01;

	//no thumbnail
	dst[index++] = 0x00;
	dst[index++] = 0x00;


	//QUANTIZATION
	//luma table
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xDB;

	//segment lengh
	dst[index++] = 0x00;
	dst[index++] = 0x43;

	//table id
	dst[index++] = 0x00;

	//quantization_table
	memcpy(dst+index,Quantization_Table_l,64);
	index += 64;

	//chroma table
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xDB;

	//segment lengh
	dst[index++] = 0x00;
	dst[index++] = 0x43;

	//table id
	dst[index++] = 0x01;

	//quantization_table
	memcpy(dst+index,Quantization_Table_c,64);
	index += 64;

	//Start Of Frame
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xC0;

	//segment lengh
	dst[index++] = 0x00;
	dst[index++] = 0x11;

	//precision
	dst[index++] = 0x08;

	//height
	dst[index++] =  (height>>8)&0xFF;
	dst[index++] = (height)&0xFF;

	//width
	dst[index++] =  (width>>8)&0xFF;
	dst[index++] = (width)&0xFF;

	//component count
	//aqui habra que poner 3
	dst[index++] = 0x03;

	//components
	dst[index++] = 0x01; //Component 1 luminance
	dst[index++] = 0x21; //1x1 sample (no subsampling)
	dst[index++] = 0x00; //quantization tabl eid

	//components
	dst[index++] = 0x02; //Component 1 luminance
	dst[index++] = 0x11; //2x1 sample (Horizontal subsampling)
	dst[index++] = 0x01; //quantization tabl eid

	//components
	dst[index++] = 0x03; //Component 1 luminance
	dst[index++] = 0x11; //2x1 sample (Horizontal subsampling)
	dst[index++] = 0x01; //quantization tabl eid

	//Huffman TABLES DC Luma
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xC4;

	//segment lenght
	dst[index++] = 0x00;
	dst[index++] = 0x1F;

	//Insignificant four bits denote the table ID, the 5th bit is true for AC and false for DC
	dst[index++] = 0x00;

	//16 values for the bits lengh
	//arbol DC Luma
	memcpy(dst+index,DC_tree_Luma,16);
	index += 16;

	//valores del arbol DC Luma
	memcpy(dst+index,DC_values_Luma,12);
	index += 12;


	//Huffman TABLES AC LUMA
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xC4;

	//segment lenght
	dst[index++] = 0x00;
	dst[index++] = 0xB5;

	//Insignificant four bits denote the table ID, the 5th bit is true for AC and false for DC
	dst[index++] = 0x10;

	int i,j;
	unsigned char result[17];
	memset(result,0,sizeof(unsigned char)*17);
	for(i = 0; i < 16; i++){
		for (j = 0; j < 11; j++){
			result[strlen(ENCODING_AC_code_Luma[i][j])]++;
		}
	}
	//eliminamos los valores repetidos que contienen 'n'
	result[1]=0;

	memcpy(dst+index,result+1,16);
	index += 16;


	//AC_code : indice de los codigos en la lista de hojas
	memcpy(dst+index,AC_tree_values_Luma,162);
	index +=162;

	//Huffman TABLES DC Chroma
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xC4;

	//segment lenght
	dst[index++] = 0x00;
	dst[index++] = 0x1F;

	//Insignificant four bits denote the table ID, the 5th bit is true for AC and false for DC
	dst[index++] = 0x01;

	//16 values for the bits lengh

	memcpy(dst+index,DC_tree_Chroma,16);
	index+=16;


	memcpy(dst+index,DC_values_Chroma,12);
	index += 12;


	//Huffman TABLES AC CHROMA
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xC4;

	//segment lenght
	dst[index++] = 0x00;
	dst[index++] = 0xB5;

	//Insignificant four bits denote the table ID, the 5th bit is true for AC and false for DC
	dst[index++] = 0x11;


	memset(result,0,sizeof(unsigned char)*17);
	for(i = 0; i < 16; i++){
		for (j = 0; j < 11; j++){
			result[strlen(ENCODING_AC_code_Chroma[i][j])]++;
		}
	}
	//eliminamos los valores repetidos que contienen 'n'
	result[1]=0;

	memcpy(dst+index,result+1,16);
	index += 16;


	//AC_code : indice de los codigos en la lista de hojas
	memcpy(dst+index,AC_tree_values_Chroma,162);
	index +=162;
	return index;

}


int genera_scan(int index,char * dst,unsigned char component)
{
	//Start of scan
	//marker
	dst[index++] = 0xFF;
	dst[index++] = 0xDA;

	//segment lenght
	dst[index++] = 0x00;
	dst[index++] = 0x08;

	//num color components
	dst[index++] = 0x01;

	//component 1 huffman table id
	dst[index++] = component+1;
	dst[index++] = huffman_table_index[component];

	//skippeing three bytes
	dst[index++] = 0x00;
	dst[index++] = 0x3F;
	dst[index++] = 0x00;
	return index;

}

char *comment= "SM armSOC v";


int genera_eof(int index,char * dst)
{
	//marcador COM
	dst[index++] = 0xFF;
	dst[index++] = 0xFE;

	//longitud del COMMENT
	unsigned int len = strlen(comment)+2+4;
	dst[index++] = (len>>8)&0xFF;
	dst[index++] = len&0xFF;

	memcpy(&(dst[index]),comment,strlen(comment));
	index +=strlen(comment);

	dst[index++] = (VERSION/100)+'0';
	dst[index++] = ((VERSION) - ((int)VERSION/100)*100)/10 +'0';
	dst[index++] = '.';
	dst[index++] = (VERSION % 10)+'0';

	dst[index++] = 0xFF;
	dst[index++] = 0xD9;
	return index;

}

//funcion que realiza la DCT, la quantizacion y el RLE de una imagen

char QT_UNZIGZAG[8][8];
int source_dct[8][8];

int source[8][8];

int source_zigzag[64];
int source_rle[64*2];

int compressor (int h_size,int v_size, unsigned char* memblock,const  char Quantization_Table[8][8], unsigned char component_sample_rate,unsigned char component_offset, unsigned char bytes_por_pixel, unsigned char *outp, int encoding){

	int i,j,k,l;
	int dc_anterior = 0;
	int numbits = 0;



	//calculamos el unzigzag de la matriz de quantizacion, para aplicarlo en la cofificacion (en el header esta al reves)

	UndoZigZagQuant(QT_UNZIGZAG,Quantization_Table);

	  /*memblockArray[VERTICAL][HORIZONTAL]*/
	unsigned char (*memblockArray)[h_size*bytes_por_pixel] = (unsigned char (*)[h_size*bytes_por_pixel]) memblock;

	//recorremos todos los bloques de 8x8 de luminancia
	  for (i = 0; i <v_size; i+=8){
	    for (j = 0; j<h_size/(component_sample_rate/bytes_por_pixel);j+=8){



	      for (k = 0; k < 8; k++){
			  for (l = 0; l<8; l++){
				 //copiamos los datos necesarios para comprimir el canal correcto, y de paso
				  // pasamos los datos de rango (0..255) a (-127,128)

				  //@TODO: leer chars para reducir el tiempo de acceso a la memoria
				   source[k][l] =  (int)memblockArray[i+k][(j+l)*component_sample_rate+component_offset] + SHIFT_8_BIT_IMAGE;
			  }
	      }

		//Aplicamos la DCT

		dct(source,source_dct);

		//quantizamos y zigzaqueamos a la vez para ahorrar tiempo


		ZigZagAndQuantize(source_dct,source_zigzag,QT_UNZIGZAG);



		memset(source_rle,0x00,64*2*sizeof(int)); //inicializamos a cero porque si no, a veces, no se encuentra el final

		RLE(source_zigzag,source_rle);
		quitaquinces(source_rle);
		dc_anterior = actualiza_dc(source_rle,dc_anterior);


		numbits = encode_8x8(source_rle,outp,encoding,numbits);


	    }
	  }


	return ceil((float)numbits/8.0);
}


int comprimeYCbCr( int image_width,int image_height, void *img_src, unsigned char * dst){


	#define IMAGE_WIDTH 32
	#define IMAGE_HEIGH 8

	/*int source[IMAGE_WIDTH][IMAGE_HEIGH] =
	{
		{ 52, 55, 61,  66,  70,  61, 64, 73 },
		{ 63, 59, 55,  90, 109,  85, 69, 72 },
		{ 62, 59, 68, 113, 144, 104, 66, 73 },
		{ 63, 58, 71, 122, 154, 106, 70, 69 },
		{ 67, 61, 68, 104, 126,  88, 68, 70 },
		{ 79, 65, 60,  70,  77,  68, 58, 75 },
		{ 85, 71, 64,  59,  55,  61, 65, 83 },
		{ 87, 79, 69,  68,  65,  76, 78, 94 }
	};*/

	/*unsigned char source[IMAGE_WIDTH*IMAGE_HEIGH] =
	{
		16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,
		16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,
		16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,
		16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,
		16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,
		16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,
		16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,
		16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210 ,16, 210, 146, 210, 16, 210, 146,  210, 16,  210, 146,  210, 16, 210, 146, 210
	};*/


	//ahora pillamos el componente cr

	#define H_SIZE image_width
	#define V_SIZE image_height
	 // #define H_SIZE 640
	  //#define V_SIZE 512
	  //#define H_SIZE 16
	  //#define V_SIZE 8

	  #define LUMA_SAMPLE_RATE		2
	  #define LUMA_OFFSET			1
	  #define CHROMA_BLUE_SAMPLE_RATE	4
	  #define CHROMA_BLUE_OFFSET		0
	  #define CHROMA_RED_SAMPLE_RATE	4
	  #define CHROMA_RED_OFFSET		2
	  #define BYTES_POR_PIXEL		2




	int index = genera_header(Quantization_Table_Luma,Quantization_Table_Chroma,V_SIZE,H_SIZE,dst);

	index = genera_scan(index,dst,COMPONENT_LUMA);
	index += compressor (H_SIZE,V_SIZE,img_src,Quantization_Table_Luma, LUMA_SAMPLE_RATE,LUMA_OFFSET,BYTES_POR_PIXEL,dst+index,ENCODING_LUMA);
	//numbytesY = encode (V_SIZE,H_SIZE/(LUMA_SAMPLE_RATE/BYTES_POR_PIXEL),resultat,outp,ENCODING_LUMA);
	//genera_imagen_mono(Quantization_Table_Luma,V_SIZE,H_SIZE/(LUMA_SAMPLE_RATE/BYTES_POR_PIXEL),outp,numbytes);


	index = genera_scan(index,dst,COMPONENT_CB);
	index += compressor (H_SIZE,V_SIZE,img_src,Quantization_Table_Chroma, CHROMA_BLUE_SAMPLE_RATE,CHROMA_BLUE_OFFSET,BYTES_POR_PIXEL,dst+index,ENCODING_CHROMA);
	//int numbytesCb = encode (V_SIZE,H_SIZE/(CHROMA_BLUE_SAMPLE_RATE/BYTES_POR_PIXEL),resultat,outp+numbytesY,ENCODING_CHROMA);
	//genera_imagen_mono(Quantization_Table_Luma,V_SIZE,H_SIZE/(CHROMA_BLUE_SAMPLE_RATE/BYTES_POR_PIXEL),outp,numbytes);

	index = genera_scan(index,dst,COMPONENT_CR);
	index += compressor (H_SIZE,V_SIZE,img_src,Quantization_Table_Chroma, CHROMA_RED_SAMPLE_RATE,CHROMA_RED_OFFSET,BYTES_POR_PIXEL,dst+index,ENCODING_CHROMA);
	//int numbytesCr = encode (V_SIZE,H_SIZE/(CHROMA_RED_SAMPLE_RATE/BYTES_POR_PIXEL),resultat,outp+numbytesY+numbytesCb,ENCODING_CHROMA);
	//genera_imagen_mono(Quantization_Table_Luma,V_SIZE,H_SIZE/(CHROMA_RED_SAMPLE_RATE/BYTES_POR_PIXEL),outp,numbytes);

	index=genera_eof(index,dst);

	return index;

}
