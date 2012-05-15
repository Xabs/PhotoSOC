//----------------------------------------------------------------//
//     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
//                   By Albert Sagol & Xavi Vicient			      //
//                 PhotoSoC - Controlador fotográfico		  	  //
//----------------------------------------------------------------//
//              Libreria de rutinas para el PSoC terminal		  //
//----------------------------------------------------------------//

#include "comunicaciones.h" 	// Libreria de comunicaciones creada por Albert y Xavi para el proyecto

//Listado de prototipos
void Inicializacion(void);
void Bienvenida(void);
void bucle_temp(void);
void Principal(void);
void Pitido(void);
void Reset_PdT(void);
char Pulsador(void);
void Menu(void);
void Sensors(void);
void Entrada1(void);	//Menú entrada Barrera 1 0/1 a 12V
void Entrada2(void);	//Menú entrada Barrera 2 0/1 a 12V
void Entrada3(void);	//Menú entrada Sensor digital 0/1 a 5V
void Entrada4(void);	//Menú entrada Sensor digital 0/1 a 5V
void Flashes(void);
void Flash1(void);
void Flash2(void);
void Flash3(void);
void Flash4(void);
void Tipo_fla(char flash);
void Dispar(void);
void Camara1(void);
void Camara2(void);
void Tipo_disp(char camara);
void Intervalometro(char camara);
void TimeLapse(char camara);
char Numeros(void);
char Tiempos(void);
void Executar(void);
void envio_valores(void);
void Ara(void);
void Trabajando(void);
void Resetear(void);
void Sistema(void);
void Reali_LCD(void);
void Zumbador(void);
void Ali_Led(void);


//Declaracion de las variables globales del PSoC Terminal
char Cam1=0, Cam2=0; 					//Variables que determinan si una salida a camara esta activa o no y el tipo de disparo
char Ent1=0, Ent2=0, Ent3=0, Ent4=0;	//Variables que determinan si una entrada esta activa o no
char Fla1=0, Fla2=0, Fla3=0, Fla4=0;	//Variables que determinan si una salida a flash esta activa o no

unsigned char Int1_Tdisp=0, Int1_Tdisp_Uni=0, Int1_Ndisp=0;					//Variables del modo disparo Intervalómetro Cámara 1
unsigned char Int2_Tdisp=0, Int2_Tdisp_Uni=0, Int2_Ndisp=0;					//Variables del modo disparo Intervalómetro Cámara 2
unsigned char TL1_Treal=0, TL1_Treal_Uni=0, TL1_Tfilm=0, TL1_Tfilm_Uni=0; 	//Variables del modo disparo Time Lapse Cámara 1
unsigned char TL2_Treal=0, TL2_Treal_Uni=0, TL2_Tfilm=0, TL2_Tfilm_Uni=0;	//Variables del modo disparo Time Lapse Cámara 2

char Luz_LCD=0;			//Variable que determina si la luz de retroalimentación esta activa o no
char Buzzer=0;			//Variable que determina si el buzzer se activa al pulsar
char Alimentacion=0;	//Variable que determina si el LED de encendido esta activo o no

//***********************************************************************************************************************/
//***********************************************************************************************************************/




/************************************************************************************************************************
/  	LLAMADA: Inicializacion ()
/  	FUNCION: Inicializa los perifericos y variables necesarias del PSoC terminal
/  	ENTRADA: void
/  	SALIDA: void
/	INICIALIZAR PERIFERICOS: No
/  	OTROS: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/************************************************************************************************************************/

void Inicializacion(void)
{
	//Inicialización del Timer para la UART
	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	Timer8_WriteCompareValue(156/2);
	Timer8_Start();
	
	//Inicialización de la UART en modo sin paridad
	UART_Start(UART_PARITY_NONE);
	
	//Inicialización del LCD
	LCD_Start();
	LCD_Init();
	
	// Con los 1 conectamos resistencias de pull-up y evitamos reset del PdT
	PRT0DR=	0xA0;	//1010 0000 
}

