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
_Int1_Tdisp::
	.byte 0
	.dbsym e Int1_Tdisp _Int1_Tdisp c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Int1_Tdisp_Uni::
	.byte 0
	.dbsym e Int1_Tdisp_Uni _Int1_Tdisp_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Int1_Ndisp::
	.byte 0
	.dbsym e Int1_Ndisp _Int1_Ndisp c
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
_Int2_Tdisp::
	.byte 0
	.dbsym e Int2_Tdisp _Int2_Tdisp c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Int2_Tdisp_Uni::
	.byte 0
	.dbsym e Int2_Tdisp_Uni _Int2_Tdisp_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Int2_Ndisp::
	.byte 0
	.dbsym e Int2_Ndisp _Int2_Ndisp c
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
	.dbline 53
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
; 		for(x=0;x<50000;x++);
	.dbline 56
	mov [X+1],0
	mov [X+0],0
	xjmp L5
L2:
	.dbline 56
L3:
	.dbline 56
	inc [X+1]
	adc [X+0],0
L5:
	.dbline 56
; 		
; 		- Detectar cierto numero y que lo muestre por el LCD		
; 		LCD_Control(0x01);
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
	.dbline 57
; 		LCD_WriteData(+48);
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
	.dbline 66
; 		for(x=0;x<50000;x++);
; 		*/		
; }
; }
; }
; }
; }
; }
; }
	.dbline 69
; }
; }
; }
	or REG[ 0],8
	.dbline 70
	mov [X+1],0
	mov [X+0],0
L7:
	.dbline 70
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
L8:
	.dbline 70
; }
	inc [X+1]
	adc [X+0],0
	.dbline 70
	mov A,[X+1]
	sub A,-96
	mov A,[X+0]
	xor A,-128
	sbb A,(15 ^ 0x80)
	jc L7
X1:
	.dbline 71
; }
	and REG[ 0],-9
	.dbline -2
	.dbline 72
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
	.dbline 81
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 84
; }
; }
; }
	or REG[ 0],4
	.dbline 85
	mov [X+1],0
	mov [X+0],0
L12:
	.dbline 85
L13:
	.dbline 85
; }
	inc [X+1]
	adc [X+0],0
	.dbline 85
	mov A,[X+1]
	sub A,-12
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L12
X2:
	.dbline 86
; }
	and REG[ 0],-5
	.dbline 87
	mov [X+1],0
	mov [X+0],0
L16:
	.dbline 87
L17:
	.dbline 87
; }
	inc [X+1]
	adc [X+0],0
	.dbline 87
	mov A,[X+1]
	sub A,-12
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L16
X3:
	.dbline -2
	.dbline 88
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
	.dbline 96
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 97
; }
	mov REG[0xd0],>_Interrupcion
	mov [_Interrupcion],0
	.dbline 98
; }
	xcall _Trabajando
	.dbline -2
	.dbline 99
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
	.dbline 112
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
	.dbline 116
; }
; }
; }
; }
	mov [X+2],0
L22:
	.dbline 120
; }
; }
; }
; }
	.dbline 121
; }
	push X
	xcall _UART_cReadChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+3],A
	.dbline 122
; }
	cmp [X+3],-1
	jnz L25
	.dbline 122
L25:
	.dbline 123
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],32
	jnz L27
	.dbline 123
	mov [X+2],1
L27:
	.dbline 124
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-128
	jnz L29
	.dbline 124
	mov [X+2],2
L29:
	.dbline 125
; }
	cmp [X+2],0
	jz L31
	.dbline 126
; }
	.dbline 127
	mov [X+1],0
	mov [X+0],0
	xjmp L36
L33:
	.dbline 127
L34:
	.dbline 127
	inc [X+1]
	adc [X+0],0
L36:
	.dbline 127
; }
	mov A,[X+1]
	sub A,100
	mov A,[X+0]
	sbb A,0
	jc L33
X4:
	.dbline 128
; }
	mov [X+1],0
	mov [X+0],0
	xjmp L40
L37:
	.dbline 129
; }
	.dbline 130
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-96
	jnz L41
	.dbline 130
	mov A,[X+2]
	xjmp L21
L41:
	.dbline 131
	or REG[ 0],-96
	.dbline 132
L38:
	.dbline 128
	inc [X+1]
	adc [X+0],0
L40:
	.dbline 128
	mov A,[X+1]
	sub A,48
	mov A,[X+0]
	sbb A,117
	jc L37
X5:
	.dbline 133
; }
; }
; }
	add [X+2],2
	.dbline 134
; }
L31:
	.dbline 135
L23:
	.dbline 135
; }
	cmp [X+2],0
	jz L22
	.dbline 136
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
	.dbline 147
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
	.dbline 151
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 152
; }
	mov X,1
	mov A,0
	xcall _LCD_Position
	.dbline 153
; }
	mov A,>L44
	push A
	mov A,<L44
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 154
; }
	mov X,3
	mov A,1
	xcall _LCD_Position
	.dbline 155
; }
	mov A,>L45
	push A
	mov A,<L45
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 156
; }
	xcall _bucle_temp
	.dbline 157
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 158
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L46
	.dbline 158
	xcall _Pitido
L46:
	.dbline 159
	cmp [X+0],0
	jz L48
	.dbline 160
	.dbline 161
	xcall _Menu
	.dbline 162
L48:
	.dbline -2
	.dbline 163
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
	.dbline 173
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
	.dbline 174
; }
	mov [X+0],1
L51:
	.dbline 178
; }
; }
; }
; }
	.dbline 179
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 180
; }
	mov A,>L54
	push A
	mov A,<L54
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 181
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 182
; }
	cmp [X+0],1
	jnz L55
	.dbline 182
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
	.dbline 183
; }
	cmp [X+0],2
	jnz L58
	.dbline 183
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
	.dbline 184
; }
	cmp [X+0],3
	jnz L61
	.dbline 184
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
	.dbline 185
; }
	cmp [X+0],4
	jnz L64
	.dbline 185
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
	.dbline 186
; }
	cmp [X+0],5
	jnz L67
	.dbline 186
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
	.dbline 187
; }
	xcall _bucle_temp
	.dbline 188
; }
	xcall _Pulsador
	mov [X+1],A
	.dbline 189
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L70
	.dbline 189
	xcall _Pitido
L70:
	.dbline 190
; }
	cmp [X+1],1
	jnz L72
	.dbline 191
; }
	.dbline 192
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	add A,1
	mov [__r0],A
	mov A,5
	cmp A,[__r0]
	jnc L74
X6:
	.dbline 192
	mov [X+0],1
	xjmp L73
L74:
	.dbline 193
; }
	inc [X+0]
	.dbline 194
; }
	xjmp L73
L72:
	.dbline 195
; }
	cmp [X+1],3
	jnz L76
	.dbline 196
; }
	.dbline 197
; }
	cmp [X+0],1
	jnz L78
	.dbline 197
	xcall _Sensors
	xjmp L77
L78:
	.dbline 198
; }
	cmp [X+0],2
	jnz L80
	.dbline 198
	xcall _Flashes
	xjmp L77
L80:
	.dbline 199
; }
	cmp [X+0],3
	jnz L82
	.dbline 199
	xcall _Dispar
	xjmp L77
L82:
	.dbline 200
