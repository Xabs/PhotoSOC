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
	.dbline 46
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
	.dbline 49
	mov [X+1],0
	mov [X+0],0
	xjmp L5
L2:
	.dbline 49
L3:
	.dbline 49
	inc [X+1]
	adc [X+0],0
L5:
	.dbline 49
; 		- Saber si ha llegado a cierto punto
; 		LCD_Control(0x01);
; 		LCD_PrCString("prueba");
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
	.dbline 50
; 		for(x=0;x<50000;x++);
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
	.dbline 59
; 		
; 		- Detectar cierto numero y que lo muestre por el LCD		
; 		LCD_Control(0x01);
; 		LCD_WriteData(+48);
; 		for(x=0;x<50000;x++);
; 		*/		
; }
; }
; }
	.dbline 62
; }
; }
; }
	or REG[ 0],8
	.dbline 63
	mov [X+1],0
	mov [X+0],0
L7:
	.dbline 63
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
L8:
	.dbline 63
; }
	inc [X+1]
	adc [X+0],0
	.dbline 63
	mov A,[X+1]
	sub A,-96
	mov A,[X+0]
	xor A,-128
	sbb A,(15 ^ 0x80)
	jc L7
X1:
	.dbline 64
; }
	and REG[ 0],-9
	.dbline -2
	.dbline 65
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
	.dbline 74
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 77
; }
; }
; }
	or REG[ 0],4
	.dbline 78
	mov [X+1],0
	mov [X+0],0
L12:
	.dbline 78
L13:
	.dbline 78
; }
	inc [X+1]
	adc [X+0],0
	.dbline 78
	mov A,[X+1]
	sub A,-12
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L12
X2:
	.dbline 79
; }
	and REG[ 0],-5
	.dbline 80
	mov [X+1],0
	mov [X+0],0
L16:
	.dbline 80
L17:
	.dbline 80
; }
	inc [X+1]
	adc [X+0],0
	.dbline 80
	mov A,[X+1]
	sub A,-12
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L16
X3:
	.dbline -2
	.dbline 81
; }
L11:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 I
	.dbend
	.dbfunc e Pulsador _Pulsador fc
;        pulsado -> X+2
;              x -> X+0
_Pulsador::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 94
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
	.dbline 98
; }
; }
; }
; }
	mov [X+2],0
L21:
	.dbline 102
; }
; }
; }
; }
	.dbline 103
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],32
	jnz L24
	.dbline 103
	mov [X+2],1
L24:
	.dbline 104
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-128
	jnz L26
	.dbline 104
	mov [X+2],2
L26:
	.dbline 105
; }
	cmp [X+2],0
	jz L28
	.dbline 106
; }
	.dbline 107
	mov [X+1],0
	mov [X+0],0
	xjmp L33
L30:
	.dbline 107
L31:
	.dbline 107
	inc [X+1]
	adc [X+0],0
L33:
	.dbline 107
; }
	mov A,[X+1]
	sub A,100
	mov A,[X+0]
	sbb A,0
	jc L30
X4:
	.dbline 108
; }
	mov [X+1],0
	mov [X+0],0
	xjmp L37
L34:
	.dbline 109
; }
	.dbline 110
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-96
	jnz L38
	.dbline 110
	mov A,[X+2]
	xjmp L20
L38:
	.dbline 111
	or REG[ 0],-96
	.dbline 112
L35:
	.dbline 108
	inc [X+1]
	adc [X+0],0
L37:
	.dbline 108
	mov A,[X+1]
	sub A,48
	mov A,[X+0]
	sbb A,117
	jc L34
X5:
	.dbline 113
; }
; }
; }
	add [X+2],2
	.dbline 114
; }
L28:
	.dbline 115
L22:
	.dbline 115
; }
	cmp [X+2],0
	jz L21
	.dbline 116
; }
	mov A,[X+2]
	mov REG[0xd0],>__r0
	.dbline -2
L20:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
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
	.dbline 127
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
	.dbline 131
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 132
; }
	mov X,1
	mov A,0
	xcall _LCD_Position
	.dbline 133
; }
	mov A,>L41
	push A
	mov A,<L41
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 134
; }
	mov X,3
	mov A,1
	xcall _LCD_Position
	.dbline 135
; }
	mov A,>L42
	push A
	mov A,<L42
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 136
; }
	xcall _bucle_temp
	.dbline 137
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 138
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L43
	.dbline 138
	xcall _Pitido
L43:
	.dbline 139
	cmp [X+0],0
	jz L45
	.dbline 140
	.dbline 141
	xcall _Menu
	.dbline 142
L45:
	.dbline -2
	.dbline 143
; }
; }
; }
; }
; }
L40:
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
	.dbline 153
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
	.dbline 154
; }
	mov [X+0],1
L48:
	.dbline 158
; }
; }
; }
; }
	.dbline 159
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 160
; }
	mov A,>L51
	push A
	mov A,<L51
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 161
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 162
; }
	cmp [X+0],1
	jnz L52
	.dbline 162
	push X
	mov A,>L54
	push A
	mov A,<L54
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L53
L52:
	.dbline 163
; }
	cmp [X+0],2
	jnz L55
	.dbline 163
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
	.dbline 164
; }
	cmp [X+0],3
	jnz L58
	.dbline 164
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
	.dbline 165
; }
	cmp [X+0],4
	jnz L61
	.dbline 165
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
	.dbline 166
; }
	cmp [X+0],5
	jnz L64
	.dbline 166
	push X
	mov A,>L66
	push A
	mov A,<L66
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L64:
L62:
L59:
L56:
L53:
	.dbline 167
; }
	xcall _bucle_temp
	.dbline 168
; }
	xcall _Pulsador
	mov [X+1],A
	.dbline 169
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L67
	.dbline 169
	xcall _Pitido
L67:
	.dbline 170
; }
	cmp [X+1],1
	jnz L69
	.dbline 171
; }
	.dbline 172
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	add A,1
	mov [__r0],A
	mov A,5
	cmp A,[__r0]
	jnc L71
X6:
	.dbline 172
	mov [X+0],1
	xjmp L70
L71:
	.dbline 173