//***********************************************************************************************************************/
//***********************************************************************************************************************/




/************************************************************************************************************************
/  	LLAMADA: Bienvenida()
/  	FUNCION: Muestra por el LCD un mensaje de bienvenida al encender el PhotoSOC
/  	ENTRADA: void
/  	SALIDA: void
/	INICIALIZAR PERIFERICOS: No
/  	OTROS: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/************************************************************************************************************************/

void Bienvenida(void)
{
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_Position(0,1);
	LCD_PrCString("Bienvenidos");
	LCD_Position(1,3);
	LCD_PrCString("a  PhotoSoC");
	bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
}

//***********************************************************************************************************************/
//***********************************************************************************************************************/


//Funcion de bucle de perdida de tiempo 

void bucle_temp(void)
{
	unsigned int x;
	
	for(x=0;x<35000;x++);	
}

//***************************************************************************************
//***************************************************************************************



// Programa pricipal del projecte, aquest sera el programa inicial que s'iniciara al encendre el circuit
//	en ell el que farem sera saludar a la persona que a ences el circuit i esperar a pulsi algun boto 
//	per accedir al menu 

void Principal(void)
{
	char boton;
	unsigned int x;
	
	boton=Pulsador();
	if(Buzzer==1) Pitido();
	if(boton!=0) 
	{
		Menu();		// Canviar nom de la rutina
	}
}

//***************************************************************************************************************
//***************************************************************************************     Menu principal



// Funcion que hace sonar el pitido en el caso de que este activado en el 
//menu del Zumbador, en caso contrario no entrara a hacer esta funcion

void Pitido(void)
{				
	int xx;

		PRT0DR=PRT0DR | 0x08;	//Encendido del puerto 0.3
		for(xx=0;xx<4000;xx++) PRT0DR=PRT0DR;	//Bucle de tiempo del pitido del zumbador
		PRT0DR=PRT0DR & 0xF7;	//Apagado del puerto 0.3
}

//***************************************************************************************
//***************************************************************************************


/************************************************************************************************************************
/  	LLAMADA: Reset_PdT ()
/  	FUNCION: Activa la patilla 25 (Port 0.2) para resetear el PSoC de Trabajo
/  	ENTRADA: void
/  	SALIDA: void
/	INICIALIZAR PERIFERICOS: No
/  	OTROS: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/************************************************************************************************************************/

void Reset_PdT(void)
{
	int x;
	
	PRT0DR=PRT0DR | 0x04;			//Puesta a 1 del puerto 0.2
	for(x=0;x<750;x++);				//Bucle de tiempo
	PRT0DR=PRT0DR & 0xFB;			//Apagado del puerto 0.2
}


//***************************************************************************************
//***************************************************************************************

// Funcio per detectar si un pulsador ha estat pitjat la cual retornara un valor entre 0 i 3
//  que farem correspondre amb una accio o una altre.
	// retorn 1 --> pulsacio curta del boto groc
	// retorn 3 --> pulsacio llarga del boto groc
	// retorn 2 --> pulsacio curta del boto vermell
	// retorn 4 --> pulsacio llarga del boto vermell

char Pulsador(void)
{	
	#define amarillo 1
	#define rojo 2
	
	char pulsado=0, aviso;
	unsigned int x;
	
	do
	{
		aviso=UART_cReadChar();
		if(aviso==255);		//Aviso nos permite saber cuando a terminado de trabajar el PSoC de Trabajo
		if((PRT0DR & 0xA0)==0x20)pulsado=amarillo;		// pulsado el botón amarillo (0.7) que dará un 0 (resistencias de pull-up) 
		if((PRT0DR & 0xA0)==0x80)pulsado=rojo;			// pulsado el botón rojo (0.5) que dará un 0 (resistencia de pull-up)
		if(pulsado!=0)
		{
			for(x=0;x<100;x++);							// bucle perdua de temps
			for(x=0;x<30000;x++)
			{
				if((PRT0DR & 0xA0)==0xA0) return pulsado;
				PRT0DR=PRT0DR | 0xA0;							// recarga de resistencias de pull-up						
			}
			pulsado=pulsado+2;
		}
		if(UART_cReadChar()==251)Principal();
	}while(pulsado==0);
	return pulsado;
}

