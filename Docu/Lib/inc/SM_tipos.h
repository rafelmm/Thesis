
#ifndef SM_TIPOS_H_
#define SM_TIPOS_H_

typedef enum modoSOC{SNAPSHOT = 2, ACTIVIDAD = 0, CONTINUO = 1, NORMALOPERATION = 3} modoSOC_t;

typedef struct {
	uint32_t x;
	uint32_t y;
	uint32_t width;
	uint32_t height;
}window_t;

#define IS_WINDOW_EQUAL(win1, win2) (win1.x==win2.x && win1.y==win2.y && win1.width==win2.width && win1.height==win2.height)

#define MAX(a,b)   (a > b ? a : b)

#define MIN(a,b)  (a < b ? a : b)


#define CONVCORR 0.732601/100   //conversion a corriente para sensor ACS712 de 2


#define POSICION_MOTOR_DESCONOCIDA 		 2
#define POSICION_MOTOR_BARRAS_FUERA 	 0
#define POSICION_MOTOR_BARRAS_DENTRO 	 1


#endif
