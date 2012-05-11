//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotográfico		  	  //
//----------------------------------------------------------------//
//              Programa principal del PSoC de trabajo			  //
//----------------------------------------------------------------//


#include <m8c.h>        		// part specific constants and macros
#include "PSoCAPI.h"   	 		// PSoC API definitions for all User Modules
#include "stdlib.h"
#include "trabajo.h"			// Libreria creada para el PSoc de trabajo por Albert y Xavi para el proyecto
#include "comunicaciones.h" 	// Libreria de comunicaciones creada por Albert y Xavi para el proyecto


#pragma interrupt_handler MI_RSI_EXTERNA


void MI_RSI_EXTERNA(void)		//Interrupción externa
{
	disparo_sensores();
}


void main()						//Programa principal
{	
	inicializacion ();
	recibe_valores();	
	ejecucion();
}		