//***************************************************************************************************************
//***************************************************************************************       Principal

// Programa del menu principal, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC

void Menu(void)
{
	char pulsat,index=1;
	unsigned int x;
	 
	do
	{	
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Menu Principal");
		LCD_Position(1,0);
		if(index==1) LCD_PrCString("1-Conf. Sensores");
		else if(index==2) LCD_PrCString("2-Conf. Flashes");
		else if(index==3) LCD_PrCString("3-Conf. Disparo");
		else if(index==4) LCD_PrCString("4-Ejecutar");
		else if(index==5) LCD_PrCString("5-Conf. Sistema");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(index+1>5)	index=1;
			else	index++;
		}
		else if(pulsat==3)
		{
			if(index==1) Sensors();
			else if(index==2)	Flashes();
			else if(index==3)	Dispar();
			else if(index==4)	Executar();
			else if(index==5)	Sistema();
		}
		else if(pulsat==2)
		{	
			if(index-1<1) index=5;
			else index--;
		}
	}while(pulsat!=4);
}

//***************************************************************************************************************
//***************************************************************************************        Sensores

// Programa del submenu Sensores, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC amb els seus diferents detectors

void Sensors(void)
{
	char pulsat,menu=1;
	unsigned int x;
		 
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Conf. Sensores");
		LCD_Position(1,0);
		if(menu==1) LCD_PrCString("1-Barrera 1 12V");
		else if(menu==2) LCD_PrCString("2-Barrera 2 12V");
		else if(menu==3) LCD_PrCString("3-Digital 1 5V");
		else if(menu==4) LCD_PrCString("4-Digital 2 5V");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>4)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			if(menu==1) Entrada1();
			else if(menu==2)	Entrada2();
			else if(menu==3)	Entrada3();
			else if(menu==4)	Entrada4();
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=4;
				else	menu--;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar la entrada 1 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo
//Entrada 0/1 de 12V para una barrera

void Entrada1(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Barrera 1 12V");
		LCD_Position(1,0);
		if(Ent1==0) LCD_PrCString("OFF");
		else LCD_PrCString("ON");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			if(Ent1==0) Ent1=1;
			else Ent1=0;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar la entrada 2 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo
//Entrada 0/1 de 12V para una barrera

void Entrada2(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Barrera 2 12V");
		LCD_Position(1,0);
		if(Ent2==0) LCD_PrCString("OFF");
		else LCD_PrCString("ON");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			if(Ent2==0) Ent2=1;
			else Ent2=0;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar la entrada 3 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo
//Entrada con conversor Analogico/Digital de 5V

void Entrada3(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Digital 1 5V");
		LCD_Position(1,0);
		if(Ent3==0) LCD_PrCString("OFF");
		else LCD_PrCString("ON");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			if(Ent3==0) Ent3=1;
			else Ent3=0;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar la entrada 4 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo
//Entrada 0/1 de 5V

void Entrada4(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Digital 2 5V");
		LCD_Position(1,0);
		if(Ent4==0) LCD_PrCString("OFF");
		else LCD_PrCString("ON");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			if(Ent4==0) Ent4=1;
			else Ent4=0;
		}
	}while(pulsat!=4);
}

//***************************************************************************************************************
//***************************************************************************************         Salidas

// Programa del submenu Salidas, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC per ejecutar las sortides, com opcions de dispar o flashos
	
void Flashes(void)
{	
	char pulsat,menu=1;
	unsigned int x;
	 
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Conf. Flashes");
		LCD_Position(1,0);
		if(menu==1) 
		{	
			LCD_PrCString("1-Flash 1");
			if(Fla1==0)LCD_PrCString(" (Off)");
			else LCD_PrCString(" (On)");
		}
		else if(menu==2) 
		{	
			LCD_PrCString("2-Flash 2");
			if(Fla2==0)LCD_PrCString(" (Off)");
			else LCD_PrCString(" (On)");
		}
		else if(menu==3) 
		{	
			
			LCD_PrCString("3-Flash 3");
			if(Fla3==0)LCD_PrCString(" (Off)");
			else LCD_PrCString(" (On)");
		}
		else if(menu==4) 
		{	
			LCD_PrCString("4-Flash 4");
			if(Fla4==0)LCD_PrCString("  (Off)");
			else LCD_PrCString(" (On)");
		}
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>4)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			if(menu==1)	Flash1();
			else if(menu==2)	Flash2();
			else if(menu==3)	Flash3();
			else if(menu==4)	Flash4();
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=4;
			else	menu--;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar el flash 1 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo
void Flash1() 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Flash 1");
		LCD_Position(1,0);
		if(Fla1==0) LCD_PrCString("Apagado");
		else if(Fla1==1) LCD_PrCString("Camara 1");
		else if(Fla1==2) LCD_PrCString("Camara 2");
		else if(Fla1==3) LCD_PrCString("Ambas");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			Tipo_fla(1);
		}
	}while(pulsat!=4);
}


