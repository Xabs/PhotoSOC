	cpu LMM
	.module main.c
	.area data(ram, con, rel)
_Luz_LCD::
	.byte 0
	.dbfile ./terminal.h
	.dbsym e Luz_LCD _Luz_LCD c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Buzzer::
	.byte 0
	.dbsym e Buzzer _Buzzer c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Alimentacion::
	.byte 0
	.dbsym e Alimentacion _Alimentacion c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Interrupcion::
	.byte 1
	.dbsym e Interrupcion _Interrupcion c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Ent1::
	.byte 0
	.dbsym e Ent1 _Ent1 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Ent2::
	.byte 0
	.dbsym e Ent2 _Ent2 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Ent3::
	.byte 0
	.dbsym e Ent3 _Ent3 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Ent4::
	.byte 0
	.dbsym e Ent4 _Ent4 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Fla1::
	.byte 0
	.dbsym e Fla1 _Fla1 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Fla2::
	.byte 0
	.dbsym e Fla2 _Fla2 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Fla3::
	.byte 0
	.dbsym e Fla3 _Fla3 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Fla4::
	.byte 0
	.dbsym e Fla4 _Fla4 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Cam1::
	.byte 0
	.dbsym e Cam1 _Cam1 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Cam2::
	.byte 0
	.dbsym e Cam2 _Cam2 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Inter1::
	.byte 0
	.dbsym e Inter1 _Inter1 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Tilap1::
	.byte 0
	.dbsym e Tilap1 _Tilap1 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Inter2::
	.byte 0
	.dbsym e Inter2 _Inter2 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Tilap2::
	.byte 0
	.dbsym e Tilap2 _Tilap2 c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area text(rom, con, rel)
	.dbfile ./terminal.h
	.dbfunc e bucle_temp _bucle_temp fV
;              x -> X+0
_bucle_temp::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 52
; //----------------------------------------------------------------//
; //     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
; //                   By Albert Sagol & Xavi Vicient			      //
; //                 PhotoSoC - Controlador fotográfico		  	  //
; //----------------------------------------------------------------//
; 
; #include <m8c.h>        // part specific constants and macros
; #include "PSoCAPI.h"    // PSoC API definitions for all User Modules
; #include "stdlib.h"
; #include "terminal.h"	// Libreria creada por Albert y Xavi para el proyecto
; #pragma interrupt_handler PATATA;	//Interrupcion para el apagado de LCD
; 
; void main()
; {	char x;
; 	int xx;
; 
; //- Inicializacion de parametros basicos del sistema al encender	
; 	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
; 	Timer8_WriteCompareValue(156/2);
; 	Timer8_Start();
; 	
; 	M8C_EnableGInt;
; 	Timer1seg_EnableInt();
; 	
; 	LCD_Start();
; 	LCD_Init();
; 
; 	UART_Start(UART_PARITY_NONE);
; 	PRT0DR=0xA0;	// Conectem las resistencias de pull-up
; 
; //- Inicializacion de parametros modificables al encender
; 	PRT0DR=PRT0DR & 0xE1;	//Apago la alrma del Buzzer, Realimentacion de LCD, Led de alimentacion y la pata de reset
; 							//Aprovechamos para conectar las resistencias de pull-up
; 	
; 	
; 	for (;;) Principal();		//Programa principal del PSoC terminal del PhotoSOC
; 		
; 		
; 		/* Elementos de testeo o para utilizar
; 		
; 		- implementar como realimentacion del LCD
; 		PRT2DR=PRT2DR | 0x80;		//reali del LCD
; 		
; 		- Comprovacion de comunicacion con UART y que lo muestre por el LCD
; 		UART_CPutString("");	//Para cadenas de carateres 
; 		UART_PutChar();			//Para valores tipo char
; 		x=UART_cGetChar();  //Esta se espera a que llegue un byte. Ver tambien UART_cReadChar()
; 		LCD_WriteData(x);
; 		
; 		- Saber si ha llegado a cierto punto
; 		LCD_Control(0x01);
; 		LCD_PrCString("prueba");
	.dbline 55
	mov [X+1],0
	mov [X+0],0
	xjmp L5
L2:
	.dbline 55
L3:
	.dbline 55
	inc [X+1]
	adc [X+0],0
L5:
	.dbline 55
; 		for(x=0;x<50000;x++);
; 		
; 		- Detectar cierto numero y que lo muestre por el LCD		
	mov REG[0xd0],>__r0
	mov A,[X+1]
	mov [__r3],A
	mov A,[X+0]
	mov [__r2],A
	mov A,[__r3]
	sub A,-72
	mov A,[__r2]
	sbb A,-120
	mov A,0
	sbb A,0
	mov A,0
	xor A,-128
	sbb A,(0 ^ 0x80)
	jc L2
X0:
	.dbline -2
	.dbline 56
; 		LCD_Control(0x01);
L1:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 i
	.dbend
	.dbfunc e Pitido _Pitido fV
;             xx -> X+0
_Pitido::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 65
; 		LCD_WriteData(+48);
; 		for(x=0;x<50000;x++);
; 		*/		
; }
; }
; }
; }
; }
; }
	.dbline 68
; }
; }
; }
	or REG[ 0],8
	.dbline 69
	mov [X+1],0
	mov [X+0],0
L7:
	.dbline 69
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
L8:
	.dbline 69
; }
	inc [X+1]
	adc [X+0],0
	.dbline 69
	mov A,[X+1]
	sub A,-96
	mov A,[X+0]
	xor A,-128
	sbb A,(15 ^ 0x80)
	jc L7
X1:
	.dbline 70
; }
	and REG[ 0],-9
	.dbline -2
	.dbline 71
; }
L6:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l xx 0 I
	.dbend
	.dbfunc e Reset_PdT _Reset_PdT fV
;              x -> X+0
_Reset_PdT::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 80
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 83
; }
; }
; }
	or REG[ 0],4
	.dbline 84
	mov [X+1],0
	mov [X+0],0
L12:
	.dbline 84
L13:
	.dbline 84
; }
	inc [X+1]
	adc [X+0],0
	.dbline 84
	mov A,[X+1]
	sub A,-12
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L12
X2:
	.dbline 85
; }
	and REG[ 0],-5
	.dbline 86
	mov [X+1],0
	mov [X+0],0
L16:
	.dbline 86
L17:
	.dbline 86
; }
	inc [X+1]
	adc [X+0],0
	.dbline 86
	mov A,[X+1]
	sub A,-12
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L16
X3:
	.dbline -2
	.dbline 87
; }
L11:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 I
	.dbend
	.dbfunc e PATATA _PATATA fV
_PATATA::
	.dbline -1
	.dbline 95
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 96
; }
	mov REG[0xd0],>_Interrupcion
	mov [_Interrupcion],0
	.dbline 97
; }
	xcall _Trabajando
	.dbline -2
	.dbline 98
; }
L20:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Pulsador _Pulsador fc
;          aviso -> X+3
;        pulsado -> X+2
;              x -> X+0
_Pulsador::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 111
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 115
; }
; }
; }
; }
	mov [X+2],0
L22:
	.dbline 119
; }
; }
; }
; }
	.dbline 120
; }
	push X
	xcall _UART_cReadChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+3],A
	.dbline 121
; }
	cmp [X+3],-1
	jnz L25
	.dbline 121
L25:
	.dbline 122
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],32
	jnz L27
	.dbline 122
	mov [X+2],1
L27:
	.dbline 123
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-128
	jnz L29
	.dbline 123
	mov [X+2],2
L29:
	.dbline 124
; }
	cmp [X+2],0
	jz L31
	.dbline 125
; }
	.dbline 126
	mov [X+1],0
	mov [X+0],0
	xjmp L36
L33:
	.dbline 126
L34:
	.dbline 126
	inc [X+1]
	adc [X+0],0
L36:
	.dbline 126
; }
	mov A,[X+1]
	sub A,100
	mov A,[X+0]
	sbb A,0
	jc L33
X4:
	.dbline 127
; }
	mov [X+1],0
	mov [X+0],0
	xjmp L40
L37:
	.dbline 128
