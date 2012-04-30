//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotográfico		  	  //
//----------------------------------------------------------------//

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "stdlib.h"
#include "terminal.h"	// Libreria creada por Albert y Xavi para el proyecto

void main()
{	char x,xx;
	
	//Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	//Timer8_WriteCompareValue(156/2);
	//Timer8_Start();
	LCD_Start();
	LCD_Init();
	
	LCD_PrCString("PHOTOSoC V0");
	//UART_Start(UART_PARITY_NONE);
	LCD_Position (1,0);
	
	
	
	
	
	
	
	//for(;;)
	//{ x=UART_cGetChar();  //Esta se espera a que llegue un byte. Ver tambien UART_cReadChar()
	//  LCD_WriteData(x);
	//}
	PRT0DR=PRT0DR|0x20;
	for (;;)
	{
	while((PRT0DR & 0x20)==0x20);
	PRT0DR=PRT0DR|0x20;
	for(xx=0;xx<100;xx++);
	while((PRT0DR & 0x20)==0x00)	PRT0DR=PRT0DR|0x20;
	for(xx=0;xx<100;xx++);				
	LCD_PrCString("Boton rojo");
	}
}
