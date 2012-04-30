//Listado de prototipos
char pulsador ();


// Funcio per detectar si un pulsador ha sigut pitjat la cual retornara un valor entre 0 i 3
//  que farem correspondre amb una accio o una altre.
	// retorn 1 --> pulsacio curta del boto groc
	// retorn 3 --> pulsacio llarga del boto groc
	// retorn 2 --> pulsacio curta del boto vermell
	// retorn 4 --> pulsacio llarga del boto vermell

char pulsador ();
{	
	#define amarillo 1
	#define rojo 2
	
	char pulsado=0;
	unsigned int x;
	
	PRT0DR=0xA0;	//Activamos resistencias de pull-up
	
	do
	{
		if((PRT0DR & 0xA0)==0x20)pulsado=amarillo;		// pulsado el botón amarillo (0.7) que dará un 0 (resistencias de pull-up) 
		if((PRT0DR & 0xA0)==0x80)pulsado=rojo;			// pulsado el botón rojo (0.5) que dará un 0 (resistencia de pull-up)
		if(pulsado!=0)
		{
			for(x=0;x<100;x++);							// bucle perdua de temps
			for(x=0;x<60000;x++)
			{
				if((PRT0DR & 0xA0)==0xA0) return pulsado;
				PRT0DR=0xA0;							// recarga de resistencias de pull-up
			}
			pulsado=pulsado+2;
		}
	}while(pulsado==0);
	
	return pulsado;
}