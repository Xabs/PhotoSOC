
//Funcion de bucl que mira si alguna entreada del PSoC de treabajo 
//se activa segun lo especificado
//Devolvera el numero de la entrada que se haya activado

char Detectores()	
{
	sensor=0;
	PRT0DR=0xAA;	//Activo las resistencias de pull-up de los detectores
	do
	{
		if(Ent1==1)if(PRT0DR & 0x80==0x80)sensor=1;	//La entrada 1 consta de una barrera a 12V
													//entrada en HighZ y con un divisor de tension
		else if(Ent2==1)if(PRT0DR & 0x20==0x20)sensor=2;	//La entrada 2 consta de una barrera a 12V
															//entrada en HighZ y con un divisor de tension
		else if(Ent3==1)if(PRT0DR & 0x08==0x00)sensor=3;	//La entrada 3 consta de un microfono regulable
															//mediante programacion a 5V
															//entrada con conversor analogico/digital
		else if(Ent4==1)if(PRT0DR & 0x02==0x00)sensor=4;	//La entrada 4 consta de diferentes posibilidades 
															//laser, infrarojos, presion, etc a 5V
	}while(sensor==0);
	return sensor;
}