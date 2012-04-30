//----------------------------------------------------------------------------
// Envia una serie de caracteres por el canal serie cuando iniciamos el programa
// Luego visualiza por el LCD los caracteres que nos llegan
// TxD en P1.4 y RxD en P1.6.  19200 baudios sin paridad
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "stdlib.h"

void main()
{	char x;
	int num;
	char a[10];
	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	Timer8_WriteCompareValue(156/2);
	Timer8_Start();
	LCD_Start();
	LCD_Init();
	LCD_PrCString("UART");
	UART_Start(UART_PARITY_NONE);
	for (x='A';x<'Z';x++) 
	{	UART_CPutString("La x vale ");
		UART_PutChar(x);
		itoa(a,x,10);
		UART_CPutString(" y en numero es ");		
		UART_PutString(a);
		UART_CPutString("\r\n");
	}
	LCD_Position(1,0);
	for(;;)
	{ x=UART_cGetChar();  //Esta se espera a que llegue un byte. Ver tambien UART_cReadChar()
	  LCD_WriteData(x);
	
	}
	
	
	
	
}