; }
	cmp [X+0],4
	jnz L84
	.dbline 200
	xcall _Executar
	xjmp L77
L84:
	.dbline 201
; }
	cmp [X+0],5
	jnz L77
	.dbline 201
	xcall _Sistema
	.dbline 202
; }
	xjmp L77
L76:
	.dbline 203
; }
	cmp [X+1],2
	jnz L88
	.dbline 204
; }
	.dbline 205
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	sub A,1
	cmp A,1
	jnc L90
X7:
	.dbline 205
	mov [X+0],5
	xjmp L91
L90:
	.dbline 206
; }
	dec [X+0]
L91:
	.dbline 207
; }
L88:
L77:
L73:
	.dbline 208
L52:
	.dbline 208
; }
	cmp [X+1],4
	jnz L51
	.dbline -2
	.dbline 209
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
	.dbline 219
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
	.dbline 220
; }
	mov [X+1],1
L93:
	.dbline 224
; }
; }
; }
; }
	.dbline 225
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 226
; }
	mov A,>L96
	push A
	mov A,<L96
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 227
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 228
; }
	cmp [X+1],1
	jnz L97
	.dbline 228
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
	.dbline 229
; }
	cmp [X+1],2
	jnz L100
	.dbline 229
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
	.dbline 230
; }
	cmp [X+1],3
	jnz L103
	.dbline 230
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
	.dbline 231
; }
	cmp [X+1],4
	jnz L106
	.dbline 231
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
	.dbline 232
; }
	xcall _bucle_temp
	.dbline 233
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 234
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L109
	.dbline 234
	xcall _Pitido
L109:
	.dbline 235
; }
	cmp [X+0],1
	jnz L111
	.dbline 236
; }
	.dbline 237
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L113
X8:
	.dbline 237
	mov [X+1],1
	xjmp L112
L113:
	.dbline 238
; }
	inc [X+1]
	.dbline 239
; }
	xjmp L112
L111:
	.dbline 240
; }
	cmp [X+0],3
	jnz L115
	.dbline 241
; }
	.dbline 242
; }
	cmp [X+1],1
	jnz L117
	.dbline 242
	xcall _Entrada1
	xjmp L116
L117:
	.dbline 243
; }
	cmp [X+1],2
	jnz L119
	.dbline 243
	xcall _Entrada2
	xjmp L116
L119:
	.dbline 244
; }
	cmp [X+1],3
	jnz L121
	.dbline 244
	xcall _Entrada3
	xjmp L116
L121:
	.dbline 245
; }
	cmp [X+1],4
	jnz L116
	.dbline 245
	xcall _Entrada4
	.dbline 246
; }
	xjmp L116
L115:
	.dbline 247
; }
	cmp [X+0],2
	jnz L125
	.dbline 248
; }
	.dbline 249
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L127
X9:
	.dbline 249
	mov [X+1],4
	xjmp L128
L127:
	.dbline 250
; }
	dec [X+1]
L128:
	.dbline 251
; }
L125:
L116:
L112:
	.dbline 252
L94:
	.dbline 252
; }
	cmp [X+0],4
	jnz L93
	.dbline -2
	.dbline 253
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
	.dbline 263
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
	.dbline 268
; }
; }
; }
; }
; }
	.dbline 269
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 270
; }
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 271
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 272
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L134
	.dbline 272
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
	.dbline 273
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
	.dbline 274
; }
	xcall _bucle_temp
	.dbline 275
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 276
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L138
	.dbline 276
	xcall _Pitido
L138:
	.dbline 277
; }
	cmp [X+0],1
	jz L142
	cmp [X+0],2
	jnz L140
L142:
	.dbline 278
; }
	.dbline 279
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 280
; }
	xjmp L141
L140:
	.dbline 281
; }
	cmp [X+0],3
	jnz L143
	.dbline 282
; }
	.dbline 283
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L145
	.dbline 283
	mov [_Ent1],1
	xjmp L146
L145:
	.dbline 284
; }
	mov REG[0xd0],>_Ent1
	mov [_Ent1],0
L146:
	.dbline 285
; }
L143:
L141:
	.dbline 286
L131:
	.dbline 286
; }
	cmp [X+0],4
	jnz L130
	.dbline -2
	.dbline 287
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
	.dbline 297
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
	.dbline 302
; }
; }
; }
; }
; }
	.dbline 303
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 304
; }
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 305
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 306
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L152
	.dbline 306
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
	.dbline 307
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
	.dbline 308
; }
	xcall _bucle_temp
	.dbline 309
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 310
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L154
	.dbline 310
	xcall _Pitido
L154:
	.dbline 311
; }
	cmp [X+0],1
	jz L158
	cmp [X+0],2
	jnz L156
L158:
	.dbline 312
; }
	.dbline 313
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 314
; }
	xjmp L157
L156:
	.dbline 315
; }
	cmp [X+0],3
	jnz L159
	.dbline 316
; }
	.dbline 317
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L161
	.dbline 317
	mov [_Ent2],1
	xjmp L162
L161:
	.dbline 318
; }
	mov REG[0xd0],>_Ent2
	mov [_Ent2],0
L162:
	.dbline 319
; }
L159:
L157:
	.dbline 320
L149:
	.dbline 320
; }
	cmp [X+0],4
	jnz L148
	.dbline -2
	.dbline 321
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
	.dbline 331
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
	.dbline 336
; }
; }
; }
; }
; }
	.dbline 337
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 338
; }
	mov A,>L167
	push A
	mov A,<L167
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 339
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 340
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L168
	.dbline 340
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
	.dbline 341
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
	.dbline 342
; }
	xcall _bucle_temp
	.dbline 343
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 344
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L170
	.dbline 344
	xcall _Pitido
L170:
	.dbline 345
; }
	cmp [X+0],1
	jz L174
	cmp [X+0],2
	jnz L172
L174:
	.dbline 346
; }
	.dbline 347
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 348
; }
	xjmp L173
L172:
	.dbline 349
; }
	cmp [X+0],3
	jnz L175
	.dbline 350
; }
	.dbline 351
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L177
	.dbline 351
	mov [_Ent3],1
	xjmp L178
L177:
	.dbline 352
; }
	mov REG[0xd0],>_Ent3
	mov [_Ent3],0
L178:
	.dbline 353
; }
L175:
L173:
	.dbline 354
L165:
	.dbline 354
; }
	cmp [X+0],4
	jnz L164
	.dbline -2
	.dbline 355
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
	.dbline 365
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
	.dbline 370
; }
; }
; }
; }
; }
	.dbline 371
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 372
; }
	mov A,>L183
	push A
	mov A,<L183
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 373
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 374
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L184
	.dbline 374
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
	.dbline 375
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
	.dbline 376
; }
	xcall _bucle_temp
	.dbline 377
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 378
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L186
	.dbline 378
	xcall _Pitido
L186:
	.dbline 379
; }
	cmp [X+0],1
	jz L190
	cmp [X+0],2
	jnz L188
L190:
	.dbline 380
; }
	.dbline 381
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 382
; }
	xjmp L189
L188:
	.dbline 383
; }
	cmp [X+0],3
	jnz L191
	.dbline 384
; }
	.dbline 385
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L193
	.dbline 385
	mov [_Ent4],1
	xjmp L194
