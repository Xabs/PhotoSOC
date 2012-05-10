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
#include "trabajo.h"			// Libreria creada por Albert y Xavi para el proyecto
#include "comunicaciones.h" 	// Libreria de comunicaciones creada por Albert y Xavi para el proyecto


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


void main()
{	
	unsigned int temp1;
	
	Inicializacion ()
		
	LCD_Control(0x01);
	LCD_PrCString ("Recibiendo");	
	for (temp1=0;temp1<50000;temp1++);
	LCD_Control(0x01);
	
	recibe(Cam1);
	recibe(Cam2);
	recibe(Ent1);
	recibe(Ent2);
	recibe(Ent3);
	recibe(Ent4);
	recibe(Fla1);
	recibe(Fla2);
	recibe(Fla3);
	recibe(Fla4);
	
	if (Cam1==2)	//Intervalometro camara 1
	recibe(Int1_Tdisp);
	recibe(Int1_Tdisp_Uni);
	recibe(Int1_Ndisp);
		
	if (Cam2==2)	//Intervalometro camara 2
	recibe(Int2_Tdisp);
	recibe(Int2_Tdisp_Uni);
	recibe(Int2_Ndisp);
	
	if (Cam1==3)	//Time-lapse camara 1
	recibe(TL1_Treal);
	recibe(TL1_Treal_Uni);
	recibe(TL1_Tfilm);
	recibe(TL1_Tfilm_Uni);
	
	if (Cam2==3)	//Time-lapse camara 2
	recibe(TL2_Treal);
	recibe(TL2_Treal_Uni);
	recibe(TL2_Tfilm);
	recibe(TL2_Tfilm_Uni);
	
	//Envio al LCD	
		LCD_Control(0x01);
		LCD_PrCString ("Cam1");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Cam1);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		LCD_PrCString ("Cam2");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Cam22);		
		for (temp1=0;temp1<50000;temp1++);
		
		LCD_Control(0x01);
		LCD_PrCString ("Ent1");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Ent1);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Ent2");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Ent2);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Ent3");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Ent3);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Ent4");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Ent4);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		
		LCD_PrCString ("Fla1");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Fla1);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Fla2");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Fla2);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Fla3");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Fla3);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Fla4");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Fla4);		
		for (temp1=0;temp1<50000;temp1++);
		
		if (Cam1==2)	//Intervalometro camara 1
		LCD_PrCString ("Int1_Tdisp");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Int1_Tdisp);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Int1_Tdisp_Uni");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Int1_Tdisp_Uni);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Int1_Ndisp");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Int1_Ndisp);		
		for (temp1=0;temp1<50000;temp1++);
			
		if (Cam2==2)	//Intervalometro camara 2
		LCD_PrCString ("Int2_Tdisp");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Int2_Tdisp);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Int2_Tdisp_Uni");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Int2_Tdisp_Uni);		
		for (temp1=0;temp1<50000;temp1++);
		LCD_PrCString ("Int2_Ndisp");	
		for (temp1=0;temp1<50000;temp1++);
		LCD_Control(0x01);
		numero_a_LCD(Int2_Ndisp);		
		for (temp1=0;temp1<50000;temp1++);
		
		if (Cam1==3)	//Time-lapse camara 1
		recibe(TL1_Treal);
		recibe(TL1_Treal_Uni);
		recibe(TL1_Tfilm);
		recibe(TL1_Tfilm_Uni);
		
		if (Cam2==3)	//Time-lapse camara 2
		recibe(TL2_Treal);
		recibe(TL2_Treal_Uni);
		recibe(TL2_Tfilm);
		recibe(TL2_Tfilm_Uni);
		
		LCD_PrCString ("Fin programa");	
		for (temp1=0;temp1<50000;temp1++);
	
	//for(;;) Inicio();
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