; }
	.dbline 129
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-96
	jnz L41
	.dbline 129
	mov A,[X+2]
	xjmp L21
L41:
	.dbline 130
	or REG[ 0],-96
	.dbline 131
L38:
	.dbline 127
	inc [X+1]
	adc [X+0],0
L40:
	.dbline 127
	mov A,[X+1]
	sub A,48
	mov A,[X+0]
	sbb A,117
	jc L37
X5:
	.dbline 132
; }
; }
; }
	add [X+2],2
	.dbline 133
; }
L31:
	.dbline 134
L23:
	.dbline 134
; }
	cmp [X+2],0
	jz L22
	.dbline 135
; }
	mov A,[X+2]
	mov REG[0xd0],>__r0
	.dbline -2
L21:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l aviso 3 c
	.dbsym l pulsado 2 c
	.dbsym l x 0 i
	.dbend
	.dbfunc e Principal _Principal fV
;              x -> X+1
;          boton -> X+0
_Principal::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 146
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 150
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 151
; }
	mov X,1
	mov A,0
	xcall _LCD_Position
	.dbline 152
; }
	mov A,>L44
	push A
	mov A,<L44
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 153
; }
	mov X,3
	mov A,1
	xcall _LCD_Position
	.dbline 154
; }
	mov A,>L45
	push A
	mov A,<L45
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 155
; }
	xcall _bucle_temp
	.dbline 156
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 157
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L46
	.dbline 157
	xcall _Pitido
L46:
	.dbline 158
	cmp [X+0],0
	jz L48
	.dbline 159
	.dbline 160
	xcall _Menu
	.dbline 161
L48:
	.dbline -2
	.dbline 162
; }
; }
; }
; }
; }
L43:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l boton 0 c
	.dbend
	.dbfunc e Menu _Menu fV
;              x -> X+2
;         pulsat -> X+1
;          index -> X+0
_Menu::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 172
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 173
; }
	mov [X+0],1
L51:
	.dbline 177
; }
; }
; }
; }
	.dbline 178
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 179
; }
	mov A,>L54
	push A
	mov A,<L54
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 180
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 181
; }
	cmp [X+0],1
	jnz L55
	.dbline 181
	push X
	mov A,>L57
	push A
	mov A,<L57
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L56
L55:
	.dbline 182
; }
	cmp [X+0],2
	jnz L58
	.dbline 182
	push X
	mov A,>L60
	push A
	mov A,<L60
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L59
L58:
	.dbline 183
; }
	cmp [X+0],3
	jnz L61
	.dbline 183
	push X
	mov A,>L63
	push A
	mov A,<L63
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L62
L61:
	.dbline 184
; }
	cmp [X+0],4
	jnz L64
	.dbline 184
	push X
	mov A,>L66
	push A
	mov A,<L66
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L65
L64:
	.dbline 185
; }
	cmp [X+0],5
	jnz L67
	.dbline 185
	push X
	mov A,>L69
	push A
	mov A,<L69
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L67:
L65:
L62:
L59:
L56:
	.dbline 186
; }
	xcall _bucle_temp
	.dbline 187
; }
	xcall _Pulsador
	mov [X+1],A
	.dbline 188
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L70
	.dbline 188
	xcall _Pitido
L70:
	.dbline 189
; }
	cmp [X+1],1
	jnz L72
	.dbline 190
; }
	.dbline 191
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	add A,1
	mov [__r0],A
	mov A,5
	cmp A,[__r0]
	jnc L74
X6:
	.dbline 191
	mov [X+0],1
	xjmp L73
L74:
	.dbline 192
; }
	inc [X+0]
	.dbline 193
; }
	xjmp L73
L72:
	.dbline 194
; }
	cmp [X+1],3
	jnz L76
	.dbline 195
; }
	.dbline 196
; }
	cmp [X+0],1
	jnz L78
	.dbline 196
	xcall _Sensors
	xjmp L77
L78:
	.dbline 197
; }
	cmp [X+0],2
	jnz L80
	.dbline 197
	xcall _Flashes
	xjmp L77
L80:
	.dbline 198
; }
	cmp [X+0],3
	jnz L82
	.dbline 198
	xcall _Dispar
	xjmp L77
L82:
	.dbline 199
; }
	cmp [X+0],4
	jnz L84
	.dbline 199
	xcall _Executar
	xjmp L77
L84:
	.dbline 200
; }
	cmp [X+0],5
	jnz L77
	.dbline 200
	xcall _Sistema
	.dbline 201
; }
	xjmp L77
L76:
	.dbline 202
; }
	cmp [X+1],2
	jnz L88
	.dbline 203
; }
	.dbline 204
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	sub A,1
	cmp A,1
	jnc L90
X7:
	.dbline 204
	mov [X+0],5
	xjmp L91
L90:
	.dbline 205
; }
	dec [X+0]
L91:
	.dbline 206
; }
L88:
L77:
L73:
	.dbline 207
L52:
	.dbline 207
; }
	cmp [X+1],4
	jnz L51
	.dbline -2
	.dbline 208
; }
L50:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l pulsat 1 c
	.dbsym l index 0 c
	.dbend
	.dbfunc e Sensors _Sensors fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
_Sensors::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 218
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 219
; }
	mov [X+1],1
L93:
	.dbline 223
; }
; }
; }
; }
	.dbline 224
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 225
; }
	mov A,>L96
	push A
	mov A,<L96
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 226
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 227
; }
	cmp [X+1],1
	jnz L97
	.dbline 227
	push X
	mov A,>L99
	push A
	mov A,<L99
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L98
L97:
	.dbline 228
; }
	cmp [X+1],2
	jnz L100
	.dbline 228
	push X
	mov A,>L102
	push A
	mov A,<L102
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L101
L100:
	.dbline 229
; }
	cmp [X+1],3
	jnz L103
	.dbline 229
	push X
	mov A,>L105
	push A
	mov A,<L105
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L104
L103:
	.dbline 230
; }
	cmp [X+1],4
	jnz L106
	.dbline 230
	push X
	mov A,>L108
	push A
	mov A,<L108
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L106:
L104:
L101:
L98:
	.dbline 231
; }
	xcall _bucle_temp
	.dbline 232
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 233
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L109
	.dbline 233
	xcall _Pitido
L109:
	.dbline 234
; }
	cmp [X+0],1
	jnz L111
	.dbline 235
; }
	.dbline 236
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L113
X8:
	.dbline 236
	mov [X+1],1
	xjmp L112
L113:
	.dbline 237
; }
	inc [X+1]
	.dbline 238
; }
	xjmp L112
L111:
	.dbline 239
; }
	cmp [X+0],3
	jnz L115
	.dbline 240
; }
	.dbline 241
; }
	cmp [X+1],1
	jnz L117
	.dbline 241
	xcall _Entrada1
	xjmp L116
L117:
	.dbline 242
; }
	cmp [X+1],2
	jnz L119
	.dbline 242
	xcall _Entrada2
	xjmp L116
L119:
	.dbline 243
; }
	cmp [X+1],3
	jnz L121
	.dbline 243
	xcall _Entrada3
	xjmp L116
L121:
	.dbline 244
; }
	cmp [X+1],4
	jnz L116
	.dbline 244
	xcall _Entrada4
	.dbline 245
; }
	xjmp L116
L115:
	.dbline 246
; }
	cmp [X+0],2
	jnz L125
	.dbline 247
; }
	.dbline 248
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L127
X9:
	.dbline 248
	mov [X+1],4
	xjmp L128
L127:
	.dbline 249
; }
	dec [X+1]
L128:
	.dbline 250
; }
L125:
L116:
L112:
	.dbline 251
L94:
	.dbline 251
; }
	cmp [X+0],4
	jnz L93
	.dbline -2
	.dbline 252
; }
L92:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Entrada1 _Entrada1 fV
;              x -> X+1
;         pulsat -> X+0
_Entrada1::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 262
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
L130:
	.dbline 267
; }
; }
; }
; }
; }
	.dbline 268
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 269
; }
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 270
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 271
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L134
	.dbline 271
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L135
L134:
	.dbline 272
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L135:
	.dbline 273
; }
	xcall _bucle_temp
	.dbline 274
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 275
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L138
	.dbline 275
	xcall _Pitido