L193:
	.dbline 386
; }
	mov REG[0xd0],>_Ent4
	mov [_Ent4],0
L194:
	.dbline 387
; }
L191:
L189:
	.dbline 388
L181:
	.dbline 388
; }
	cmp [X+0],4
	jnz L180
	.dbline -2
	.dbline 389
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
	.dbline 399
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
	.dbline 400
; }
	mov [X+1],1
L196:
	.dbline 404
; }
; }
; }
; }
	.dbline 405
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 406
; }
	mov A,>L199
	push A
	mov A,<L199
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 407
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 408
; }
	cmp [X+1],1
	jnz L200
	.dbline 409
; }
	.dbline 410
; }
	push X
	mov A,>L202
	push A
	mov A,<L202
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 411
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L203
	.dbline 411
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
	.dbline 412
; }
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 413
; }
	xjmp L201
L200:
	.dbline 414
; }
	cmp [X+1],2
	jnz L207
	.dbline 415
; }
	.dbline 416
; }
	push X
	mov A,>L209
	push A
	mov A,<L209
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 417
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L210
	.dbline 417
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
	.dbline 418
; }
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 419
; }
	xjmp L208
L207:
	.dbline 420
; }
	cmp [X+1],3
	jnz L212
	.dbline 421
; }
	.dbline 423
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
	.dbline 424
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L215
	.dbline 424
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
	.dbline 425
; }
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 426
; }
	xjmp L213
L212:
	.dbline 427
; }
	cmp [X+1],4
	jnz L217
	.dbline 428
; }
	.dbline 429
; }
	push X
	mov A,>L219
	push A
	mov A,<L219
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 430
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L220
	.dbline 430
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
	.dbline 431
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
	.dbline 432
; }
L217:
L213:
L208:
L201:
	.dbline 433
; }
	xcall _bucle_temp
	.dbline 434
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 435
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L223
	.dbline 435
	xcall _Pitido
L223:
	.dbline 436
; }
	cmp [X+0],1
	jnz L225
	.dbline 437
; }
	.dbline 438
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L227
X10:
	.dbline 438
	mov [X+1],1
	xjmp L226
L227:
	.dbline 439
; }
	inc [X+1]
	.dbline 440
; }
	xjmp L226
L225:
	.dbline 441
; }
	cmp [X+0],3
	jnz L229
	.dbline 442
; }
	.dbline 443
; }
	cmp [X+1],1
	jnz L231
	.dbline 443
	xcall _Flash1
	xjmp L230
L231:
	.dbline 444
; }
	cmp [X+1],2
	jnz L233
	.dbline 444
	xcall _Flash2
	xjmp L230
L233:
	.dbline 445
; }
	cmp [X+1],3
	jnz L235
	.dbline 445
	xcall _Flash3
	xjmp L230
L235:
	.dbline 446
; }
	cmp [X+1],4
	jnz L230
	.dbline 446
	xcall _Flash4
	.dbline 447
; }
	xjmp L230
L229:
	.dbline 448
; }
	cmp [X+0],2
	jnz L239
	.dbline 449
; }
	.dbline 450
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L241
X11:
	.dbline 450
	mov [X+1],4
	xjmp L242
L241:
	.dbline 451
; }
	dec [X+1]
L242:
	.dbline 452
; }
L239:
L230:
L226:
	.dbline 453
L197:
	.dbline 453
; }
	cmp [X+0],4
	jnz L196
	.dbline -2
	.dbline 454
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
	.dbline 463
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
	.dbline 468
; }
; }
; }
; }
; }
	.dbline 469
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 470
; }
	mov A,>L247
	push A
	mov A,<L247
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 471
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 472
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L248
	.dbline 472
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
	.dbline 473
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
	.dbline 474
; }
	xcall _bucle_temp
	.dbline 475
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 476
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L250
	.dbline 476
	xcall _Pitido
L250:
	.dbline 477
; }
	cmp [X+0],1
	jz L254
	cmp [X+0],2
	jnz L252
L254:
	.dbline 478
; }
	.dbline 479
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 480
; }
	xjmp L253
L252:
	.dbline 481
; }
	cmp [X+0],3
	jnz L255
	.dbline 482
; }
	.dbline 483
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L257
	.dbline 483
	mov [_Fla1],1
	xjmp L258
L257:
	.dbline 484
; }
	mov REG[0xd0],>_Fla1
	mov [_Fla1],0
L258:
	.dbline 485
; }
L255:
L253:
	.dbline 486
L245:
	.dbline 486
; }
	cmp [X+0],4
	jnz L244
	.dbline -2
	.dbline 487
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
	.dbline 497
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
	.dbline 502
; }
; }
; }
; }
; }
	.dbline 503
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 504
; }
	mov A,>L263
	push A
	mov A,<L263
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 505
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 506
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L264
	.dbline 506
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
	.dbline 507
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
	.dbline 508
; }
	xcall _bucle_temp
	.dbline 509
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 510
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L266
	.dbline 510
	xcall _Pitido
L266:
	.dbline 511
; }
	cmp [X+0],1
	jz L270
	cmp [X+0],2
	jnz L268
L270:
	.dbline 512
; }
	.dbline 513
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 514
; }
	xjmp L269
L268:
	.dbline 515
; }
	cmp [X+0],3
	jnz L271
	.dbline 516
; }
	.dbline 517
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L273
	.dbline 517
	mov [_Fla2],1
	xjmp L274
L273:
	.dbline 518
; }
	mov REG[0xd0],>_Fla2
	mov [_Fla2],0
L274:
	.dbline 519
; }
L271:
L269:
	.dbline 520
L261:
	.dbline 520
; }
	cmp [X+0],4
	jnz L260
	.dbline -2
	.dbline 521
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
	.dbline 530
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
	.dbline 535
; }
; }
; }
; }
; }
	.dbline 536
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 537
; }
	mov A,>L279
	push A
	mov A,<L279
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 538
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 539
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L280
	.dbline 539
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
	.dbline 540
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
	.dbline 541
; }
	xcall _bucle_temp
	.dbline 542
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 543
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L282
	.dbline 543
	xcall _Pitido
L282:
	.dbline 544
; }
	cmp [X+0],1
	jz L286
	cmp [X+0],2
	jnz L284
L286:
	.dbline 545
; }
	.dbline 546
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 547
; }
	xjmp L285
L284:
	.dbline 548
; }
	cmp [X+0],3
	jnz L287
	.dbline 549
; }
	.dbline 550
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L289
	.dbline 550
	mov [_Fla3],1
	xjmp L290
L289:
	.dbline 551
; }
	mov REG[0xd0],>_Fla3
	mov [_Fla3],0
L290:
	.dbline 552
; }
L287:
L285:
	.dbline 553
L277:
	.dbline 553
; }
	cmp [X+0],4
	jnz L276
	.dbline -2
	.dbline 554
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
	.dbline 563
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
	.dbline 568
; }
; }
; }
; }
; }
	.dbline 569
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 570
; }
	mov A,>L295
	push A
	mov A,<L295
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 571
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 572
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L296
	.dbline 572
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
	.dbline 573
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
	.dbline 574
; }
	xcall _bucle_temp
	.dbline 575
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 576
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L298
	.dbline 576
	xcall _Pitido
