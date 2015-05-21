/*
 * JPEG_Encoder.c
 *
 *  Created on: 05/09/2014
 *      Author: miquel
 */


#include "JPEGLib.h"
#include <math.h>
#include "Huffman.h"





void ZigZag(int QF[8][8],int ZZ[64]){
	int m,n,j,i;
	m = 8;
	for (i = n = 0; i < m * 2; i++){
		for (j = (i < m) ? 0 : i-m+1; j <= i && j < m; j++){
			int array_index = (i&1)? j*(m-1)+i : (i-j)*m+j;
			ZZ[n] = (int)QF[array_index/8][array_index%8] ;
			n++;
		}
	}
}


void ZigZagAndQuantize(int QF[8][8],int ZZ[64], unsigned char QM[8][8]){
	int m,n,j,i;
	m = 8;
	for (i = n = 0; i < m * 2; i++){
		for (j = (i < m) ? 0 : i-m+1; j <= i && j < m; j++){
			int array_index = (i&1)? j*(m-1)+i : (i-j)*m+j;
			ZZ[n] = ((int)QF[array_index/8][array_index%8])/QM[array_index/8][array_index%8] ;
			n++;
		}
	}
}

void UndoZigZagQuant(char QF[8][8],const char ZZ[8][8]){
	int m,n,j,i;
	m = 8;
	for (i = n = 0; i < m * 2; i++){
		for (j = (i < m) ? 0 : i-m+1; j <= i && j < m; j++){
			int array_index = (i&1)? j*(m-1)+i : (i-j)*m+j;
			 QF[array_index/8][array_index%8] = ZZ[n/8][n%8];
			n++;
		}
	}
}


void Quantize(int F[8][8],char QT[8][8])
{
  int i,j;
  for(i=0;i<8;i++){
    for(j=0;j<8;j++){
    		F[i][j] = F[i][j]/QT[i][j];  //creemos que no hay diferencia apreciable entre las dos formas de quantizar
      	 // QF[i][j] = (int)     floor(  ( (F[i][j]/((float) QT[i][j])) + 0.49 )  );
    }
  }
}



void shift(int F[8][8], int value){

	int i,j;
	for(i=0;i<8;i++){
	  for(j=0;j<8;j++) {
	    F[i][j]+= value;
	  }
	}

}



/*
#define C1 cos(M_PI/16)
#define C3 cos(3*M_PI/16)
#define C5 cos(5*M_PI/16)
#define C6 cos(6*M_PI/16)
#define S6 sin(6*M_PI/16)
#define C7 cos(7*M_PI/16)

#define R2 sqrt(2.0)
*/

 #define C1 1004
 #define C3 851
 #define C5 569
 #define C6 392
 #define S6 946
 #define C7 200

 #define R2 181

void dct(int in[8][8], int dct[8][8]) {
    int i;
    int rows[8][8];

    int x0, x1, x2, x3, x4, x5, x6, x7;
    int tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;

    int tmp10, tmp11, tmp12, tmp13;
    int z1, z2, z3, z4, z5;

    /* transform rows */
    for (i = 0; i < 8; i++) {

        x0 = in[i][0];
        x1 = in[i][1];
        x2 = in[i][2];
        x3 = in[i][3];
        x4 = in[i][4];
        x5 = in[i][5];
        x6 = in[i][6];
        x7 = in[i][7];

        tmp0 = x0 + x7;
        tmp7 = x0 - x7;
        tmp1 = x1 + x6;
        tmp6 = x1 - x6;
        tmp2 = x2 + x5;
        tmp5 = x2 - x5;
        tmp3 = x3 + x4;
        tmp4 = x3 - x4;

        tmp10 = tmp0 + tmp3;
        tmp13 = tmp0 - tmp3;
        tmp11 = tmp1 + tmp2;
        tmp12 = tmp1 - tmp2;

        rows[i][0] = tmp10 + tmp11;
        rows[i][4] = tmp10 - tmp11;

        rows[i][2] = (R2 * (tmp12 * C6 + tmp13 * S6)) >> 17;
        rows[i][6] = (R2 * (tmp13 * C6 - tmp12 * S6)) >> 17;

        //ODD PART
        z1 = tmp4 + tmp7;
        z2 = tmp5 + tmp6;
        z3 = tmp4 + tmp6;
        z4 = tmp5 + tmp7;
        z5 = (z3 + z4) * R2 * C3;

        tmp4 = tmp4 * R2 * (-C1 + C3 + C5 - C7);
        tmp5 = tmp5 * R2 * (C1 + C3 - C5 + C7);
        tmp6 = tmp6 * R2 * (C1 + C3 + C5 - C7);
        tmp7 = tmp7 * R2 * (C1 + C3 - C5 - C7);

        z1 = z1 * R2 * (C7 - C3);
        z2 = z2 * R2 * (-C1 - C3);
        z3 = z3 * R2 * (-C3 - C5);
        z4 = z4 * R2 * (C5 - C3);

        z3 += z5;
        z4 += z5;

        rows[i][7] = (tmp4 + z1 + z3) >> 17;
        rows[i][5] = (tmp5 + z2 + z4) >> 17;
        rows[i][3] = (tmp6 + z2 + z3) >> 17;
        rows[i][1] = (tmp7 + z1 + z4) >> 17;


    }

    /* transform columns */
    for (i = 0; i < 8; i++) {

        x0 = rows[0][i];
        x1 = rows[1][i];
        x2 = rows[2][i];
        x3 = rows[3][i];
        x4 = rows[4][i];
        x5 = rows[5][i];
        x6 = rows[6][i];
        x7 = rows[7][i];

        tmp0 = x0 + x7;
        tmp7 = x0 - x7;
        tmp1 = x1 + x6;
        tmp6 = x1 - x6;
        tmp2 = x2 + x5;
        tmp5 = x2 - x5;
        tmp3 = x3 + x4;
        tmp4 = x3 - x4;

        tmp10 = tmp0 + tmp3;
        tmp13 = tmp0 - tmp3;
        tmp11 = tmp1 + tmp2;
        tmp12 = tmp1 - tmp2;

        dct[0][i] = (tmp10 + tmp11) >> 3;
        dct[4][i] = (tmp10 - tmp11) >> 3;

        dct[2][i] = (R2 * (tmp12 * C6 + tmp13 * S6)) >> 20;
        dct[6][i] = (R2 * (tmp13 * C6 - tmp12 * S6)) >> 20;


        //ODD PART
        z1 = tmp4 + tmp7;
        z2 = tmp5 + tmp6;
        z3 = tmp4 + tmp6;
        z4 = tmp5 + tmp7;
        z5 = (z3 + z4) * R2 * C3;

        tmp4 = tmp4 * R2 * (-C1 + C3 + C5 - C7);
        tmp5 = tmp5 * R2 * (C1 + C3 - C5 + C7);
        tmp6 = tmp6 * R2 * (C1 + C3 + C5 - C7);
        tmp7 = tmp7 * R2 * (C1 + C3 - C5 - C7);

        z1 = z1 * R2 * (C7 - C3);
        z2 = z2 * R2 * (-C1 - C3);
        z3 = z3 * R2 * (-C3 - C5);
        z4 = z4 * R2 * (C5 - C3);

        z3 += z5;
        z4 += z5;

        dct[7][i] = (tmp4 + z1 + z3) >> 20;
        dct[5][i] = (tmp5 + z2 + z4) >> 20;
        dct[3][i] = (tmp6 + z2 + z3) >> 20;
        dct[1][i] = (tmp7 + z1 + z4) >> 20;


    }

}

