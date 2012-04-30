//Listado de prototipos
void bucle_temp();
void Pitido();
char Pulsador();
void Reset_PdT();
void Principal();
void Menu();
void Sensors();
void Entrada1();	//Barrera 1 a 12V
void Entrada2();	//Barrera 2 a 12V
void Entrada3();	//Conversor Ana/Dig a 5V
void Entrada4();	//0/1 a 5V
void Flashes();
void Flash1();
void Flash2();
void Flash3();
void Flash4();
void Dispar();
void Camara1();
void Camara2();
void Tipo_disp(char camara);
void Intervalometro(char camara);
void TimeLapse(char camara);
void Executar();
void Ara();
void Envia(char valor);
void Sistema();
void Reali_LCD();
void Zumbador();
void Ali_Led();

//Declaracion de las variables globales del PSoC Terminal
char Luz_LCD=0;
char Buzzer=0;
char Alimentacion=0;
char Ent1=0, Ent2=0, Ent3=0, Ent4=0;
char Fla1=0, Fla2=0, Fla3=0, Fla4=0;
char Cam1=0, Cam2=0, Inter1=0, Tilap1=0, Inter2=0, Tilap2=0;

//***************************************************************************************
//***************************************************************************************

//Funcion de bucle de perdida de tiempo 

void bucle_temp()
{
	unsigned int x;
	
	for(x=0;x<35000;x++);	
}

//***************************************************************************************
//***************************************************************************************

// Funcion que hace sonar el pitido en el caso de que este activado en el 
//menu del Zumbador, en caso contrario no entrara a hacer esta funcion

void Pitido()
{				
	int xx;

		PRT0DR=PRT0DR | 0x08;	//Encendido del puerto 0.3
		for(xx=0;xx<4000;xx++) PRT0DR=PRT0DR;	//Bucle de tiempo del pitido del zumbador
		PRT0DR=PRT0DR & 0xF7;	//Apagado del puerto 0.3
}

//***************************************************************************************
//***************************************************************************************

//Funcion que resetea el PSoC de trabajo dejandolo a la espera de enviarle 
//datos, para trabajar

void Reset_PdT()
{
	int x;
	
	PRT0DR=PRT0DR | 0x04;
	for(x=0;x<500;x++);
	PRT0DR=PRT0DR & 0xFB;
	for(x=0;x<500;x++);
}

//***************************************************************************************
//***************************************************************************************

// Funcio per detectar si un pulsador ha sigut pitjat la cual retornara un valor entre 0 i 3
//  que farem correspondre amb una accio o una altre.
	// retorn 1 --> pulsacio curta del boto groc
	// retorn 3 --> pulsacio llarga del boto groc
	// retorn 2 --> pulsacio curta del boto vermell
	// retorn 4 --> pulsacio llarga del boto vermell

char Pulsador()
{	
	#define amarillo 1
	#define rojo 2
	
	char pulsado=0;
	unsigned int x;
	
	do
	{
		if((PRT0DR & 0xA0)==0x20)pulsado=amarillo;		// pulsado el bot�n amarillo (0.7) que dar� un 0 (resistencias de pull-up) 
		if((PRT0DR & 0xA0)==0x80)pulsado=rojo;			// pulsado el bot�n rojo (0.5) que dar� un 0 (resistencia de pull-up)
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
	}while(pulsado==0);
	return pulsado;
}

//***************************************************************************************************************
//***************************************************************************************       Principal

// Programa pricipal del projecte, aquest sera el programa inicial que s'iniciara al encendre el circuit
//	en ell el que farem sera saludar a la persona que a ences el circuit i esperar a pulsi algun boto 
//	per accedir al menu 

void Principal()
{
	char boton;
	unsigned int x;
	
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_Position(0,1);
	LCD_PrCString("Bienvenidos");
	LCD_Position(1,3);
	LCD_PrCString("a  PhotoSoC");
	bucle_temp();	//Bulcle perdida de tiempo para canvio de menu
	boton=Pulsador();
	if(Buzzer==1) Pitido();
	if(boton!=0) 
	{
		Menu();		// Canviar nom de la rutina
	}
}

//***************************************************************************************************************
//***************************************************************************************     Menu principal

// Programa del menu principal, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC

void Menu()
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

void Sensors()
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

void Entrada1() 
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

void Entrada2() 
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

void Entrada3() 
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

void Entrada4() 
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
	
void Flashes()
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
		if(Fla1==0) LCD_PrCString("OFF");
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
			if(Fla1==0) Fla1=1;	
			else Fla1=0;
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
		if(Fla2==0) LCD_PrCString("OFF");
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
			if(Fla2==0) Fla2=1;	
			else Fla2=0;
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
		if(Fla3==0) LCD_PrCString("OFF");
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
			if(Fla3==0) Fla3=1;	
			else Fla3=0;
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
		if(Fla4==0) LCD_PrCString("OFF");
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
			if(Fla4==0) Fla4=1;	
			else Fla4=0;
		}
	}while(pulsat!=4);
}

//***************************************************************************************************************
//***************************************************************************************         Disparo

// Programa del submenu Disparo aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC para disparar las camaras

void Dispar()
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

void Camara1() 
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

void Camara2() 
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
			if(camara==1) Cam1=menu-1;
			else if(camara==2) Cam2=menu-1;
			if(menu==3) Intervalometro(camara);
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
	char pulsat, menu;
	unsigned int x;
			
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
			if(camara==1) Cam1=menu-1;
			else if(camara==2) Cam2=menu-1;
			pulsat=4;
		}
		else if(pulsat==2)
		{	
			if(menu-1<1)	menu=2;
			else	menu--;
		}
	}while(pulsat!=4);

}

//***************************************************************************************************************
//***************************************************************************************         Ejecutar

// Programa del submenu Ejecutar, aquest programa sera el que permetra
//	navegar per el menu i activar el mode de funcionament que 
//	tindra el PhotoSoC i que fara actualitzar i actuar el PSoC de treball

void Executar()
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

//Funcion que permite empezar a enviar la infomacion al PSoC de trabajo
//y empieza a ejecutar los sensores

void Ara()
{
	Reset_PdT();
	Envia(9);
	Envia(Ent1);
	Envia(Ent2);
	Envia(Ent3);
	Envia(Ent4);
	Envia(Cam1);
	Envia(Cam2);
	Envia(Fla1);
	Envia(Fla2);
	Envia(Fla3);
	Envia(Fla4);
//	Envia(Uni);
//	Envia(Inter);
//	Envia(Tilap);
	if(Buzzer==1) Pitido();
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString("Datos enviados");
	LCD_Position(1,0);
	LCD_PrCString("PhotoSOC Activo");
}

//***************************************************************************************
//***************************************************************************************

//Funcion a la que le pasas un valor y lo manda por la UART tambien
//tiene un bucle para que el PSoC de trabajo pueda capturar el dato
//utilizamos un protocolo de comunicaciones

void Envia(char valor)
{
	char confirmacion;
	
	do
	{	
		UART_PutChar(valor);
		confirmacion=UART_cGetChar();  //Esta se espera a que llegue un byte.
		if(valor==confirmacion) UART_PutChar(5);	//verificacion de la coms 
		else UART_PutChar(4);	//Error al comunicar
	}while(valor!=confirmacion);
}

//***************************************************************************************************************
//***************************************************************************************         Sistema

// Programa del submenu Sistema, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC a l'hora de modificar especificacions del sistema

void Sistema()
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

void Reali_LCD() 
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

void Zumbador() 
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

void Ali_Led() 
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