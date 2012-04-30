// Programa del submenu Sistema, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC a l'hora de modificar especificacions del sistema

char pulsat,menu;

menu=1;
 
do
{
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString(">Conf. Sistema");
	LCD_Position(1,0);
	if(menu==1) LCD_PrCString("1-Luz LCD");
	elseif(menu==2) LCD_PrCString("2-Pitido interno");
	elseif(menu==3) LCD_PrCString("3-Led de marcha");
	pulsat=Pulsadors();
	if(pulsat==1)
	{
		if(menu++>3)	menu=1;
		else	menu++;
	}
	elseif(pulsat==3)
	{
			if(menu==1) Reali_LCD();
			elseif(menu==2)	Buzzer();
			elseif(menu==3)	Ali_Led();
	}
	elseif(pulsat==2)
	{	
		if(menu--<1)	menu=3;
			else	menu--;
	}
}while(pulsat=!4)