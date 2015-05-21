/*
 * Huffman.c
 *
 *  Created on: 05/09/2014
 *      Author: miquel,ezio
 */

#include "Huffman.h"


/************************************************************************************//**
* \fn void getCategory (int a)
* \brief Devuelve el numero de bits necesarios para representar a
*
* \param a entero del que se quiere representar
****************************************************************************************/
int getCategory(int a)
{
  if(a==0)
	return 0;
  else if(abs(a)<=1)
	return 1;
  else if(abs(a)<=3)
	return 2;
  else if(abs(a)<=7)
	return 3;
  else if(abs(a)<=15)
	return 4;
  else if(abs(a)<=31)
	return 5;
  else if(abs(a)<=63)
	return 6;
  else if(abs(a)<=127)
	return 7;
  else if(abs(a)<=255)
	return 8;
  else if(abs(a)<=511)
	return 9;
  else if(abs(a)<=1023)
	return 10;
  else if(abs(a)<=2047)
	return 11;
  else if(abs(a)<=4095)
	return 12;
  else if(abs(a)<=8191)
	return 13;
  else if(abs(a)<=16383)
	return 14;
  else
	return 15;
}

/************************************************************************************//**
* \fn void generate_code_generic (	TREE root,
* 									int value,
* 									unsigned char* code,
* 									int output_index,
* 									const unsigned int *bin_code_table,
* 									const int *codeLen_table)
* \brief Genera el codigo huffman
*
* Genera el codigo huffman a partir del arbol de codifiacion y las tablas de codigos
* \param root 			Raiz del arbol
* \param value 			valor a codificar
* \param code			buffer de salida
* \param output_index 	indice del buffer de salida (en bits)
* \param bin_code_table	Tabla de codigos de codificacion
* \param codelen_table	tabla de logitud de codigos
****************************************************************************************/
int generate_code_generic(int value,unsigned char* code, int output_index,const unsigned int *bin_code_table,const unsigned char *codeLen_table){
	int i,j;

	//obtenemos el numero de bits necesarios para codificar el valor
	int category = getCategory(value);

	//obtenemos el codigo huffman para este numero de bits
	unsigned int huff_code = bin_code_table[category];

	unsigned int word_to_copy = (huff_code << category) | ((~(0xFFFFFFFF<<category)) &(value>0 ? value : value+   ((int)0x00000001<<category) -1     ));

	//word to copy contiene los datos a copiar en el output
	word_to_copy <<= 32 - codeLen_table[category] -(output_index%8);


	//Hem de girar el bytes si es una maquina litle endian
	#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
		word_to_copy = __builtin_bswap32(word_to_copy);
	#endif

	unsigned char *word_pointer = (char *)&word_to_copy;
	for (j = output_index; j< output_index + codeLen_table[category]; j++ ){
		code[(j)>>3] &= ~(0x80>>((j)%8)); //borram el bit corresponent
		code[(j)>>3] |= (0x80>>((j)%8)) & word_pointer[   ((j)>>3)-(output_index>>3)  ];
		if ((code[(j)>>3] == 0xFF) && (j%8 == 7)){ // si hemos escrito 0xFF, debemos poner un "stuff byte" 0x00
			output_index += 8;
			j+=8;
			code[(j>>3)] = 0x00;
		}
	}
	output_index +=codeLen_table[category];

	return output_index;
}

/************************************************************************************//**
* \fn void generate_AC_code (		int values,
* 									unsigned char* code,
* 									int output_index,
* 									const unsigned int *bin_code_table,
* 									const int *codeLen_table)
* \brief Genera el codigo huffman
*
* Genera los codigos huffman del componente AC de una matriz 8x8 a partir del arbol de codifiacion y las tablas de codigos
* \param value 			valor a codificar
* \param code			buffer de salida
* \param output_index 	indice del buffer de salida (en bits)
* \param bin_AC_code	Tabla de codigos de codificacion
* \param ENCODING_AC_codeLen	tabla de logitud de codigos
****************************************************************************************/
int generate_AC_code(int values[64*2] ,unsigned char* code, int output_index,const unsigned int bin_AC_code[16][11],const unsigned char ENCODING_AC_codeLen[16][11]){
	int i,j;

	for (i = 1; i< 64*2; i+=2){
		output_index = generate_code_generic(values[i+1],code,output_index,bin_AC_code[values[i]],ENCODING_AC_codeLen[values[i]]);
		//els valors 0,0 indiquen que no hi ha mes dades
		if (values[i] == 0 && values[i+1] == 0) break;

	}
	return output_index;
}


/************************************************************************************//**
* \fn void generate_DC_code (		int values,
* 									unsigned char* code,
* 									int output_index,
* 									const unsigned int *bin_code_table,
* 									const int *codeLen_table)
* \brief Genera el codigo huffman
*
* Genera los codigos huffman del componente DC de una matriz 8x8 a partir del arbol de codifiacion y las tablas de codigos
* \param value 			valor a codificar
* \param code			buffer de salida
* \param output_index 	indice del buffer de salida (en bits)
* \param bin_DC_code	Tabla de codigos de codificacion
* \param ENCODING_DC_codeLen	tabla de logitud de codigos
****************************************************************************************/
int generate_DC_code(int values[64] ,unsigned char* code, int output_index,const unsigned int * bin_DC_code,const unsigned char * ENCODING_DC_codeLen){

	return generate_code_generic(values[0],code,output_index,bin_DC_code,ENCODING_DC_codeLen);
}




/************************************************************************************//**
* \fn void encode8x8 (	int *img_data ,
* 					char * code,
* 					char encoding_type)
* \brief Genera la codificacion huffman de una imagen
*
* Genera la codificacion huffman de una imagen
* \param code			buffer de salida
* \param encoding_type 	Tipo de codificacion:; ENCODING_LUMA, ENCODING_CHROMA
****************************************************************************************/

int encode_8x8(int *img_data , unsigned char * code, char encoding_type, int bit_offset){


	const char *(*ENCODING_AC_code)[11];
	const unsigned char (*ENCODING_AC_codeLen)[11];
	const unsigned int (*bin_AC_code)[11];
	const char ** ENCODING_DC_code;
	const unsigned char * ENCODING_DC_codeLen;
	const unsigned int *bin_DC_code;

	if (encoding_type == ENCODING_LUMA){
		ENCODING_AC_code = ENCODING_AC_code_Luma;
		ENCODING_AC_codeLen = ENCODING_AC_codeLen_Luma;
		bin_AC_code = bin_AC_code_Luma;
		ENCODING_DC_code = ENCODING_DC_code_Luma;
		ENCODING_DC_codeLen = ENCODING_DC_codeLen_Luma;
		bin_DC_code = bin_DC_code_Luma;
	} else if (encoding_type == ENCODING_CHROMA){
		ENCODING_AC_code = ENCODING_AC_code_Chroma;
		ENCODING_AC_codeLen = ENCODING_AC_codeLen_Chroma;
		bin_AC_code = bin_AC_code_Chroma;
		ENCODING_DC_code = ENCODING_DC_code_Chroma;
		ENCODING_DC_codeLen = ENCODING_DC_codeLen_Chroma;
		bin_DC_code = bin_DC_code_Chroma;

	}


	int total_bits = bit_offset;

	total_bits = generate_DC_code(img_data,code,total_bits,bin_DC_code,ENCODING_DC_codeLen);

	total_bits = generate_AC_code(img_data,code,total_bits,bin_AC_code,ENCODING_AC_codeLen);




	return total_bits;

}

