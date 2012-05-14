//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotográfico		  	  //
//----------------------------------------------------------------//
//              Programa principal del PSoC terminal			  //
//----------------------------------------------------------------//

#include <m8c.h>        		// part specific constants and macros
#include "PSoCAPI.h"    		// PSoC API definitions for all User Modules
#include "stdlib.h"
#include "terminal.h"			// Libreria creada por Albert y Xavi para el proyecto

void main()
{	
	Inicializacion();			//Rutina de inicialización de los perifericos
	Bienvenida();				//Rutina que muestra el mensaje de bienvenida
	for (;;) Principal();		//Programa principal del PSoC terminal del PhotoSOC
}
