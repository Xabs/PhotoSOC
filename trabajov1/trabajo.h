//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotogr�fico		  	  //
//----------------------------------------------------------------//
//              Libreria de rutinas para el PSoC trabajo		  //
//----------------------------------------------------------------//


//Listado de defines utilizados en la libreria
#define off 0
#define on 1

//Declaracion de las variables globales del PSoC Trabajo

char Cam1=0, Cam2=0; 					//Variables que determinan si una salida a camara esta activa o no y el tipo de disparo
char Ent1=0, Ent2=0, Ent3=0, Ent4=0;	//Variables que determinan si una entrada esta activa o no
char Fla1=0, Fla2=0, Fla3=0, Fla4=0;	//Variables que determinan si una salida a flash esta activa o no

unsigned char Int1_Tdisp=0, Int1_Tdisp_Uni=0, Int1_Ndisp=0;					//Variables del modo disparo Interval�metro C�mara 1
unsigned char Int2_Tdisp=0, Int2_Tdisp_Uni=0, Int2_Ndisp=0;					//Variables del modo disparo Interval�metro C�mara 2
unsigned char TL1_Treal=0, TL1_Treal_Uni=0, TL1_Tfilm=0, TL1_Tfilm_Uni=0; 	//Variables del modo disparo Time Lapse C�mara 1
unsigned char TL2_Treal=0, TL2_Treal_Uni=0, TL2_Tfilm=0, TL2_Tfilm_Uni=0;	//Variables del modo disparo Time Lapse C�mara 2

char tocacam1=0, tocacam2=0;



//Prototipos de la libreria del PSoC de trabajo
void inicializacion(void);
void recibe_valores(void);
void activar_sensores(void);
void disparo_sensores(void);
void ejecucion(void);
void preparadisparo(void);
unsigned long calculosegundos(char numero, char unidades);

void disparo(void);
void dispara_camara(char disparo_camara_numero);
void dispara_camaras (void);
void Inicio(void);
char Dato(void);
void Deteccion(void);
void Disparo_flash(char disparo_flash_numero);
void Unico(void);
void Intervalometro(void);
void TimeLapse(void);

//******************************************************************************
//******************************************************************************