; }
	inc [X+0]
	.dbline 174
; }
	xjmp L70
L69:
	.dbline 175
; }
	cmp [X+1],3
	jnz L73
	.dbline 176
; }
	.dbline 177
; }
	cmp [X+0],1
	jnz L75
	.dbline 177
	xcall _Sensors
	xjmp L74
L75:
	.dbline 178
; }
	cmp [X+0],2
	jnz L77
	.dbline 178
	xcall _Flashes
	xjmp L74
L77:
	.dbline 179
; }
	cmp [X+0],3
	jnz L79
	.dbline 179
	xcall _Dispar
	xjmp L74
L79:
	.dbline 180
; }
	cmp [X+0],4
	jnz L81
	.dbline 180
	xcall _Executar
	xjmp L74
L81:
	.dbline 181
; }
	cmp [X+0],5
	jnz L74
	.dbline 181
	xcall _Sistema
	.dbline 182
; }
	xjmp L74
L73:
	.dbline 183
; }
	cmp [X+1],2
	jnz L85
	.dbline 184
; }
	.dbline 185
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	sub A,1
	cmp A,1
	jnc L87
X7:
	.dbline 185
	mov [X+0],5
	xjmp L88
L87:
	.dbline 186
; }
	dec [X+0]
L88:
	.dbline 187
; }
L85:
L74:
L70:
	.dbline 188
L49:
	.dbline 188
; }
	cmp [X+1],4
	jnz L48
	.dbline -2
	.dbline 189
; }
L47:
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
	.dbline 199
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
	.dbline 200
; }
	mov [X+1],1
L90:
	.dbline 204
; }
; }
; }
; }
	.dbline 205
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 206
; }
	mov A,>L93
	push A
	mov A,<L93
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 207
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 208
; }
	cmp [X+1],1
	jnz L94
	.dbline 208
	push X
	mov A,>L96
	push A
	mov A,<L96
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L95
L94:
	.dbline 209
; }
	cmp [X+1],2
	jnz L97
	.dbline 209
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
	.dbline 210
; }
	cmp [X+1],3
	jnz L100
	.dbline 210
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
	.dbline 211
; }
	cmp [X+1],4
	jnz L103
	.dbline 211
	push X
	mov A,>L105
	push A
	mov A,<L105
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L103:
L101:
L98:
L95:
	.dbline 212
; }
	xcall _bucle_temp
	.dbline 213
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 214
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L106
	.dbline 214
	xcall _Pitido
L106:
	.dbline 215
; }
	cmp [X+0],1
	jnz L108
	.dbline 216
; }
	.dbline 217
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L110
X8:
	.dbline 217
	mov [X+1],1
	xjmp L109
L110:
	.dbline 218
; }
	inc [X+1]
	.dbline 219
; }
	xjmp L109
L108:
	.dbline 220
; }
	cmp [X+0],3
	jnz L112
	.dbline 221
; }
	.dbline 222
; }
	cmp [X+1],1
	jnz L114
	.dbline 222
	xcall _Entrada1
	xjmp L113
L114:
	.dbline 223
; }
	cmp [X+1],2
	jnz L116
	.dbline 223
	xcall _Entrada2
	xjmp L113
L116:
	.dbline 224
; }
	cmp [X+1],3
	jnz L118
	.dbline 224
	xcall _Entrada3
	xjmp L113
L118:
	.dbline 225
; }
	cmp [X+1],4
	jnz L113
	.dbline 225
	xcall _Entrada4
	.dbline 226
; }
	xjmp L113
L112:
	.dbline 227
; }
	cmp [X+0],2
	jnz L122
	.dbline 228
; }
	.dbline 229
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L124
X9:
	.dbline 229
	mov [X+1],4
	xjmp L125
L124:
	.dbline 230
; }
	dec [X+1]
L125:
	.dbline 231
; }
L122:
L113:
L109:
	.dbline 232
L91:
	.dbline 232
; }
	cmp [X+0],4
	jnz L90
	.dbline -2
	.dbline 233
; }
L89:
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
	.dbline 243
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
L127:
	.dbline 248
; }
; }
; }
; }
; }
	.dbline 249
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 250
; }
	mov A,>L130
	push A
	mov A,<L130
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 251
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 252
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L131
	.dbline 252
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L132
L131:
	.dbline 253
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L132:
	.dbline 254
; }
	xcall _bucle_temp
	.dbline 255
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 256
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L135
	.dbline 256
	xcall _Pitido
L135:
	.dbline 257
; }
	cmp [X+0],1
	jz L139
	cmp [X+0],2
	jnz L137
L139:
	.dbline 258
; }
	.dbline 259
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 260
; }
	xjmp L138
L137:
	.dbline 261
; }
	cmp [X+0],3
	jnz L140
	.dbline 262
; }
	.dbline 263
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L142
	.dbline 263
	mov [_Ent1],1
	xjmp L143
L142:
	.dbline 264
; }
	mov REG[0xd0],>_Ent1
	mov [_Ent1],0
L143:
	.dbline 265
; }
L140:
L138:
	.dbline 266
L128:
	.dbline 266
; }
	cmp [X+0],4
	jnz L127
	.dbline -2
	.dbline 267
; }
L126:
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
	.dbline 277
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
L145:
	.dbline 282
; }
; }
; }
; }
; }
	.dbline 283
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 284
; }
	mov A,>L148
	push A
	mov A,<L148
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 285
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 286
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L149
	.dbline 286
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L150
L149:
	.dbline 287
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L150:
	.dbline 288
; }
	xcall _bucle_temp
	.dbline 289
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 290
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L151
	.dbline 290
	xcall _Pitido
L151:
	.dbline 291
; }
	cmp [X+0],1
	jz L155
	cmp [X+0],2
	jnz L153
L155:
	.dbline 292
; }
	.dbline 293
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 294
; }
	xjmp L154
L153:
	.dbline 295
; }
	cmp [X+0],3
	jnz L156
	.dbline 296
; }
	.dbline 297
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L158
	.dbline 297
	mov [_Ent2],1
	xjmp L159
L158:
	.dbline 298