L298:
	.dbline 577
; }
	cmp [X+0],1
	jz L302
	cmp [X+0],2
	jnz L300
L302:
	.dbline 578
; }
	.dbline 579
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 580
; }
	xjmp L301
L300:
	.dbline 581
; }
	cmp [X+0],3
	jnz L303
	.dbline 582
; }
	.dbline 583
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L305
	.dbline 583
	mov [_Fla4],1
	xjmp L306
L305:
	.dbline 584
; }
	mov REG[0xd0],>_Fla4
	mov [_Fla4],0
L306:
	.dbline 585
; }
L303:
L301:
	.dbline 586
L293:
	.dbline 586
; }
	cmp [X+0],4
	jnz L292
	.dbline -2
	.dbline 587
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
	.dbline 597
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
	.dbline 599
; }
; }
	mov [X+1],1
L308:
	.dbline 603
; }
; }
; }
; }
	.dbline 604
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 605
; }
	mov A,>L311
	push A
	mov A,<L311
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 606
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 607
; }
	cmp [X+1],1
	jnz L312
	.dbline 607
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
	.dbline 608
; }
	cmp [X+1],2
	jnz L315
	.dbline 608
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
	.dbline 609
; }
	xcall _bucle_temp
	.dbline 610
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 611
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L318
	.dbline 611
	xcall _Pitido
L318:
	.dbline 612
; }
	cmp [X+0],1
	jnz L320
	.dbline 613
; }
	.dbline 614
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L322
X12:
	.dbline 614
	mov [X+1],1
	xjmp L321
L322:
	.dbline 615
; }
	inc [X+1]
	.dbline 616
; }
	xjmp L321
L320:
	.dbline 617
; }
	cmp [X+0],3
	jnz L324
	.dbline 618
; }
	.dbline 619
; }
	cmp [X+1],1
	jnz L326
	.dbline 619
	xcall _Camara1
	xjmp L325
L326:
	.dbline 620
; }
	cmp [X+1],2
	jnz L325
	.dbline 620
	xcall _Camara2
	.dbline 621
; }
	xjmp L325
L324:
	.dbline 622
; }
	cmp [X+0],2
	jnz L330
	.dbline 623
; }
	.dbline 624
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L332
X13:
	.dbline 624
	mov [X+1],2
	xjmp L333
L332:
	.dbline 625
; }
	dec [X+1]
L333:
	.dbline 626
; }
L330:
L325:
L321:
	.dbline 627
L309:
	.dbline 627
; }
	cmp [X+0],4
	jnz L308
	.dbline -2
	.dbline 628
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
	.dbline 637
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
	.dbline 642
; }
; }
; }
; }
; }
	.dbline 643
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 644
; }
	mov A,>L338
	push A
	mov A,<L338
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 645
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 646
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],0
	jnz L339
	.dbline 646
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
	.dbline 647
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L342
	.dbline 647
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
	.dbline 648
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L345
	.dbline 648
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
	.dbline 649
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L348
	.dbline 649
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
	.dbline 650
; }
	xcall _bucle_temp
	.dbline 651
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 652
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L351
	.dbline 652
	xcall _Pitido
L351:
	.dbline 653
; }
	cmp [X+0],1
	jz L355
	cmp [X+0],2
	jnz L353
L355:
	.dbline 654
; }
	.dbline 655
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 656
; }
	xjmp L354
L353:
	.dbline 657
; }
	cmp [X+0],3
	jnz L356
	.dbline 658
; }
	.dbline 659
; }
	mov A,1
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 660
; }
L356:
L354:
	.dbline 661
L336:
	.dbline 661
; }
	cmp [X+0],4
	jnz L335
	.dbline -2
	.dbline 662
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
	.dbline 671
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
	.dbline 676
; }
; }
; }
; }
; }
	.dbline 677
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 678
; }
	mov A,>L362
	push A
	mov A,<L362
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 679
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 680
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],0
	jnz L363
	.dbline 680
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
	.dbline 681
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L365
	.dbline 681
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
	.dbline 682
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L367
	.dbline 682
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
	.dbline 683
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L369
	.dbline 683
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
	.dbline 684
; }
	xcall _bucle_temp
	.dbline 685
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 686
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L371
	.dbline 686
	xcall _Pitido
L371:
	.dbline 687
; }
	cmp [X+0],1
	jz L375
	cmp [X+0],2
	jnz L373
L375:
	.dbline 688
; }
	.dbline 689
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 690
; }
	xjmp L374
L373:
	.dbline 691
; }
	cmp [X+0],3
	jnz L376
	.dbline 692
; }
	.dbline 693
; }
	mov A,2
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 694
; }
L376:
L374:
	.dbline 695
L360:
	.dbline 695
; }
	cmp [X+0],4
	jnz L359
	.dbline -2
	.dbline 696
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
	.dbline 706
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
	.dbline 710
; }
; }
; }
; }
	cmp [X-4],1
	jnz L379
	.dbline 710
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	add A,1
	mov [X+1],A
	xjmp L380
L379:
	.dbline 711
; }
	cmp [X-4],2
	jnz L381
	.dbline 711
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	add A,1
	mov [X+1],A
L381:
L380:
L383:
	.dbline 714
; }
; }
; }
	.dbline 715
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 716
; }
	mov A,>L386
	push A
	mov A,<L386
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 717
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 718
; }
	cmp [X+1],1
	jnz L387
	.dbline 718
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
	.dbline 719
; }
	cmp [X+1],2
	jnz L389
	.dbline 719
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
	.dbline 720
; }
	cmp [X+1],3
	jnz L391
	.dbline 720
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
	.dbline 721
; }
	cmp [X+1],4
	jnz L393
	.dbline 721
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
	.dbline 722
; }
	xcall _bucle_temp
	.dbline 723
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 724
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L395
	.dbline 724
	xcall _Pitido
L395:
	.dbline 725
; }
	cmp [X+0],1
	jnz L397
	.dbline 726
; }
	.dbline 727
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L399
X14:
	.dbline 727
	mov [X+1],1
	xjmp L398
L399:
	.dbline 728
; }
	inc [X+1]
	.dbline 729
; }
	xjmp L398
L397:
	.dbline 730
; }
	cmp [X+0],3
	jnz L401
	.dbline 731
; }
	.dbline 732
; }
	cmp [X+1],1
	jz L405
	cmp [X+1],2
	jnz L403
L405:
	.dbline 733
; }
	.dbline 734
; }
	cmp [X-4],1
	jnz L406
	.dbline 734
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L404
L406:
	.dbline 735
; }
	cmp [X-4],2
	jnz L404
	.dbline 735
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 736
; }
	xjmp L404
L403:
	.dbline 737
; }
	cmp [X+1],3
	jnz L410
	.dbline 737
	mov A,[X-4]
	push A
	xcall _Intervalometro
	add SP,-1
	xjmp L411
L410:
	.dbline 738
; }
	cmp [X+1],4
	jnz L412
	.dbline 738
	mov A,[X-4]
	push A
	xcall _TimeLapse
	add SP,-1
L412:
L411:
L404:
	.dbline 739
; }
	mov [X+0],4
	.dbline 740
; }
	xjmp L402
L401:
	.dbline 741
; }
	cmp [X+0],2
	jnz L414
	.dbline 742
