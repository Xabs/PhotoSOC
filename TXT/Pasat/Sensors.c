// Programa del submenu Sensores, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC amb els seus diferents detectors

char pulsat,menu;

menu=1;
 
do
{
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString(">Conf. Sensores");
	LCD_Position(1,0);
	if(menu==1) LCD_PrCString("1-Entrada 1");
	elseif(menu==2) LCD_PrCString("2-Entrada 2");
	elseif(menu==3) LCD_PrCString("3-Entrada 3");
	elseif(menu==4) LCD_PrCString("4-Entrada 4");
	pulsat=Pulsadors();
	if(pulsat==1)
	{
		if(menu++>4)	menu=1;
		else	menu++;
	}
	elseif(pulsat==3)
	{
			if(menu==1) Entrada1();
			elseif(menu==2)	Entrada2();
			elseif(menu==3)	Entrada3();
			elseif(menu==4)	Entrada4();
	}
	elseif(pulsat==2)
	{	
		if(menu--<1)	menu=4;
			else	menu--;
	}
}while(pulsat=!4)