; }
	mov REG[0xd0],>_Ent2
	mov [_Ent2],0
L159:
	.dbline 299
; }
L156:
L154:
	.dbline 300
L146:
	.dbline 300
; }
	cmp [X+0],4
	jnz L145
	.dbline -2
	.dbline 301
; }
L144:
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
	.dbline 311
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
L161:
	.dbline 316
; }
; }
; }
; }
; }
	.dbline 317
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 318
; }
	mov A,>L164
	push A
	mov A,<L164
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 319
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 320
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L165
	.dbline 320
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L166
L165:
	.dbline 321
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L166:
	.dbline 322
; }
	xcall _bucle_temp
	.dbline 323
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 324
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L167
	.dbline 324
	xcall _Pitido
L167:
	.dbline 325
; }
	cmp [X+0],1
	jz L171
	cmp [X+0],2
	jnz L169
L171:
	.dbline 326
; }
	.dbline 327
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 328
; }
	xjmp L170
L169:
	.dbline 329
; }
	cmp [X+0],3
	jnz L172
	.dbline 330
; }
	.dbline 331
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L174
	.dbline 331
	mov [_Ent3],1
	xjmp L175
L174:
	.dbline 332
; }
	mov REG[0xd0],>_Ent3
	mov [_Ent3],0
L175:
	.dbline 333
; }
L172:
L170:
	.dbline 334
L162:
	.dbline 334
; }
	cmp [X+0],4
	jnz L161
	.dbline -2
	.dbline 335
; }
L160:
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
	.dbline 345
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
L177:
	.dbline 350
; }
; }
; }
; }
; }
	.dbline 351
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 352
; }
	mov A,>L180
	push A
	mov A,<L180
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 353
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 354
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L181
	.dbline 354
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L182
L181:
	.dbline 355
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L182:
	.dbline 356
; }
	xcall _bucle_temp
	.dbline 357
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 358
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L183
	.dbline 358
	xcall _Pitido
L183:
	.dbline 359
; }
	cmp [X+0],1
	jz L187
	cmp [X+0],2
	jnz L185
L187:
	.dbline 360
; }
	.dbline 361
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 362
; }
	xjmp L186
L185:
	.dbline 363
; }
	cmp [X+0],3
	jnz L188
	.dbline 364
; }
	.dbline 365
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L190
	.dbline 365
	mov [_Ent4],1
	xjmp L191
L190:
	.dbline 366
; }
	mov REG[0xd0],>_Ent4
	mov [_Ent4],0
L191:
	.dbline 367
; }
L188:
L186:
	.dbline 368
L178:
	.dbline 368
; }
	cmp [X+0],4
	jnz L177
	.dbline -2
	.dbline 369
; }
L176:
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
	.dbline 379
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
	.dbline 380
; }
	mov [X+1],1
L193:
	.dbline 384
; }
; }
; }
; }
	.dbline 385
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 386
; }
	mov A,>L196
	push A
	mov A,<L196
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 387
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 388
; }
	cmp [X+1],1
	jnz L197
	.dbline 389
; }
	.dbline 390
; }
	push X
	mov A,>L199
	push A
	mov A,<L199
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 391
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L200
	.dbline 391
	push X
	mov A,>L202
	push A
	mov A,<L202
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L198
L200:
	.dbline 392
; }
	push X
	mov A,>L203
	push A
	mov A,<L203
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 393
; }
	xjmp L198
L197:
	.dbline 394
; }
	cmp [X+1],2
	jnz L204
	.dbline 395
; }
	.dbline 396
; }
	push X
	mov A,>L206
	push A
	mov A,<L206
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 397
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L207
	.dbline 397
	push X
	mov A,>L202
	push A
	mov A,<L202
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L205
L207:
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
	xjmp L205
L204:
	.dbline 400
; }
	cmp [X+1],3
	jnz L209
	.dbline 401
; }
	.dbline 403
; }
; }
	push X
	mov A,>L211
	push A
	mov A,<L211
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 404
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L212
	.dbline 404
	push X
	mov A,>L202
	push A
	mov A,<L202
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L210
L212:
	.dbline 405
; }
	push X
	mov A,>L203
	push A
	mov A,<L203
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 406
; }
	xjmp L210
L209:
	.dbline 407
; }
	cmp [X+1],4
	jnz L214
	.dbline 408
; }
	.dbline 409
; }
	push X
	mov A,>L216
	push A
	mov A,<L216
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 410
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L217
	.dbline 410
	push X
	mov A,>L219
	push A
	mov A,<L219
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L218
L217:
	.dbline 411
; }
	push X
	mov A,>L203
	push A
	mov A,<L203
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L218:
	.dbline 412
; }
L214:
L210:
L205:
L198:
	.dbline 413
; }
	xcall _bucle_temp
	.dbline 414
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 415
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L220
	.dbline 415
	xcall _Pitido
L220:
	.dbline 416
; }
	cmp [X+0],1
	jnz L222
	.dbline 417
; }
	.dbline 418
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L224
X10:
	.dbline 418
	mov [X+1],1
	xjmp L223
L224:
	.dbline 419
; }
	inc [X+1]
	.dbline 420
; }
	xjmp L223
L222:
	.dbline 421
; }
	cmp [X+0],3
	jnz L226
	.dbline 422
; }
	.dbline 423
; }
	cmp [X+1],1
	jnz L228
	.dbline 423
	xcall _Flash1
	xjmp L227
L228:
	.dbline 424
; }
	cmp [X+1],2
	jnz L230
	.dbline 424
	xcall _Flash2
	xjmp L227
L230:
	.dbline 425
; }
	cmp [X+1],3
	jnz L232
	.dbline 425
	xcall _Flash3
	xjmp L227
L232:
	.dbline 426
; }
	cmp [X+1],4
	jnz L227
	.dbline 426
	xcall _Flash4
	.dbline 427
; }
	xjmp L227
L226:
	.dbline 428
; }
	cmp [X+0],2
	jnz L236
	.dbline 429
; }
	.dbline 430
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L238
X11:
	.dbline 430
	mov [X+1],4
	xjmp L239
L238:
	.dbline 431