L138:
	.dbline 276
; }
	cmp [X+0],1
	jz L142
	cmp [X+0],2
	jnz L140
L142:
	.dbline 277
; }
	.dbline 278
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 279
; }
	xjmp L141
L140:
	.dbline 280
; }
	cmp [X+0],3
	jnz L143
	.dbline 281
; }
	.dbline 282
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L145
	.dbline 282
	mov [_Ent1],1
	xjmp L146
L145:
	.dbline 283
; }
	mov REG[0xd0],>_Ent1
	mov [_Ent1],0
L146:
	.dbline 284
; }
L143:
L141:
	.dbline 285
L131:
	.dbline 285
; }
	cmp [X+0],4
	jnz L130
	.dbline -2
	.dbline 286
; }
L129:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Entrada2 _Entrada2 fV
;              x -> X+1
;         pulsat -> X+0
_Entrada2::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 296
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
L148:
	.dbline 301
; }
; }
; }
; }
; }
	.dbline 302
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 303
; }
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 304
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 305
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L152
	.dbline 305
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L153
L152:
	.dbline 306
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L153:
	.dbline 307
; }
	xcall _bucle_temp
	.dbline 308
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 309
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L154
	.dbline 309
	xcall _Pitido
L154:
	.dbline 310
; }
	cmp [X+0],1
	jz L158
	cmp [X+0],2
	jnz L156
L158:
	.dbline 311
; }
	.dbline 312
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 313
; }
	xjmp L157
L156:
	.dbline 314
; }
	cmp [X+0],3
	jnz L159
	.dbline 315
; }
	.dbline 316
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L161
	.dbline 316
	mov [_Ent2],1
	xjmp L162
L161:
	.dbline 317
; }
	mov REG[0xd0],>_Ent2
	mov [_Ent2],0
L162:
	.dbline 318
; }
L159:
L157:
	.dbline 319
L149:
	.dbline 319
; }
	cmp [X+0],4
	jnz L148
	.dbline -2
	.dbline 320
; }
L147:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Entrada3 _Entrada3 fV
;              x -> X+1
;         pulsat -> X+0
_Entrada3::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 330
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
L164:
	.dbline 335
; }
; }
; }
; }
; }
	.dbline 336
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 337
; }
	mov A,>L167
	push A
	mov A,<L167
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 338
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 339
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L168
	.dbline 339
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L169
L168:
	.dbline 340
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L169:
	.dbline 341
; }
	xcall _bucle_temp
	.dbline 342
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 343
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L170
	.dbline 343
	xcall _Pitido
L170:
	.dbline 344
; }
	cmp [X+0],1
	jz L174
	cmp [X+0],2
	jnz L172
L174:
	.dbline 345
; }
	.dbline 346
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 347
; }
	xjmp L173
L172:
	.dbline 348
; }
	cmp [X+0],3
	jnz L175
	.dbline 349
; }
	.dbline 350
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L177
	.dbline 350
	mov [_Ent3],1
	xjmp L178
L177:
	.dbline 351
; }
	mov REG[0xd0],>_Ent3
	mov [_Ent3],0
L178:
	.dbline 352
; }
L175:
L173:
	.dbline 353
L165:
	.dbline 353
; }
	cmp [X+0],4
	jnz L164
	.dbline -2
	.dbline 354
; }
L163:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Entrada4 _Entrada4 fV
;              x -> X+1
;         pulsat -> X+0
_Entrada4::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 364
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
L180:
	.dbline 369
; }
; }
; }
; }
; }
	.dbline 370
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 371
; }
	mov A,>L183
	push A
	mov A,<L183
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 372
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 373
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L184
	.dbline 373
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L185
L184:
	.dbline 374
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L185:
	.dbline 375
; }
	xcall _bucle_temp
	.dbline 376
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 377
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L186
	.dbline 377
	xcall _Pitido
L186:
	.dbline 378
; }
	cmp [X+0],1
	jz L190
	cmp [X+0],2
	jnz L188
L190:
	.dbline 379
; }
	.dbline 380
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 381
; }
	xjmp L189
L188:
	.dbline 382
; }
	cmp [X+0],3
	jnz L191
	.dbline 383
; }
	.dbline 384
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L193
	.dbline 384
	mov [_Ent4],1
	xjmp L194
L193:
	.dbline 385
; }
	mov REG[0xd0],>_Ent4
	mov [_Ent4],0
L194:
	.dbline 386
; }
L191:
L189:
	.dbline 387
L181:
	.dbline 387
; }
	cmp [X+0],4
	jnz L180
	.dbline -2
	.dbline 388
; }
L179:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Flashes _Flashes fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
_Flashes::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 398
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 399
; }
	mov [X+1],1
L196:
	.dbline 403
; }
; }
; }
; }
	.dbline 404
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 405
; }
	mov A,>L199
	push A
	mov A,<L199
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 406
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 407
; }
	cmp [X+1],1
	jnz L200
	.dbline 408
; }
	.dbline 409
; }
	push X
	mov A,>L202
	push A
	mov A,<L202
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 410
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L203
	.dbline 410
	push X
	mov A,>L205
	push A
	mov A,<L205
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L201
L203:
	.dbline 411
; }
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 412
; }
	xjmp L201
L200:
	.dbline 413
; }
	cmp [X+1],2
	jnz L207
	.dbline 414
; }
	.dbline 415
; }
	push X
	mov A,>L209
	push A
	mov A,<L209
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 416
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L210
	.dbline 416
	push X
	mov A,>L205
	push A
	mov A,<L205
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L208
L210:
	.dbline 417
; }
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 418
; }
	xjmp L208
L207:
	.dbline 419
; }
	cmp [X+1],3
	jnz L212
	.dbline 420
; }
	.dbline 422
; }
; }
	push X
	mov A,>L214
	push A
	mov A,<L214
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 423
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L215
	.dbline 423
	push X
	mov A,>L205
	push A
	mov A,<L205
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L213
L215:
	.dbline 424
; }
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 425
; }
	xjmp L213
L212:
	.dbline 426
; }
	cmp [X+1],4
	jnz L217
	.dbline 427
; }
	.dbline 428
; }
	push X
	mov A,>L219
	push A
	mov A,<L219
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 429
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L220
	.dbline 429
	push X
	mov A,>L222
	push A
	mov A,<L222
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L221
L220:
	.dbline 430
; }
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L221:
	.dbline 431
; }
L217:
L213:
L208:
L201:
	.dbline 432
; }
	xcall _bucle_temp
	.dbline 433
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 434
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L223
	.dbline 434
	xcall _Pitido
L223:
	.dbline 435
; }
	cmp [X+0],1
	jnz L225
	.dbline 436
; }
	.dbline 437
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L227
X10:
	.dbline 437
	mov [X+1],1
	xjmp L226
L227:
	.dbline 438
; }
	inc [X+1]
	.dbline 439
; }
	xjmp L226
L225:
	.dbline 440
; }
	cmp [X+0],3
	jnz L229
	.dbline 441
; }
	.dbline 442
; }
	cmp [X+1],1
	jnz L231
	.dbline 442
	xcall _Flash1
	xjmp L230
L231:
	.dbline 443
; }
	cmp [X+1],2
	jnz L233
	.dbline 443
	xcall _Flash2
	xjmp L230
L233:
	.dbline 444
; }
	cmp [X+1],3
	jnz L235
	.dbline 444
	xcall _Flash3
	xjmp L230
L235:
	.dbline 445
; }
	cmp [X+1],4
	jnz L230
	.dbline 445
	xcall _Flash4
	.dbline 446
; }
	xjmp L230
L229:
	.dbline 447
; }
	cmp [X+0],2
	jnz L239
	.dbline 448
; }
	.dbline 449
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L241
X11:
	.dbline 449
	mov [X+1],4
	xjmp L242
L241:
	.dbline 450
; }
	dec [X+1]
L242:
	.dbline 451
; }
L239:
L230:
L226:
	.dbline 452
L197:
	.dbline 452
; }
	cmp [X+0],4
	jnz L196
	.dbline -2
	.dbline 453
