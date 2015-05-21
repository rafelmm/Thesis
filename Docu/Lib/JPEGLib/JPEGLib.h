/*
 * JPEGLib.h
 *
 *  Created on: 05/09/2014
 *      Author: miquel
 */

#ifndef JPEGLIB_H_
#define JPEGLIB_H_

#include "Huffman.h"

#define ALLOC_BLOCK_SIZE HUFFMAN_ALLOC_SIZE

void JPEGLib_init(void *(*memAllocFunc)(void), void (*memFreeFunc)(void*));



#endif /* JPEGLIB_H_ */