; }
	dec [X+1]
L239:
	.dbline 432
; }
L236:
L227:
L223:
	.dbline 433
L194:
	.dbline 433
; }
	cmp [X+0],4
	jnz L193
	.dbline -2
	.dbline 434
; }
L192:
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
	.dbline 443
; }
; }
; }
; }
; }
; }
; }
; }
; }
L241:
	.dbline 448
; }
; }
; }
; }
; }
	.dbline 449
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 450
; }
	mov A,>L244
	push A
	mov A,<L244
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 451
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 452
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L245
	.dbline 452
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L246
L245:
	.dbline 453
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L246:
	.dbline 454
; }
	xcall _bucle_temp
	.dbline 455
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 456
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L247
	.dbline 456
	xcall _Pitido
L247:
	.dbline 457
; }
	cmp [X+0],1
	jz L251
	cmp [X+0],2
	jnz L249
L251:
	.dbline 458
; }
	.dbline 459
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 460
; }
	xjmp L250
L249:
	.dbline 461
; }
	cmp [X+0],3
	jnz L252
	.dbline 462
; }
	.dbline 463
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L254
	.dbline 463
	mov [_Fla1],1
	xjmp L255
L254:
	.dbline 464
; }
	mov REG[0xd0],>_Fla1
	mov [_Fla1],0
L255:
	.dbline 465
; }
L252:
L250:
	.dbline 466
L242:
	.dbline 466
; }
	cmp [X+0],4
	jnz L241
	.dbline -2
	.dbline 467
; }
L240:
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
	.dbline 477
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
L257:
	.dbline 482
; }
; }
; }
; }
; }
	.dbline 483
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 484
; }
	mov A,>L260
	push A
	mov A,<L260
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 485
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 486
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L261
	.dbline 486
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L262
L261:
	.dbline 487
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L262:
	.dbline 488
; }
	xcall _bucle_temp
	.dbline 489
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 490
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L263
	.dbline 490
	xcall _Pitido
L263:
	.dbline 491
; }
	cmp [X+0],1
	jz L267
	cmp [X+0],2
	jnz L265
L267:
	.dbline 492
; }
	.dbline 493
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 494
; }
	xjmp L266
L265:
	.dbline 495
; }
	cmp [X+0],3
	jnz L268
	.dbline 496
; }
	.dbline 497
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L270
	.dbline 497
	mov [_Fla2],1
	xjmp L271
L270:
	.dbline 498
; }
	mov REG[0xd0],>_Fla2
	mov [_Fla2],0
L271:
	.dbline 499
; }
L268:
L266:
	.dbline 500
L258:
	.dbline 500
; }
	cmp [X+0],4
	jnz L257
	.dbline -2
	.dbline 501
; }
L256:
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
	.dbline 510
; }
; }
; }
; }
; }
; }
; }
; }
; }
L273:
	.dbline 515
; }
; }
; }
; }
; }
	.dbline 516
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 517
; }
	mov A,>L276
	push A
	mov A,<L276
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 518
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 519
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L277
	.dbline 519
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L278
L277:
	.dbline 520
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L278:
	.dbline 521
; }
	xcall _bucle_temp
	.dbline 522
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 523
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L279
	.dbline 523
	xcall _Pitido
L279:
	.dbline 524
; }
	cmp [X+0],1
	jz L283
	cmp [X+0],2
	jnz L281
L283:
	.dbline 525
; }
	.dbline 526
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 527
; }
	xjmp L282
L281:
	.dbline 528
; }
	cmp [X+0],3
	jnz L284
	.dbline 529
; }
	.dbline 530
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L286
	.dbline 530
	mov [_Fla3],1
	xjmp L287
L286:
	.dbline 531
; }
	mov REG[0xd0],>_Fla3
	mov [_Fla3],0
L287:
	.dbline 532
; }
L284:
L282:
	.dbline 533
L274:
	.dbline 533
; }
	cmp [X+0],4
	jnz L273
	.dbline -2
	.dbline 534
; }
L272:
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
	.dbline 543
; }
; }
; }
; }
; }
; }
; }
; }
; }
L289:
	.dbline 548
; }
; }
; }
; }
; }
	.dbline 549
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 550
; }
	mov A,>L292
	push A
	mov A,<L292
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 551
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 552
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L293
	.dbline 552
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L294
L293:
	.dbline 553
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L294:
	.dbline 554
; }
	xcall _bucle_temp
	.dbline 555
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 556
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L295
	.dbline 556
	xcall _Pitido
L295:
	.dbline 557
; }
	cmp [X+0],1
	jz L299
	cmp [X+0],2
	jnz L297
L299:
	.dbline 558
; }
	.dbline 559
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 560
; }
	xjmp L298
L297:
	.dbline 561
; }
	cmp [X+0],3
	jnz L300
	.dbline 562
; }
	.dbline 563
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L302
	.dbline 563
	mov [_Fla4],1
	xjmp L303
L302:
	.dbline 564
; }
	mov REG[0xd0],>_Fla4
	mov [_Fla4],0
L303:
	.dbline 565
; }
L300:
L298:
	.dbline 566
L290:
	.dbline 566
; }
	cmp [X+0],4
	jnz L289
	.dbline -2
	.dbline 567
; }
L288:
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
	.dbline 577
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
	.dbline 579
; }
; }
	mov [X+1],1
L305:
	.dbline 583
; }
; }
; }
; }
	.dbline 584
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 585
; }
	mov A,>L308
	push A
	mov A,<L308
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 586
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 587
; }
	cmp [X+1],1
	jnz L309
	.dbline 587
	push X
	mov A,>L311
	push A
	mov A,<L311
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L310
L309:
	.dbline 588
; }
	cmp [X+1],2
	jnz L312
	.dbline 588
	push X
	mov A,>L314
	push A
	mov A,<L314
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L312:
L310:
	.dbline 589
; }
	xcall _bucle_temp
	.dbline 590
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 591
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L315
	.dbline 591
	xcall _Pitido
L315:
	.dbline 592
; }
	cmp [X+0],1
	jnz L317
	.dbline 593
