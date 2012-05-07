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
	.dbline 51
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
; 		
; 		- Detectar cierto numero y que lo muestre por el LCD		
	.dbline 54
	mov [X+1],0
	mov [X+0],0
	xjmp L5
L2:
	.dbline 54
L3:
	.dbline 54
	inc [X+1]
	adc [X+0],0
L5:
	.dbline 54
; 		LCD_Control(0x01);
; 		LCD_WriteData(+48);
; 		for(x=0;x<50000;x++);
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
	.dbline 55
; 		*/		
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
	.dbline 64
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 67
; }
; }
; }
	or REG[ 0],8
	.dbline 68
	mov [X+1],0
	mov [X+0],0
L7:
	.dbline 68
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
L8:
	.dbline 68
; }
	inc [X+1]
	adc [X+0],0
	.dbline 68
	mov A,[X+1]
	sub A,-96
	mov A,[X+0]
	xor A,-128
	sbb A,(15 ^ 0x80)
	jc L7
X1:
	.dbline 69
; }
	and REG[ 0],-9
	.dbline -2
	.dbline 70
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
	.dbline 79
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 82
; }
; }
; }
	or REG[ 0],4
	.dbline 83
	mov [X+1],0
	mov [X+0],0
L12:
	.dbline 83
L13:
	.dbline 83
; }
	inc [X+1]
	adc [X+0],0
	.dbline 83
	mov A,[X+1]
	sub A,-12
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L12
X2:
	.dbline 84
; }
	and REG[ 0],-5
	.dbline 85
	mov [X+1],0
	mov [X+0],0
L16:
	.dbline 85
L17:
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
	jc L16
X3:
	.dbline -2
	.dbline 86
; }
L11:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 I
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
	.dbline 99
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
	.dbline 103
; }
; }
; }
; }
	mov [X+2],0
L21:
	.dbline 107
; }
; }
; }
; }
	.dbline 108
; }
	push X
	xcall _UART_cReadChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+3],A
	.dbline 109
; }
	cmp [X+3],-1
	jnz L24
	.dbline 109
L24:
	.dbline 110
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],32
	jnz L26
	.dbline 110
	mov [X+2],1
L26:
	.dbline 111
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-128
	jnz L28
	.dbline 111
	mov [X+2],2
L28:
	.dbline 112
; }
	cmp [X+2],0
	jz L30
	.dbline 113
; }
	.dbline 114
	mov [X+1],0
	mov [X+0],0
	xjmp L35
L32:
	.dbline 114
L33:
	.dbline 114
	inc [X+1]
	adc [X+0],0
L35:
	.dbline 114
; }
	mov A,[X+1]
	sub A,100
	mov A,[X+0]
	sbb A,0
	jc L32
X4:
	.dbline 115
; }
	mov [X+1],0
	mov [X+0],0
	xjmp L39
L36:
	.dbline 116
; }
	.dbline 117
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-96
	jnz L40
	.dbline 117
	mov A,[X+2]
	xjmp L20
L40:
	.dbline 118
	or REG[ 0],-96
	.dbline 119
L37:
	.dbline 115
	inc [X+1]
	adc [X+0],0
L39:
	.dbline 115
	mov A,[X+1]
	sub A,48
	mov A,[X+0]
	sbb A,117
	jc L36
X5:
	.dbline 120
; }
; }
; }
	add [X+2],2
	.dbline 121
; }
L30:
	.dbline 122
; }
	push X
	xcall _UART_cReadChar
	mov REG[0xd0],>__r0
	pop X
	cmp A,-5
	jnz L42
	.dbline 122
	xcall _Principal
L42:
	.dbline 123
L22:
	.dbline 123
; }
	cmp [X+2],0
	jz L21
	.dbline 124
; }
	mov A,[X+2]
	mov REG[0xd0],>__r0
	.dbline -2
L20:
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
	.dbline 135
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
	.dbline 139
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 140
; }
	mov X,1
	mov A,0
	xcall _LCD_Position
	.dbline 141
; }
	mov A,>L45
	push A
	mov A,<L45
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 142
; }
	mov X,3
	mov A,1
	xcall _LCD_Position
	.dbline 143
; }
	mov A,>L46
	push A
	mov A,<L46
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 144
; }
	xcall _bucle_temp
	.dbline 145
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 146
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L47
	.dbline 146
	xcall _Pitido
L47:
	.dbline 147
	cmp [X+0],0
	jz L49
	.dbline 148
	.dbline 149
	xcall _Menu
	.dbline 150
L49:
	.dbline -2
	.dbline 151
; }
; }
; }
; }
; }
L44:
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
	.dbline 161
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
	.dbline 162
; }
	mov [X+0],1
L52:
	.dbline 166
; }
; }
; }
; }
	.dbline 167
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 168
; }
	mov A,>L55
	push A
	mov A,<L55
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 169
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 170
; }
	cmp [X+0],1
	jnz L56
	.dbline 170
	push X
	mov A,>L58
	push A
	mov A,<L58
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L57
L56:
	.dbline 171
; }
	cmp [X+0],2
	jnz L59
	.dbline 171
	push X
	mov A,>L61
	push A
	mov A,<L61
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L60
L59:
	.dbline 172
; }
	cmp [X+0],3
	jnz L62
	.dbline 172
	push X
	mov A,>L64
	push A
	mov A,<L64
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L63
L62:
	.dbline 173
; }
	cmp [X+0],4
	jnz L65
	.dbline 173
	push X
	mov A,>L67
	push A
	mov A,<L67
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L66
L65:
	.dbline 174
; }
	cmp [X+0],5
	jnz L68
	.dbline 174
	push X
	mov A,>L70
	push A
	mov A,<L70
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L68:
L66:
L63:
L60:
L57:
	.dbline 175
; }
	xcall _bucle_temp
	.dbline 176
; }
	xcall _Pulsador
	mov [X+1],A
	.dbline 177
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L71
	.dbline 177
	xcall _Pitido
L71:
	.dbline 178
; }
	cmp [X+1],1
	jnz L73
	.dbline 179
; }
	.dbline 180
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	add A,1
	mov [__r0],A
	mov A,5
	cmp A,[__r0]
	jnc L75
X6:
	.dbline 180
	mov [X+0],1
	xjmp L74
L75:
	.dbline 181
; }
	inc [X+0]
	.dbline 182
; }
	xjmp L74
L73:
	.dbline 183
; }
	cmp [X+1],3
	jnz L77
	.dbline 184
; }
	.dbline 185
; }
	cmp [X+0],1
	jnz L79
	.dbline 185
	xcall _Sensors
	xjmp L78
L79:
	.dbline 186
; }
	cmp [X+0],2
	jnz L81
	.dbline 186
	xcall _Flashes
	xjmp L78
L81:
	.dbline 187
; }
	cmp [X+0],3
	jnz L83
	.dbline 187
	xcall _Dispar
	xjmp L78
L83:
	.dbline 188
; }
	cmp [X+0],4
	jnz L85
	.dbline 188
	xcall _Executar
	xjmp L78
L85:
	.dbline 189
; }
	cmp [X+0],5
	jnz L78
	.dbline 189
	xcall _Sistema
	.dbline 190
; }
	xjmp L78
L77:
	.dbline 191
; }
	cmp [X+1],2
	jnz L89
	.dbline 192
; }
	.dbline 193
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	sub A,1
	cmp A,1
	jnc L91
X7:
	.dbline 193
	mov [X+0],5
	xjmp L92
L91:
	.dbline 194
; }
	dec [X+0]
L92:
	.dbline 195
; }
L89:
L78:
L74:
	.dbline 196
L53:
	.dbline 196
; }
	cmp [X+1],4
	jnz L52
	.dbline -2
	.dbline 197
; }
L51:
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
	.dbline 207
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
	.dbline 208
; }
	mov [X+1],1
L94:
	.dbline 212
