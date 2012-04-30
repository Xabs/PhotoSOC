
// Funcion que hace sonar el pitido en el caso de que este activado en el 
//menu del Zumbador, en caso contrario no entrara a hacer esta funcion

void Pitido()
{				
	int xx;

		PRT0DR=PRT0DR | 0x10;
		for(xx=0;xx<5000;xx++);
		PRT0DR=PRT0DR & 0xEF;
}
