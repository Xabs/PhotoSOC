//Funci�n envia

//Prototipo
void envia(char);


//A colocar en rutina de inicializaci�n del aparato
Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
Timer8_WriteCompareValue(156/2);
Timer8_Start();
UART_Start(UART_PARITY_NONE);

//Funci�n
void envia (char envia_dato)
{
	char envia_recibe, envia_confirmacion, envia_contador;
	
	envia_confirmacion=0;					//Inicializaci�n de variables
	envia_contador=0;
	
	while (envia_confirmacion==0)
	{
		UART_PutChar(envia_dato);		//envia el dato introducido en la funci�n
		envia_recibe=UART_cGetChar();	//recibe un dato 
		
		if (envia_confirmacion==envia_recibe) envia_confirmacion=170;	//Si el dato enviado y recibido coinciden damos la comunicaci�n por correcta enviando un 170
		UART_PutChar(envia_confirmacion);							//Envio de la confirmacion (170 ACC, 0 NOK)
		envia_contador=envia_contador++;							//Suma 1 al contador que evita un envio infinito en caso de fallo
		if (envia_contador==10)envia_confirmacion=1;				//Si el envio falla 10 veces hacemos que salga del bucle
	}
}



//Funci�n recibe

//Prototipo
char recibe();


//A colocar en rutina de inicializaci�n del aparato
Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
Timer8_WriteCompareValue(156/2);
Timer8_Start();
UART_Start(UART_PARITY_NONE);

//Funci�n
char recibe ()
{
	char recibe_dato, recibe_confirmacion, recibe_contador;
	
	recibe_confirmacion=0;				//Inicializaci�n de variables
	recibe_contador=0;
	
	while (recibe_confirmacion==0)
	{
		recibe_dato=UART_cGetChar();	//recibe el dato
		UART_PutChar(recibe_dato);		//envia el dato recibido para su confirmaci�n
			
		recibe_confirmacion=UART_cGetChar();		//Recibe la confirmaci�n
		if (recibe_confirmacion==170) return recibe_dato;	//Si es ACC (170) la funci�n devuelve el dato recibido
		recibe_contador=recibe_contador++;			//Suma 1 al contador que evita una recepci�n infinita
		if (recibe_contador==10) return 255;				//Si la recepci�n falla 10 veces hacemos que salga del bucle dando un 255
	}
}