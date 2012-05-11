//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotográfico		  	  //
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

unsigned char Int1_Tdisp=0, Int1_Tdisp_Uni=0, Int1_Ndisp=0;					//Variables del modo disparo Intervalómetro Cámara 1
unsigned char Int2_Tdisp=0, Int2_Tdisp_Uni=0, Int2_Ndisp=0;					//Variables del modo disparo Intervalómetro Cámara 2
unsigned char TL1_Treal=0, TL1_Treal_Uni=0, TL1_Tfilm=0, TL1_Tfilm_Uni=0; 	//Variables del modo disparo Time Lapse Cámara 1
unsigned char TL2_Treal=0, TL2_Treal_Uni=0, TL2_Tfilm=0, TL2_Tfilm_Uni=0;	//Variables del modo disparo Time Lapse Cámara 2

char tocacam1=0, tocacam2=0;
unsigned int dspCam1=0, dspCam2=0;		//Disparos de la camara
unsigned long tpCam1=0, tpCam2=0;		//Tiempo entre disparos


//Prototipos de la libreria del PSoC de trabajo
void inicializacion(void);
void recibe_valores(void);
void activar_sensores(void);
void disparo_sensores(void);
void ejecucion(void);
void preparadisparo(void);
unsigned long calculosegundos(char numero, char unidades);
void disparo(void);

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
	//Inicialización del Timer para la UART
	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	Timer8_WriteCompareValue(156/2);
	Timer8_Start();
	
	//Inicialización de la UART en modo sin paridad
	UART_Start(UART_PARITY_NONE);
	
	//Inicialización del Timer para contar el tiempo entre disparos
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
	
	//Evitar las entradas no activadas en la programación aunque provoquen una interrupción
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
	#define treal preparadisparo_tp_real
	#define tclip preparadisparo_tp_clip
	
	unsigned long treal, tclip;
	
	switch (Cam1==)				//Cámara 1
	{
		case 1:					//disparo único
			tocacam1=on;
			break
		case 2:					//intervalometro
			dspCam1=Int1_Ndisp;
			tpCam1=calculosegundos(Int1_Tdisp, Int1_Tdisp_Uni);
			break
		case 3:					//Timelapse
			treal=calculosegundos(TL1_Treal, TL1_Treal_Uni);	//Calculo en segundos del tiempo real
			tclip=calculosegundos(TL1_Tfilm, TL1_Tfilm_Uni);	//Calculo en segundos del tiempo de clip
			dspCam1=(tclip*25);		//25 fotogramas por segundo para Europa (PAL)
			tpCam1=(treal/dspCam1);
			break
	}

	//Falta un switch igual para la camara 2 despues que Javi confirme la redacción
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
/  	FUNCION: Rutina que dispara la/s camara/s y/o flashes segun programación
/  	ENTRADA: void
/  	SALIDA: void
/	OTROS: nada
/  	AUTOR: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/
void disparo(void)
{
	int x;
	//Apertura de las cámaras
	if (tocacam1==on)
		{
			PRT2DR=PRT2DR | 0x01;	//activar enfoque cam1
			PRT2DR=PRT2DR | 0x04;	//activar obturador cam1
		}
	if (tocacam2==on)
		{
			PRT2DR=PRT2DR | 0x10;	//activar enfoque cam2
			PRT2DR=PRT2DR | 0x40;	//activar obturador cam2
		}
	//Apertura de los flashes
	if (Fla1==1) PRT0DR=PRT0DR | 0x01;	
	if (Fla2==1) PRT0DR=PRT0DR | 0x04;	
	if (Fla3==1) PRT0DR=PRT0DR | 0x10;	
	if (Fla4==1) PRT0DR=PRT0DR | 0x40;
	
	//Perdida de tiempo para activar salidas
	for(x=0;x<300;x++);
	
	//Desactivación de los flashes
	PRT0DR=PRT0DR & 0xAA;			//1010-1010
	
	//Desactivación de las cámaras
	PRT2DR=PRT2DR & 0xAA;			//1010-1010
	
}
//******************************************************************************
//******************************************************************************