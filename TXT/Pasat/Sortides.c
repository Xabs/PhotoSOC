// Programa del submenu Salidas, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC per ejecutar las sortides, com opcions de dispar o flashos

char pulsat,menu;

menu=1;
 
do
{
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString(">Conf. Salidas");
	LCD_Position(1,0);
	if(menu==1) LCD_PrCString("1-Camara 1");
	elseif(menu==2) LCD_PrCString("2-Camara 2");
	elseif(menu==3) LCD_PrCString("3-Flash 1");
	elseif(menu==4) LCD_PrCString("4-Flash 2");
	elseif(menu==5)	LCD_PrCString("5-Flash 3");
	elseif(menu==6)	LCD_PrCString("6-Flash 4");
	pulsat=Pulsadors();
	if(pulsat==1)
	{
		if(menu++>6)	menu=1;
		else	menu++;
	}
	elseif(pulsat==3)
	{
			if(menu==1) Camara1();
			elseif(menu==2)	Camara2();
			elseif(menu==3)	Flash1();
			elseif(menu==4)	Flash2();
			elseif(menu==5)	Flash3();
			elseif(menu==6)	Flash4();
	}
	elseif(pulsat==2)
	{	
		if(menu--<1)	menu=6;
			else	menu--;
	}
}while(pulsat=!4)