; }
L195:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Flash1 _Flash1 fV
;              x -> X+1
;         pulsat -> X+0
_Flash1::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 462
; }
; }
; }
; }
; }
; }
; }
; }
; }
L244:
	.dbline 467
; }
; }
; }
; }
; }
	.dbline 468
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 469
; }
	mov A,>L247
	push A
	mov A,<L247
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 470
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 471
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L248
	.dbline 471
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L249
L248:
	.dbline 472
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L249:
	.dbline 473
; }
	xcall _bucle_temp
	.dbline 474
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 475
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L250
	.dbline 475
	xcall _Pitido
L250:
	.dbline 476
; }
	cmp [X+0],1
	jz L254
	cmp [X+0],2
	jnz L252
L254:
	.dbline 477
; }
	.dbline 478
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 479
; }
	xjmp L253
L252:
	.dbline 480
; }
	cmp [X+0],3
	jnz L255
	.dbline 481
; }
	.dbline 482
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L257
	.dbline 482
	mov [_Fla1],1
	xjmp L258
L257:
	.dbline 483
; }
	mov REG[0xd0],>_Fla1
	mov [_Fla1],0
L258:
	.dbline 484
; }
L255:
L253:
	.dbline 485
L245:
	.dbline 485
; }
	cmp [X+0],4
	jnz L244
	.dbline -2
	.dbline 486
; }
L243:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Flash2 _Flash2 fV
;              x -> X+1
;         pulsat -> X+0
_Flash2::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 496
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
L260:
	.dbline 501
; }
; }
; }
; }
; }
	.dbline 502
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 503
; }
	mov A,>L263
	push A
	mov A,<L263
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 504
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 505
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L264
	.dbline 505
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L265
L264:
	.dbline 506
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L265:
	.dbline 507
; }
	xcall _bucle_temp
	.dbline 508
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 509
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L266
	.dbline 509
	xcall _Pitido
L266:
	.dbline 510
; }
	cmp [X+0],1
	jz L270
	cmp [X+0],2
	jnz L268
L270:
	.dbline 511
; }
	.dbline 512
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 513
; }
	xjmp L269
L268:
	.dbline 514
; }
	cmp [X+0],3
	jnz L271
	.dbline 515
; }
	.dbline 516
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L273
	.dbline 516
	mov [_Fla2],1
	xjmp L274
L273:
	.dbline 517
; }
	mov REG[0xd0],>_Fla2
	mov [_Fla2],0
L274:
	.dbline 518
; }
L271:
L269:
	.dbline 519
L261:
	.dbline 519
; }
	cmp [X+0],4
	jnz L260
	.dbline -2
	.dbline 520
; }
L259:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Flash3 _Flash3 fV
;              x -> X+1
;         pulsat -> X+0
_Flash3::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 529
; }
; }
; }
; }
; }
; }
; }
; }
; }
L276:
	.dbline 534
; }
; }
; }
; }
; }
	.dbline 535
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 536
; }
	mov A,>L279
	push A
	mov A,<L279
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 537
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 538
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L280
	.dbline 538
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L281
L280:
	.dbline 539
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L281:
	.dbline 540
; }
	xcall _bucle_temp
	.dbline 541
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 542
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L282
	.dbline 542
	xcall _Pitido
L282:
	.dbline 543
; }
	cmp [X+0],1
	jz L286
	cmp [X+0],2
	jnz L284
L286:
	.dbline 544
; }
	.dbline 545
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 546
; }
	xjmp L285
L284:
	.dbline 547
; }
	cmp [X+0],3
	jnz L287
	.dbline 548
; }
	.dbline 549
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L289
	.dbline 549
	mov [_Fla3],1
	xjmp L290
L289:
	.dbline 550
; }
	mov REG[0xd0],>_Fla3
	mov [_Fla3],0
L290:
	.dbline 551
; }
L287:
L285:
	.dbline 552
L277:
	.dbline 552
; }
	cmp [X+0],4
	jnz L276
	.dbline -2
	.dbline 553
; }
L275:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Flash4 _Flash4 fV
;              x -> X+1
;         pulsat -> X+0
_Flash4::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 562
; }
; }
; }
; }
; }
; }
; }
; }
; }
L292:
	.dbline 567
; }
; }
; }
; }
; }
	.dbline 568
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 569
; }
	mov A,>L295
	push A
	mov A,<L295
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 570
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 571
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L296
	.dbline 571
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L297
L296:
	.dbline 572
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L297:
	.dbline 573
; }
	xcall _bucle_temp
	.dbline 574
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 575
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L298
	.dbline 575
	xcall _Pitido
L298:
	.dbline 576
; }
	cmp [X+0],1
	jz L302
	cmp [X+0],2
	jnz L300
L302:
	.dbline 577
; }
	.dbline 578
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 579
; }
	xjmp L301
L300:
	.dbline 580
; }
	cmp [X+0],3
	jnz L303
	.dbline 581
; }
	.dbline 582
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L305
	.dbline 582
	mov [_Fla4],1
	xjmp L306
L305:
	.dbline 583
; }
	mov REG[0xd0],>_Fla4
	mov [_Fla4],0
L306:
	.dbline 584
; }
L303:
L301:
	.dbline 585
L293:
	.dbline 585
; }
	cmp [X+0],4
	jnz L292
	.dbline -2
	.dbline 586
; }
L291:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Dispar _Dispar fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
_Dispar::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 596
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 598
; }
; }
	mov [X+1],1
L308:
	.dbline 602
; }
; }
; }
; }
	.dbline 603
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 604
; }
	mov A,>L311
	push A
	mov A,<L311
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 605
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 606
; }
	cmp [X+1],1
	jnz L312
	.dbline 606
	push X
	mov A,>L314
	push A
	mov A,<L314
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L313
L312:
	.dbline 607
; }
	cmp [X+1],2
	jnz L315
	.dbline 607
	push X
	mov A,>L317
	push A
	mov A,<L317
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L315:
L313:
	.dbline 608
; }
	xcall _bucle_temp
	.dbline 609
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 610
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L318
	.dbline 610
	xcall _Pitido
L318:
	.dbline 611
; }
	cmp [X+0],1
	jnz L320
	.dbline 612
; }
	.dbline 613
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L322
X12:
	.dbline 613
	mov [X+1],1
	xjmp L321
L322:
	.dbline 614
; }
	inc [X+1]
	.dbline 615
; }
	xjmp L321
L320:
	.dbline 616
; }
	cmp [X+0],3
	jnz L324
	.dbline 617
; }
	.dbline 618
; }
	cmp [X+1],1
	jnz L326
	.dbline 618
	xcall _Camara1
	xjmp L325
L326:
	.dbline 619
; }
	cmp [X+1],2
	jnz L325
	.dbline 619
	xcall _Camara2
	.dbline 620
; }
	xjmp L325
L324:
	.dbline 621
; }
	cmp [X+0],2
	jnz L330
	.dbline 622
; }
	.dbline 623
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L332
X13:
	.dbline 623
	mov [X+1],2
	xjmp L333
L332:
	.dbline 624
; }
	dec [X+1]
L333:
	.dbline 625
; }
L330:
L325:
L321:
	.dbline 626
L309:
	.dbline 626
; }
	cmp [X+0],4
	jnz L308
	.dbline -2
	.dbline 627
; }
L307:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Camara1 _Camara1 fV
;              x -> X+1
;         pulsat -> X+0
_Camara1::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 636
; }
; }
; }
; }
; }
; }
; }
; }
; }
L335:
	.dbline 641
; }
; }
; }
; }
; }
	.dbline 642
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 643
; }
	mov A,>L338
	push A
	mov A,<L338
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 644
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 645
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],0
	jnz L339
	.dbline 645
	push X
	mov A,>L341
	push A
	mov A,<L341
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L340
L339:
	.dbline 646
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L342
	.dbline 646
	push X
	mov A,>L344
	push A
	mov A,<L344
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L343
L342:
	.dbline 647
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L345
	.dbline 647
	push X
	mov A,>L347
	push A
	mov A,<L347
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L346
L345:
	.dbline 648
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L348
	.dbline 648
	push X
	mov A,>L350
	push A
	mov A,<L350
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L348:
L346:
L343:
L340:
	.dbline 649
