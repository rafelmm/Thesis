#ifndef SM_SRAM_H_INCLUDED
#define SM_SRAM_H_INCLUDED

#include "ch.h"
#include "hal.h"

#define Bank1_SRAM2_ADDR  ((uint32_t)0x60000000)
#define Bank1_SRAM2_END   ((uint32_t)0x607FFFFF)//64Mbits de memoria

#define Size_Block 		873812 // 1/3 de la memoria reservada para una imagen
#define Dest_Image_1 	((uint32_t)0x60000000)
#define Dest_Image_2	((uint32_t)0x60280000)
#define Dest_Image_3	((uint32_t)0x60500000)
#define Dest_JPEG  		((uint32_t)0x60280000)


void SM_initMem(void);
//void testmem(void);


#endif
