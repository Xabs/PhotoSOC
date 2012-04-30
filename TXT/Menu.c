// Programa del menu principal, aquest programa sera el que permetra
//	navegar per el menu i elegir entre las diferents funcions que 
//	tindra el PhotoSoC

char pulsat,menu;

if (menu!=1&&menu!=2&&menu!=3&&menu!=4)	menu=1;
 
do
{
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString(">Menu Principal");
	switch(menu)
	{
		case 1:
			LCD_Position(1,0);
			LCD_PrCString("1-Conf. Sensores");
			break;
		case 2:
			LCD_Position(1,0);
			LCD_PrCString("2-Conf. Salidas");
			break;
		case 3:
			LCD_Position(1,0);
			LCD_PrCString("3-Ejecutar");
			break;
		case 4:
			LCD_Position(1,0);
			LCD_PrCString("4-Conf. Sistema");
			break;
	}
	pulsat=Pulsadors();
	switch(pulsat)
	{
		case 0:
			if(menu++>4)	menu=1;
			else	menu++;
			break;
		case 1:
			switch(menu)
			{
				case 0:
					Sensores();
					break;
				case 1:
					Salidas();
					break;
				case 2:
					Ejecutar();
					break;
				case 3:
					Sistema();
					break;
			}
			break;
		case 2:
			if(menu--<1)	menu=4;
			else	menu--;
			break;
	}
}while(pulsat=!3)