//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar el flash 2 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo

void Flash2() 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Flash 2");
		LCD_Position(1,0);
		if(Fla1==0) LCD_PrCString("Apagado");
		else if(Fla1==1) LCD_PrCString("Camara 1");
		else if(Fla1==2) LCD_PrCString("Camara 2");
		else if(Fla1==3) LCD_PrCString("Ambas");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			Tipo_fla(2);
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar el flash 3 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo

void Flash3() 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Flash 3");
		LCD_Position(1,0);
		if(Fla1==0) LCD_PrCString("Apagado");
		else if(Fla1==1) LCD_PrCString("Camara 1");
		else if(Fla1==2) LCD_PrCString("Camara 2");
		else if(Fla1==3) LCD_PrCString("Ambas");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			Tipo_fla(3);
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar el flash 4 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo
void Flash4() 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Flash 4");
		LCD_Position(1,0);
		if(Fla1==0) LCD_PrCString("Apagado");
		else if(Fla1==1) LCD_PrCString("Camara 1");
		else if(Fla1==2) LCD_PrCString("Camara 2");
		else if(Fla1==3) LCD_PrCString("Ambas");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			Tipo_fla(4);
		}
	}while(pulsat!=4);
}

//***************************************************************************************************************
//***************************************************************************************         Disparo




void Tipo_fla(char flash)
{
	char pulsat, menu;
	unsigned int x;
	
	if(flash==1) menu=Fla1+1;
	else if(flash==2) menu=Fla2+1;
	else if(flash==3) menu=Fla3+1;
	else if(flash==4) menu=Fla4+1;
			
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Asignacion");
		LCD_Position(1,0);
		if(menu==1) LCD_PrCString("Apagado");
		else if(menu==2) LCD_PrCString("Camara 1");
		else if(menu==3) LCD_PrCString("Camara 2");
		else if(menu==4) LCD_PrCString("Ambas");
		bucle_temp();	//Bucle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>4)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			if(flash==1)Fla1=menu-1;
			else if(flash==2) Fla2=menu-1;
			else if(flash==3) Fla3=menu-1;
			else if(flash==4) Fla4=menu-1;
			pulsat=4;
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=4;
			else	menu--;
		}
	}while(pulsat!=4);
}




// Programa del submenu Disparo aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC para disparar las camaras

void Dispar(void)
{

	char pulsat,menu=1;
	unsigned int x;
	 
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Conf. Disparo");
		LCD_Position(1,0);
		if(menu==1) LCD_PrCString("1-Camara 1");
		else if(menu==2) LCD_PrCString("2-Camara 2");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>2)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			if(menu==1) Camara1();
			else if(menu==2) Camara2();
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=2;
			else	menu--;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar el camara 1 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo

void Camara1(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Camara 1");
		LCD_Position(1,0);
		if(Cam1==0) LCD_PrCString("No dispara");
		else if(Cam1==1) LCD_PrCString("Disp. Unico");
		else if(Cam1==2) LCD_PrCString("Intervalometro");
		else if(Cam1==3) LCD_PrCString("Time Lapse");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			Tipo_disp(1);
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar el camara 2 para su funcionamiento cuando 
//se ponga en marcha el programa en el PSoC de Trabajo

void Camara2(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Camara 2");
		LCD_Position(1,0);
		if(Cam2==0) LCD_PrCString("No dispara");
		else if(Cam2==1) LCD_PrCString("Disp. Unico");
		else if(Cam2==2) LCD_PrCString("Intervalometro");
		else if(Cam2==3) LCD_PrCString("Time Lapse");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			Tipo_disp(2);
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite elegir el tipo de disparo que efectuara una camara
//recivira un valor que sera el tipo programado por el momento y podran 
//elegir otro tipo que sera devuelto

void Tipo_disp(char camara)
{
	char pulsat, menu;
	unsigned int x;
	
	if(camara==1) menu=Cam1+1;
	else if(camara==2) menu=Cam2+1;
			
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Tipo de disp.");
		LCD_Position(1,0);
		if(menu==1) LCD_PrCString("No dispara");
		else if(menu==2) LCD_PrCString("Disp. Unico");
		else if(menu==3) LCD_PrCString("Intervalometro");
		else if(menu==4) LCD_PrCString("Time Lapse");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>4)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			if(menu==1 || menu==2) 
			{
				if(camara==1)Cam1=menu-1;
				else if(camara==2) Cam2=menu-1;
			}
			else if(menu==3) Intervalometro(camara);
			else if(menu==4) TimeLapse(camara);
			pulsat=4;
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=4;
			else	menu--;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion donde se especificaran variables de la funcin del Intervalometro

void Intervalometro(char camara)
{
	char pulsat, menu=1;
	unsigned int x;
			
	if(camara==1) Cam1=2;
	else if(camara==2) Cam2=2;
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Intervalometro");
		LCD_Position(1,0);
		if(menu==1) LCD_PrCString("T entre foto");
		else if(menu==2) LCD_PrCString("Numero de fotos");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>2)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			if(menu==1)
			{
				if(camara==1)
				{
					Int1_Tdisp=Numeros();
					Int1_Tdisp_Uni=Tiempos();
				}
				else if(camara==2)
				{
					Int2_Tdisp=Numeros();
					Int2_Tdisp_Uni=Tiempos();	 
				}
			}
			else if(menu==2)
			{
				if(camara==1)Int1_Ndisp=Numeros();		
				else if(camara==2)Int2_Ndisp=Numeros();			
			}
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=2;
			else	menu--;
		}
	}while(pulsat!=4);

}

//***************************************************************************************
//***************************************************************************************

//Funcion donde se especificaran variables de la funcin del Intervalometro

void TimeLapse(char camara)
{
	char pulsat, menu=1;
	unsigned int x;
	
	if(camara==1) Cam1=3;
	else if(camara==2) Cam2=3;
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Time Lapse");
		LCD_Position(1,0);
		if(menu==1) LCD_PrCString("Tiempo real");
		else if(menu==2) LCD_PrCString("Tiempo video");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>2)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			if(menu==1)
			{
				if(camara==1)
				{
					TL1_Treal=Numeros();
					TL1_Treal_Uni=Tiempos();
				}
				else if(camara==2)
				{
					TL2_Treal=Numeros();
					TL2_Treal_Uni=Tiempos();	 
				}
			}
			else if(menu==2)
			{
				if(camara==1)
				{
					TL1_Tfilm=Numeros();
					TL1_Tfilm_Uni=Tiempos();
				}
				else if(camara==2)
				{
					TL2_Tfilm=Numeros();
					TL2_Tfilm_Uni=Tiempos();
				}
			}
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=2;
			else	menu--;
		}
	}while(pulsat!=4);

}