; }
; }
; }
; }
	.dbline 213
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 214
; }
	mov A,>L97
	push A
	mov A,<L97
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 215
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 216
; }
	cmp [X+1],1
	jnz L98
	.dbline 216
	push X
	mov A,>L100
	push A
	mov A,<L100
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L99
L98:
	.dbline 217
; }
	cmp [X+1],2
	jnz L101
	.dbline 217
	push X
	mov A,>L103
	push A
	mov A,<L103
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L102
L101:
	.dbline 218
; }
	cmp [X+1],3
	jnz L104
	.dbline 218
	push X
	mov A,>L106
	push A
	mov A,<L106
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L105
L104:
	.dbline 219
; }
	cmp [X+1],4
	jnz L107
	.dbline 219
	push X
	mov A,>L109
	push A
	mov A,<L109
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L107:
L105:
L102:
L99:
	.dbline 220
; }
	xcall _bucle_temp
	.dbline 221
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 222
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L110
	.dbline 222
	xcall _Pitido
L110:
	.dbline 223
; }
	cmp [X+0],1
	jnz L112
	.dbline 224
; }
	.dbline 225
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L114
X8:
	.dbline 225
	mov [X+1],1
	xjmp L113
L114:
	.dbline 226
; }
	inc [X+1]
	.dbline 227
; }
	xjmp L113
L112:
	.dbline 228
; }
	cmp [X+0],3
	jnz L116
	.dbline 229
; }
	.dbline 230
; }
	cmp [X+1],1
	jnz L118
	.dbline 230
	xcall _Entrada1
	xjmp L117
L118:
	.dbline 231
; }
	cmp [X+1],2
	jnz L120
	.dbline 231
	xcall _Entrada2
	xjmp L117
L120:
	.dbline 232
; }
	cmp [X+1],3
	jnz L122
	.dbline 232
	xcall _Entrada3
	xjmp L117
L122:
	.dbline 233
; }
	cmp [X+1],4
	jnz L117
	.dbline 233
	xcall _Entrada4
	.dbline 234
; }
	xjmp L117
L116:
	.dbline 235
; }
	cmp [X+0],2
	jnz L126
	.dbline 236
; }
	.dbline 237
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L128
X9:
	.dbline 237
	mov [X+1],4
	xjmp L129
L128:
	.dbline 238
; }
	dec [X+1]
L129:
	.dbline 239
; }
L126:
L117:
L113:
	.dbline 240
L95:
	.dbline 240
; }
	cmp [X+0],4
	jnz L94
	.dbline -2
	.dbline 241
; }
L93:
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
	.dbline 251
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
L131:
	.dbline 256
; }
; }
; }
; }
; }
	.dbline 257
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 258
; }
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 259
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 260
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L135
	.dbline 260
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L136
L135:
	.dbline 261
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L136:
	.dbline 262
; }
	xcall _bucle_temp
	.dbline 263
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 264
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L139
	.dbline 264
	xcall _Pitido
L139:
	.dbline 265
; }
	cmp [X+0],1
	jz L143
	cmp [X+0],2
	jnz L141
L143:
	.dbline 266
; }
	.dbline 267
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 268
; }
	xjmp L142
L141:
	.dbline 269
; }
	cmp [X+0],3
	jnz L144
	.dbline 270
; }
	.dbline 271
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L146
	.dbline 271
	mov [_Ent1],1
	xjmp L147
L146:
	.dbline 272
; }
	mov REG[0xd0],>_Ent1
	mov [_Ent1],0
L147:
	.dbline 273
; }
L144:
L142:
	.dbline 274
L132:
	.dbline 274
; }
	cmp [X+0],4
	jnz L131
	.dbline -2
	.dbline 275
; }
L130:
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
	.dbline 285
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
L149:
	.dbline 290
; }
; }
; }
; }
; }
	.dbline 291
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 292
; }
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 293
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 294
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L153
	.dbline 294
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L154
L153:
	.dbline 295
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L154:
	.dbline 296
; }
	xcall _bucle_temp
	.dbline 297
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 298
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L155
	.dbline 298
	xcall _Pitido
L155:
	.dbline 299
; }
	cmp [X+0],1
	jz L159
	cmp [X+0],2
	jnz L157
L159:
	.dbline 300
; }
	.dbline 301
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 302
; }
	xjmp L158
L157:
	.dbline 303
; }
	cmp [X+0],3
	jnz L160
	.dbline 304
; }
	.dbline 305
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L162
	.dbline 305
	mov [_Ent2],1
	xjmp L163
L162:
	.dbline 306
; }
	mov REG[0xd0],>_Ent2
	mov [_Ent2],0
L163:
	.dbline 307
; }
L160:
L158:
	.dbline 308
L150:
	.dbline 308
; }
	cmp [X+0],4
	jnz L149
	.dbline -2
	.dbline 309
; }
L148:
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
	.dbline 319
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
L165:
	.dbline 324
; }
; }
; }
; }
; }
	.dbline 325
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 326
; }
	mov A,>L168
	push A
	mov A,<L168
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 327
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 328
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L169
	.dbline 328
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L170
L169:
	.dbline 329
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L170:
	.dbline 330
; }
	xcall _bucle_temp
	.dbline 331
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 332
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L171
	.dbline 332
	xcall _Pitido
L171:
	.dbline 333
; }
	cmp [X+0],1
	jz L175
	cmp [X+0],2
	jnz L173
L175:
	.dbline 334
; }
	.dbline 335
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 336
; }
	xjmp L174
L173:
	.dbline 337
; }
	cmp [X+0],3
	jnz L176
	.dbline 338
; }
	.dbline 339
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L178
	.dbline 339
	mov [_Ent3],1
	xjmp L179
L178:
	.dbline 340
; }
	mov REG[0xd0],>_Ent3
	mov [_Ent3],0
L179:
	.dbline 341
; }
L176:
L174:
	.dbline 342
L166:
	.dbline 342
; }
	cmp [X+0],4
	jnz L165
	.dbline -2
	.dbline 343
; }
L164:
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
	.dbline 353
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
L181:
	.dbline 358
; }
; }
; }
; }
; }
	.dbline 359
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 360
; }
	mov A,>L184
	push A
	mov A,<L184
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 361
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 362
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L185
	.dbline 362
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L186
L185:
	.dbline 363
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L186:
	.dbline 364
; }
	xcall _bucle_temp
	.dbline 365
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 366
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L187
	.dbline 366
	xcall _Pitido
L187:
	.dbline 367
; }
	cmp [X+0],1
	jz L191
	cmp [X+0],2
	jnz L189
L191:
	.dbline 368
; }
	.dbline 369
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 370
; }
	xjmp L190
L189:
	.dbline 371
; }
	cmp [X+0],3
	jnz L192
	.dbline 372
; }
	.dbline 373
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L194
	.dbline 373
	mov [_Ent4],1
	xjmp L195
L194:
	.dbline 374
; }
	mov REG[0xd0],>_Ent4
	mov [_Ent4],0
L195:
	.dbline 375
; }
L192:
L190:
	.dbline 376
L182:
	.dbline 376
; }
	cmp [X+0],4
	jnz L181
	.dbline -2
	.dbline 377
; }
L180:
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
	.dbline 387
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
	.dbline 388
; }
	mov [X+1],1
L197:
	.dbline 392
; }
; }
; }
; }
	.dbline 393
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 394
; }
	mov A,>L200
	push A
	mov A,<L200
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 395
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 396
; }
	cmp [X+1],1
	jnz L201
	.dbline 397
; }
	.dbline 398
; }
	push X
	mov A,>L203
	push A
	mov A,<L203
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 399
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L204
	.dbline 399
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L202
L204:
	.dbline 400
; }
	push X
	mov A,>L207
	push A
	mov A,<L207
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 401
; }
	xjmp L202
L201:
	.dbline 402
; }
	cmp [X+1],2
	jnz L208
	.dbline 403
; }
	.dbline 404
; }
	push X
	mov A,>L210
	push A
	mov A,<L210
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 405
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L211
	.dbline 405
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L209
L211:
	.dbline 406