; }
	.dbline 594
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L319
X12:
	.dbline 594
	mov [X+1],1
	xjmp L318
L319:
	.dbline 595
; }
	inc [X+1]
	.dbline 596
; }
	xjmp L318
L317:
	.dbline 597
; }
	cmp [X+0],3
	jnz L321
	.dbline 598
; }
	.dbline 599
; }
	cmp [X+1],1
	jnz L323
	.dbline 599
	xcall _Camara1
	xjmp L322
L323:
	.dbline 600
; }
	cmp [X+1],2
	jnz L322
	.dbline 600
	xcall _Camara2
	.dbline 601
; }
	xjmp L322
L321:
	.dbline 602
; }
	cmp [X+0],2
	jnz L327
	.dbline 603
; }
	.dbline 604
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L329
X13:
	.dbline 604
	mov [X+1],2
	xjmp L330
L329:
	.dbline 605
; }
	dec [X+1]
L330:
	.dbline 606
; }
L327:
L322:
L318:
	.dbline 607
L306:
	.dbline 607
; }
	cmp [X+0],4
	jnz L305
	.dbline -2
	.dbline 608
; }
L304:
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
	.dbline 617
; }
; }
; }
; }
; }
; }
; }
; }
; }
L332:
	.dbline 622
; }
; }
; }
; }
; }
	.dbline 623
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 624
; }
	mov A,>L335
	push A
	mov A,<L335
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 625
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 626
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],0
	jnz L336
	.dbline 626
	push X
	mov A,>L338
	push A
	mov A,<L338
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L337
L336:
	.dbline 627
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L339
	.dbline 627
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
	.dbline 628
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L342
	.dbline 628
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
	.dbline 629
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L345
	.dbline 629
	push X
	mov A,>L347
	push A
	mov A,<L347
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L345:
L343:
L340:
L337:
	.dbline 630
; }
	xcall _bucle_temp
	.dbline 631
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 632
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L348
	.dbline 632
	xcall _Pitido
L348:
	.dbline 633
; }
	cmp [X+0],1
	jz L352
	cmp [X+0],2
	jnz L350
L352:
	.dbline 634
; }
	.dbline 635
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 636
; }
	xjmp L351
L350:
	.dbline 637
; }
	cmp [X+0],3
	jnz L353
	.dbline 638
; }
	.dbline 639
; }
	mov A,1
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 640
; }
L353:
L351:
	.dbline 641
L333:
	.dbline 641
; }
	cmp [X+0],4
	jnz L332
	.dbline -2
	.dbline 642
; }
L331:
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
	.dbline 651
; }
; }
; }
; }
; }
; }
; }
; }
; }
L356:
	.dbline 656
; }
; }
; }
; }
; }
	.dbline 657
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 658
; }
	mov A,>L359
	push A
	mov A,<L359
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 659
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 660
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],0
	jnz L360
	.dbline 660
	push X
	mov A,>L338
	push A
	mov A,<L338
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L361
L360:
	.dbline 661
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L362
	.dbline 661
	push X
	mov A,>L341
	push A
	mov A,<L341
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L363
L362:
	.dbline 662
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L364
	.dbline 662
	push X
	mov A,>L344
	push A
	mov A,<L344
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L365
L364:
	.dbline 663
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L366
	.dbline 663
	push X
	mov A,>L347
	push A
	mov A,<L347
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L366:
L365:
L363:
L361:
	.dbline 664
; }
	xcall _bucle_temp
	.dbline 665
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 666
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L368
	.dbline 666
	xcall _Pitido
L368:
	.dbline 667
; }
	cmp [X+0],1
	jz L372
	cmp [X+0],2
	jnz L370
L372:
	.dbline 668
; }
	.dbline 669
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 670
; }
	xjmp L371
L370:
	.dbline 671
; }
	cmp [X+0],3
	jnz L373
	.dbline 672
; }
	.dbline 673
; }
	mov A,2
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 674
; }
L373:
L371:
	.dbline 675
L357:
	.dbline 675
; }
	cmp [X+0],4
	jnz L356
	.dbline -2
	.dbline 676
; }
L355:
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
	.dbline 686
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
	.dbline 690
; }
; }
; }
; }
	cmp [X-4],1
	jnz L376
	.dbline 690
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	add A,1
	mov [X+1],A
	xjmp L377
L376:
	.dbline 691
; }
	cmp [X-4],2
	jnz L378
	.dbline 691
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	add A,1
	mov [X+1],A
L378:
L377:
L380:
	.dbline 694
; }
; }
; }
	.dbline 695
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 696
; }
	mov A,>L383
	push A
	mov A,<L383
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 697
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 698
; }
	cmp [X+1],1
	jnz L384
	.dbline 698
	push X
	mov A,>L338
	push A
	mov A,<L338
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L385
L384:
	.dbline 699
; }
	cmp [X+1],2
	jnz L386
	.dbline 699
	push X
	mov A,>L341
	push A
	mov A,<L341
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L387
L386:
	.dbline 700
; }
	cmp [X+1],3
	jnz L388
	.dbline 700
	push X
	mov A,>L344
	push A
	mov A,<L344
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L389
L388:
	.dbline 701
; }
	cmp [X+1],4
	jnz L390
	.dbline 701
	push X
	mov A,>L347
	push A
	mov A,<L347
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L390:
L389:
L387:
L385:
	.dbline 702
; }
	xcall _bucle_temp
	.dbline 703
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 704
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L392
	.dbline 704
	xcall _Pitido
L392:
	.dbline 705
; }
	cmp [X+0],1
	jnz L394
	.dbline 706
; }
	.dbline 707
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L396
X14:
	.dbline 707
	mov [X+1],1
	xjmp L395
L396:
	.dbline 708
; }
	inc [X+1]
	.dbline 709
; }
	xjmp L395
L394:
	.dbline 710
; }
	cmp [X+0],3
	jnz L398
	.dbline 711
; }
	.dbline 712
; }
	cmp [X-4],1
	jnz L400
	.dbline 712
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L401
L400:
	.dbline 713
; }
	cmp [X-4],2
	jnz L402
	.dbline 713
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
L402:
L401:
	.dbline 714
