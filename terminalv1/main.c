//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotográfico		  	  //
//----------------------------------------------------------------//

#include <m8c.h>        		// part specific constants and macros
#include "PSoCAPI.h"    		// PSoC API definitions for all User Modules
#include "stdlib.h"
#include "terminal.h"			// Libreria creada por Albert y Xavi para el proyecto
#include "comunicaciones.h" 	// Libreria de comunicaciones creada por Albert y Xavi para el proyecto

void main()
{	char x;
	int xx;

//- Inicializacion de parametros basicos del sistema al encender	
	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	Timer8_WriteCompareValue(156/2);
	Timer8_Start();
	
	LCD_Start();
	LCD_Init();

	UART_Start(UART_PARITY_NONE);
	PRT0DR=0xA0;	// Conectem las resistencias de pull-up

//- Inicializacion de parametros modificables al encender
	PRT0DR=PRT0DR & 0xE1;	//Apago la alrma del Buzzer, Realimentacion de LCD, Led de alimentacion y la pata de reset
							//Aprovechamos para conectar las resistencias de pull-up
	
	
	for (;;) Principal();		//Programa principal del PSoC terminal del PhotoSOC
		
		
		/* Elementos de testeo o para utilizar
		
		- implementar como realimentacion del LCD
		PRT2DR=PRT2DR | 0x80;		//reali del LCD
		
		- Comprovacion de comunicacion con UART y que lo muestre por el LCD
		UART_CPutString("");	//Para cadenas de carateres 
		UART_PutChar();			//Para valores tipo char
		x=UART_cGetChar();  //Esta se espera a que llegue un byte. Ver tambien UART_cReadChar()
		LCD_WriteData(x);
		
		- Saber si ha llegado a cierto punto
		LCD_Control(0x01);
		LCD_PrCString("prueba");
		for(x=0;x<50000;x++);
		
		- Detectar cierto numero y que lo muestre por el LCD		
		LCD_Control(0x01);
		LCD_WriteData(+48);
		for(x=0;x<50000;x++);
		*/		
}