; }
	push X
	mov A,>L207
	push A
	mov A,<L207
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 407
; }
	xjmp L209
L208:
	.dbline 408
; }
	cmp [X+1],3
	jnz L213
	.dbline 409
; }
	.dbline 411
; }
; }
	push X
	mov A,>L215
	push A
	mov A,<L215
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 412
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L216
	.dbline 412
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L214
L216:
	.dbline 413
; }
	push X
	mov A,>L207
	push A
	mov A,<L207
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 414
; }
	xjmp L214
L213:
	.dbline 415
; }
	cmp [X+1],4
	jnz L218
	.dbline 416
; }
	.dbline 417
; }
	push X
	mov A,>L220
	push A
	mov A,<L220
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 418
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L221
	.dbline 418
	push X
	mov A,>L223
	push A
	mov A,<L223
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L222
L221:
	.dbline 419
; }
	push X
	mov A,>L207
	push A
	mov A,<L207
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L222:
	.dbline 420
; }
L218:
L214:
L209:
L202:
	.dbline 421
; }
	xcall _bucle_temp
	.dbline 422
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 423
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L224
	.dbline 423
	xcall _Pitido
L224:
	.dbline 424
; }
	cmp [X+0],1
	jnz L226
	.dbline 425
; }
	.dbline 426
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L228
X10:
	.dbline 426
	mov [X+1],1
	xjmp L227
L228:
	.dbline 427
; }
	inc [X+1]
	.dbline 428
; }
	xjmp L227
L226:
	.dbline 429
; }
	cmp [X+0],3
	jnz L230
	.dbline 430
; }
	.dbline 431
; }
	cmp [X+1],1
	jnz L232
	.dbline 431
	xcall _Flash1
	xjmp L231
L232:
	.dbline 432
; }
	cmp [X+1],2
	jnz L234
	.dbline 432
	xcall _Flash2
	xjmp L231
L234:
	.dbline 433
; }
	cmp [X+1],3
	jnz L236
	.dbline 433
	xcall _Flash3
	xjmp L231
L236:
	.dbline 434
; }
	cmp [X+1],4
	jnz L231
	.dbline 434
	xcall _Flash4
	.dbline 435
; }
	xjmp L231
L230:
	.dbline 436
; }
	cmp [X+0],2
	jnz L240
	.dbline 437
; }
	.dbline 438
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L242
X11:
	.dbline 438
	mov [X+1],4
	xjmp L243
L242:
	.dbline 439
; }
	dec [X+1]
L243:
	.dbline 440
; }
L240:
L231:
L227:
	.dbline 441
L198:
	.dbline 441
; }
	cmp [X+0],4
	jnz L197
	.dbline -2
	.dbline 442
; }
L196:
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
	.dbline 451
; }
; }
; }
; }
; }
; }
; }
; }
; }
L245:
	.dbline 456
; }
; }
; }
; }
; }
	.dbline 457
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 458
; }
	mov A,>L248
	push A
	mov A,<L248
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 459
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 460
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L249
	.dbline 460
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L250
L249:
	.dbline 461
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L250:
	.dbline 462
; }
	xcall _bucle_temp
	.dbline 463
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 464
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L251
	.dbline 464
	xcall _Pitido
L251:
	.dbline 465
; }
	cmp [X+0],1
	jz L255
	cmp [X+0],2
	jnz L253
L255:
	.dbline 466
; }
	.dbline 467
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 468
; }
	xjmp L254
L253:
	.dbline 469
; }
	cmp [X+0],3
	jnz L256
	.dbline 470
; }
	.dbline 471
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L258
	.dbline 471
	mov [_Fla1],1
	xjmp L259
L258:
	.dbline 472
; }
	mov REG[0xd0],>_Fla1
	mov [_Fla1],0
L259:
	.dbline 473
; }
L256:
L254:
	.dbline 474
L246:
	.dbline 474
; }
	cmp [X+0],4
	jnz L245
	.dbline -2
	.dbline 475
; }
L244:
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
	.dbline 485
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
L261:
	.dbline 490
; }
; }
; }
; }
; }
	.dbline 491
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 492
; }
	mov A,>L264
	push A
	mov A,<L264
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 493
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 494
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L265
	.dbline 494
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L266
L265:
	.dbline 495
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L266:
	.dbline 496
; }
	xcall _bucle_temp
	.dbline 497
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 498
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L267
	.dbline 498
	xcall _Pitido
L267:
	.dbline 499
; }
	cmp [X+0],1
	jz L271
	cmp [X+0],2
	jnz L269
L271:
	.dbline 500
; }
	.dbline 501
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 502
; }
	xjmp L270
L269:
	.dbline 503
; }
	cmp [X+0],3
	jnz L272
	.dbline 504
; }
	.dbline 505
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L274
	.dbline 505
	mov [_Fla2],1
	xjmp L275
L274:
	.dbline 506
; }
	mov REG[0xd0],>_Fla2
	mov [_Fla2],0
L275:
	.dbline 507
; }
L272:
L270:
	.dbline 508
L262:
	.dbline 508
; }
	cmp [X+0],4
	jnz L261
	.dbline -2
	.dbline 509
; }
L260:
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
	.dbline 518
; }
; }
; }
; }
; }
; }
; }
; }
; }
L277:
	.dbline 523
; }
; }
; }
; }
; }
	.dbline 524
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 525
; }
	mov A,>L280
	push A
	mov A,<L280
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 526
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 527
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L281
	.dbline 527
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L282
L281:
	.dbline 528
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L282:
	.dbline 529
; }
	xcall _bucle_temp
	.dbline 530
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 531
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L283
	.dbline 531
	xcall _Pitido
L283:
	.dbline 532
; }
	cmp [X+0],1
	jz L287
	cmp [X+0],2
	jnz L285
L287:
	.dbline 533
; }
	.dbline 534
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 535
; }
	xjmp L286
L285:
	.dbline 536
; }
	cmp [X+0],3
	jnz L288
	.dbline 537
; }
	.dbline 538
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L290
	.dbline 538
	mov [_Fla3],1
	xjmp L291
L290:
	.dbline 539
; }
	mov REG[0xd0],>_Fla3
	mov [_Fla3],0
L291:
	.dbline 540
; }
L288:
L286:
	.dbline 541
L278:
	.dbline 541
; }
	cmp [X+0],4
	jnz L277
	.dbline -2
	.dbline 542
; }
L276:
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
	.dbline 551
; }
; }
; }
; }
; }
; }
; }
; }
; }
L293:
	.dbline 556
; }
; }
; }
; }
; }
	.dbline 557
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 558
; }
	mov A,>L296
	push A
	mov A,<L296
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 559
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 560
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L297
	.dbline 560
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L298
L297:
	.dbline 561
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L298:
	.dbline 562
; }
	xcall _bucle_temp
	.dbline 563
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 564
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L299
	.dbline 564
	xcall _Pitido
L299:
	.dbline 565
; }
	cmp [X+0],1
	jz L303
	cmp [X+0],2
	jnz L301
L303:
	.dbline 566
; }
	.dbline 567
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 568
; }
	xjmp L302
L301:
	.dbline 569
; }
	cmp [X+0],3
	jnz L304
	.dbline 570
; }
	.dbline 571
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L306
	.dbline 571
	mov [_Fla4],1
	xjmp L307
L306:
	.dbline 572
; }
	mov REG[0xd0],>_Fla4
	mov [_Fla4],0
L307:
	.dbline 573
; }
L304:
L302:
	.dbline 574
L294:
	.dbline 574
; }
	cmp [X+0],4
	jnz L293
	.dbline -2
	.dbline 575
; }
L292:
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
	.dbline 585
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
	.dbline 587
; }
; }
	mov [X+1],1
L309:
	.dbline 591
; }
; }
; }
; }
	.dbline 592
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 593
; }
	mov A,>L312
	push A
	mov A,<L312
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 594
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 595
; }
	cmp [X+1],1
	jnz L313
	.dbline 595
	push X
	mov A,>L315
	push A
	mov A,<L315
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L314
L313:
	.dbline 596