; }
	cmp [X+1],3
	jnz L404
	.dbline 714
	mov A,[X-4]
	push A
	xcall _Intervalometro
	add SP,-1
	xjmp L405
L404:
	.dbline 715
; }
	cmp [X+1],4
	jnz L406
	.dbline 715
	mov A,[X-4]
	push A
	xcall _TimeLapse
	add SP,-1
L406:
L405:
	.dbline 716
; }
	mov [X+0],4
	.dbline 717
; }
	xjmp L399
L398:
	.dbline 718
; }
	cmp [X+0],2
	jnz L408
	.dbline 719
; }
	.dbline 720
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L410
X15:
	.dbline 720
	mov [X+1],4
	xjmp L411
L410:
	.dbline 721
; }
	dec [X+1]
L411:
	.dbline 722
; }
L408:
L399:
L395:
	.dbline 723
L381:
	.dbline 723
; }
	cmp [X+0],4
	jnz L380
	.dbline -2
	.dbline 724
; }
L375:
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
	.dbline 732
; }
; }
; }
; }
; }
; }
; }
; }
L413:
	.dbline 737
; }
; }
; }
; }
; }
	.dbline 738
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 739
; }
	mov A,>L416
	push A
	mov A,<L416
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 740
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 741
; }
	cmp [X+1],1
	jnz L417
	.dbline 741
	push X
	mov A,>L419
	push A
	mov A,<L419
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L418
L417:
	.dbline 742
; }
	cmp [X+1],2
	jnz L420
	.dbline 742
	push X
	mov A,>L422
	push A
	mov A,<L422
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L420:
L418:
	.dbline 743
; }
	xcall _bucle_temp
	.dbline 744
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 745
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L423
	.dbline 745
	xcall _Pitido
L423:
	.dbline 746
; }
	cmp [X+0],1
	jnz L425
	.dbline 747
; }
	.dbline 748
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L427
X16:
	.dbline 748
	mov [X+1],1
	xjmp L426
L427:
	.dbline 749
; }
	inc [X+1]
	.dbline 750
; }
	xjmp L426
L425:
	.dbline 751
; }
	cmp [X+0],3
	jnz L429
	.dbline 752
; }
	.dbline 753
; }
	cmp [X-4],1
	jnz L431
	.dbline 753
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L432
L431:
	.dbline 754
; }
	cmp [X-4],2
	jnz L433
	.dbline 754
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
L433:
L432:
	.dbline 755
; }
	mov [X+0],4
	.dbline 756
; }
	xjmp L430
L429:
	.dbline 757
; }
	cmp [X+0],2
	jnz L435
	.dbline 758
; }
	.dbline 759
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L437
X17:
	.dbline 759
	mov [X+1],2
	xjmp L438
L437:
	.dbline 760
; }
	dec [X+1]
L438:
	.dbline 761
; }
L435:
L430:
L426:
	.dbline 762
L414:
	.dbline 762
; }
	cmp [X+0],4
	jnz L413
	.dbline -2
	.dbline 764
; }
; }
L412:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbsym l camara -4 c
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
	.dbline 774
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
	.dbline 775
; }
	mov [X+1],1
L440:
	.dbline 779
; }
; }
; }
; }
	.dbline 780
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 781
; }
	mov A,>L443
	push A
	mov A,<L443
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 782
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 783
; }
	mov A,>L444
	push A
	mov A,<L444
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 784
; }
	xcall _bucle_temp
	.dbline 785
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 786
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L445
	.dbline 786
	xcall _Pitido
	xjmp L446
L445:
	.dbline 787
; }
	cmp [X+0],3
	jnz L447
	.dbline 788
; }
	.dbline 789
; }
	cmp [X+1],1
	jnz L449
	.dbline 789
	xcall _Ara
L449:
	.dbline 790
; }
L447:
L446:
	.dbline 791
L441:
	.dbline 791
; }
	cmp [X+0],4
	jnz L440
	.dbline -2
	.dbline 792
; }
L439:
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
	.dbline 801
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 802
; }
	xcall _Reset_PdT
	.dbline 803
; }
	mov A,9
	push A
	xcall _Envia
	add SP,-1
	.dbline 804
; }
	mov REG[0xd0],>_Ent1
	mov A,[_Ent1]
	push A
	xcall _Envia
	.dbline 805
; }
	mov REG[0xd0],>_Ent2
	mov A,[_Ent2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 806
; }
	mov REG[0xd0],>_Ent3
	mov A,[_Ent3]
	push A
	xcall _Envia
	.dbline 807
; }
	mov REG[0xd0],>_Ent4
	mov A,[_Ent4]
	push A
	xcall _Envia
	add SP,-2
	.dbline 808
; }
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	push A
	xcall _Envia
	.dbline 809
; }
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 810
; }
	mov REG[0xd0],>_Fla1
	mov A,[_Fla1]
	push A
	xcall _Envia
	.dbline 811
; }
	mov REG[0xd0],>_Fla2
	mov A,[_Fla2]
	push A
	xcall _Envia
	add SP,-2
	.dbline 812
; }
	mov REG[0xd0],>_Fla3
	mov A,[_Fla3]
	push A
	xcall _Envia
	.dbline 813
; }
	mov REG[0xd0],>_Fla4
	mov A,[_Fla4]
	push A
	xcall _Envia
	add SP,-2
	.dbline 817
; }
; }
; }
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L452
	.dbline 817
	xcall _Pitido
L452:
	.dbline 818
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 819
; }
	mov A,>L454
	push A
	mov A,<L454
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 820
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 821
; }
	mov A,>L455
	push A
	mov A,<L455
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline -2
	.dbline 822
; }
L451:
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
	.dbline 832
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
L457:
	.dbline 836
; }
; }
; }
; }
	.dbline 837
; }
	push X
	mov A,[X-4]
	xcall _UART_PutChar
	.dbline 838
; }
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 839
; }
	mov A,[X-4]
	cmp A,[X+0]
	jnz L460
	.dbline 839
	push X
	mov A,5
	xcall _UART_PutChar
	pop X
	xjmp L461
L460:
	.dbline 840