; }
	.dbline 743
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L416
X15:
	.dbline 743
	mov [X+1],4
	xjmp L417
L416:
	.dbline 744
; }
	dec [X+1]
L417:
	.dbline 745
; }
L414:
L402:
L398:
	.dbline 746
L384:
	.dbline 746
; }
	cmp [X+0],4
	jnz L383
	.dbline -2
	.dbline 747
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
	.dbline 755
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 756
; }
	mov [X+1],1
	.dbline 759
; }
; }
; }
	cmp [X-4],1
	jnz L419
	.dbline 759
	mov REG[0xd0],>_Cam1
	mov [_Cam1],2
	xjmp L420
L419:
	.dbline 760
; }
	cmp [X-4],2
	jnz L421
	.dbline 760
	mov REG[0xd0],>_Cam2
	mov [_Cam2],2
L421:
L420:
L423:
	.dbline 762
; }
; }
	.dbline 763
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 764
; }
	mov A,>L426
	push A
	mov A,<L426
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 765
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 766
; }
	cmp [X+1],1
	jnz L427
	.dbline 766
	push X
	mov A,>L429
	push A
	mov A,<L429
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L428
L427:
	.dbline 767
; }
	cmp [X+1],2
	jnz L430
	.dbline 767
	push X
	mov A,>L432
	push A
	mov A,<L432
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L430:
L428:
	.dbline 768
; }
	xcall _bucle_temp
	.dbline 769
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 770
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L433
	.dbline 770
	xcall _Pitido
L433:
	.dbline 771
; }
	cmp [X+0],1
	jnz L435
	.dbline 772
; }
	.dbline 773
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L437
X16:
	.dbline 773
	mov [X+1],1
	xjmp L436
L437:
	.dbline 774
; }
	inc [X+1]
	.dbline 775
; }
	xjmp L436
L435:
	.dbline 776
; }
	cmp [X+0],3
	jnz L439
	.dbline 777
; }
	.dbline 778
; }
	cmp [X+1],1
	jnz L441
	.dbline 779
; }
	.dbline 780
; }
	cmp [X-4],1
	jnz L443
	.dbline 781
; }
	.dbline 782
; }
	xcall _Numeros
	mov REG[0xd0],>_Int1_Tdisp
	mov [_Int1_Tdisp],A
	.dbline 783
; }
	xcall _Tiempos
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov [_Int1_Tdisp_Uni],A
	.dbline 784
; }
	xjmp L444
L443:
	.dbline 785
; }
	cmp [X-4],2
	jnz L445
	.dbline 786
; }
	.dbline 787
; }
	xcall _Numeros
	mov REG[0xd0],>_Int2_Tdisp
	mov [_Int2_Tdisp],A
	.dbline 788
; }
	xcall _Tiempos
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov [_Int2_Tdisp_Uni],A
	.dbline 789
; }
L445:
L444:
	.dbline 790
; }
	mov [X+0],4
	.dbline 791
; }
	xjmp L440
L441:
	.dbline 792
; }
	cmp [X+1],2
	jnz L440
	.dbline 793
; }
	.dbline 794
; }
	cmp [X-4],1
	jnz L449
	.dbline 794
	xcall _Numeros
	mov REG[0xd0],>_Int1_Ndisp
	mov [_Int1_Ndisp],A
	xjmp L440
L449:
	.dbline 795
; }
	cmp [X-4],2
	jnz L440
	.dbline 795
	xcall _Numeros
	mov REG[0xd0],>_Int2_Ndisp
	mov [_Int2_Ndisp],A
	.dbline 796
; }
	.dbline 797
; }
	xjmp L440
L439:
	.dbline 798
; }
	cmp [X+0],2
	jnz L453
	.dbline 799
; }
	.dbline 800
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L455
X17:
	.dbline 800
	mov [X+1],2
	xjmp L456
L455:
	.dbline 801
; }
	dec [X+1]
L456:
	.dbline 802
; }
L453:
L440:
L436:
	.dbline 803
L424:
	.dbline 803
; }
	cmp [X+0],4
	jnz L423
	.dbline -2
	.dbline 805
; }
; }
L418:
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
	.dbline 813
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 814
; }
	mov [X+1],1
	.dbline 817
; }
; }
; }
	cmp [X-4],1
	jnz L458
	.dbline 817
	mov REG[0xd0],>_Cam1
	mov [_Cam1],3
	xjmp L459
L458:
	.dbline 818
; }
	cmp [X-4],2
	jnz L460
	.dbline 818
	mov REG[0xd0],>_Cam2
	mov [_Cam2],3
L460:
L459:
L462:
	.dbline 820
; }
; }
	.dbline 821
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 822
; }
	mov A,>L465
	push A
	mov A,<L465
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 823
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 824
; }
	cmp [X+1],1
	jnz L466
	.dbline 824
	push X
	mov A,>L468
	push A
	mov A,<L468
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L467
L466:
	.dbline 825
; }
	cmp [X+1],2
	jnz L469
	.dbline 825
	push X
	mov A,>L471
	push A
	mov A,<L471
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L469:
L467:
	.dbline 826
; }
	xcall _bucle_temp
	.dbline 827
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 828
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L472
	.dbline 828
	xcall _Pitido
L472:
	.dbline 829
; }
	cmp [X+0],1
	jnz L474
	.dbline 830
; }
	.dbline 831
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L476
X18:
	.dbline 831
	mov [X+1],1
	xjmp L475
L476:
	.dbline 832
; }
	inc [X+1]
	.dbline 833
; }
	xjmp L475
L474:
	.dbline 834
; }
	cmp [X+0],3
	jnz L478
	.dbline 835
; }
	.dbline 836
; }
	cmp [X+1],1
	jnz L480
	.dbline 837
; }
	.dbline 838
; }
	cmp [X-4],1
	jnz L482
	.dbline 839
; }
	.dbline 840
; }
	xcall _Numeros
	mov REG[0xd0],>_TL1_Treal
	mov [_TL1_Treal],A
	.dbline 841
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL1_Treal_Uni
	mov [_TL1_Treal_Uni],A
	.dbline 842
; }
	xjmp L481
L482:
	.dbline 843
; }
	cmp [X-4],2
	jnz L481
	.dbline 844
; }
	.dbline 845
; }
	xcall _Numeros
	mov REG[0xd0],>_TL2_Treal
	mov [_TL2_Treal],A
	.dbline 846
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL2_Treal_Uni
	mov [_TL2_Treal_Uni],A
	.dbline 847
; }
	.dbline 848
; }
	xjmp L481
L480:
	.dbline 849
; }
	cmp [X+1],2
	jnz L486
	.dbline 850
; }
	.dbline 851
; }
	cmp [X-4],1
	jnz L488
	.dbline 852
; }
	.dbline 853
; }
	xcall _Numeros
	mov REG[0xd0],>_TL1_Tfilm
	mov [_TL1_Tfilm],A
	.dbline 854
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov [_TL1_Tfilm_Uni],A
	.dbline 855
; }
	xjmp L489
L488:
	.dbline 856
; }
	cmp [X-4],2
	jnz L490
	.dbline 857
; }
	.dbline 858
