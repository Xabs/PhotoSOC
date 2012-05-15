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

#pragma interrupt_handler MI_RSI_EXTERNA
#pragma interrupt_handler MI_RSI_DEL_TIMER

void MI_RSI_EXTERNA(void)		//Interrupción externa
{
	PRT0DR=PRT0DR|0x01; //0000-0001
	for (tempo=0;tempo<5000;tempo++) ;
	PRT0DR=PRT0DR&0xFE;
	
	//disparo_sensores();
}

void MI_RSI_DEL_TIMER (void)	//Interrupción del timer Segundos
{
	contador_trabajo1++;
	if (contador_trabajo1==tpCam1) chivato1=on;
	contador_trabajo2++;
	if (contador_trabajo2==tpCam2) chivato2=on;
}


void main()						//Programa principal
{	
	inicializacion ();
	recibe_valores();
	activar_sensores();	
	
	
	
	ejecucion();
	envia_fintrabajo();
}		
