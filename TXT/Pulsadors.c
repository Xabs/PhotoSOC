// Funcio per detectar si un pulsdor ha sigut pitjat la cual retornara un valor entre 0 i 3
//  que farem correspondre amb una accio o una altre.
	// retorn 0 --> pulsacio curta del boto groc
	// retorn 1 --> pulsacio llarga del boto groc
	// retorn 2 --> pulsacio curta del boto vermell
	// retorn 3 --> pulsacio llarga del boto vermell

	
// falta determinar els ports i els bits on anira conectats els pulsdors **
char pulsG,pulsV,reteG,reteV,boto;
unsigned int x;

pulsG=0;
pulsV=0;
reteG=0;
reteV=0;
do
{
	if((PRT*DR & 0x**)==0)		// donara 0 en el cas de posar resistencias de pull-up
	{	
		for(x=0;x<100;x++);		// bucle perdua de temps
		pulsG=1;
		for(x=0;x<59999;x++)
		{
			if((PRT*DR & 0x**)==1) break;
			PRT*DR=0x**;			// recarga de resistencias de pull-up
		}
		if(x==60000) reteG=1;
	}
	if((PRT*DR & 0x**)==0)		// donara 0 en el cas de posar resistencias de pull-up
	{	
		for(x=0;x<100;x++);		// bucle perdua de temps
		pulsV=1;
		for(x=0;x<59999;x++)
		{
			if((PRT*DR & 0x**)==1) break;
			PRT*DR=0x**;			// recarga de resistencias de pull-up
		}
		if(x==60000) reteV=1;
	}
}while(pulsG==0 && pulsV==0);
if(pulsG==1)
{	if(reteG==1) boto=1;
	else	boto=0;
}
elseif(pulsV==1)
{	if(reteV==1) boto=3;
	else	boto=2;
}
return boto;