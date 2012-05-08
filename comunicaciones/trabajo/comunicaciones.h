//Listado de defines utilzados en la libreria

//Variables globales de la libreria

//Prototipos de la libreria de comunicaciones
void envia (unsigned char envia_dato);
unsigned char recibe(void);


/************************************************************************************************************************
/  	LLAMADA: envia(dato a enviar)
/  	FUNCION: Envia mediante la UART el dato introducido
/  	ENTRADA: dato a introducir
/  	SALIDA: void
/	INICIALIZAR PERIFERICOS: UART
/  	OTROS: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/************************************************************************************************************************/
void envia (unsigned char envia_dato)
{
	unsigned char envia_recibe, envia_confirmacion, envia_contador;
	
	envia_confirmacion=48;					//Inicialización de variables
	envia_contador=0;
	
	while (envia_confirmacion==48)
	{
		UART_PutChar(envia_dato);		//envia el dato introducido en la función
		envia_recibe=UART_cGetChar();	//recibe un dato 
		
		if (envia_recibe==envia_dato) envia_confirmacion=49;	//Si el dato enviado y recibido coinciden damos la comunicación por correcta enviando un 170
		UART_PutChar(envia_confirmacion);							//Envio de la confirmacion (170 ACC, 0 NOK)
		envia_contador=envia_contador++;							//Suma 1 al contador que evita un envio infinito en caso de fallo
		if (envia_contador==10)envia_confirmacion=1;				//Si el envio falla 10 veces hacemos que salga del bucle
	}
}

//***********************************************************************************************************************
//***********************************************************************************************************************


/************************************************************************************************************************
/  	LLAMADA: recibe()
/  	FUNCION: Recibe mediante la UART un dato para guardarlo en una variable
/  	ENTRADA: void
/  	SALIDA: dato recibido o 255 en caso de fallo de recepción
/	INICIALIZAR PERIFERICOS: UART
/  	OTROS: Rutina realizada por Albert Sagol y Xavi Vicient para el proyecto de C4 y C9
/************************************************************************************************************************/
unsigned char recibe(void)
{
	unsigned char recibe_dato, recibe_confirmacion, recibe_contador;

	recibe_confirmacion=48;				//Inicialización de variables
	recibe_contador=0;
	
	while (recibe_confirmacion==48)
	{
		recibe_dato=UART_cGetChar();	//recibe el dato
		UART_PutChar(recibe_dato);		//envia el dato recibido para su confirmación
			
		recibe_confirmacion=UART_cGetChar();				//Recibe la confirmación
		if (recibe_confirmacion==49) return recibe_dato;	//Si es ACC (170) la función devuelve el dato recibido
		recibe_contador=recibe_contador++;					//Suma 1 al contador que evita una recepción infinita
		if (recibe_contador==10) recibe_confirmacion=1;		//Si la recepción falla 10 veces hacemos que salga del bucle dando un 255
	}
	return 255;
}