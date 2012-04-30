// Programa pricipal del projecte, aquest sera el programa inicial que s'iniciara al encendre el circuit
//	en ell el que farem sera saludar a la persona que a ences el circuit i esperar a pulsi algun boto 
//	per accedir al menu 

//	falta tot el tema de inicialitzar las comunicacions

char pulsat;

for(;;)
{
	LCD_Start();
	LCD_Init();
	PRT*DR=0x**;	// Conectem las resistencias de pull-up
	LCD_Position(0,1);
	LCD_PrCString("Bienvenidos");
	LCD_Position(1,3);
	LCD_PrCString("a  PhotoSoC");
	pulsat=Pulsadors();
	if(pulsat==0||pulsat==1||pulsat==2||pulsat==3) Menu();
}