; }
	xcall _Numeros
	mov REG[0xd0],>_TL2_Tfilm
	mov [_TL2_Tfilm],A
	.dbline 859
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov [_TL2_Tfilm_Uni],A
	.dbline 860
; }
L490:
L489:
	.dbline 861
; }
L486:
L481:
	.dbline 862
; }
	mov [X+0],4
	.dbline 863
; }
	xjmp L479
L478:
	.dbline 864
; }
	cmp [X+0],2
	jnz L492
	.dbline 865
; }
	.dbline 866
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L494
X19:
	.dbline 866
	mov [X+1],2
	xjmp L495
L494:
	.dbline 867
; }
	dec [X+1]
L495:
	.dbline 868
; }
L492:
L479:
L475:
	.dbline 869
L463:
	.dbline 869
; }
	cmp [X+0],4
	jnz L462
	.dbline -2
	.dbline 871
; }
; }
L457:
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
;           menu -> X+6
;         pulsat -> X+5
;        mostrar -> X+4
;              x -> X+2
;       recortar -> X+1
;          zeros -> X+0
_Numeros::
	.dbline -1
	push X
	mov X,SP
	add SP,7
	.dbline 879
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 880
; }
	mov [X+6],1
L497:
	.dbline 884
; }
; }
; }
; }
	.dbline 885
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 886
; }
	mov A,>L500
	push A
	mov A,<L500
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 887
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 888
; }
	mov [X+3],0
	mov [X+2],0
	mov [X+0],100
	mov A,[X+6]
	mov [X+1],A
	xjmp L504
L501:
	.dbline 889
	.dbline 890
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov REG[0xd0],>__r0
	xcall __divmodu_8X8_8
	pop A
	mov [X+4],A
	add SP,-1
	.dbline 891
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	xcall __divmodu_8X8_8
	add SP,-1
	pop A
	mov [X+1],A
	.dbline 892
	mov A,10
	push A
	mov A,[X+0]
	push A
	xcall __divmodu_8X8_8
	pop A
	mov [X+0],A
	add SP,-1
	.dbline 893
	mov A,[X+4]
	add A,48
	push X
	xcall _LCD_WriteData
	pop X
	.dbline 894
L502:
	.dbline 888
	inc [X+3]
	adc [X+2],0
L504:
	.dbline 888
	mov A,[X+3]
	sub A,3
	mov A,[X+2]
	sbb A,0
	jc L501
X20:
	.dbline 895
; }
; }
; }
; }
; }
; }
; }
	xcall _bucle_temp
	.dbline 896
; }
	xcall _Pulsador
	mov [X+5],A
	.dbline 897
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L505
	.dbline 897
	xcall _Pitido
L505:
	.dbline 898
; }
	cmp [X+5],1
	jnz L507
	.dbline 899
; }
	.dbline 900
; }
	mov REG[0xd0],>__r0
	mov A,[X+6]
	add A,1
	mov [__r0],A
	mov A,100
	cmp A,[__r0]
	jnc L509
X21:
	.dbline 900
	mov [X+6],1
	xjmp L508
L509:
	.dbline 901
; }
	inc [X+6]
	.dbline 902
; }
	xjmp L508
L507:
	.dbline 903
; }
	cmp [X+5],3
	jnz L511
	.dbline 904
; }
	.dbline 905
; }
	mov A,[X+6]
	mov REG[0xd0],>__r0
	xjmp L496
L511:
	.dbline 907
; }
; }
	cmp [X+5],2
	jnz L513
	.dbline 908
; }
	.dbline 909
; }
	mov REG[0xd0],>__r0
	mov A,[X+6]
	sub A,1
	cmp A,1
	jnc L515
X22:
	.dbline 909
	mov [X+6],100
	xjmp L516
L515:
	.dbline 910
; }
	dec [X+6]
L516:
	.dbline 911
; }
L513:
L508:
	.dbline 912
L498:
	.dbline 912
; }
	cmp [X+5],5
	jnz L497
	.dbline -2
	.dbline 913
; }
L496:
	add SP,-7
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l menu 6 c
	.dbsym l pulsat 5 c
	.dbsym l mostrar 4 c
	.dbsym l x 2 i
	.dbsym l recortar 1 c
	.dbsym l zeros 0 c
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
	.dbline 921
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 922
; }
	mov [X+1],1
L518:
	.dbline 926
; }
; }
; }
; }
	.dbline 927
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 928
; }
	mov A,>L521
	push A
	mov A,<L521
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 929
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 930
; }
	cmp [X+1],1
	jnz L522
	.dbline 930
	push X
	mov A,>L524
	push A
	mov A,<L524
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L523
L522:
	.dbline 931
; }
	cmp [X+1],2
	jnz L525
	.dbline 931
	push X
	mov A,>L527
	push A
	mov A,<L527
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L526
L525:
	.dbline 932
; }
	cmp [X+1],3
	jnz L528
	.dbline 932
	push X
	mov A,>L530
	push A
	mov A,<L530
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L529
L528:
	.dbline 933
; }
	cmp [X+1],4
	jnz L531
	.dbline 933
	push X
	mov A,>L533
	push A
	mov A,<L533
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L531:
L529:
L526:
L523:
	.dbline 934
; }
	xcall _bucle_temp
	.dbline 935
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 936
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L534
	.dbline 936
	xcall _Pitido
L534:
	.dbline 937
; }
	cmp [X+0],1
	jnz L536
	.dbline 938
; }
	.dbline 939
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L538
X23:
	.dbline 939
	mov [X+1],1
	xjmp L537
L538:
	.dbline 940
; }
	inc [X+1]
	.dbline 941
; }
	xjmp L537
L536:
	.dbline 942
; }
	cmp [X+0],3
	jnz L540
	.dbline 943
; }
	.dbline 944
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	xjmp L517
L540:
	.dbline 946
; }
; }
	cmp [X+0],2
	jnz L542
	.dbline 947
; }
	.dbline 948
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L544
X24:
	.dbline 948
	mov [X+1],4
	xjmp L545
L544:
	.dbline 949
; }
	dec [X+1]
L545:
	.dbline 950
; }
L542:
L537:
	.dbline 951
L519:
	.dbline 951
; }
	cmp [X+0],5
	jnz L518
	.dbline -2
	.dbline 952
; }
L517:
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
	.dbline 962
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
	.dbline 963
; }
	mov [X+1],1
L547:
	.dbline 967
; }
; }
; }
; }
	.dbline 968
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 969
; }
	mov A,>L550
	push A
	mov A,<L550
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 970
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 971
; }
	mov A,>L551
	push A
	mov A,<L551
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 972
; }
	xcall _bucle_temp
	.dbline 973
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 974
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L552
	.dbline 974
	xcall _Pitido
	xjmp L553
L552:
	.dbline 975
; }
	cmp [X+0],3
	jnz L554
	.dbline 976
; }
	.dbline 977
; }
	cmp [X+1],1
	jnz L556
	.dbline 977
	xcall _Ara
L556:
	.dbline 978
; }
L554:
L553:
	.dbline 979
L548:
	.dbline 979
; }
	cmp [X+0],4
	jnz L547
	.dbline -2
	.dbline 980
; }
L546:
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
	.dbline 989
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 990
; }
	xcall _Reset_PdT
	.dbline 991
; }
	mov A,9
	push A
	xcall _Envia
	add SP,-1
	.dbline 992
