//----------------------------------------------------------------------------
// PSoC de trabajo del proyecto PhotoSOC
// 
// TxD en P1.4 y RxD en P1.6.  19200 baudios sin paridad
//----------------------------------------------------------------------------

#include <m8c.h>        		// part specific constants and macros
#include "PSoCAPI.h"   	 		// PSoC API definitions for all User Modules
#include "stdlib.h"
#include "trabajo.h"			// Libreria creada por Albert y Xavi para el proyecto
#include "comunicaciones.h" 	// Libreria de comunicaciones creada por Albert y Xavi para el proyecto

void main()
{	
	Inicializacion ()
	
	//falta activar las diferentes entradas 
	// y variables
	
	for(;;) Inicio();
}		
	
	//Posibles utiles del PSoC de trabajo
	/*
		
		x=UART_cGetChar();  //Esta se espera a que llegue un byte. 
		Ver tambien UART_cReadChar()
	
		PRT0DR=PRT0DR | 0x40;
		for(num=0;num<20000;num++);
		PRT0DR=PRT0DR & 0xBF;
		for(;;);
	*/
