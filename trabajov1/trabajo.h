//Listado de defines utilizados en la libreria




//Variables globales del PSoC de trabajo
char inici;
char listo_int1, listo_int2, listo_tl1, listo_tl2;
char Ent1=0;	//Barrera 1 12V
char Ent2=0;	//Barrera 2 12V
char Ent3=0;	//Microfono A/D 5V
char Ent4=0;	//Digital 0/1 5V
char Fla1=0, Fla2=0, Fla3=0, Fla4=0;
char Cam1=0;
char Cam2=0;

//Prototipos de la libreria del PSoC de trabajo
void Inicializacion();
void Inicio();
void Ejecucion();
char Dato();
void Deteccion();
void Tipodisparo();
void Disparo_camara(char disparo_camara_numero);
void Disparo_flash(char disparo_flash_numero);
void Unico();
void Intervalometro(char camara);
void TimeLapse(char camara);
void Reset();


//******************************************************************************
//******************************************************************************

/************************************************************************************************************************
/  LLAMADA: Inicializacion()
/  FUNCION: Inicializa todos los perifericos necesarios en el proyecto: Timers, UART, etc
/  ENTRADA: void
/  SALIDA: void
/  OTROS: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/**********************************************************************************************************************/

void Inicializacion()
{
	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	Timer8_WriteCompareValue(156/2);
	Timer8_Start();
	
	Segundos_WritePeriod(10000);		
	Segundos_WriteCompareValue(0);
	Segundos_Start();
	
	UART_Start(UART_PARITY_NONE);
}	

	
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
		inici=1;
		if(coms==9) Ejecucion();
		//Dejo espacio en caso de querer implementar el testeo del microfo a traves de la UART
	}
}

//******************************************************************************
//******************************************************************************

//Funcion que recibira las tranmision de la UART y las asignara a las diferentes
//variables para poderlas usar en nuestro programa

void Ejecucion()
{
	unsigned double real, film;
	

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

char Dato()
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

//Funcion que gestionara los tipos de disparos al activarse dependiendo de  la informacion
//de las variables que le hemos mandado actuara de una manera u otra

void Tipodisparo()
{
	if(inici==1)
	{
		if(Cam1==1) Unico();
		else if(Cam1==1) Unico();
		inici=0;
	}
	if(listo_int1==1 && Cam1==2) Intervalometro(1);
	if(listo_int2==1 && Cam2==2) Intervalometro(2);
	if(listo_tl1==1 && Cam1==3) TimeLapse(1);
	if(listo_tl2==1 && Cam2==3) TimeLapse(2);
	if(listo_int1==0 && listo_int2==0 && listo_tl1==0 && listo_tl2==0) Reset();
}

//******************************************************************************
//******************************************************************************

//Funcion que realiza un disparo unico de camara/s
void Disparo_camara(char disparo_camara_numero)
{	
	int x;
	//Activación de las salidas
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
	
	//Desactivación de las salidas
	PRT2DR=PRT2DR & 0xFA;			//desactivar cam1
	PRT2DR=PRT2DR & 0xAF;			//desactivar cam2
}


//******************************************************************************
//******************************************************************************


//Funcion que realiza un disparo de flash
void Disparo_flash(char disparo_flash_numero)
{	
	int x;
	//Activación de las salidas
	if (disparo_flash_numero==1) PRT0DR=PRT0DR | 0x01;	
	if (disparo_flash_numero==2) PRT0DR=PRT0DR | 0x04;	
	if (disparo_flash_numero==3) PRT0DR=PRT0DR | 0x10;	
	if (disparo_flash_numero==4) PRT0DR=PRT0DR | 0x40;	
	
	//Perdida de tiempo para activar salidas
	for(x=0;x<300;x++);
	
	//Desactivación de las salidas
	PRT0DR=PRT0DR & 0xAA;
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
	Reset();
}

//******************************************************************************
//******************************************************************************

//Funcion de Intevalometro

void Intervalometro(char camara)
{
	int x;
	
	// A la espera de la conf 
	if()
}

//******************************************************************************
//******************************************************************************

//Funcion de Intevalometro

void TimeLapse(char camara)
{
	int x;
	
	// A la espera de la conf
	//Inicio();  ??
}

//******************************************************************************
//******************************************************************************

//Funcion de Intevalometro

void Reset()
{
	int x;
	
	// A la espera de la conf
	//Inicio();  ??
}