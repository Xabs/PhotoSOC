// Programa pricipal del projecte, aquest sera el programa inicial que s'iniciara al encendre el circuit
//	en ell el que farem sera saludar a la persona que a ences el circuit i esperar a pulsi algun boto 
//	per accedir al menu 

//	falta tot el tema de inicialitzar las comunicacions

for(;;)
{
	LCD_Start();
	LCD_Init();
	PRT0DR=0xA0;	// Conectem las resistencias de pull-up
	LCD_Position(0,1);
	LCD_PrCString("Bienvenidos");
	LCD_Position(1,3);
	LCD_PrCString("a  PhotoSoC");
	if(Pulsadors()!=0) Menu();		// Canviar nom de la rutina
}