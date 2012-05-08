//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotográfico		  	  //
//----------------------------------------------------------------//

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "stdlib.h"
#include "comunicaciones.h"	// Libreria creada por Albert y Xavi para el proyecto


void main()
{	

unsigned char prueba1,prueba2,prueba3;

//- Inicializacion de parametros basicos del sistema al encender	
	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	Timer8_WriteCompareValue(156/2);
	Timer8_Start();
	
	UART_Start(UART_PARITY_NONE);
	

// Envio de datos

	prueba1=50;
	prueba2=58;
	prueba3=62;
	
	envia(prueba1);
	envia(prueba2);
	envia(prueba3);
	
}