; }
	mov REG[0xd0],>_Ent1
	mov A,[_Ent1]
	push A
	xcall _Envia
	.dbline 993
; }
	mov REG[0xd0],>_Ent2
	mov A,[_Ent2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 994
; }
	mov REG[0xd0],>_Ent3
	mov A,[_Ent3]
	push A
	xcall _Envia
	.dbline 995
; }
	mov REG[0xd0],>_Ent4
	mov A,[_Ent4]
	push A
	xcall _Envia
	add SP,-2
	.dbline 996
; }
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	push A
	xcall _Envia
	.dbline 997
; }
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 998
; }
	mov REG[0xd0],>_Fla1
	mov A,[_Fla1]
	push A
	xcall _Envia
	.dbline 999
; }
	mov REG[0xd0],>_Fla2
	mov A,[_Fla2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 1000
; }
	mov REG[0xd0],>_Fla3
	mov A,[_Fla3]
	push A
	xcall _Envia
	.dbline 1001
; }
	mov REG[0xd0],>_Fla4
	mov A,[_Fla4]
	push A
	xcall _Envia
	add SP,-2
	.dbline 1002
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L559
	.dbline 1002
	xcall _Pitido
L559:
	.dbline 1003
; }
	xcall _Trabajando
	.dbline -2
	.dbline 1004
; }
L558:
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
	.dbline 1014
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
L562:
	.dbline 1018
; }
; }
; }
; }
	.dbline 1019
; }
	push X
	mov A,[X-4]
	xcall _UART_PutChar
	.dbline 1020
; }
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 1021
; }
	mov A,[X-4]
	cmp A,[X+0]
	jnz L565
	.dbline 1021
	push X
	mov A,5
	xcall _UART_PutChar
	pop X
	xjmp L566
L565:
	.dbline 1022
; }
	push X
	mov A,4
	xcall _UART_PutChar
	pop X
L566:
	.dbline 1023
L563:
	.dbline 1023
; }
	mov A,[X-4]
	cmp A,[X+0]
	jnz L562
	.dbline -2
	.dbline 1024
; }
L561:
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
	.dbline 1033
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 1037
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1038
; }
	mov A,>L568
	push A
	mov A,<L568
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1039
	mov REG[0xd0],>_Interrupcion
	cmp [_Interrupcion],1
	jnz L569
	.dbline 1039
	mov [X+2],0
	mov [X+1],0
	xjmp L574
L571:
	.dbline 1039
L572:
	.dbline 1039
	inc [X+2]
	adc [X+1],0
L574:
	.dbline 1039
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
	jc L571
X26:
L569:
	.dbline 1040
; }
	push X
	xcall _Timer1seg_Stop
	pop X
	.dbline 1041
; }
L575:
	.dbline 1042
; }
	.dbline 1043
; }
	mov REG[0xd0],>_Interrupcion
	mov [_Interrupcion],1
	.dbline 1044
; }
	push X
	mov A,8
	xcall _LCD_Control
	pop X
	.dbline 1045
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1046
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L579
	.dbline 1046
	xcall _Pitido
L579:
	.dbline 1047
; }
	cmp [X+0],1
	jz L584
	cmp [X+0],2
	jz L584
	cmp [X+0],4
	jnz L581
L584:
	.dbline 1048
; }
	.dbline 1049
; }
	push X
	mov A,14
	xcall _LCD_Control
	.dbline 1050
; }
	mov A,1
	xcall _LCD_Control
	.dbline 1051
; }
	mov A,>L568
	push A
	mov A,<L568
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1052
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 1053
; }
	mov A,>L585
	push A
	mov A,<L585
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1054
; }
	mov X,78
	mov A,32
	xcall _Timer1seg_WritePeriod
	.dbline 1055
; }
	xcall _Timer1seg_Start
	pop X
	.dbline 1056
; }
	xjmp L575
L581:
	.dbline 1057
	cmp [X+0],3
	jnz L575
	.dbline 1058
	.dbline 1059
	xcall _Resetear
	.dbline 1060
	.dbline 1061
	.dbline 1041
	.dbline 1041
	xjmp L575
X25:
	.dbline -2
L567:
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
	.dbline 1071
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
	.dbline 1072
; }
	mov A,99
	push A
	xcall _Envia
	add SP,-1
	.dbline 1073
; }
	xcall _Principal
	.dbline -2
	.dbline 1074
; }
L588:
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
	.dbline 1084
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
	.dbline 1085
; }
	mov [X+1],1
L590:
	.dbline 1089
; }
; }
; }
; }
	.dbline 1090
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1091
; }
	mov A,>L593
	push A
	mov A,<L593
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1092
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1093
; }
	cmp [X+1],1
	jnz L594
	.dbline 1093
	push X
	mov A,>L596
	push A
	mov A,<L596
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L595
L594:
	.dbline 1094
; }
	cmp [X+1],2
	jnz L597
	.dbline 1094
	push X
	mov A,>L599
	push A
	mov A,<L599
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L598
L597:
	.dbline 1095
; }
	cmp [X+1],3
	jnz L600
	.dbline 1095
	push X
	mov A,>L602
	push A
	mov A,<L602
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L600:
L598:
L595:
	.dbline 1096
; }
	xcall _bucle_temp
	.dbline 1097
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1098
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L603
	.dbline 1098
	xcall _Pitido
L603:
	.dbline 1099
; }
	cmp [X+0],1
	jnz L605
	.dbline 1100
; }
	.dbline 1101
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L607
X27:
	.dbline 1101
	mov [X+1],1
	xjmp L606
L607:
	.dbline 1102
; }
	inc [X+1]
	.dbline 1103
; }
	xjmp L606
L605:
	.dbline 1104
; }
	cmp [X+0],3
	jnz L609
	.dbline 1105
; }
	.dbline 1106
; }
	cmp [X+1],1
	jnz L611
	.dbline 1106
	xcall _Reali_LCD
	xjmp L610
L611:
	.dbline 1107
; }
	cmp [X+1],2
	jnz L613
	.dbline 1107
	xcall _Zumbador
	xjmp L610
L613:
	.dbline 1108
; }
	cmp [X+1],3
	jnz L610
	.dbline 1108
	xcall _Ali_Led
	.dbline 1109
; }
	xjmp L610
L609:
	.dbline 1110
; }
	cmp [X+0],2
	jnz L617
	.dbline 1111
; }
	.dbline 1112
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L619
X28:
	.dbline 1112
	mov [X+1],3
	xjmp L620
L619:
	.dbline 1113
; }
	dec [X+1]
L620:
	.dbline 1114
; }
L617:
L610:
L606:
	.dbline 1115
L591:
	.dbline 1115
; }
	cmp [X+0],4
	jnz L590
	.dbline -2
	.dbline 1116
; }
L589:
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
	.dbline 1125
; }
; }
; }
; }
; }
; }
; }
; }
; }
L622:
	.dbline 1130
; }
; }
; }
; }
; }
	.dbline 1131
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1132
; }
	mov A,>L625
	push A
	mov A,<L625
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1133
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1134
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L626
	.dbline 1134
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L627
L626:
	.dbline 1135
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L627:
	.dbline 1136
; }
	xcall _bucle_temp
	.dbline 1137
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1138
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L628
	.dbline 1138
	xcall _Pitido