; }
	xcall _bucle_temp
	.dbline 650
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 651
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L351
	.dbline 651
	xcall _Pitido
L351:
	.dbline 652
; }
	cmp [X+0],1
	jz L355
	cmp [X+0],2
	jnz L353
L355:
	.dbline 653
; }
	.dbline 654
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 655
; }
	xjmp L354
L353:
	.dbline 656
; }
	cmp [X+0],3
	jnz L356
	.dbline 657
; }
	.dbline 658
; }
	mov A,1
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 659
; }
L356:
L354:
	.dbline 660
L336:
	.dbline 660
; }
	cmp [X+0],4
	jnz L335
	.dbline -2
	.dbline 661
; }
L334:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Camara2 _Camara2 fV
;              x -> X+1
;         pulsat -> X+0
_Camara2::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 670
; }
; }
; }
; }
; }
; }
; }
; }
; }
L359:
	.dbline 675
; }
; }
; }
; }
; }
	.dbline 676
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 677
; }
	mov A,>L362
	push A
	mov A,<L362
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 678
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 679
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],0
	jnz L363
	.dbline 679
	push X
	mov A,>L341
	push A
	mov A,<L341
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L364
L363:
	.dbline 680
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L365
	.dbline 680
	push X
	mov A,>L344
	push A
	mov A,<L344
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L366
L365:
	.dbline 681
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L367
	.dbline 681
	push X
	mov A,>L347
	push A
	mov A,<L347
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L368
L367:
	.dbline 682
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L369
	.dbline 682
	push X
	mov A,>L350
	push A
	mov A,<L350
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L369:
L368:
L366:
L364:
	.dbline 683
; }
	xcall _bucle_temp
	.dbline 684
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 685
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L371
	.dbline 685
	xcall _Pitido
L371:
	.dbline 686
; }
	cmp [X+0],1
	jz L375
	cmp [X+0],2
	jnz L373
L375:
	.dbline 687
; }
	.dbline 688
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 689
; }
	xjmp L374
L373:
	.dbline 690
; }
	cmp [X+0],3
	jnz L376
	.dbline 691
; }
	.dbline 692
; }
	mov A,2
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 693
; }
L376:
L374:
	.dbline 694
L360:
	.dbline 694
; }
	cmp [X+0],4
	jnz L359
	.dbline -2
	.dbline 695
; }
L358:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Tipo_disp _Tipo_disp fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
;         camara -> X-4
_Tipo_disp::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 705
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 709
; }
; }
; }
; }
	cmp [X-4],1
	jnz L379
	.dbline 709
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	add A,1
	mov [X+1],A
	xjmp L380
L379:
	.dbline 710
; }
	cmp [X-4],2
	jnz L381
	.dbline 710
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	add A,1
	mov [X+1],A
L381:
L380:
L383:
	.dbline 713
; }
; }
; }
	.dbline 714
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 715
; }
	mov A,>L386
	push A
	mov A,<L386
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 716
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 717
; }
	cmp [X+1],1
	jnz L387
	.dbline 717
	push X
	mov A,>L341
	push A
	mov A,<L341
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L388
L387:
	.dbline 718
; }
	cmp [X+1],2
	jnz L389
	.dbline 718
	push X
	mov A,>L344
	push A
	mov A,<L344
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L390
L389:
	.dbline 719
; }
	cmp [X+1],3
	jnz L391
	.dbline 719
	push X
	mov A,>L347
	push A
	mov A,<L347
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L392
L391:
	.dbline 720
; }
	cmp [X+1],4
	jnz L393
	.dbline 720
	push X
	mov A,>L350
	push A
	mov A,<L350
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L393:
L392:
L390:
L388:
	.dbline 721
; }
	xcall _bucle_temp
	.dbline 722
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 723
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L395
	.dbline 723
	xcall _Pitido
L395:
	.dbline 724
; }
	cmp [X+0],1
	jnz L397
	.dbline 725
; }
	.dbline 726
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L399
X14:
	.dbline 726
	mov [X+1],1
	xjmp L398
L399:
	.dbline 727
; }
	inc [X+1]
	.dbline 728
; }
	xjmp L398
L397:
	.dbline 729
; }
	cmp [X+0],3
	jnz L401
	.dbline 730
; }
	.dbline 731
; }
	cmp [X-4],1
	jnz L403
	.dbline 731
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L404
L403:
	.dbline 732
; }
	cmp [X-4],2
	jnz L405
	.dbline 732
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
L405:
L404:
	.dbline 733
; }
	cmp [X+1],3
	jnz L407
	.dbline 733
	mov A,[X-4]
	push A
	xcall _Intervalometro
	add SP,-1
	xjmp L408
L407:
	.dbline 734
; }
	cmp [X+1],4
	jnz L409
	.dbline 734
	mov A,[X-4]
	push A
	xcall _TimeLapse
	add SP,-1
L409:
L408:
	.dbline 735
; }
	mov [X+0],4
	.dbline 736
; }
	xjmp L402
L401:
	.dbline 737
; }
	cmp [X+0],2
	jnz L411
	.dbline 738
; }
	.dbline 739
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L413
X15:
	.dbline 739
	mov [X+1],4
	xjmp L414
L413:
	.dbline 740
; }
	dec [X+1]
L414:
	.dbline 741
; }
L411:
L402:
L398:
	.dbline 742
L384:
	.dbline 742
; }
	cmp [X+0],4
	jnz L383
	.dbline -2
	.dbline 743
; }
L378:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbsym l camara -4 c
	.dbend
	.dbfunc e Intervalometro _Intervalometro fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
;         camara -> X-4
_Intervalometro::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 751
; }
; }
; }
; }
; }
; }
; }
; }
L416:
	.dbline 756
; }
; }
; }
; }
; }
	.dbline 757
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 758
; }
	mov A,>L419
	push A
	mov A,<L419
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 759
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 760
; }
	cmp [X+1],1
	jnz L420
	.dbline 760
	push X
	mov A,>L422
	push A
	mov A,<L422
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L421
L420:
	.dbline 761
; }
	cmp [X+1],2
	jnz L423
	.dbline 761
	push X
	mov A,>L425
	push A
	mov A,<L425
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L423:
L421:
	.dbline 762
; }
	xcall _bucle_temp
	.dbline 763
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 764
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L426
	.dbline 764
	xcall _Pitido
L426:
	.dbline 765
; }
	cmp [X+0],1
	jnz L428
	.dbline 766
; }
	.dbline 767
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L430
X16:
	.dbline 767
	mov [X+1],1
	xjmp L429
L430:
	.dbline 768
; }
	inc [X+1]
	.dbline 769
; }
	xjmp L429
L428:
	.dbline 770
; }
	cmp [X+0],3
	jnz L432
	.dbline 771
; }
	.dbline 772
; }
	cmp [X-4],1
	jnz L434
	.dbline 772
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L435
L434:
	.dbline 773
; }
	cmp [X-4],2
	jnz L436
	.dbline 773
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
L436:
L435:
	.dbline 774
; }
	mov [X+0],4
	.dbline 775
; }
	xjmp L433
L432:
	.dbline 776
; }
	cmp [X+0],2
	jnz L438
	.dbline 777
; }
	.dbline 778
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L440
X17:
	.dbline 778
	mov [X+1],2
	xjmp L441
L440:
	.dbline 779
; }
	dec [X+1]
L441:
	.dbline 780
; }
L438:
L433:
L429:
	.dbline 781
L417:
	.dbline 781
; }
	cmp [X+0],4
	jnz L416
	.dbline -2
	.dbline 783
; }
; }
L415:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbsym l camara -4 c
	.dbend
	.dbfunc e TimeLapse _TimeLapse fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
;         camara -> X-4
_TimeLapse::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 791
; }
; }
; }
; }
; }
; }
; }
; }
L443:
	.dbline 796
; }
; }
; }
; }
; }
	.dbline 797
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 798
; }
	mov A,>L419
	push A
	mov A,<L419
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 799
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 800
; }
	cmp [X+1],1
	jnz L446
	.dbline 800
	push X
	mov A,>L422
	push A
	mov A,<L422
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L447
L446:
	.dbline 801