; }
	cmp [X+1],2
	jnz L316
	.dbline 596
	push X
	mov A,>L318
	push A
	mov A,<L318
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L316:
L314:
	.dbline 597
; }
	xcall _bucle_temp
	.dbline 598
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 599
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L319
	.dbline 599
	xcall _Pitido
L319:
	.dbline 600
; }
	cmp [X+0],1
	jnz L321
	.dbline 601
; }
	.dbline 602
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L323
X12:
	.dbline 602
	mov [X+1],1
	xjmp L322
L323:
	.dbline 603
; }
	inc [X+1]
	.dbline 604
; }
	xjmp L322
L321:
	.dbline 605
; }
	cmp [X+0],3
	jnz L325
	.dbline 606
; }
	.dbline 607
; }
	cmp [X+1],1
	jnz L327
	.dbline 607
	xcall _Camara1
	xjmp L326
L327:
	.dbline 608
; }
	cmp [X+1],2
	jnz L326
	.dbline 608
	xcall _Camara2
	.dbline 609
; }
	xjmp L326
L325:
	.dbline 610
; }
	cmp [X+0],2
	jnz L331
	.dbline 611
; }
	.dbline 612
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L333
X13:
	.dbline 612
	mov [X+1],2
	xjmp L334
L333:
	.dbline 613
; }
	dec [X+1]
L334:
	.dbline 614
; }
L331:
L326:
L322:
	.dbline 615
L310:
	.dbline 615
; }
	cmp [X+0],4
	jnz L309
	.dbline -2
	.dbline 616
; }
L308:
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
	.dbline 625
; }
; }
; }
; }
; }
; }
; }
; }
; }
L336:
	.dbline 630
; }
; }
; }
; }
; }
	.dbline 631
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 632
; }
	mov A,>L339
	push A
	mov A,<L339
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 633
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 634
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],0
	jnz L340
	.dbline 634
	push X
	mov A,>L342
	push A
	mov A,<L342
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L341
L340:
	.dbline 635
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L343
	.dbline 635
	push X
	mov A,>L345
	push A
	mov A,<L345
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L344
L343:
	.dbline 636
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L346
	.dbline 636
	push X
	mov A,>L348
	push A
	mov A,<L348
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L347
L346:
	.dbline 637
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L349
	.dbline 637
	push X
	mov A,>L351
	push A
	mov A,<L351
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L349:
L347:
L344:
L341:
	.dbline 638
; }
	xcall _bucle_temp
	.dbline 639
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 640
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L352
	.dbline 640
	xcall _Pitido
L352:
	.dbline 641
; }
	cmp [X+0],1
	jz L356
	cmp [X+0],2
	jnz L354
L356:
	.dbline 642
; }
	.dbline 643
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 644
; }
	xjmp L355
L354:
	.dbline 645
; }
	cmp [X+0],3
	jnz L357
	.dbline 646
; }
	.dbline 647
; }
	mov A,1
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 648
; }
L357:
L355:
	.dbline 649
L337:
	.dbline 649
; }
	cmp [X+0],4
	jnz L336
	.dbline -2
	.dbline 650
; }
L335:
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
	.dbline 659
; }
; }
; }
; }
; }
; }
; }
; }
; }
L360:
	.dbline 664
; }
; }
; }
; }
; }
	.dbline 665
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 666
; }
	mov A,>L363
	push A
	mov A,<L363
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 667
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 668
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],0
	jnz L364
	.dbline 668
	push X
	mov A,>L342
	push A
	mov A,<L342
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L365
L364:
	.dbline 669
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L366
	.dbline 669
	push X
	mov A,>L345
	push A
	mov A,<L345
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L367
L366:
	.dbline 670
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L368
	.dbline 670
	push X
	mov A,>L348
	push A
	mov A,<L348
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L369
L368:
	.dbline 671
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L370
	.dbline 671
	push X
	mov A,>L351
	push A
	mov A,<L351
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L370:
L369:
L367:
L365:
	.dbline 672
; }
	xcall _bucle_temp
	.dbline 673
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 674
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L372
	.dbline 674
	xcall _Pitido
L372:
	.dbline 675
; }
	cmp [X+0],1
	jz L376
	cmp [X+0],2
	jnz L374
L376:
	.dbline 676
; }
	.dbline 677
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 678
; }
	xjmp L375
L374:
	.dbline 679
; }
	cmp [X+0],3
	jnz L377
	.dbline 680
; }
	.dbline 681
; }
	mov A,2
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 682
; }
L377:
L375:
	.dbline 683
L361:
	.dbline 683
; }
	cmp [X+0],4
	jnz L360
	.dbline -2
	.dbline 684
; }
L359:
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
	.dbline 694
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
	.dbline 698
; }
; }
; }
; }
	cmp [X-4],1
	jnz L380
	.dbline 698
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	add A,1
	mov [X+1],A
	xjmp L381
L380:
	.dbline 699
; }
	cmp [X-4],2
	jnz L382
	.dbline 699
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	add A,1
	mov [X+1],A
L382:
L381:
L384:
	.dbline 702
; }
; }
; }
	.dbline 703
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 704
; }
	mov A,>L387
	push A
	mov A,<L387
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 705
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 706
; }
	cmp [X+1],1
	jnz L388
	.dbline 706
	push X
	mov A,>L342
	push A
	mov A,<L342
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L389
L388:
	.dbline 707
; }
	cmp [X+1],2
	jnz L390
	.dbline 707
	push X
	mov A,>L345
	push A
	mov A,<L345
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L391
L390:
	.dbline 708
; }
	cmp [X+1],3
	jnz L392
	.dbline 708
	push X
	mov A,>L348
	push A
	mov A,<L348
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L393
L392:
	.dbline 709
; }
	cmp [X+1],4
	jnz L394
	.dbline 709
	push X
	mov A,>L351
	push A
	mov A,<L351
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L394:
L393:
L391:
L389:
	.dbline 710
; }
	xcall _bucle_temp
	.dbline 711
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 712
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L396
	.dbline 712
	xcall _Pitido
L396:
	.dbline 713
; }
	cmp [X+0],1
	jnz L398
	.dbline 714
; }
	.dbline 715
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L400
X14:
	.dbline 715
	mov [X+1],1
	xjmp L399
L400:
	.dbline 716
; }
	inc [X+1]
	.dbline 717
; }
	xjmp L399
L398:
	.dbline 718
; }
	cmp [X+0],3
	jnz L402
	.dbline 719
; }
	.dbline 720
; }
	cmp [X+1],1
	jz L406
	cmp [X+1],2
	jnz L404
L406:
	.dbline 721
; }
	.dbline 722
; }
	cmp [X-4],1
	jnz L407
	.dbline 722
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L405
L407:
	.dbline 723
; }
	cmp [X-4],2
	jnz L405
	.dbline 723
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 724
; }
	xjmp L405
L404:
	.dbline 725
; }
	cmp [X+1],3
	jnz L411
	.dbline 725
	mov A,[X-4]
	push A
	xcall _Intervalometro
	add SP,-1
	xjmp L412
L411:
	.dbline 726
; }
	cmp [X+1],4
	jnz L413
	.dbline 726
	mov A,[X-4]
	push A
	xcall _TimeLapse
	add SP,-1
L413:
L412:
L405:
	.dbline 727
; }
	mov [X+0],4
	.dbline 728
; }
	xjmp L403
L402:
	.dbline 729
; }
	cmp [X+0],2
	jnz L415
	.dbline 730
; }
	.dbline 731
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L417
X15:
	.dbline 731
	mov [X+1],4
	xjmp L418
L417:
	.dbline 732
; }
	dec [X+1]
L418:
	.dbline 733
; }
L415:
L403:
L399:
	.dbline 734
L385:
	.dbline 734
; }
	cmp [X+0],4
	jnz L384
	.dbline -2
	.dbline 735
; }
L379:
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
	.dbline 743
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 744
; }
	mov [X+1],1
	.dbline 747