L628:
	.dbline 1139
; }
	cmp [X+0],1
	jz L632
	cmp [X+0],2
	jnz L630
L632:
	.dbline 1140
; }
	.dbline 1141
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1142
; }
	xjmp L631
L630:
	.dbline 1143
; }
	cmp [X+0],3
	jnz L633
	.dbline 1144
; }
	.dbline 1145
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L635
	.dbline 1146
; }
	.dbline 1147
; }
	or REG[ 0],2
	.dbline 1148
; }
	mov [_Luz_LCD],1
	.dbline 1149
; }
	xjmp L636
L635:
	.dbline 1151
; }
; }
	.dbline 1152
; }
	and REG[ 0],-3
	.dbline 1153
; }
	mov REG[0xd0],>_Luz_LCD
	mov [_Luz_LCD],0
	.dbline 1154
; }
L636:
	.dbline 1155
; }
L633:
L631:
	.dbline 1156
L623:
	.dbline 1156
; }
	cmp [X+0],4
	jnz L622
	.dbline -2
	.dbline 1157
; }
L621:
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
	.dbline 1166
; }
; }
; }
; }
; }
; }
; }
; }
; }
L638:
	.dbline 1171
; }
; }
; }
; }
; }
	.dbline 1172
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1173
; }
	mov A,>L641
	push A
	mov A,<L641
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1174
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1175
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L642
	.dbline 1175
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L643
L642:
	.dbline 1176
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L643:
	.dbline 1177
; }
	xcall _bucle_temp
	.dbline 1178
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1179
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L644
	.dbline 1179
	xcall _Pitido
L644:
	.dbline 1180
; }
	cmp [X+0],1
	jz L648
	cmp [X+0],2
	jnz L646
L648:
	.dbline 1181
; }
	.dbline 1182
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1183
; }
	xjmp L647
L646:
	.dbline 1184
; }
	cmp [X+0],3
	jnz L649
	.dbline 1185
; }
	.dbline 1186
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L651
	.dbline 1186
	mov [_Buzzer],1
	xjmp L652
L651:
	.dbline 1187
; }
	mov REG[0xd0],>_Buzzer
	mov [_Buzzer],0
L652:
	.dbline 1188
; }
L649:
L647:
	.dbline 1189
L639:
	.dbline 1189
; }
	cmp [X+0],4
	jnz L638
	.dbline -2
	.dbline 1190
; }
L637:
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
	.dbline 1199
; }
; }
; }
; }
; }
; }
; }
; }
; }
L654:
	.dbline 1204
; }
; }
; }
; }
; }
	.dbline 1205
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1206
; }
	mov A,>L657
	push A
	mov A,<L657
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1207
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1208
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L658
	.dbline 1208
	push X
	mov A,>L136
	push A
	mov A,<L136
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L659
L658:
	.dbline 1209
; }
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L659:
	.dbline 1210
; }
	xcall _bucle_temp
	.dbline 1211
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1212
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L660
	.dbline 1212
	xcall _Pitido
L660:
	.dbline 1213
; }
	cmp [X+0],1
	jz L664
	cmp [X+0],2
	jnz L662
L664:
	.dbline 1214
; }
	.dbline 1215
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1216
; }
	xjmp L663
L662:
	.dbline 1217
; }
	cmp [X+0],3
	jnz L665
	.dbline 1218
; }
	.dbline 1219
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L667
	.dbline 1220
; }
	.dbline 1221
; }
	or REG[ 0],16
	.dbline 1222
; }
	mov [_Alimentacion],1
	.dbline 1223
; }
	xjmp L668
L667:
	.dbline 1225
; }
; }
	.dbline 1226
; }
	and REG[ 0],-17
	.dbline 1227
; }
	mov REG[0xd0],>_Alimentacion
	mov [_Alimentacion],0
	.dbline 1228
; }
L668:
	.dbline 1229
; }
L665:
L663:
	.dbline 1230
L655:
	.dbline 1230
; }
	cmp [X+0],4
	jnz L654
	.dbline -2
	.dbline 1231
; }
L653:
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
L670:
	.dbline 36
	xcall _Principal
	.dbline 36
	.dbline 36
	xjmp L670
X29:
	.dbline -2
L669:
	add SP,-3
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l xx 1 I
	.dbsym l x 0 c
	.dbend
	.area data(ram, con, rel)
	.dbfile ./main.c
_TL2_Tfilm_Uni::
	.byte 0
	.dbfile ./terminal.h
	.dbsym e TL2_Tfilm_Uni _TL2_Tfilm_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL2_Tfilm::
	.byte 0
	.dbsym e TL2_Tfilm _TL2_Tfilm c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL2_Treal_Uni::
	.byte 0
	.dbsym e TL2_Treal_Uni _TL2_Treal_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL2_Treal::
	.byte 0
	.dbsym e TL2_Treal _TL2_Treal c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL1_Tfilm_Uni::
	.byte 0
	.dbsym e TL1_Tfilm_Uni _TL1_Tfilm_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL1_Tfilm::
	.byte 0
	.dbsym e TL1_Tfilm _TL1_Tfilm c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL1_Treal_Uni::
	.byte 0
	.dbsym e TL1_Treal_Uni _TL1_Treal_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL1_Treal::
	.byte 0
	.dbsym e TL1_Treal _TL1_Treal c
	.area lit(rom, con, rel)
L657:
	.byte 62,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L641:
	.byte 62,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o,0
L625:
	.byte 62,'L,'u,'z,32,'L,'C,'D,0
L602:
	.byte 51,45,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L599:
	.byte 50,45,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o
	.byte 0
L596:
	.byte 49,45,'L,'u,'z,32,'L,'C,'D,0
L593:
	.byte 62,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L585:
	.byte 'Q,'u,'i,'e,'r,'e,32,'p,'a,'r,'a,'r,'l,'o,63,0
L568:
	.byte 'P,'h,'o,'t,'o,'S,'O,'C,32,'a,'c,'t,'i,'v,'o,0
L551:
	.byte 49,45,'A,'h,'o,'r,'a,0
L550:
	.byte 62,'E,'j,'e,'c,'u,'t,'a,'r,0
L533:
	.byte 'H,'o,'r,'a,'s,0
L530:
	.byte 'M,'i,'n,'u,'t,'o,'s,0
L527:
	.byte 'S,'e,'g,'u,'n,'d,'o,'s,0
L524:
	.byte 'M,'i,'l,'i,'s,'e,'g,'u,'n,'d,'o,'s,0
L521:
	.byte 62,'U,'n,'i,46,32,'d,'e,32,'t,'i,'e,'m,'p,'o,0
L500:
	.byte 62,'N,'u,'m,'e,'r,'o,32,49,45,49,48,48,0
L471:
	.byte 'T,'i,'e,'m,'p,'o,32,'v,'i,'d,'e,'o,0
L468:
	.byte 'T,'i,'e,'m,'p,'o,32,'r,'e,'a,'l,0
L465:
	.byte 62,'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L432:
	.byte 'N,'u,'m,'e,'r,'o,32,'d,'e,32,'f,'o,'t,'o,'s,0
L429:
	.byte 'T,32,'e,'n,'t,'r,'e,32,'f,'o,'t,'o,0
L426:
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