; }
	cmp [X+1],2
	jnz L448
	.dbline 801
	push X
	mov A,>L425
	push A
	mov A,<L425
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L448:
L447:
	.dbline 802
; }
	xcall _bucle_temp
	.dbline 803
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 804
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L450
	.dbline 804
	xcall _Pitido
L450:
	.dbline 805
; }
	cmp [X+0],1
	jnz L452
	.dbline 806
; }
	.dbline 807
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L454
X18:
	.dbline 807
	mov [X+1],1
	xjmp L453
L454:
	.dbline 808
; }
	inc [X+1]
	.dbline 809
; }
	xjmp L453
L452:
	.dbline 810
; }
	cmp [X+0],3
	jnz L456
	.dbline 811
; }
	.dbline 812
; }
	cmp [X-4],1
	jnz L458
	.dbline 812
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L459
L458:
	.dbline 813
; }
	cmp [X-4],2
	jnz L460
	.dbline 813
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
L460:
L459:
	.dbline 814
; }
	mov [X+0],4
	.dbline 815
; }
	xjmp L457
L456:
	.dbline 816
; }
	cmp [X+0],2
	jnz L462
	.dbline 817
; }
	.dbline 818
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L464
X19:
	.dbline 818
	mov [X+1],2
	xjmp L465
L464:
	.dbline 819
; }
	dec [X+1]
L465:
	.dbline 820
; }
L462:
L457:
L453:
	.dbline 821
L444:
	.dbline 821
; }
	cmp [X+0],4
	jnz L443
	.dbline -2
	.dbline 823
; }
; }
L442:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbsym l camara -4 c
	.dbend
	.dbfunc e Numeros _Numeros fc
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
_Numeros::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 831
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 832
; }
	mov [X+1],0
L467:
	.dbline 836
; }
; }
; }
; }
	.dbline 837
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 838
; }
	mov A,>L470
	push A
	mov A,<L470
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 839
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 840
; }
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 841
; }
	xcall _bucle_temp
	.dbline 842
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 843
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L471
	.dbline 843
	xcall _Pitido
L471:
	.dbline 844
; }
	cmp [X+0],1
	jnz L473
	.dbline 845
; }
	.dbline 846
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,100
	cmp A,[__r0]
	jnc L475
X20:
	.dbline 846
	mov [X+1],1
	xjmp L474
L475:
	.dbline 847
; }
	inc [X+1]
	.dbline 848
; }
	xjmp L474
L473:
	.dbline 849
; }
	cmp [X+0],3
	jnz L477
	.dbline 850
; }
	.dbline 851
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	xjmp L466
L477:
	.dbline 853
; }
; }
	cmp [X+0],2
	jnz L479
	.dbline 854
; }
	.dbline 855
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L481
X21:
	.dbline 855
	mov [X+1],100
	xjmp L482
L481:
	.dbline 856
; }
	dec [X+1]
L482:
	.dbline 857
; }
L479:
L474:
	.dbline 858
L468:
	.dbline 858
; }
	cmp [X+0],4
	jnz L467
	.dbline -2
	.dbline 859
; }
L466:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Tiempos _Tiempos fc
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
_Tiempos::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 867
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 868
; }
	mov [X+1],0
L484:
	.dbline 872
; }
; }
; }
; }
	.dbline 873
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 874
; }
	mov A,>L487
	push A
	mov A,<L487
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 875
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 876
; }
	cmp [X+1],1
	jnz L488
	.dbline 876
	push X
	mov A,>L490
	push A
	mov A,<L490
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L489
L488:
	.dbline 877
; }
	cmp [X+1],2
	jnz L491
	.dbline 877
	push X
	mov A,>L493
	push A
	mov A,<L493
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L492
L491:
	.dbline 878
; }
	cmp [X+1],3
	jnz L494
	.dbline 878
	push X
	mov A,>L496
	push A
	mov A,<L496
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L494:
L492:
L489:
	.dbline 879
; }
	xcall _bucle_temp
	.dbline 880
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 881
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L497
	.dbline 881
	xcall _Pitido
L497:
	.dbline 882
; }
	cmp [X+0],1
	jnz L499
	.dbline 883
; }
	.dbline 884
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L501
X22:
	.dbline 884
	mov [X+1],1
	xjmp L500
L501:
	.dbline 885
; }
	inc [X+1]
	.dbline 886
; }
	xjmp L500
L499:
	.dbline 887
; }
	cmp [X+0],3
	jnz L503
	.dbline 888
; }
	.dbline 889
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	xjmp L483
L503:
	.dbline 891
; }
; }
	cmp [X+0],2
	jnz L505
	.dbline 892
; }
	.dbline 893
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L507
X23:
	.dbline 893
	mov [X+1],3
	xjmp L508
L507:
	.dbline 894
; }
	dec [X+1]
L508:
	.dbline 895
; }
L505:
L500:
	.dbline 896
L485:
	.dbline 896
; }
	cmp [X+0],4
	jnz L484
	.dbline -2
	.dbline 897
; }
L483:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Executar _Executar fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
_Executar::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 907
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 908
; }
	mov [X+1],1
L510:
	.dbline 912
; }
; }
; }
; }
	.dbline 913
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 914
; }
	mov A,>L513
	push A
	mov A,<L513
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 915
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 916
; }
	mov A,>L514
	push A
	mov A,<L514
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 917
; }
	xcall _bucle_temp
	.dbline 918
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 919
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L515
	.dbline 919
	xcall _Pitido
	xjmp L516
L515:
	.dbline 920
; }
	cmp [X+0],3
	jnz L517
	.dbline 921
; }
	.dbline 922
; }
	cmp [X+1],1
	jnz L519
	.dbline 922
	xcall _Ara
L519:
	.dbline 923
; }
L517:
L516:
	.dbline 924
L511:
	.dbline 924
; }
	cmp [X+0],4
	jnz L510
	.dbline -2
	.dbline 925
; }
L509:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Ara _Ara fV
_Ara::
	.dbline -1
	.dbline 934
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 935
; }
	xcall _Reset_PdT
	.dbline 936
; }
	mov A,9
	push A
	xcall _Envia
	add SP,-1
	.dbline 937
; }
	mov REG[0xd0],>_Ent1
	mov A,[_Ent1]
	push A
	xcall _Envia
	.dbline 938
; }
	mov REG[0xd0],>_Ent2
	mov A,[_Ent2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 939
; }
	mov REG[0xd0],>_Ent3
	mov A,[_Ent3]
	push A
	xcall _Envia
	.dbline 940
; }
	mov REG[0xd0],>_Ent4
	mov A,[_Ent4]
	push A
	xcall _Envia
	add SP,-2
	.dbline 941
; }
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	push A
	xcall _Envia
	.dbline 942
; }
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 943
; }
	mov REG[0xd0],>_Fla1
	mov A,[_Fla1]
	push A
	xcall _Envia
	.dbline 944
; }
	mov REG[0xd0],>_Fla2
	mov A,[_Fla2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 945
; }
	mov REG[0xd0],>_Fla3
	mov A,[_Fla3]
	push A
	xcall _Envia
	.dbline 946
; }
	mov REG[0xd0],>_Fla4
	mov A,[_Fla4]
	push A
	xcall _Envia
	add SP,-2
	.dbline 947
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L522
	.dbline 947
	xcall _Pitido
L522:
	.dbline 948
; }
	xcall _Trabajando
	.dbline -2
	.dbline 949
; }
L521:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Envia _Envia fV
;   confirmacion -> X+0
;          valor -> X-4
_Envia::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 959
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
L525:
	.dbline 963
; }
; }
; }
; }
	.dbline 964
; }
	push X
	mov A,[X-4]
	xcall _UART_PutChar
	.dbline 965
; }
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 966
; }
	mov A,[X-4]
	cmp A,[X+0]
	jnz L528
	.dbline 966
	push X
	mov A,5
	xcall _UART_PutChar
	pop X
	xjmp L529
L528:
	.dbline 967
; }
	push X
	mov A,4
	xcall _UART_PutChar
	pop X
L529:
	.dbline 968