; }
	push X
	mov A,4
	xcall _UART_PutChar
	pop X
L461:
	.dbline 841
L458:
	.dbline 841
; }
	mov A,[X-4]
	cmp A,[X+0]
	jnz L457
	.dbline -2
	.dbline 842
; }
L456:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l confirmacion 0 c
	.dbsym l valor -4 c
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
	.dbline 852
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
	.dbline 853
; }
	mov [X+1],1
L463:
	.dbline 857
; }
; }
; }
; }
	.dbline 858
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 859
; }
	mov A,>L466
	push A
	mov A,<L466
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 860
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 861
; }
	cmp [X+1],1
	jnz L467
	.dbline 861
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
	.dbline 862
; }
	cmp [X+1],2
	jnz L470
	.dbline 862
	push X
	mov A,>L472
	push A
	mov A,<L472
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L471
L470:
	.dbline 863
; }
	cmp [X+1],3
	jnz L473
	.dbline 863
	push X
	mov A,>L475
	push A
	mov A,<L475
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L473:
L471:
L468:
	.dbline 864
; }
	xcall _bucle_temp
	.dbline 865
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 866
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L476
	.dbline 866
	xcall _Pitido
L476:
	.dbline 867
; }
	cmp [X+0],1
	jnz L478
	.dbline 868
; }
	.dbline 869
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L480
X18:
	.dbline 869
	mov [X+1],1
	xjmp L479
L480:
	.dbline 870
; }
	inc [X+1]
	.dbline 871
; }
	xjmp L479
L478:
	.dbline 872
; }
	cmp [X+0],3
	jnz L482
	.dbline 873
; }
	.dbline 874
; }
	cmp [X+1],1
	jnz L484
	.dbline 874
	xcall _Reali_LCD
	xjmp L483
L484:
	.dbline 875
; }
	cmp [X+1],2
	jnz L486
	.dbline 875
	xcall _Zumbador
	xjmp L483
L486:
	.dbline 876
; }
	cmp [X+1],3
	jnz L483
	.dbline 876
	xcall _Ali_Led
	.dbline 877
; }
	xjmp L483
L482:
	.dbline 878
; }
	cmp [X+0],2
	jnz L490
	.dbline 879
; }
	.dbline 880
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L492
X19:
	.dbline 880
	mov [X+1],3
	xjmp L493
L492:
	.dbline 881
; }
	dec [X+1]
L493:
	.dbline 882
; }
L490:
L483:
L479:
	.dbline 883
L464:
	.dbline 883
; }
	cmp [X+0],4
	jnz L463
	.dbline -2
	.dbline 884
; }
L462:
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
	.dbline 893
; }
; }
; }
; }
; }
; }
; }
; }
; }
L495:
	.dbline 898
; }
; }
; }
; }
; }
	.dbline 899
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 900
; }
	mov A,>L498
	push A
	mov A,<L498
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 901
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 902
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L499
	.dbline 902
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L500
L499:
	.dbline 903
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L500:
	.dbline 904
; }
	xcall _bucle_temp
	.dbline 905
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 906
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L501
	.dbline 906
	xcall _Pitido
L501:
	.dbline 907
; }
	cmp [X+0],1
	jz L505
	cmp [X+0],2
	jnz L503
L505:
	.dbline 908
; }
	.dbline 909
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 910
; }
	xjmp L504
L503:
	.dbline 911
; }
	cmp [X+0],3
	jnz L506
	.dbline 912
; }
	.dbline 913
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L508
	.dbline 914
; }
	.dbline 915
; }
	or REG[ 0],2
	.dbline 916
; }
	mov [_Luz_LCD],1
	.dbline 917
; }
	xjmp L509
L508:
	.dbline 919
; }
; }
	.dbline 920
; }
	and REG[ 0],-3
	.dbline 921
; }
	mov REG[0xd0],>_Luz_LCD
	mov [_Luz_LCD],0
	.dbline 922
; }
L509:
	.dbline 923
; }
L506:
L504:
	.dbline 924
L496:
	.dbline 924
; }
	cmp [X+0],4
	jnz L495
	.dbline -2
	.dbline 925
; }
L494:
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
L511:
	.dbline 939
; }
; }
; }
; }
; }
	.dbline 940
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 941
; }
	mov A,>L514
	push A
	mov A,<L514
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 942
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 943
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L515
	.dbline 943
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L516
L515:
	.dbline 944
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L516:
	.dbline 945
; }
	xcall _bucle_temp
	.dbline 946
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 947
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L517
	.dbline 947
	xcall _Pitido
L517:
	.dbline 948
; }
	cmp [X+0],1
	jz L521
	cmp [X+0],2
	jnz L519
L521:
	.dbline 949
; }
	.dbline 950
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 951
; }
	xjmp L520
L519:
	.dbline 952
; }
	cmp [X+0],3
	jnz L522
	.dbline 953
; }
	.dbline 954
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L524
	.dbline 954
	mov [_Buzzer],1
	xjmp L525
L524:
	.dbline 955
; }
	mov REG[0xd0],>_Buzzer
	mov [_Buzzer],0
L525:
	.dbline 956
; }
L522:
L520:
	.dbline 957
L512:
	.dbline 957
; }
	cmp [X+0],4
	jnz L511
	.dbline -2
	.dbline 958
; }
L510:
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
	.dbline 967
; }
; }
; }
; }
; }
; }
; }
; }
; }
L527:
	.dbline 972
; }
; }
; }
; }
; }
	.dbline 973
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 974
; }
	mov A,>L530
	push A
	mov A,<L530
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 975
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 976
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L531
	.dbline 976
	push X
	mov A,>L133
	push A
	mov A,<L133
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L532
L531:
	.dbline 977
; }
	push X
	mov A,>L134
	push A
	mov A,<L134
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L532:
	.dbline 978
; }
	xcall _bucle_temp
	.dbline 979
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 980
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L533
	.dbline 980
	xcall _Pitido
L533:
	.dbline 981
; }
	cmp [X+0],1
	jz L537
	cmp [X+0],2
	jnz L535
L537:
	.dbline 982
; }
	.dbline 983
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 984
; }
	xjmp L536