; }
; }
; }
	cmp [X-4],1
	jnz L420
	.dbline 747
	mov REG[0xd0],>_Cam1
	mov [_Cam1],2
	xjmp L421
L420:
	.dbline 748
; }
	cmp [X-4],2
	jnz L422
	.dbline 748
	mov REG[0xd0],>_Cam2
	mov [_Cam2],2
L422:
L421:
L424:
	.dbline 750
; }
; }
	.dbline 751
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 752
; }
	mov A,>L427
	push A
	mov A,<L427
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 753
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 754
; }
	cmp [X+1],1
	jnz L428
	.dbline 754
	push X
	mov A,>L430
	push A
	mov A,<L430
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L429
L428:
	.dbline 755
; }
	cmp [X+1],2
	jnz L431
	.dbline 755
	push X
	mov A,>L433
	push A
	mov A,<L433
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L431:
L429:
	.dbline 756
; }
	xcall _bucle_temp
	.dbline 757
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 758
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L434
	.dbline 758
	xcall _Pitido
L434:
	.dbline 759
; }
	cmp [X+0],1
	jnz L436
	.dbline 760
; }
	.dbline 761
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L438
X16:
	.dbline 761
	mov [X+1],1
	xjmp L437
L438:
	.dbline 762
; }
	inc [X+1]
	.dbline 763
; }
	xjmp L437
L436:
	.dbline 764
; }
	cmp [X+0],3
	jnz L440
	.dbline 765
; }
	.dbline 766
; }
	cmp [X+1],1
	jnz L442
	.dbline 767
; }
	.dbline 768
; }
	cmp [X-4],1
	jnz L444
	.dbline 769
; }
	.dbline 770
; }
	xcall _Numeros
	mov REG[0xd0],>_Int1_Tdisp
	mov [_Int1_Tdisp],A
	.dbline 771
; }
	xcall _Tiempos
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov [_Int1_Tdisp_Uni],A
	.dbline 772
; }
	xjmp L441
L444:
	.dbline 773
; }
	cmp [X-4],2
	jnz L441
	.dbline 774
; }
	.dbline 775
; }
	xcall _Numeros
	mov REG[0xd0],>_Int2_Tdisp
	mov [_Int2_Tdisp],A
	.dbline 776
; }
	xcall _Tiempos
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov [_Int2_Tdisp_Uni],A
	.dbline 777
; }
	.dbline 778
; }
	xjmp L441
L442:
	.dbline 779
; }
	cmp [X+1],2
	jnz L441
	.dbline 780
; }
	.dbline 781
; }
	cmp [X-4],1
	jnz L450
	.dbline 781
	xcall _Numeros
	mov REG[0xd0],>_Int1_Ndisp
	mov [_Int1_Ndisp],A
	xjmp L441
L450:
	.dbline 782
; }
	cmp [X-4],2
	jnz L441
	.dbline 782
	xcall _Numeros
	mov REG[0xd0],>_Int2_Ndisp
	mov [_Int2_Ndisp],A
	.dbline 783
; }
	.dbline 784
; }
	xjmp L441
L440:
	.dbline 785
; }
	cmp [X+0],2
	jnz L454
	.dbline 786
; }
	.dbline 787
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L456
X17:
	.dbline 787
	mov [X+1],2
	xjmp L457
L456:
	.dbline 788
; }
	dec [X+1]
L457:
	.dbline 789
; }
L454:
L441:
L437:
	.dbline 790
L425:
	.dbline 790
; }
	cmp [X+0],4
	jnz L424
	.dbline -2
	.dbline 792
; }
; }
L419:
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
	.dbline 800
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 801
; }
	mov [X+1],1
	.dbline 804
; }
; }
; }
	cmp [X-4],1
	jnz L459
	.dbline 804
	mov REG[0xd0],>_Cam1
	mov [_Cam1],3
	xjmp L460
L459:
	.dbline 805
; }
	cmp [X-4],2
	jnz L461
	.dbline 805
	mov REG[0xd0],>_Cam2
	mov [_Cam2],3
L461:
L460:
L463:
	.dbline 807
; }
; }
	.dbline 808
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 809
; }
	mov A,>L466
	push A
	mov A,<L466
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 810
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 811
; }
	cmp [X+1],1
	jnz L467
	.dbline 811
	push X
	mov A,>L469
	push A
	mov A,<L469
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L468
L467:
	.dbline 812
; }
	cmp [X+1],2
	jnz L470
	.dbline 812
	push X
	mov A,>L472
	push A
	mov A,<L472
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L470:
L468:
	.dbline 813
; }
	xcall _bucle_temp
	.dbline 814
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 815
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L473
	.dbline 815
	xcall _Pitido
L473:
	.dbline 816
; }
	cmp [X+0],1
	jnz L475
	.dbline 817
; }
	.dbline 818
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L477
X18:
	.dbline 818
	mov [X+1],1
	xjmp L476
L477:
	.dbline 819
; }
	inc [X+1]
	.dbline 820
; }
	xjmp L476
L475:
	.dbline 821
; }
	cmp [X+0],3
	jnz L479
	.dbline 822
; }
	.dbline 823
; }
	cmp [X+1],1
	jnz L481
	.dbline 824
; }
	.dbline 825
; }
	cmp [X-4],1
	jnz L483
	.dbline 826
; }
	.dbline 827
; }
	xcall _Numeros
	mov REG[0xd0],>_TL1_Treal
	mov [_TL1_Treal],A
	.dbline 828
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL1_Treal_Uni
	mov [_TL1_Treal_Uni],A
	.dbline 829
; }
	xjmp L480
L483:
	.dbline 830
; }
	cmp [X-4],2
	jnz L480
	.dbline 831
; }
	.dbline 832
; }
	xcall _Numeros
	mov REG[0xd0],>_TL2_Treal
	mov [_TL2_Treal],A
	.dbline 833
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL2_Treal_Uni
	mov [_TL2_Treal_Uni],A
	.dbline 834
; }
	.dbline 835
; }
	xjmp L480
L481:
	.dbline 836
; }
	cmp [X+1],2
	jnz L480
	.dbline 837
; }
	.dbline 838
; }
	cmp [X-4],1
	jnz L489
	.dbline 839
; }
	.dbline 840
; }
	xcall _Numeros
	mov REG[0xd0],>_TL1_Tfilm
	mov [_TL1_Tfilm],A
	.dbline 841
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov [_TL1_Tfilm_Uni],A
	.dbline 842
; }
	xjmp L480
L489:
	.dbline 843
; }
	cmp [X-4],2
	jnz L480
	.dbline 844
; }
	.dbline 845
; }
	xcall _Numeros
	mov REG[0xd0],>_TL2_Tfilm
	mov [_TL2_Tfilm],A
	.dbline 846
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov [_TL2_Tfilm_Uni],A
	.dbline 847
; }
	.dbline 848
; }
	.dbline 849
; }
	xjmp L480
L479:
	.dbline 850
; }
	cmp [X+0],2
	jnz L493
	.dbline 851
; }
	.dbline 852
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L495
X19:
	.dbline 852
	mov [X+1],2
	xjmp L496
L495:
	.dbline 853
; }
	dec [X+1]
L496:
	.dbline 854
; }
L493:
L480:
L476:
	.dbline 855
L464:
	.dbline 855
; }
	cmp [X+0],4
	jnz L463
	.dbline -2
	.dbline 857
; }
; }
L458:
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
	.dbline 865
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 866
; }
	mov [X+6],1
L498:
	.dbline 870
; }
; }
; }
; }
	.dbline 871
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 872
; }
	mov A,>L501
	push A
	mov A,<L501
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 873
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 874
; }
	mov [X+3],0
	mov [X+2],0
	mov [X+0],100
	mov A,[X+6]
	mov [X+1],A
	xjmp L505
