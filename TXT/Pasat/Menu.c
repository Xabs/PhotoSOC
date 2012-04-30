// Programa del menu principal, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC

char pulsat,menu;

menu=1;
 
do
{
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString(">Menu Principal");
	LCD_Position(1,0);
	if(menu==1) LCD_PrCString("1-Conf. Sensores");
	elseif(menu==2) LCD_PrCString("2-Conf. Salidas");
	elseif(menu==3) LCD_PrCString("3-Conf. Disparo");
	elseif(menu==4) LCD_PrCString("4-Ejecutar");
	elseif(menu==5)	LCD_PrCString("5-Conf. Sistema");
	pulsat=Pulsadors();
	if(pulsat==1)
	{
		if(menu++>5)	menu=1;
		else	menu++;
	}
	elseif(pulsat==3)
	{
			if(menu==1) Sensors();
			elseif(menu==2)	Sortides();
			elseif(menu==3)	Dispar();
			elseif(menu==4)	Executar();
			elseif(menu==5)	Sistema();
	}
	elseif(pulsat==2)
	{	
		if(menu--<1)	menu=5;
			else	menu--;
	}
}while(pulsat=!4)