L526:
	.dbline 968
; }
	mov A,[X-4]
	cmp A,[X+0]
	jnz L525
	.dbline -2
	.dbline 969
; }
L524:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l confirmacion 0 c
	.dbsym l valor -4 c
	.dbend
	.dbfunc e Trabajando _Trabajando fV
;              x -> X+1
;         pulsat -> X+0
_Trabajando::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 978
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 982
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 983
; }
	mov A,>L531
	push A
	mov A,<L531
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 984
	mov REG[0xd0],>_Interrupcion
	cmp [_Interrupcion],1
	jnz L532
	.dbline 984
	mov [X+2],0
	mov [X+1],0
	xjmp L537
L534:
	.dbline 984
L535:
	.dbline 984
	inc [X+2]
	adc [X+1],0
L537:
	.dbline 984
; }
	mov REG[0xd0],>__r0
	mov A,[X+2]
	mov [__r3],A
	mov A,[X+1]
	mov [__r2],A
	mov A,[__r3]
	sub A,96
	mov A,[__r2]
	sbb A,-22
	mov A,0
	sbb A,0
	mov A,0
	xor A,-128
	sbb A,(0 ^ 0x80)
	jc L534
X25:
L532:
	.dbline 985
; }
	push X
	xcall _Timer1seg_Stop
	pop X
	.dbline 986
; }
L538:
	.dbline 987
; }
	.dbline 988
; }
	mov REG[0xd0],>_Interrupcion
	mov [_Interrupcion],1
	.dbline 989
; }
	push X
	mov A,8
	xcall _LCD_Control
	pop X
	.dbline 990
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 991
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L542
	.dbline 991
	xcall _Pitido
L542:
	.dbline 992
; }
	cmp [X+0],1
	jz L547
	cmp [X+0],2
	jz L547
	cmp [X+0],4
	jnz L544
L547:
	.dbline 993
; }
	.dbline 994
; }
	push X
	mov A,14
	xcall _LCD_Control
	.dbline 995
; }
	mov A,1
	xcall _LCD_Control
	.dbline 996
; }
	mov A,>L531
	push A
	mov A,<L531
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 997
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 998
; }
	mov A,>L548
	push A
	mov A,<L548
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 999
; }
	mov X,78
	mov A,32
	xcall _Timer1seg_WritePeriod
	.dbline 1000
; }
	xcall _Timer1seg_Start
	pop X
	.dbline 1001
; }
	xjmp L538
L544:
	.dbline 1002
	cmp [X+0],3
	jnz L538
	.dbline 1003
	.dbline 1004
	xcall _Resetear
	.dbline 1005
	.dbline 1006
	.dbline 986
	.dbline 986
	xjmp L538
X24:
	.dbline -2
L530:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Resetear _Resetear fV
_Resetear::
	.dbline -1
	.dbline 1016
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 1017
; }
	mov A,99
	push A
	xcall _Envia
	add SP,-1
	.dbline 1018
; }
	xcall _Principal
	.dbline -2
	.dbline 1019
; }
L551:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Sistema _Sistema fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
_Sistema::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 1029
; }
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 1030
; }
	mov [X+1],1
L553:
	.dbline 1034
; }
; }
; }
; }
	.dbline 1035
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1036
; }
	mov A,>L556
	push A
	mov A,<L556
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1037
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1038
; }
	cmp [X+1],1
	jnz L557
	.dbline 1038
	push X
	mov A,>L559
	push A
	mov A,<L559
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L558
L557:
	.dbline 1039
; }
	cmp [X+1],2
	jnz L560
	.dbline 1039
	push X
	mov A,>L562
	push A
	mov A,<L562
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L561
L560:
	.dbline 1040
; }
	cmp [X+1],3
	jnz L563
	.dbline 1040
	push X
	mov A,>L565
	push A
	mov A,<L565
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L563:
L561:
L558:
	.dbline 1041
; }
	xcall _bucle_temp
	.dbline 1042
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1043
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L566
	.dbline 1043
	xcall _Pitido
L566:
	.dbline 1044
; }
	cmp [X+0],1
	jnz L568
	.dbline 1045
; }
	.dbline 1046
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L570
X26:
	.dbline 1046
	mov [X+1],1
	xjmp L569
L570:
	.dbline 1047
; }
	inc [X+1]
	.dbline 1048
; }
	xjmp L569
L568:
	.dbline 1049
; }
	cmp [X+0],3
	jnz L572
	.dbline 1050
; }
	.dbline 1051
; }
	cmp [X+1],1
	jnz L574
	.dbline 1051
	xcall _Reali_LCD
	xjmp L573
L574:
	.dbline 1052
; }
	cmp [X+1],2
	jnz L576
	.dbline 1052
	xcall _Zumbador
	xjmp L573
L576:
	.dbline 1053
; }
	cmp [X+1],3
	jnz L573
	.dbline 1053
	xcall _Ali_Led
	.dbline 1054
; }
	xjmp L573
L572:
	.dbline 1055
; }
	cmp [X+0],2
	jnz L580
	.dbline 1056
; }
	.dbline 1057
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L582
X27:
	.dbline 1057
	mov [X+1],3
	xjmp L583
L582:
	.dbline 1058
; }
	dec [X+1]
L583:
	.dbline 1059
; }
L580:
L573:
L569:
	.dbline 1060
L554:
	.dbline 1060
; }
	cmp [X+0],4
	jnz L553
	.dbline -2
	.dbline 1061
; }
L552:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Reali_LCD _Reali_LCD fV
;              x -> X+1
;         pulsat -> X+0
_Reali_LCD::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 1070
; }
; }
; }
; }
; }
; }
; }
; }
; }
L585:
	.dbline 1075
; }
; }
; }
; }
; }
	.dbline 1076
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1077
; }
	mov A,>L588
	push A
	mov A,<L588
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1078
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1079
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L589
	.dbline 1079
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L590
L589:
	.dbline 1080
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L590:
	.dbline 1081
; }
	xcall _bucle_temp
	.dbline 1082
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1083
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L591
	.dbline 1083
	xcall _Pitido
L591:
	.dbline 1084
; }
	cmp [X+0],1
	jz L595
	cmp [X+0],2
	jnz L593
L595:
	.dbline 1085
; }
	.dbline 1086
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1087
; }
	xjmp L594
L593:
	.dbline 1088
; }
	cmp [X+0],3
	jnz L596
	.dbline 1089
; }
	.dbline 1090
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L598
	.dbline 1091
; }
	.dbline 1092
; }
	or REG[ 0],2
	.dbline 1093
; }
	mov [_Luz_LCD],1
	.dbline 1094
; }
	xjmp L599
L598:
	.dbline 1096
; }
; }
	.dbline 1097
; }
	and REG[ 0],-3
	.dbline 1098
; }
	mov REG[0xd0],>_Luz_LCD
	mov [_Luz_LCD],0
	.dbline 1099
; }
L599:
	.dbline 1100
; }
L596:
L594:
	.dbline 1101
L586:
	.dbline 1101
; }
	cmp [X+0],4
	jnz L585
	.dbline -2
	.dbline 1102
; }
L584:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Zumbador _Zumbador fV
;              x -> X+1
;         pulsat -> X+0
_Zumbador::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 1111
; }
; }
; }
; }
; }
; }
; }
; }
; }
L601:
	.dbline 1116
; }
; }
; }
; }
; }
	.dbline 1117
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1118
; }
	mov A,>L604
	push A
	mov A,<L604
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1119
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1120
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L605
	.dbline 1120
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L606
L605:
	.dbline 1121
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L606:
	.dbline 1122
; }
	xcall _bucle_temp
	.dbline 1123
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1124
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L607
	.dbline 1124
	xcall _Pitido
L607:
	.dbline 1125
; }
	cmp [X+0],1
	jz L611
	cmp [X+0],2
	jnz L609
L611:
	.dbline 1126
; }
	.dbline 1127
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1128
; }
	xjmp L610
L609:
	.dbline 1129
; }
	cmp [X+0],3
	jnz L612
	.dbline 1130
; }
	.dbline 1131
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L614
	.dbline 1131
	mov [_Buzzer],1
	xjmp L615