L502:
	.dbline 875
	.dbline 876
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov REG[0xd0],>__r0
	xcall __divmodu_8X8_8
	pop A
	mov [X+4],A
	add SP,-1
	.dbline 877
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	xcall __divmodu_8X8_8
	add SP,-1
	pop A
	mov [X+1],A
	.dbline 878
	mov A,10
	push A
	mov A,[X+0]
	push A
	xcall __divmodu_8X8_8
	pop A
	mov [X+0],A
	add SP,-1
	.dbline 879
	mov A,[X+4]
	add A,48
	push X
	xcall _LCD_WriteData
	pop X
	.dbline 880
L503:
	.dbline 874
	inc [X+3]
	adc [X+2],0
L505:
	.dbline 874
	mov A,[X+3]
	sub A,3
	mov A,[X+2]
	sbb A,0
	jc L502
X20:
	.dbline 881
; }
; }
; }
; }
; }
; }
; }
	xcall _bucle_temp
	.dbline 882
; }
	xcall _Pulsador
	mov [X+5],A
	.dbline 883
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L506
	.dbline 883
	xcall _Pitido
L506:
	.dbline 884
; }
	cmp [X+5],1
	jnz L508
	.dbline 885
; }
	.dbline 886
; }
	mov REG[0xd0],>__r0
	mov A,[X+6]
	add A,1
	mov [__r0],A
	mov A,100
	cmp A,[__r0]
	jnc L510
X21:
	.dbline 886
	mov [X+6],1
	xjmp L509
L510:
	.dbline 887
; }
	inc [X+6]
	.dbline 888
; }
	xjmp L509
L508:
	.dbline 889
; }
	cmp [X+5],3
	jnz L512
	.dbline 890
; }
	.dbline 891
; }
	mov A,[X+6]
	mov REG[0xd0],>__r0
	xjmp L497
L512:
	.dbline 893
; }
; }
	cmp [X+5],2
	jnz L514
	.dbline 894
; }
	.dbline 895
; }
	mov REG[0xd0],>__r0
	mov A,[X+6]
	sub A,1
	cmp A,1
	jnc L516
X22:
	.dbline 895
	mov [X+6],100
	xjmp L517
L516:
	.dbline 896
; }
	dec [X+6]
L517:
	.dbline 897
; }
L514:
L509:
	.dbline 898
L499:
	.dbline 898
; }
	cmp [X+5],5
	jnz L498
	.dbline -2
	.dbline 899
; }
L497:
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
	.dbline 907
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
L519:
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
	mov A,>L522
	push A
	mov A,<L522
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 915
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 916
; }
	cmp [X+1],1
	jnz L523
	.dbline 916
	push X
	mov A,>L525
	push A
	mov A,<L525
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L524
L523:
	.dbline 917
; }
	cmp [X+1],2
	jnz L526
	.dbline 917
	push X
	mov A,>L528
	push A
	mov A,<L528
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L527
L526:
	.dbline 918
; }
	cmp [X+1],3
	jnz L529
	.dbline 918
	push X
	mov A,>L531
	push A
	mov A,<L531
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L529:
L527:
L524:
	.dbline 919
; }
	xcall _bucle_temp
	.dbline 920
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 921
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L532
	.dbline 921
	xcall _Pitido
L532:
	.dbline 922
; }
	cmp [X+0],1
	jnz L534
	.dbline 923
; }
	.dbline 924
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L536
X23:
	.dbline 924
	mov [X+1],1
	xjmp L535
L536:
	.dbline 925
; }
	inc [X+1]
	.dbline 926
; }
	xjmp L535
L534:
	.dbline 927
; }
	cmp [X+0],3
	jnz L538
	.dbline 928
; }
	.dbline 929
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	xjmp L518
L538:
	.dbline 931
; }
; }
	cmp [X+0],2
	jnz L540
	.dbline 932
; }
	.dbline 933
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L542
X24:
	.dbline 933
	mov [X+1],3
	xjmp L543
L542:
	.dbline 934
; }
	dec [X+1]
L543:
	.dbline 935
; }
L540:
L535:
	.dbline 936
L520:
	.dbline 936
; }
	cmp [X+0],5
	jnz L519
	.dbline -2
	.dbline 937
; }
L518:
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
	.dbline 947
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
	.dbline 948
; }
	mov [X+1],1
L545:
	.dbline 952
; }
; }
; }
; }
	.dbline 953
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 954
; }
	mov A,>L548
	push A
	mov A,<L548
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 955
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 956
; }
	mov A,>L549
	push A
	mov A,<L549
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 957
; }
	xcall _bucle_temp
	.dbline 958
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 959
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L550
	.dbline 959
	xcall _Pitido
	xjmp L551
L550:
	.dbline 960
; }
	cmp [X+0],3
	jnz L552
	.dbline 961
; }
	.dbline 962
; }
	cmp [X+1],1
	jnz L554
	.dbline 962
	xcall _Ara
L554:
	.dbline 963
; }
L552:
L551:
	.dbline 964
L546:
	.dbline 964
; }
	cmp [X+0],4
	jnz L545
	.dbline -2
	.dbline 965
; }
L544:
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
	.dbline 974
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 975
; }
	xcall _Reset_PdT
	.dbline 976
; }
	mov A,9
	push A
	xcall _Envia
	add SP,-1
	.dbline 977
; }
	mov REG[0xd0],>_Ent1
	mov A,[_Ent1]
	push A
	xcall _Envia
	.dbline 978
; }
	mov REG[0xd0],>_Ent2
	mov A,[_Ent2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 979
; }
	mov REG[0xd0],>_Ent3
	mov A,[_Ent3]
	push A
	xcall _Envia
	.dbline 980
; }
	mov REG[0xd0],>_Ent4
	mov A,[_Ent4]
	push A
	xcall _Envia
	add SP,-2
	.dbline 981
; }
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	push A
	xcall _Envia
	.dbline 982
; }
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 983
; }
	mov REG[0xd0],>_Fla1
	mov A,[_Fla1]
	push A
	xcall _Envia
	.dbline 984
; }
	mov REG[0xd0],>_Fla2
	mov A,[_Fla2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 985
; }
	mov REG[0xd0],>_Fla3
	mov A,[_Fla3]
	push A
	xcall _Envia
	.dbline 986
; }
	mov REG[0xd0],>_Fla4
	mov A,[_Fla4]
	push A
	xcall _Envia
	add SP,-2
	.dbline 987
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L557
	.dbline 987
	xcall _Pitido
L557:
	.dbline 988
; }
	xcall _Trabajando
	.dbline -2
	.dbline 989
; }
L556:
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
	.dbline 999
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
L560:
	.dbline 1003
; }
; }
; }
; }
	.dbline 1004
; }
	push X
	mov A,[X-4]
	xcall _UART_PutChar
	.dbline 1005
; }
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 1006
; }
	mov A,[X-4]
	cmp A,[X+0]
	jnz L563
	.dbline 1006
	push X
	mov A,5
	xcall _UART_PutChar
	pop X
	xjmp L564
L563:
	.dbline 1007
; }
	push X
	mov A,4
	xcall _UART_PutChar
	pop X
L564:
	.dbline 1008
L561:
	.dbline 1008
; }
	mov A,[X-4]
	cmp A,[X+0]
	jnz L560
	.dbline -2
	.dbline 1009
; }
L559:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l confirmacion 0 c
	.dbsym l valor -4 c
	.dbend
	.dbfunc e Trabajando _Trabajando fV
;         pulsat -> X+2
;              x -> X+0
_Trabajando::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 1018
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 1023
; }
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1024
; }
	mov A,>L566
	push A
	mov A,<L566
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1025
	mov [X+1],0
	mov [X+0],0
	xjmp L570
L567:
	.dbline 1025
L568:
	.dbline 1025
	inc [X+1]
	adc [X+0],0
L570:
	.dbline 1025
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	mov [__r3],A
	mov A,[X+0]
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
	jc L567
X26:
	.dbline 1027
; }
; }
L571:
	.dbline 1028
; }
	.dbline 1030
; }
; }
	push X
	mov A,8
	xcall _LCD_Control
	.dbline 1031
; }
	mov A,1
	xcall _LCD_Control
	pop X
	.dbline 1033