L535:
	.dbline 985
; }
	cmp [X+0],3
	jnz L538
	.dbline 986
; }
	.dbline 987
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L540
	.dbline 988
; }
	.dbline 989
; }
	or REG[ 0],16
	.dbline 990
; }
	mov [_Alimentacion],1
	.dbline 991
; }
	xjmp L541
L540:
	.dbline 993
; }
; }
	.dbline 994
; }
	and REG[ 0],-17
	.dbline 995
; }
	mov REG[0xd0],>_Alimentacion
	mov [_Alimentacion],0
	.dbline 996
; }
L541:
	.dbline 997
; }
L538:
L536:
	.dbline 998
L528:
	.dbline 998
; }
	cmp [X+0],4
	jnz L527
	.dbline -2
	.dbline 999
; }
L526:
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
	.dbline 22
	xcall _LCD_Start
	.dbline 23
	xcall _LCD_Init
	.dbline 25
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 26
	mov REG[ 0],-96
	.dbline 29
	and REG[ 0],-31
	.dbline 33
L543:
	.dbline 33
	xcall _Principal
	.dbline 33
	.dbline 33
	xjmp L543
X20:
	.dbline -2
L542:
	add SP,-3
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l xx 1 I
	.dbsym l x 0 c
	.dbend
	.area lit(rom, con, rel)
L530:
	.byte 62,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L514:
	.byte 62,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o,0
L498:
	.byte 62,'L,'u,'z,32,'L,'C,'D,0
L475:
	.byte 51,45,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L472:
	.byte 50,45,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o
	.byte 0
L469:
	.byte 49,45,'L,'u,'z,32,'L,'C,'D,0
L466:
	.byte 62,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L455:
	.byte 'P,'h,'o,'t,'o,'S,'O,'C,32,'A,'c,'t,'i,'v,'o,0
L454:
	.byte 'D,'a,'t,'o,'s,32,'e,'n,'v,'i,'a,'d,'o,'s,0
L444:
	.byte 49,45,'A,'h,'o,'r,'a,0
L443:
	.byte 62,'E,'j,'e,'c,'u,'t,'a,'r,0
L422:
	.byte 'N,'u,'m,'e,'r,'o,32,'d,'e,32,'f,'o,'t,'o,'s,0
L419:
	.byte 'T,32,'e,'n,'t,'r,'e,32,'f,'o,'t,'o,0
L416:
	.byte 62,'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L383:
	.byte 62,'T,'i,'p,'o,32,'d,'e,32,'d,'i,'s,'p,46,0
L359:
	.byte 62,'C,'a,'m,'a,'r,'a,32,50,0
L347:
	.byte 'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L344:
	.byte 'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L341:
	.byte 'D,'i,'s,'p,46,32,'U,'n,'i,'c,'o,0
L338:
	.byte 'N,'o,32,'d,'i,'s,'p,'a,'r,'a,0
L335:
	.byte 62,'C,'a,'m,'a,'r,'a,32,49,0
L314:
	.byte 50,45,'C,'a,'m,'a,'r,'a,32,50,0
L311:
	.byte 49,45,'C,'a,'m,'a,'r,'a,32,49,0
L308:
	.byte 62,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L292:
	.byte 62,'F,'l,'a,'s,'h,32,52,0
L276:
	.byte 62,'F,'l,'a,'s,'h,32,51,0
L260:
	.byte 62,'F,'l,'a,'s,'h,32,50,0
L244:
	.byte 62,'F,'l,'a,'s,'h,32,49,0
L219:
	.byte 32,32,40,'O,'f,'f,41,0
L216:
	.byte 52,45,'F,'l,'a,'s,'h,32,52,0
L211:
	.byte 51,45,'F,'l,'a,'s,'h,32,51,0
L206:
	.byte 50,45,'F,'l,'a,'s,'h,32,50,0
L203:
	.byte 32,40,'O,'n,41,0
L202:
	.byte 32,40,'O,'f,'f,41,0
L199:
	.byte 49,45,'F,'l,'a,'s,'h,32,49,0
L196:
	.byte 62,'C,'o,'n,'f,46,32,'F,'l,'a,'s,'h,'e,'s,0
L180:
	.byte 62,'D,'i,'g,'i,'t,'a,'l,32,50,32,53,'V,0
L164:
	.byte 62,'D,'i,'g,'i,'t,'a,'l,32,49,32,53,'V,0
L148:
	.byte 62,'B,'a,'r,'r,'e,'r,'a,32,50,32,49,50,'V,0
L134:
	.byte 'O,'N,0
L133:
	.byte 'O,'F,'F,0
L130:
	.byte 62,'B,'a,'r,'r,'e,'r,'a,32,49,32,49,50,'V,0
L105:
	.byte 52,45,'D,'i,'g,'i,'t,'a,'l,32,50,32,53,'V,0
L102:
	.byte 51,45,'D,'i,'g,'i,'t,'a,'l,32,49,32,53,'V,0
L99:
	.byte 50,45,'B,'a,'r,'r,'e,'r,'a,32,50,32,49,50,'V,0
L96:
	.byte 49,45,'B,'a,'r,'r,'e,'r,'a,32,49,32,49,50,'V,0
L93:
	.byte 62,'C,'o,'n,'f,46,32,'S,'e,'n,'s,'o,'r,'e,'s,0
L66:
	.byte 53,45,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L63:
	.byte 52,45,'E,'j,'e,'c,'u,'t,'a,'r,0
L60:
	.byte 51,45,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L57:
	.byte 50,45,'C,'o,'n,'f,46,32,'F,'l,'a,'s,'h,'e,'s,0
L54:
	.byte 49,45,'C,'o,'n,'f,46,32,'S,'e,'n,'s,'o,'r,'e,'s
	.byte 0
L51:
	.byte 62,'M,'e,'n,'u,32,'P,'r,'i,'n,'c,'i,'p,'a,'l,0
L42:
	.byte 'a,32,32,'P,'h,'o,'t,'o,'S,'o,'C,0
L41:
	.byte 'B,'i,'e,'n,'v,'e,'n,'i,'d,'o,'s,0