/************************************************************************************************************************
/  	LLAMADA: inicializacion()
/  	FUNCION: Inicializa todos los perifericos necesarios en el proyecto: Timers, UART, etc
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: nada
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/

void inicializacion(void)
{
	//Inicializaci�n del Timer para la UART
	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	Timer8_WriteCompareValue(156/2);
	Timer8_Start();
	
	//Inicializaci�n de la UART en modo sin paridad
	UART_Start(UART_PARITY_NONE);
	
	//Inicializaci�n del Timer para contar el tiempo entre disparos
	Segundos_WritePeriod(10000);		
	Segundos_WriteCompareValue(0);
	Segundos_Start();	
}	

//******************************************************************************
//******************************************************************************



/************************************************************************************************************************
/  	LLAMADA: recibe_valores()
/  	FUNCION: Recibe mediante UART los valores programados en el PSoC terminal
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: necesaria libreria comunicaciones.h e inicializar la UART y el Timer asociado
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/

void recibe_valores(void)
{
	Cam1=recibe();
	Cam2=recibe();
	Ent1=recibe();
	Ent2=recibe();
	Ent3=recibe();
	Ent4=recibe();
	Fla1=recibe();
	Fla2=recibe();
	Fla3=recibe();
	Fla4=recibe();
	
	if (Cam1==2)	//Intervalometro camara 1
	Int1_Tdisp=recibe();
	Int1_Tdisp_Uni=recibe();
	Int1_Ndisp=recibe();
		
	if (Cam2==2)	//Intervalometro camara 2
	Int2_Tdisp=recibe();
	Int2_Tdisp_Uni=recibe();
	Int2_Ndisp=recibe();
	
	if (Cam1==3)	//Time-lapse camara 1
	TL1_Treal=recibe();
	TL1_Treal_Uni=recibe();
	TL1_Tfilm=recibe();
	TL1_Tfilm_Uni=recibe();
	
	if (Cam2==3)	//Time-lapse camara 2
	TL2_Treal=recibe();
	TL2_Treal_Uni=recibe();
	TL2_Tfilm=recibe();
	TL2_Tfilm_Uni=recibe();
	
	//Faltaria programar si hay alguna variable que ha dado error
}	

//******************************************************************************
//******************************************************************************



/************************************************************************************************************************
/  	LLAMADA: activar_sensores()
/  	FUNCION: Rutina que activa las interrupciones externas para permitir el disparo por sensor
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: necesario programar las patillas y crear la rutina par las interrupciones externas
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/

void activar_sensores(void)
{
	if (Ent1==on || Ent2==on || Ent3==on || Ent4==on)
	{
		M8C_EnableGInt;									//Permitir interrupciones globalmente
		M8C_EnableIntMask (INT_MSK0,INT_MSK0_GPIO);		//Permitir interrupciones externas
	}
}

//******************************************************************************
//******************************************************************************



/************************************************************************************************************************
/  	LLAMADA: disparo_sensores()
/  	FUNCION: Rutina que dispara la/s camara/s cuando se ha activado algun sensor
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: necesario programar las patillas y crear la rutina par las interrupciones externas
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/

void disparo_sensores(void)
{
	#define sensores disparo_sensores_sensores
	char sensores;		//Declaraciones de las variables de la rutina
	
	//Guardamos el estado del port que crea las interrupciones evitando los flashes
	sensores=PRT0DR&0xAA; 					//1010-1010 
	
	//Evitar las entradas no activadas en la programaci�n aunque provoquen una interrupci�n
	if (Ent1==off) sensores=sensores&0x7F; 	//0111-1111
	if (Ent2==off) sensores=sensores&0xDF: 	//1101-1111
	if (Ent3==off) sensores=sensores&0xF7; 	//1111-0111
	if (Ent4==off) sensores=sensores&0xFD; 	//1111-1101
	
	//Disparar segun tipo de disparo
	if (sensores!=0) 
	disparo();
}

//******************************************************************************
//******************************************************************************




/************************************************************************************************************************
/  	LLAMADA: ejecucion()
/  	FUNCION: Rutina que segun los valores recibidos ejecuta los diferentes trabajos
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: nada
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/

void ejecucion (void)
{
	preparadisparo();
	disparo();
}	

//******************************************************************************
//******************************************************************************




/************************************************************************************************************************
/  	LLAMADA: preparadisparo()
/  	FUNCION: Rutina que segun el tipo de disparo programado activa las interrupciones y prepara las variables
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: nada
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/
void preparadisparo(void)
{
	if(Cam1==1) tocacam1=on; 		//disparo unico camara 1
	
	if(Cam2==1) tocacam2=on;		//disparo unico camara 2
	
	if(Cam1==2)
	{
	//Intervalometro camara 1
	}
	
	if(Cam1==3)
	{
	//C�lculo Time lapse camara 1
	}
	
	if(Cam2==2)
	{
	//Intervalometro camara 2
	}
	
	if (Cam2==3)
	{
	//C�lculo Time lapse camara 2
	}
}
//******************************************************************************
//******************************************************************************




/************************************************************************************************************************
/  	LLAMADA: x=calculosegundos(numero,unidades)
/  	FUNCION: Rutina que calcula los segundos en funcion de la cantidad y las unidades
/  	ENTRADA: numero (char) y unidades (char)
/  	SALIDA: unsigned long
/	OTROS: nada
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/
unsigned long calculosegundos(char numero, char unidades)
{
	unsigned long resultado;
	if (unidades==1) resultado=numero;
	if (unidades==2) resultado=(numero*60);
	if (unidades==3) resultado=(numero*3600);
	return (resultado);
}
//******************************************************************************
//******************************************************************************





/************************************************************************************************************************
/  	LLAMADA: disparo()
/  	FUNCION: Rutina que dispara la/s camara/s y/o flashes segun programaci�n
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: nada
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/


void disparo(void)
{
	if (Cam1==1 && Cam2==1)
	dispara_camaras();
}

//******************************************************************************
//******************************************************************************


//Funcion que realiza un disparo unico de camara/s
void Disparo_camara(char disparo_camara_numero)
{	
	int x;
	//Activaci�n de las salidas
	if (disparo_camara_numero==1)
		{
			PRT2DR=PRT2DR | 0x01;	//activar enfoque cam1
			PRT2DR=PRT2DR | 0x04;	//activar obturador cam1
		}
	if (disparo_camara_numero==2)
		{
			PRT2DR=PRT2DR | 0x10;	//activar enfoque cam2
			PRT2DR=PRT2DR | 0x40;	//activar obturador cam2
		}
	//Perdida de tiempo para activar salidas
	for(x=0;x<300;x++);
	
	//Desactivaci�n de las salidas
	PRT2DR=PRT2DR & 0xFA;			//desactivar cam1
	PRT2DR=PRT2DR & 0xAF;			//desactivar cam2
}


//******************************************************************************
//******************************************************************************

//Funcion que dispara las camaras segun si estan activadas o no por men�
void Dispara_camaras (void)
{	
	if (Cam1==on) Disparo_camara(1);
	if (Cam2==on) Disparo_camara(2);
}
//******************************************************************************
//******************************************************************************




/************************************************************************************************************************
/  	LLAMADA: intervalometro()
/  	FUNCION: Rutina que desarrolla el programa de intervalometro
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: nada
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/

void Intervalometro(void)
{
	unsigned char intervalometro_x, Int_Ndisp,Int_Tdisp;
	
	//C�lculo del tiempo entre disparos en segundos
	
	//Disparos
	for (intervalometro_x=0;intervalometro_x<Int_Ndisp;intervalometro_x++)
	{
		Dispara_camaras();
		Temporizador(Int_Tdisp);
	}
}

//******************************************************************************
//******************************************************************************







/*	

//Funcion que recibira las tranmision de la UART y las asignara a las diferentes
//variables para poderlas usar en nuestro programa

void Ejecucion(void)
{
	unsigned long real, film;
	
		
	if(Cam1==2)
	{
		listo_int1=1;
		if(Int1_Tdisp_Uni==1)Td_int1=Int1_Tdisp;			//Td_int1, Int1_Tdisp, Int1_Tdisp_Uni
		else if(Int1_Tdisp_Uni==2)Td_int1=Int1_Tdisp*60;
		else if(Int1_Tdisp_Uni==3)Td_int1=Int1_Tdisp*3600;
	}
	else listo_int1=0;
	if(Cam2==2)
	{
		listo_int2=1;
		if(Int2_Tdisp_Uni==1)Td_int2=Int2_Tdisp;			//Td_int2, Int2_Tdisp, Int2_Tdisp_Uni
		else if(Int2_Tdisp_Uni==2)Td_int2=Int2_Tdisp*60;
		else if(Int2_Tdisp_Uni==3)Td_int2=Int2_Tdisp*3600;
	}
	else listo_int2=0;
	if(Cam1==3)
	{
		listo_tl1=1;
		if(TL1_Treal_Uni==1)real=TL1_Treal;					//TL1_Treal, TL1_Treal_Uni
		else if(TL1_Treal_Uni==2)real=TL1_Treal*60;
		else if(TL1_Treal_Uni==3)real=TL1_Treal*3600;
		
		if(TL1_Tfilm_Uni==1)film=TL1_Tfilm;					//TL1_Tfilm, TL1_Tfilm_Uni
		else if(TL1_Tfilm_Uni==2)film=TL1_Tfilm*60;
		else if(TL1_Tfilm_Uni==3)film=TL1_Tfilm*3600;
		
		D_tl1=film*25;										//D_tl1
		Td_tl1=real/D_tl1;									//Td_tl1
	}
	else listo_tl1=0;
	if(Cam2==3)
	{
		listo_tl2=1;
		if(TL2_Treal_Uni==1)real=TL2_Treal;					//TL2_Treal, TL2_Treal_Uni
		else if(TL2_Treal_Uni==2)real=TL2_Treal*60;
		else if(TL2_Treal_Uni==3)real=TL2_Treal*3600;
		
		if(TL2_Tfilm_Uni==1)film=TL2_Tfilm;					//TL2_Tfilm, TL2_Tfilm_Uni
		else if(TL2_Tfilm_Uni==2)film=TL2_Tfilm*60;
		else if(TL2_Tfilm_Uni==3)film=TL2_Tfilm*3600;
		
		D_tl2=film*25;										//D_tl2
		Td_tl2=real/D_tl2;									//Td_tl2
	}
	else listo_tl2=0;
	
	Deteccion();
}

//******************************************************************************
//******************************************************************************

//Funcion de soporte que devolvera lo que reciba por la UART
//y enviara una confirmacion para que se envie el siguiente dato

char Dato(void)
{
	char recibido, confirma;
	
	do
	{
		recibido=UART_cGetChar();	//Esta se espera a que llegue un byte. Ver tambien UART_cReadChar()
		UART_PutChar(recibido);		//Devolvemos el valor para la confirmacion confirmacion
		confirma=UART_cGetChar();	//Resultado de la confirmacion
	}while(confirma!=5);
	return recibido;
}

//******************************************************************************
//******************************************************************************

//Funcion de bucle que mira si alguna entrada del PSoC de trabajo 
//se activa segun lo especificado
//Devolvera el numero de la entrada que se haya activado

void Deteccion(void)	
{
	char sensor=0;
	unsigned char x,
	
	PRT0DR=0xAA;	//Activo las resistencias de pull-up de los detectores
	
	do
	{
		if(Ent1==1)if(PRT0DR & 0x80==0x80)sensor=1;			//La entrada 1 consta de una barrera a 12V
															//entrada en HighZ y con un divisor de tension
		else if(Ent2==1)if(PRT0DR & 0x20==0x20)sensor=2;	//La entrada 2 consta de una barrera a 12V
															//entrada en HighZ y con un divisor de tension
		else if(Ent3==1)					//La entrada 3 consta de diferentes posibilidades
		{									//laser, infrarojos, presion, etc a 5V
			if(PRT0DR & 0x08==0x00)			
				{
					sensor=3;
					PRT0DR=PRT0DR | 0x08;
				}
		}
		else if(Ent4==1)					//La entrada 4 consta de diferentes posibilidades 
		{									//laser, infrarojos, presion, etc a 5V
			if(PRT0DR & 0x02==0x00)
			{
				sensor=4;
				PRT0DR=PRT0DR | 0x02;	//Recarga de la resistencia
			}
		}
		x=UART_cReadChar();
		if(x==99) Reset();
	}while(sensor==0);
	Tipodisparo();
}

//******************************************************************************
//******************************************************************************



//******************************************************************************
//******************************************************************************

//Funcion que realiza un disparo de flash
void Disparo_flash(char disparo_flash_numero)
{	
	int x;
	//Activaci�n de las salidas
	if (disparo_flash_numero==1) PRT0DR=PRT0DR | 0x01;	
	if (disparo_flash_numero==2) PRT0DR=PRT0DR | 0x04;	
	if (disparo_flash_numero==3) PRT0DR=PRT0DR | 0x10;	
	if (disparo_flash_numero==4) PRT0DR=PRT0DR | 0x40;	
	
	//Perdida de tiempo para activar salidas
	for(x=0;x<300;x++);
	
	//Desactivaci�n de las salidas
	PRT0DR=PRT0DR & 0xAA;
}


//******************************************************************************
//******************************************************************************



//Funcion de disparo unico, dispara todos los actuadores a la vez

void Unico(void)
{
	int x;
	
	PRT0DR=PRT0DR | 0x55; 	//Activacion de todas las salidas del puerto 0
	PRT2DR=PRT2DR | 0x55;	//Activacion de todas las salidas del puerto 2
	for(x=0;x<300;x++);		//Tiempo para que actuen 
	PRT0DR=PRT0DR & 0xAA;	//Desactivacion de las salidas del puerto 0
	PRT2DR=PRT2DR & 0xAA;	//Desactivacion de las salidas del puerto 2
	Reset();
}

//******************************************************************************
//******************************************************************************



//******************************************************************************
//******************************************************************************

//Funcion de Timelapse

void TimeLapse(void)
{
	unsigned long timelapse_treal, timelapse_tclip, timelapse_disparos, timelapse_resultado;
	unsigned int timelapse_x;
	
	//C�lculo del tiempo real en segundos
	
	//C�lculo del tiempo del clip en segundos
	
	//C�lculo del numero de disparos a realizar
	timelapse_disparos=(timelapse_tclip*25); //25fotogramas por segundo para Europa (PAL)
	
	//C�lculo del tiempo entre disparos
	timelapse_resultado=(timelapse_treal/timelapse_disparos);
	
	for (timelapse_x=0;timelapse_x<timelapse_disparos;timelapse_x++)
	{
		Dispara_camaras();
		Temporizador(timelapse_resultado);
	}
}
//******************************************************************************
//******************************************************************************



//Funcion de temporizador que contar� X segundos

void Temporizador (void)
{

}

//******************************************************************************
//******************************************************************************/