; }
; }
	xcall _Pulsador
	mov [X+2],A
	.dbline 1034
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L575
	.dbline 1034
	xcall _Pitido
L575:
	.dbline 1035
; }
	cmp [X+2],1
	jz L580
	cmp [X+2],2
	jz L580
	cmp [X+2],4
	jnz L577
L580:
	.dbline 1036
; }
	.dbline 1037
; }
	push X
	mov A,14
	xcall _LCD_Control
	.dbline 1038
; }
	mov A,>L581
	push A
	mov A,<L581
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1039
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 1040
; }
	mov A,>L582
	push A
	mov A,<L582
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1041
	mov [X+1],0
	mov [X+0],0
	xjmp L586
L583:
	.dbline 1041
L584:
	.dbline 1041
	inc [X+1]
	adc [X+0],0
L586:
	.dbline 1041
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	mov [__r3],A
	mov A,[X+0]
	mov [__r2],A
	mov A,[__r3]
	sub A,80
	mov A,[__r2]
	sbb A,-61
	mov A,0
	sbb A,0
	mov A,0
	xor A,-128
	sbb A,(0 ^ 0x80)
	jc L583
X27:
	.dbline 1042
; }
	xjmp L571
L577:
	.dbline 1043
; }
	cmp [X+2],3
	jnz L571
	.dbline 1044
; }
	.dbline 1045
; }
	push X
	mov A,14
	xcall _LCD_Control
	.dbline 1046
; }
	mov A,>L589
	push A
	mov A,<L589
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1047
	mov [X+1],0
	mov [X+0],0
	xjmp L593
L590:
	.dbline 1047
L591:
	.dbline 1047
	inc [X+1]
	adc [X+0],0
L593:
	.dbline 1047
	mov REG[0xd0],>__r0
	mov A,[X+1]
	mov [__r3],A
	mov A,[X+0]
	mov [__r2],A
	mov A,[__r3]
	sub A,80
	mov A,[__r2]
	sbb A,-61
	mov A,0
	sbb A,0
	mov A,0
	xor A,-128
	sbb A,(0 ^ 0x80)
	jc L590
X28:
	.dbline 1048
	xcall _Resetear
	.dbline 1049
	.dbline 1050
	.dbline 1027
	.dbline 1027
	xjmp L571
X25:
	.dbline -2
L565:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l pulsat 2 c
	.dbsym l x 0 i
	.dbend
	.dbfunc e Resetear _Resetear fV
_Resetear::
	.dbline -1
	.dbline 1060
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
	.dbline 1061
; }
	mov A,99
	push A
	xcall _Envia
	add SP,-1
	.dbline 1062
; }
	xcall _Principal
	.dbline -2
	.dbline 1063
; }
L594:
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
	.dbline 1073
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
	.dbline 1074
; }
	mov [X+1],1
L596:
	.dbline 1078
; }
; }
; }
; }
	.dbline 1079
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1080
; }
	mov A,>L599
	push A
	mov A,<L599
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1081
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1082
; }
	cmp [X+1],1
	jnz L600
	.dbline 1082
	push X
	mov A,>L602
	push A
	mov A,<L602
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L601
L600:
	.dbline 1083
; }
	cmp [X+1],2
	jnz L603
	.dbline 1083
	push X
	mov A,>L605
	push A
	mov A,<L605
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L604
L603:
	.dbline 1084
; }
	cmp [X+1],3
	jnz L606
	.dbline 1084
	push X
	mov A,>L608
	push A
	mov A,<L608
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L606:
L604:
L601:
	.dbline 1085
; }
	xcall _bucle_temp
	.dbline 1086
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1087
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L609
	.dbline 1087
	xcall _Pitido
L609:
	.dbline 1088
; }
	cmp [X+0],1
	jnz L611
	.dbline 1089
; }
	.dbline 1090
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L613
X29:
	.dbline 1090
	mov [X+1],1
	xjmp L612
L613:
	.dbline 1091
; }
	inc [X+1]
	.dbline 1092
; }
	xjmp L612
L611:
	.dbline 1093
; }
	cmp [X+0],3
	jnz L615
	.dbline 1094
; }
	.dbline 1095
; }
	cmp [X+1],1
	jnz L617
	.dbline 1095
	xcall _Reali_LCD
	xjmp L616
L617:
	.dbline 1096
; }
	cmp [X+1],2
	jnz L619
	.dbline 1096
	xcall _Zumbador
	xjmp L616
L619:
	.dbline 1097
; }
	cmp [X+1],3
	jnz L616
	.dbline 1097
	xcall _Ali_Led
	.dbline 1098
; }
	xjmp L616
L615:
	.dbline 1099
; }
	cmp [X+0],2
	jnz L623
	.dbline 1100
; }
	.dbline 1101
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L625
X30:
	.dbline 1101
	mov [X+1],3
	xjmp L626
L625:
	.dbline 1102
; }
	dec [X+1]
L626:
	.dbline 1103
; }
L623:
L616:
L612:
	.dbline 1104
L597:
	.dbline 1104
; }
	cmp [X+0],4
	jnz L596
	.dbline -2
	.dbline 1105
; }
L595:
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
	.dbline 1114
; }
; }
; }
; }
; }
; }
; }
; }
; }
L628:
	.dbline 1119
; }
; }
; }
; }
; }
	.dbline 1120
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1121
; }
	mov A,>L631
	push A
	mov A,<L631
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1122
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1123
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L632
	.dbline 1123
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L633
L632:
	.dbline 1124
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L633:
	.dbline 1125
; }
	xcall _bucle_temp
	.dbline 1126
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1127
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L634
	.dbline 1127
	xcall _Pitido
L634:
	.dbline 1128
; }
	cmp [X+0],1
	jz L638
	cmp [X+0],2
	jnz L636
L638:
	.dbline 1129
; }
	.dbline 1130
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1131
; }
	xjmp L637
L636:
	.dbline 1132
; }
	cmp [X+0],3
	jnz L639
	.dbline 1133
; }
	.dbline 1134
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L641
	.dbline 1135
; }
	.dbline 1136
; }
	or REG[ 0],2
	.dbline 1137
; }
	mov [_Luz_LCD],1
	.dbline 1138
; }
	xjmp L642
L641:
	.dbline 1140
; }
; }
	.dbline 1141
; }
	and REG[ 0],-3
	.dbline 1142
; }
	mov REG[0xd0],>_Luz_LCD
	mov [_Luz_LCD],0
	.dbline 1143
; }
L642:
	.dbline 1144
; }
L639:
L637:
	.dbline 1145
L629:
	.dbline 1145
; }
	cmp [X+0],4
	jnz L628
	.dbline -2
	.dbline 1146
; }
L627:
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
	.dbline 1155
; }
; }
; }
; }
; }
; }
; }
; }
; }
L644:
	.dbline 1160
; }
; }
; }
; }
; }
	.dbline 1161
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1162
; }
	mov A,>L647
	push A
	mov A,<L647
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1163
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1164
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L648
	.dbline 1164
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L649
L648:
	.dbline 1165
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L649:
	.dbline 1166
; }
	xcall _bucle_temp
	.dbline 1167
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1168
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L650
	.dbline 1168
	xcall _Pitido
L650:
	.dbline 1169
; }
	cmp [X+0],1
	jz L654
	cmp [X+0],2
	jnz L652
L654:
	.dbline 1170
; }
	.dbline 1171
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1172
; }
	xjmp L653
L652:
	.dbline 1173
; }
	cmp [X+0],3
	jnz L655
	.dbline 1174
; }
	.dbline 1175
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L657
	.dbline 1175
	mov [_Buzzer],1
	xjmp L658
L657:
	.dbline 1176
; }
	mov REG[0xd0],>_Buzzer
	mov [_Buzzer],0
L658:
	.dbline 1177
; }
L655:
L653:
	.dbline 1178
L645:
	.dbline 1178
; }
	cmp [X+0],4
	jnz L644
	.dbline -2
	.dbline 1179
