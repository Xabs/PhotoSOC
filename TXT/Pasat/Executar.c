// Programa del submenu Ejecutar, aquest programa sera el que permetra
//	navegar per el menu i activar el mode de funcionament que 
//	tindra el PhotoSoC i que fara actualitzar i actuar el PSoC de treball

char pulsat,menu;

menu=1;
 
do
{
	LCD_Control(0x01);	//Borrat de pantalla
	LCD_PrCString(">Ejecutar");
	LCD_Position(1,0);
	LCD_PrCString("1-Ahora");
	pulsat=Pulsadors();
	elseif(pulsat==3)
	{
			if(menu==1) Ara();
	}
}while(pulsat=!4)