//***************************************************************************************
//***************************************************************************************

//

char Numeros(void) 
{
	char pulsat, menu=1, mostrar, recortar, zeros;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Numero 1-100");
		LCD_Position(1,0);
		for(x=0,zeros=100,recortar=menu;x<3;x++)
		{	
			mostrar=recortar/zeros;
			recortar=recortar%zeros;
			zeros=zeros/10;
			LCD_WriteData(mostrar+48);
		}
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>100)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			return menu;
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=100;
			else	menu--;
		}
	}while(pulsat!=5);
}

//***************************************************************************************
//***************************************************************************************

//

char Tiempos(void) 
{
	char pulsat, menu=1;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Uni. de tiempo");
		LCD_Position(1,0);
		if(menu==1) LCD_PrCString("Segundos");
		else if(menu==2)LCD_PrCString("Minutos");
		else if(menu==3)LCD_PrCString("Horas");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>3)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			return menu;
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=3;
			else	menu--;
		}
	}while(pulsat!=5);
}

//***************************************************************************************************************
//***************************************************************************************         Ejecutar

// Programa del submenu Ejecutar, aquest programa sera el que permetra
//	navegar per el menu i activar el mode de funcionament que 
//	tindra el PhotoSoC i que fara actualitzar i actuar el PSoC de treball