; }
L643:
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
	.dbline 1188
; }
; }
; }
; }
; }
; }
; }
; }
; }
L660:
	.dbline 1193
; }
; }
; }
; }
; }
	.dbline 1194
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1195
; }
	mov A,>L663
	push A
	mov A,<L663
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1196
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1197
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L664
	.dbline 1197
	push X
	mov A,>L137
	push A
	mov A,<L137
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L665
L664:
	.dbline 1198
; }
	push X
	mov A,>L138
	push A
	mov A,<L138
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L665:
	.dbline 1199
; }
	xcall _bucle_temp
	.dbline 1200
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1201
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L666
	.dbline 1201
	xcall _Pitido
L666:
	.dbline 1202
; }
	cmp [X+0],1
	jz L670
	cmp [X+0],2
	jnz L668
L670:
	.dbline 1203
; }
	.dbline 1204
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1205
; }
	xjmp L669
L668:
	.dbline 1206
; }
	cmp [X+0],3
	jnz L671
	.dbline 1207
; }
	.dbline 1208
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L673
	.dbline 1209
; }
	.dbline 1210
; }
	or REG[ 0],16
	.dbline 1211
; }
	mov [_Alimentacion],1
	.dbline 1212
; }
	xjmp L674
L673:
	.dbline 1214
; }
; }
	.dbline 1215
; }
	and REG[ 0],-17
	.dbline 1216
; }
	mov REG[0xd0],>_Alimentacion
	mov [_Alimentacion],0
	.dbline 1217
; }
L674:
	.dbline 1218
; }
L671:
L669:
	.dbline 1219
L661:
	.dbline 1219
; }
	cmp [X+0],4
	jnz L660
	.dbline -2
	.dbline 1220
; }
L659:
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
	.dbline 13
	.dbline 17
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 18
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 19
	xcall _Timer8_Start
	.dbline 21
	xcall _LCD_Start
	.dbline 22
	xcall _LCD_Init
	.dbline 24
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 25
	mov REG[ 0],-96
	.dbline 28
	and REG[ 0],-31
	.dbline 32
L676:
	.dbline 32
	xcall _Principal
	.dbline 32
	.dbline 32
	xjmp L676
X31:
	.dbline -2
L675:
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
L663:
	.byte 62,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L647:
	.byte 62,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o,0
L631:
	.byte 62,'L,'u,'z,32,'L,'C,'D,0
L608:
	.byte 51,45,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L605:
	.byte 50,45,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o
	.byte 0
L602:
	.byte 49,45,'L,'u,'z,32,'L,'C,'D,0
L599:
	.byte 62,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L589:
	.byte 'T,'r,'a,'b,'a,'j,'o,32,'p,'a,'r,'a,'d,'o,0
L582:
	.byte 'M,'a,'n,'t,'e,'n,'e,'r,32,'A,'m,'a,'r,'i,'l,'l
	.byte 'o,0
L581:
	.byte 'Q,'u,'i,'e,'r,'e,32,'p,'a,'r,'a,'r,'l,'o,63,0
L566:
	.byte 'P,'h,'o,'t,'o,'S,'O,'C,32,'a,'c,'t,'i,'v,'o,0
L549:
	.byte 49,45,'A,'h,'o,'r,'a,0
L548:
	.byte 62,'E,'j,'e,'c,'u,'t,'a,'r,0
L531:
	.byte 'H,'o,'r,'a,'s,0
L528:
	.byte 'M,'i,'n,'u,'t,'o,'s,0
L525:
	.byte 'S,'e,'g,'u,'n,'d,'o,'s,0
L522:
	.byte 62,'U,'n,'i,46,32,'d,'e,32,'t,'i,'e,'m,'p,'o,0
L501:
	.byte 62,'N,'u,'m,'e,'r,'o,32,49,45,49,48,48,0
L472:
	.byte 'T,'i,'e,'m,'p,'o,32,'v,'i,'d,'e,'o,0
L469:
	.byte 'T,'i,'e,'m,'p,'o,32,'r,'e,'a,'l,0
L466:
	.byte 62,'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L433:
	.byte 'N,'u,'m,'e,'r,'o,32,'d,'e,32,'f,'o,'t,'o,'s,0
L430:
	.byte 'T,32,'e,'n,'t,'r,'e,32,'f,'o,'t,'o,0
L427:
	.byte 62,'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L387:
	.byte 62,'T,'i,'p,'o,32,'d,'e,32,'d,'i,'s,'p,46,0
L363:
	.byte 62,'C,'a,'m,'a,'r,'a,32,50,0
L351:
	.byte 'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L348:
	.byte 'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L345:
	.byte 'D,'i,'s,'p,46,32,'U,'n,'i,'c,'o,0
L342:
	.byte 'N,'o,32,'d,'i,'s,'p,'a,'r,'a,0
L339:
	.byte 62,'C,'a,'m,'a,'r,'a,32,49,0
L318:
	.byte 50,45,'C,'a,'m,'a,'r,'a,32,50,0
L315:
	.byte 49,45,'C,'a,'m,'a,'r,'a,32,49,0
L312:
	.byte 62,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L296:
	.byte 62,'F,'l,'a,'s,'h,32,52,0
L280:
	.byte 62,'F,'l,'a,'s,'h,32,51,0
L264:
	.byte 62,'F,'l,'a,'s,'h,32,50,0
L248:
	.byte 62,'F,'l,'a,'s,'h,32,49,0
L223:
	.byte 32,32,40,'O,'f,'f,41,0
L220:
	.byte 52,45,'F,'l,'a,'s,'h,32,52,0
L215:
	.byte 51,45,'F,'l,'a,'s,'h,32,51,0
L210:
	.byte 50,45,'F,'l,'a,'s,'h,32,50,0
L207:
	.byte 32,40,'O,'n,41,0
L206:
	.byte 32,40,'O,'f,'f,41,0
L203:
	.byte 49,45,'F,'l,'a,'s,'h,32,49,0
L200:
	.byte 62,'C,'o,'n,'f,46,32,'F,'l,'a,'s,'h,'e,'s,0
L184:
	.byte 62,'D,'i,'g,'i,'t,'a,'l,32,50,32,53,'V,0
L168:
	.byte 62,'D,'i,'g,'i,'t,'a,'l,32,49,32,53,'V,0
L152:
	.byte 62,'B,'a,'r,'r,'e,'r,'a,32,50,32,49,50,'V,0
L138:
	.byte 'O,'N,0
L137:
	.byte 'O,'F,'F,0
L134:
	.byte 62,'B,'a,'r,'r,'e,'r,'a,32,49,32,49,50,'V,0
L109:
	.byte 52,45,'D,'i,'g,'i,'t,'a,'l,32,50,32,53,'V,0
L106:
	.byte 51,45,'D,'i,'g,'i,'t,'a,'l,32,49,32,53,'V,0
L103:
	.byte 50,45,'B,'a,'r,'r,'e,'r,'a,32,50,32,49,50,'V,0
L100:
	.byte 49,45,'B,'a,'r,'r,'e,'r,'a,32,49,32,49,50,'V,0
L97:
	.byte 62,'C,'o,'n,'f,46,32,'S,'e,'n,'s,'o,'r,'e,'s,0
L70:
	.byte 53,45,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L67:
	.byte 52,45,'E,'j,'e,'c,'u,'t,'a,'r,0
L64:
	.byte 51,45,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L61:
	.byte 50,45,'C,'o,'n,'f,46,32,'F,'l,'a,'s,'h,'e,'s,0
L58:
	.byte 49,45,'C,'o,'n,'f,46,32,'S,'e,'n,'s,'o,'r,'e,'s
	.byte 0
L55:
	.byte 62,'M,'e,'n,'u,32,'P,'r,'i,'n,'c,'i,'p,'a,'l,0
L46:
	.byte 'a,32,32,'P,'h,'o,'t,'o,'S,'o,'C,0
L45:
	.byte 'B,'i,'e,'n,'v,'e,'n,'i,'d,'o,'s,0