L614:
	.dbline 1132
; }
	mov REG[0xd0],>_Buzzer
	mov [_Buzzer],0
L615:
	.dbline 1133
; }
L612:
L610:
	.dbline 1134
L602:
	.dbline 1134
; }
	cmp [X+0],4
	jnz L601
	.dbline -2
	.dbline 1135
; }
L600:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Ali_Led _Ali_Led fV
;              x -> X+1
;         pulsat -> X+0
_Ali_Led::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 1144
; }
; }
; }
; }
; }
; }
; }
; }
; }
L617:
	.dbline 1149
; }
; }
; }
; }
; }
	.dbline 1150
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1151
; }
	mov A,>L620
	push A
	mov A,<L620
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1152
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1153
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L621
	.dbline 1153
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L622
L621:
	.dbline 1154
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L622:
	.dbline 1155
; }
	xcall _bucle_temp
	.dbline 1156
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1157
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L623
	.dbline 1157
	xcall _Pitido
L623:
	.dbline 1158
; }
	cmp [X+0],1
	jz L627
	cmp [X+0],2
	jnz L625
L627:
	.dbline 1159
; }
	.dbline 1160
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1161
; }
	xjmp L626
L625:
	.dbline 1162
; }
	cmp [X+0],3
	jnz L628
	.dbline 1163
; }
	.dbline 1164
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L630
	.dbline 1165
; }
	.dbline 1166
; }
	or REG[ 0],16
	.dbline 1167
; }
	mov [_Alimentacion],1
	.dbline 1168
; }
	xjmp L631
L630:
	.dbline 1170
; }
; }
	.dbline 1171
; }
	and REG[ 0],-17
	.dbline 1172
; }
	mov REG[0xd0],>_Alimentacion
	mov [_Alimentacion],0
	.dbline 1173
; }
L631:
	.dbline 1174
; }
L628:
L626:
	.dbline 1175
L618:
	.dbline 1175
; }
	cmp [X+0],4
	jnz L617
	.dbline -2
	.dbline 1176
; }
L616:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfile ./main.c
	.dbfunc e main _main fV
;             xx -> X+1
;              x -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 14
	.dbline 18
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 19
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 20
	xcall _Timer8_Start
	pop X
	.dbline 22
		or  F, 01h

	.dbline 23
	push X
	xcall _Timer1seg_EnableInt
	.dbline 25
	xcall _LCD_Start
	.dbline 26
	xcall _LCD_Init
	.dbline 28
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 29
	mov REG[ 0],-96
	.dbline 32
	and REG[ 0],-31
	.dbline 36
L633:
	.dbline 36
	xcall _Principal
	.dbline 36
	.dbline 36
	xjmp L633
X28:
	.dbline -2
L632:
	add SP,-3
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l xx 1 I
	.dbsym l x 0 c
	.dbend
	.area lit(rom, con, rel)
L620:
	.byte 62,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L604:
	.byte 62,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o,0
L588:
	.byte 62,'L,'u,'z,32,'L,'C,'D,0
L565:
	.byte 51,45,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L562:
	.byte 50,45,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o
	.byte 0
L559:
	.byte 49,45,'L,'u,'z,32,'L,'C,'D,0
L556:
	.byte 62,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L548:
	.byte 'Q,'u,'i,'e,'r,'e,32,'p,'a,'r,'a,'r,'l,'o,63,0
L531:
	.byte 'P,'h,'o,'t,'o,'S,'O,'C,32,'a,'c,'t,'i,'v,'o,0
L514:
	.byte 49,45,'A,'h,'o,'r,'a,0
L513:
	.byte 62,'E,'j,'e,'c,'u,'t,'a,'r,0
L496:
	.byte 'M,'i,'n,'u,'t,'o,'s,0
L493:
	.byte 'S,'e,'g,'u,'n,'d,'o,'s,0
L490:
	.byte 'M,'i,'l,'i,'s,'e,'g,'u,'n,'d,'o,'s,0
L487:
	.byte 62,'U,'n,'i,46,32,'d,'e,32,'t,'i,'e,'m,'p,'o,0
L470:
	.byte 62,'N,'u,'m,46,32,'d,'e,32,'t,'i,'e,'m,'p,'o,0
L425:
	.byte 'N,'u,'m,'e,'r,'o,32,'d,'e,32,'f,'o,'t,'o,'s,0
L422:
	.byte 'T,32,'e,'n,'t,'r,'e,32,'f,'o,'t,'o,0
L419:
	.byte 62,'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L386:
	.byte 62,'T,'i,'p,'o,32,'d,'e,32,'d,'i,'s,'p,46,0
L362:
	.byte 62,'C,'a,'m,'a,'r,'a,32,50,0
L350:
	.byte 'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L347:
	.byte 'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L344:
	.byte 'D,'i,'s,'p,46,32,'U,'n,'i,'c,'o,0
L341:
	.byte 'N,'o,32,'d,'i,'s,'p,'a,'r,'a,0
L338:
	.byte 62,'C,'a,'m,'a,'r,'a,32,49,0
L317:
	.byte 50,45,'C,'a,'m,'a,'r,'a,32,50,0
L314:
	.byte 49,45,'C,'a,'m,'a,'r,'a,32,49,0
L311:
	.byte 62,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L295:
	.byte 62,'F,'l,'a,'s,'h,32,52,0
L279:
	.byte 62,'F,'l,'a,'s,'h,32,51,0
L263:
	.byte 62,'F,'l,'a,'s,'h,32,50,0
L247:
	.byte 62,'F,'l,'a,'s,'h,32,49,0
L222:
	.byte 32,32,40,'O,'f,'f,41,0
L219:
	.byte 52,45,'F,'l,'a,'s,'h,32,52,0
L214:
	.byte 51,45,'F,'l,'a,'s,'h,32,51,0
L209:
	.byte 50,45,'F,'l,'a,'s,'h,32,50,0
L206:
	.byte 32,40,'O,'n,41,0
L205:
	.byte 32,40,'O,'f,'f,41,0
L202:
	.byte 49,45,'F,'l,'a,'s,'h,32,49,0
L199:
	.byte 62,'C,'o,'n,'f,46,32,'F,'l,'a,'s,'h,'e,'s,0
L183:
	.byte 62,'D,'i,'g,'i,'t,'a,'l,32,50,32,53,'V,0
L167:
	.byte 62,'D,'i,'g,'i,'t,'a,'l,32,49,32,53,'V,0
L151:
	.byte 62,'B,'a,'r,'r,'e,'r,'a,32,50,32,49,50,'V,0
L137:
	.byte 'O,'N,0
L136:
	.byte 'O,'F,'F,0
L133:
	.byte 62,'B,'a,'r,'r,'e,'r,'a,32,49,32,49,50,'V,0
L108:
	.byte 52,45,'D,'i,'g,'i,'t,'a,'l,32,50,32,53,'V,0
L105:
	.byte 51,45,'D,'i,'g,'i,'t,'a,'l,32,49,32,53,'V,0
L102:
	.byte 50,45,'B,'a,'r,'r,'e,'r,'a,32,50,32,49,50,'V,0
L99:
	.byte 49,45,'B,'a,'r,'r,'e,'r,'a,32,49,32,49,50,'V,0
L96:
	.byte 62,'C,'o,'n,'f,46,32,'S,'e,'n,'s,'o,'r,'e,'s,0
L69:
	.byte 53,45,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L66:
	.byte 52,45,'E,'j,'e,'c,'u,'t,'a,'r,0
L63:
	.byte 51,45,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L60:
	.byte 50,45,'C,'o,'n,'f,46,32,'F,'l,'a,'s,'h,'e,'s,0
L57:
	.byte 49,45,'C,'o,'n,'f,46,32,'S,'e,'n,'s,'o,'r,'e,'s
	.byte 0
L54:
	.byte 62,'M,'e,'n,'u,32,'P,'r,'i,'n,'c,'i,'p,'a,'l,0
L45:
	.byte 'a,32,32,'P,'h,'o,'t,'o,'S,'o,'C,0
L44:
	.byte 'B,'i,'e,'n,'v,'e,'n,'i,'d,'o,'s,0