void Executar(void)
{
	char pulsat,menu=1;
	unsigned int x;
	 
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Ejecutar");
		LCD_Position(1,0);
		LCD_PrCString("1-Ahora");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		else if(pulsat==3)
		{
			if(menu==1) Ara();
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

/************************************************************************************************************************
/  	LLAMADA: envio_valores()
/  	FUNCION: Envia al PSoC de trabajo los valores que se han seleccionado por menú
/  	ENTRADA: void
/  	SALIDA: void
/	INICIALIZAR PERIFERICOS: No
/  	OTROS: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/************************************************************************************************************************/

void envio_valores(void)
{
	Reset_PdT();
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("arriba reset");
	LCD_Control(0x01);	//Borrat de pantalla
	envia(Cam1);
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("arriba cam1");
	envia(Cam2);
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("arriba cam2");
	envia(Ent1);
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("arriba Ent1");
	envia(Ent2);
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("arriba Ent2");
	envia(Ent3);
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("arriba Ent3");
	envia(Ent4);
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("arriba Ent4");
	envia(Fla1);
	envia(Fla2);
	envia(Fla3);
	envia(Fla4);
	
	
	
	if (Cam1==2)	//Intervalometro camara 1
	envia(Int1_Tdisp);
	envia(Int1_Tdisp_Uni);
	envia(Int1_Ndisp);
		
	if (Cam2==2)	//Intervalometro camara 2
	envia(Int2_Tdisp);
	envia(Int2_Tdisp_Uni);
	envia(Int2_Ndisp);
	
	if (Cam1==3)	//Time-lapse camara 1
	envia(TL1_Treal);
	envia(TL1_Treal_Uni);
	envia(TL1_Tfilm);
	envia(TL1_Tfilm_Uni);
	
	if (Cam2==3)	//Time-lapse camara 2
	envia(TL2_Treal);
	envia(TL2_Treal_Uni);
	envia(TL2_Tfilm);
	envia(TL2_Tfilm_Uni);
	
	if(Buzzer==1) Pitido();
	
	
}


//***************************************************************************************
//***************************************************************************************




//Funcion que permite empezar a enviar la infomacion al PSoC de trabajo
//y empieza a ejecutar los sensores

void Ara(void)		//Prova
{
	envio_valores();
	Trabajando();
}

//***************************************************************************************
//***************************************************************************************


//Funcion en la que el PSoC Terminal se queda al empezar despues de 
//enviar los datos y el PSoC de Trabajo esta trabajando

void Trabajando(void)
{
	unsigned int x;
	char pulsat;
	
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("PhotoSOC activo");
	for(x=0;x<60000;x++);
	for(x=0;x<60000;x++);
	for(x=0;x<60000;x++);
	
	for(;;)
	{
		LCD_Control(0x08);	//LCD off
		LCD_Control(0x01);	//Borrat de pantalla
		
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1||pulsat==2||pulsat==4)
		{
			LCD_Control(0x0E);	//LCD on
			LCD_Position(0,1);
			LCD_PrCString("Parar trabajo?");
			LCD_Position(1,0);
			LCD_PrCString("Manten Amarillo");
			for(x=0;x<50000;x++);
			for(x=0;x<50000;x++);
		}	
		else if(pulsat==3)
		{
			LCD_Control(0x0E);	//LCD on
			LCD_PrCString("Trabajo parado");
			for(x=0;x<50000;x++);
			Resetear();
		}
	}	
}

//***************************************************************************************
//***************************************************************************************

//Funcion en la que el PSoC Terminal interrumpe el funcionamiento del programa
//del PSoC de Trabajo y vuelve a iniciar la programacion 

void Resetear(void)
{
	Reset_PdT();
	Principal();
}

//***************************************************************************************************************
//***************************************************************************************         Sistema

// Programa del submenu Sistema, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC a l'hora de modificar especificacions del sistema

void Sistema(void)
{
	char pulsat,menu=1;
	unsigned int x;
		 
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Conf. Sistema");
		LCD_Position(1,0);
		if(menu==1) LCD_PrCString("1-Luz LCD");
		else if(menu==2) LCD_PrCString("2-Pitido interno");
		else if(menu==3) LCD_PrCString("3-Led de marcha");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1)
		{
			if(menu+1>3)	menu=1;
			else	menu++;
		}
		else if(pulsat==3)
		{
			if(menu==1) Reali_LCD();
			else if(menu==2) Zumbador();
			else if(menu==3) Ali_Led();
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=3;
			else	menu--;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar la realimentacion del LCD para poder configurar a oscuras
//Dependera de una variable global que la controlara

void Reali_LCD(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Luz LCD");
		LCD_Position(1,0);
		if(Luz_LCD==0) LCD_PrCString("OFF");
		else LCD_PrCString("ON");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2)
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			if(Luz_LCD==0) 
			{
				PRT0DR=PRT0DR | 0x02;	//Encendido del puerto 0.2
				Luz_LCD=1;
			}
			else 
			{
				PRT0DR=PRT0DR & 0xFD;	//Apagado del puerto 0.2
				Luz_LCD=0;
			}
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar el zumbador para poder que emita un pitido al acepatr alguna opcion
//Dependera de una variable global que la controlara

void Zumbador(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Pitido interno");
		LCD_Position(1,0);
		if(Buzzer==0) LCD_PrCString("OFF");
		else LCD_PrCString("ON");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			if(Buzzer==0) Buzzer=1;	//Habilitacion de la funcion Pitido()
			else Buzzer=0;
		}
	}while(pulsat!=4);
}

//***************************************************************************************
//***************************************************************************************

//Funcion que permite conectar el led del interruptor de alimentacion
//Dependera de una variable global que la controlara

void Ali_Led(void) 
{
	char pulsat;
	unsigned int x;
	
	do
	{
		LCD_Control(0x01);	//Borrat de pantalla
		LCD_PrCString(">Led de marcha");
		LCD_Position(1,0);
		if(Alimentacion==0) LCD_PrCString("OFF");
		else LCD_PrCString("ON");
		bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
		pulsat=Pulsador();
		if(Buzzer==1) Pitido();
		if(pulsat==1 || pulsat==2) 
		{
			PRT0DR=PRT0DR;
		}
		else if(pulsat==3)
		{
			if(Alimentacion==0) 
			{
				PRT0DR=PRT0DR | 0x10;	//Encendido del puerto 0.4
				Alimentacion=1;
			}
			else 
			{
				PRT0DR=PRT0DR & 0xEF;	//Apagado del puerto 0.4
				Alimentacion=0;
			}
		}
	}while(pulsat!=4);
}

//***********************************************************************************************************************
//***********************************************************************************************************************