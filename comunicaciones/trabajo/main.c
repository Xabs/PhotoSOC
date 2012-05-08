//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotográfico		  	  //
//----------------------------------------------------------------//

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#include "stdlib.h"
#include "comunicaciones.h"	// Libreria creada por Albert y Xavi para el proyecto

//Prototipos
void numero_a_LCD (int f_numero);

//Funciones usuario
void numero_a_LCD (int f_numero)
{
	char f_num[5],f_i,f_k;
	int f_division,f_mod,f_j;
	
	f_i=0;
	f_j=1000;
	f_mod=f_numero;

	for (f_k=0;f_k<4;f_k++)
	{
		f_division=f_mod/f_j;	
		f_mod=f_mod%f_j;		
		
		if (f_division>0)
			{
				f_num[f_i]=f_division+48;
				f_i++;
			}
		if (f_division==0 && f_i>0)
			{
				f_num[f_i]=48;
				f_i++;
			}
		f_j=f_j/10;
	}
	
	f_num[f_i]=0;
	
	LCD_PrString (f_num);
	
}


//Programa principal
void main()
{	
	unsigned char x,prueba1,prueba2,prueba3;
	unsigned int temp1;
	
	//- Inicializacion de parametros basicos del sistema al encender	
		Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
		Timer8_WriteCompareValue(156/2);
		Timer8_Start();
		
		UART_Start(UART_PARITY_NONE);
		
		LCD_Start();
		LCD_Init();	
		
		LCD_Control(0x01);
		LCD_PrCString ("Recibiendo");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
	
	// Recepción de datos
		prueba1=recibe();
		prueba2=recibe();
		prueba3=recibe();
		
	//Envio al LCD	
		LCD_Control(0x01);
		LCD_PrCString ("prueba1");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(prueba1);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		LCD_PrCString ("Prueba2");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(prueba2);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		LCD_PrCString ("Prueba3");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(prueba3);		
		for (temp1=0;temp1<50000;temp1++);

		LCD_Control(0x01);
		LCD_PrCString ("Fin programa");	
		for (temp1=0;temp1<50000;temp1++);
}
