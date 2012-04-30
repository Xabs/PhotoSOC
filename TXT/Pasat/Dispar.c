// Programa del submenu Disparo aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC para disparar las camaras

char pulsat,menu;

menu=1;
 
do
{
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString(">Conf. Disparo");
	LCD_Position(1,0);
	if(menu==1) LCD_PrCString("1-Unico");
	elseif(menu==2) LCD_PrCString("2-Intervalometro");
	elseif(menu==3) LCD_PrCString("3-Time Lapse");
	pulsat=Pulsadors();
	if(pulsat==1)
	{
		if(menu++>3)	menu=1;
		else	menu++;
	}
	elseif(pulsat==3)
	{
			if(menu==1) Unico();
			elseif(menu==2)	Intervalometro();
			elseif(menu==3) TimeLapse();
	}
	elseif(pulsat==2)
	{	
		if(menu--<1)	menu=3;
			else	menu--;
	}
}while(pulsat=!4)