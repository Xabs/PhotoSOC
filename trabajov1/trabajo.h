//Prototipos de la libreria del PSoC de trabajo
void Inicio();
void Ejecucion();
char Dato();
void Deteccion();
void Disparo();
void Unico();
void Intervalometro();
void TimeLapse();

//Variables globales del PSoC de trabajo
char Ent1=0;	//Barrera 1 12V
char Ent2=0;	//Barrera 2 12V
char Ent3=0;	//Microfono A/D 5V
char Ent4=0;	//Digital 0/1 5V
char Cam1=0, Cam2=0, Fla1=0, Fla2=0, Fla3=0, Fla4=0;
char Uni=0, Inter=0, Tilap=0;

//******************************************************************************
//******************************************************************************

//Esta funcion esperara continuamente una informacion que le llegara por
//la comunicacion del puerto serie que hemos incorporado al
//proyecto, la informacion que reciba hara de selector para las tareas
//que tiene programadas

void Inicio()
{	
	char coms;
	
	for(;;)
	{
		coms=Dato();
		if(coms==9) Ejecucion();
		//Dejo espacio en caso de querer implementar el testeo del microfo a traves de la UART
	}
}

//******************************************************************************
//******************************************************************************

//Funcion que recivira las tranmision de la UART y las asignara a las diferentes
//variables para poderlas usar en nuestro programa

void Ejecucion()
{
	Ent1=Dato();
	Ent2=Dato();
	Ent3=Dato();
	Ent4=Dato();
	Cam1=Dato();
	Cam2=Dato();
	Fla1=Dato();
	Fla2=Dato();
	Fla3=Dato();
	Fla4=Dato();
	Uni=Dato();
	Inter=Dato();
	Tilap=Dato();
	Deteccion();
}

//******************************************************************************
//******************************************************************************

//Funcion de soporte que devolvera lo que reciva por la UART
//y enviara una confirmacion para que se envie el siguiente dato

char Dato()
{
	char recivido, confirma;
	
	do
	{
		recivido=UART_cGetChar();	//Esta se espera a que llegue un byte. Ver tambien UART_cReadChar()
		UART_PutChar(recivido);		//Devolvemos el valor para la confirmacion confirmacion
		confirma=UART_cGetChar();	//Resultado de la confirmacion
	}while(confirma!=5);
	return recivido;
}

//******************************************************************************
//******************************************************************************

//Funcion de bucl que mira si alguna entreada del PSoC de treabajo 
//se activa segun lo especificado
//Devolvera el numero de la entrada que se haya activado

void Deteccion()	
{
	char sensor=0;
	
	PRT0DR=0xAA;	//Activo las resistencias de pull-up de los detectores
	
	do
	{
		if(Ent1==1)if(PRT0DR & 0x80==0x80)sensor=1;			//La entrada 1 consta de una barrera a 12V
															//entrada en HighZ y con un divisor de tension
		else if(Ent2==1)if(PRT0DR & 0x20==0x20)sensor=2;	//La entrada 2 consta de una barrera a 12V
															//entrada en HighZ y con un divisor de tension
		else if(Ent3==1)					//La entrada 3 consta de un microfono regulable
		{									//mediante programacion a 5V
			if(PRT0DR & 0x08==0x00)			//entrada con conversor analogico/digital
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
	}while(sensor==0);
	Disparo();
}

//******************************************************************************
//******************************************************************************

//Funcion que gestionara los tipos de disparos al activarse dependiendo de  la informacion
//de las variables que le hemos mandado actuara de una manera u otra

void Disparo()
{
	if(Uni==1) Unico();
	else if(Inter==1) Intervalometro();
	else if (Tilap==1) TimeLapse();
	//En caso de no haber seleccionado ningun modo de disparo
}

//******************************************************************************
//******************************************************************************

//Funcion de disparo unico, dispara todos los actuadores a la vez

void Unico()
{
	int x;
	
	PRT0DR=PRT0DR | 0x55; 	//Activacion de todas las salidas del puerto 0
	PRT2DR=PRT2DR | 0x55;	//Activacion de todas las salidas del puerto 2
	for(x=0;x<300;x++);		//Tiempo para que actuen 
	PRT0DR=PRT0DR & 0xAA;	//Desactivacion de las salidas del puerto 0
	PRT2DR=PRT2DR & 0xAA;	//Desactivacion de las salidas del puerto 2
	//Inicio();  ??
}

//******************************************************************************
//******************************************************************************

//Funcion de Intevalometro

void Intervalometro()
{
	int x;
	
	// A la espera de la conf 
	//Inicio();  ??
}

//******************************************************************************
//******************************************************************************

//Funcion de Intevalometro

void TimeLapse()
{
	int x;
	
	// A la espera de la conf
	//Inicio();  ??
}