	cpu LMM
	.module main.c
	.area text(rom, con, rel)
	.dbfile ./comunicaciones.h
	.dbfunc e envia _envia fV
;   envia_recibe -> X+2
; envia_contador -> X+1
; envia_confirmacion -> X+0
;     envia_dato -> X-4
_envia::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 19
; //----------------------------------------------------------------//
; //     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
; //                   By Albert Sagol & Xavi Vicient			      //
; //                 PhotoSoC - Controlador fotográfico		  	  //
; //----------------------------------------------------------------//
; //              Programa principal del PSoC terminal			  //
; //----------------------------------------------------------------//
; 
; #include <m8c.h>        		// part specific constants and macros
; #include "PSoCAPI.h"    		// PSoC API definitions for all User Modules
; #include "stdlib.h"
; #include "terminal.h"			// Libreria creada por Albert y Xavi para el proyecto
; 
; void main()
; {	
; 	Inicializacion();			//Rutina de inicialización de los perifericos
; 	Bienvenida();				//Rutina que muestra el mensaje de bienvenida
; 	for (;;) Principal();		//Programa principal del PSoC terminal del PhotoSOC
; }
	.dbline 22
; }
; }
; }
	mov [X+0],0
	.dbline 23
; }
	mov [X+1],0
	xjmp L3
L2:
	.dbline 26
; }
; }
; }
	.dbline 27
; }
	push X
	mov A,[X-4]
	xcall _UART_PutChar
	.dbline 28
; }
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+2],A
	.dbline 30
; }
; }
	mov A,[X+2]
	cmp A,[X-4]
	jnz L5
	.dbline 30
	mov [X+0],79
L5:
	.dbline 31
; }
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	pop X
	.dbline 32
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 33
; }
	cmp [X+1],10
	jnz L7
	.dbline 33
	mov [X+0],1
L7:
	.dbline 34
L3:
	.dbline 25
	cmp [X+0],0
	jz L2
	.dbline -2
	.dbline 35
; }
; }
L1:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l envia_recibe 2 c
	.dbsym l envia_contador 1 c
	.dbsym l envia_confirmacion 0 c
	.dbsym l envia_dato -4 c
	.dbend
	.dbfunc e recibe _recibe fc
;    recibe_dato -> X+2
; recibe_contador -> X+1
; recibe_confirmacion -> X+0
_recibe::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 50
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
	.dbline 53
; }
; }
; }
	mov [X+0],0
	.dbline 54
; }
	mov [X+1],0
	xjmp L11
L10:
	.dbline 57
; }
; }
; }
	.dbline 58
; }
	push X
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+2],A
	.dbline 59
; }
	push X
	mov A,[X+2]
	xcall _UART_PutChar
	.dbline 61
; }
; }
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 62
; }
	cmp [X+0],79
	jnz L13
	.dbline 63
; }
	mov A,[X+2]
	xjmp L9
L13:
	.dbline 64
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 65
; }
	cmp [X+1],10
	jnz L15
	.dbline 65
	mov [X+0],1
L15:
	.dbline 66
L11:
	.dbline 56
	cmp [X+0],0
	jz L10
	.dbline 67
; }
; }
	mov REG[0xd0],>__r0
	mov A,-1
	.dbline -2
L9:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l recibe_dato 2 c
	.dbsym l recibe_contador 1 c
	.dbsym l recibe_confirmacion 0 c
	.dbend
	.area data(ram, con, rel)
	.dbfile ./comunicaciones.h
_Cam1::
	.byte 0
	.dbfile ./terminal.h
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
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL1_Treal::
	.byte 0
	.dbsym e TL1_Treal _TL1_Treal c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL1_Treal_Uni::
	.byte 0
	.dbsym e TL1_Treal_Uni _TL1_Treal_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL1_Tfilm::
	.byte 0
	.dbsym e TL1_Tfilm _TL1_Tfilm c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL1_Tfilm_Uni::
	.byte 0
	.dbsym e TL1_Tfilm_Uni _TL1_Tfilm_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL2_Treal::
	.byte 0
	.dbsym e TL2_Treal _TL2_Treal c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL2_Treal_Uni::
	.byte 0
	.dbsym e TL2_Treal_Uni _TL2_Treal_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL2_Tfilm::
	.byte 0
	.dbsym e TL2_Tfilm _TL2_Tfilm c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_TL2_Tfilm_Uni::
	.byte 0
	.dbsym e TL2_Tfilm_Uni _TL2_Tfilm_Uni c
	.area data(ram, con, rel)
	.dbfile ./terminal.h
	.area data(ram, con, rel)
	.dbfile ./terminal.h
_Luz_LCD::
	.byte 0
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
	.area text(rom, con, rel)
	.dbfile ./terminal.h
	.dbfunc e Inicializacion _Inicializacion fV
_Inicializacion::
	.dbline -1
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
; }
; }
; }
; }
	.dbline 82
; }
; }
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 83
; }
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 84
; }
	xcall _Timer8_Start
	.dbline 87
; }
; }
; }
	mov A,0
	xcall _UART_Start
	.dbline 90
; }
; }
; }
	xcall _LCD_Start
	.dbline 91
; }
	xcall _LCD_Init
	pop X
	.dbline 94
; }
; }
; }
	mov REG[ 0],-96
	.dbline -2
	.dbline 95
; }
L17:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Bienvenida _Bienvenida fV
_Bienvenida::
	.dbline -1
	.dbline 113
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
; }
; }
; }
	.dbline 114
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 115
; }
	mov X,1
	mov A,0
	xcall _LCD_Position
	.dbline 116
; }
	mov A,>L19
	push A
	mov A,<L19
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 117
; }
	mov X,3
	mov A,1
	xcall _LCD_Position
	.dbline 118
; }
	mov A,>L20
	push A
	mov A,<L20
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 119
; }
	xcall _bucle_temp
	.dbline -2
	.dbline 120
; }
L18:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e bucle_temp _bucle_temp fV
;              x -> X+0
_bucle_temp::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 129
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 132
	mov [X+1],0
	mov [X+0],0
	xjmp L25
L22:
	.dbline 132
L23:
	.dbline 132
	inc [X+1]
	adc [X+0],0
L25:
	.dbline 132
; }
; }
; }
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
	jc L22
X0:
	.dbline -2
	.dbline 133
; }
L21:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
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
	.dbline 145
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
	.dbline 149
; }
; }
; }
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 150
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L27
	.dbline 150
	xcall _Pitido
L27:
	.dbline 151
	cmp [X+0],0
	jz L29
	.dbline 152
	.dbline 153
	xcall _Menu
	.dbline 154
L29:
	.dbline -2
	.dbline 155
; }
; }
; }
; }
; }
L26:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l boton 0 c
	.dbend
	.dbfunc e Pitido _Pitido fV
;             xx -> X+0
_Pitido::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 166
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
	.dbline 169
; }
; }
; }
	or REG[ 0],8
	.dbline 170
	mov [X+1],0
	mov [X+0],0
L32:
	.dbline 170
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
L33:
	.dbline 170
; }
	inc [X+1]
	adc [X+0],0
	.dbline 170
	mov A,[X+1]
	sub A,-96
	mov A,[X+0]
	xor A,-128
	sbb A,(15 ^ 0x80)
	jc L32
X1:
	.dbline 171
; }
	and REG[ 0],-9
	.dbline -2
	.dbline 172
; }
L31:
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
	.dbline 188
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
; }
	.dbline 191
; }
; }
; }
	or REG[ 0],4
	.dbline 192
	mov [X+1],0
	mov [X+0],0
L37:
	.dbline 192
L38:
	.dbline 192
; }
	inc [X+1]
	adc [X+0],0
	.dbline 192
	mov A,[X+1]
	sub A,-18
	mov A,[X+0]
	xor A,-128
	sbb A,(2 ^ 0x80)
	jc L37
X2:
	.dbline 193
; }
	and REG[ 0],-5
	.dbline -2
	.dbline 194
; }
L36:
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
	.dbline 208
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
	.dbline 212
; }
; }
; }
; }
	mov [X+2],0
L42:
	.dbline 216
; }
; }
; }
; }
	.dbline 217
; }
	push X
	xcall _UART_cReadChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+3],A
	.dbline 218
; }
	cmp [X+3],-1
	jnz L45
	.dbline 218
L45:
	.dbline 219
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],32
	jnz L47
	.dbline 219
	mov [X+2],1
L47:
	.dbline 220
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-128
	jnz L49
	.dbline 220
	mov [X+2],2
L49:
	.dbline 221
; }
	cmp [X+2],0
	jz L51
	.dbline 222
; }
	.dbline 223
	mov [X+1],0
	mov [X+0],0
	xjmp L56
L53:
	.dbline 223
L54:
	.dbline 223
	inc [X+1]
	adc [X+0],0
L56:
	.dbline 223
; }
	mov A,[X+1]
	sub A,100
	mov A,[X+0]
	sbb A,0
	jc L53
X3:
	.dbline 224
; }
	mov [X+1],0
	mov [X+0],0
	xjmp L60
L57:
	.dbline 225
; }
	.dbline 226
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-96
	jnz L61
	.dbline 226
	mov A,[X+2]
	xjmp L41
L61:
	.dbline 227
	or REG[ 0],-96
	.dbline 228
L58:
	.dbline 224
	inc [X+1]
	adc [X+0],0
L60:
	.dbline 224
	mov A,[X+1]
	sub A,48
	mov A,[X+0]
	sbb A,117
	jc L57
X4:
	.dbline 229
; }
; }
; }
	add [X+2],2
	.dbline 230
; }
L51:
	.dbline 231
; }
	push X
	xcall _UART_cReadChar
	mov REG[0xd0],>__r0
	pop X
	cmp A,-5
	jnz L63
	.dbline 231
	xcall _Principal
L63:
	.dbline 232
L43:
	.dbline 232
; }
	cmp [X+2],0
	jz L42
	.dbline 233
; }
	mov A,[X+2]
	mov REG[0xd0],>__r0
	.dbline -2
L41:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l aviso 3 c
	.dbsym l pulsado 2 c
	.dbsym l x 0 i
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
	.dbline 244
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
	.dbline 245
; }
	mov [X+0],1
L66:
	.dbline 249
; }
; }
; }
; }
	.dbline 250
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 251
; }
	mov A,>L69
	push A
	mov A,<L69
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 252
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 253
; }
	cmp [X+0],1
	jnz L70
	.dbline 253
	push X
	mov A,>L72
	push A
	mov A,<L72
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L71
L70:
	.dbline 254
; }
	cmp [X+0],2
	jnz L73
	.dbline 254
	push X
	mov A,>L75
	push A
	mov A,<L75
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L74
L73:
	.dbline 255
; }
	cmp [X+0],3
	jnz L76
	.dbline 255
	push X
	mov A,>L78
	push A
	mov A,<L78
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L77
L76:
	.dbline 256
; }
	cmp [X+0],4
	jnz L79
	.dbline 256
	push X
	mov A,>L81
	push A
	mov A,<L81
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L80
L79:
	.dbline 257
; }
	cmp [X+0],5
	jnz L82
	.dbline 257
	push X
	mov A,>L84
	push A
	mov A,<L84
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L82:
L80:
L77:
L74:
L71:
	.dbline 258
; }
	xcall _bucle_temp
	.dbline 259
; }
	xcall _Pulsador
	mov [X+1],A
	.dbline 260
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L85
	.dbline 260
	xcall _Pitido
L85:
	.dbline 261
; }
	cmp [X+1],1
	jnz L87
	.dbline 262
; }
	.dbline 263
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	add A,1
	mov [__r0],A
	mov A,5
	cmp A,[__r0]
	jnc L89
X5:
	.dbline 263
	mov [X+0],1
	xjmp L88
L89:
	.dbline 264
; }
	inc [X+0]
	.dbline 265
; }
	xjmp L88
L87:
	.dbline 266
; }
	cmp [X+1],3
	jnz L91
	.dbline 267
; }
	.dbline 268
; }
	cmp [X+0],1
	jnz L93
	.dbline 268
	xcall _Sensors
	xjmp L92
L93:
	.dbline 269
; }
	cmp [X+0],2
	jnz L95
	.dbline 269
	xcall _Flashes
	xjmp L92
L95:
	.dbline 270
; }
	cmp [X+0],3
	jnz L97
	.dbline 270
	xcall _Dispar
	xjmp L92
L97:
	.dbline 271
; }
	cmp [X+0],4
	jnz L99
	.dbline 271
	xcall _Executar
	xjmp L92
L99:
	.dbline 272
; }
	cmp [X+0],5
	jnz L92
	.dbline 272
	xcall _Sistema
	.dbline 273
; }
	xjmp L92
L91:
	.dbline 274
; }
	cmp [X+1],2
	jnz L103
	.dbline 275
; }
	.dbline 276
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	sub A,1
	cmp A,1
	jnc L105
X6:
	.dbline 276
	mov [X+0],5
	xjmp L106
L105:
	.dbline 277
; }
	dec [X+0]
L106:
	.dbline 278
; }
L103:
L92:
L88:
	.dbline 279
L67:
	.dbline 279
; }
	cmp [X+1],4
	jnz L66
	.dbline -2
	.dbline 280
; }
L65:
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
	.dbline 290
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
	.dbline 291
; }
	mov [X+1],1
L108:
	.dbline 295
; }
; }
; }
; }
	.dbline 296
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 297
; }
	mov A,>L111
	push A
	mov A,<L111
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 298
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 299
; }
	cmp [X+1],1
	jnz L112
	.dbline 299
	push X
	mov A,>L114
	push A
	mov A,<L114
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L113
L112:
	.dbline 300
; }
	cmp [X+1],2
	jnz L115
	.dbline 300
	push X
	mov A,>L117
	push A
	mov A,<L117
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L116
L115:
	.dbline 301
; }
	cmp [X+1],3
	jnz L118
	.dbline 301
	push X
	mov A,>L120
	push A
	mov A,<L120
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L119
L118:
	.dbline 302
; }
	cmp [X+1],4
	jnz L121
	.dbline 302
	push X
	mov A,>L123
	push A
	mov A,<L123
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L121:
L119:
L116:
L113:
	.dbline 303
; }
	xcall _bucle_temp
	.dbline 304
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 305
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L124
	.dbline 305
	xcall _Pitido
L124:
	.dbline 306
; }
	cmp [X+0],1
	jnz L126
	.dbline 307
; }
	.dbline 308
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L128
X7:
	.dbline 308
	mov [X+1],1
	xjmp L127
L128:
	.dbline 309
; }
	inc [X+1]
	.dbline 310
; }
	xjmp L127
L126:
	.dbline 311
; }
	cmp [X+0],3
	jnz L130
	.dbline 312
; }
	.dbline 313
; }
	cmp [X+1],1
	jnz L132
	.dbline 313
	xcall _Entrada1
	xjmp L131
L132:
	.dbline 314
; }
	cmp [X+1],2
	jnz L134
	.dbline 314
	xcall _Entrada2
	xjmp L131
L134:
	.dbline 315
; }
	cmp [X+1],3
	jnz L136
	.dbline 315
	xcall _Entrada3
	xjmp L131
L136:
	.dbline 316
; }
	cmp [X+1],4
	jnz L131
	.dbline 316
	xcall _Entrada4
	.dbline 317
; }
	xjmp L131
L130:
	.dbline 318
; }
	cmp [X+0],2
	jnz L140
	.dbline 319
; }
	.dbline 320
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L142
X8:
	.dbline 320
	mov [X+1],4
	xjmp L143
L142:
	.dbline 321
; }
	dec [X+1]
L143:
	.dbline 322
; }
L140:
L131:
L127:
	.dbline 323
L109:
	.dbline 323
; }
	cmp [X+0],4
	jnz L108
	.dbline -2
	.dbline 324
; }
L107:
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
	.dbline 334
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
	.dbline 339
; }
; }
; }
; }
; }
	.dbline 340
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 341
; }
	mov A,>L148
	push A
	mov A,<L148
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 342
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 343
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L149
	.dbline 343
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L150
L149:
	.dbline 344
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L150:
	.dbline 345
; }
	xcall _bucle_temp
	.dbline 346
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 347
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L153
	.dbline 347
	xcall _Pitido
L153:
	.dbline 348
; }
	cmp [X+0],1
	jz L157
	cmp [X+0],2
	jnz L155
L157:
	.dbline 349
; }
	.dbline 350
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 351
; }
	xjmp L156
L155:
	.dbline 352
; }
	cmp [X+0],3
	jnz L158
	.dbline 353
; }
	.dbline 354
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L160
	.dbline 354
	mov [_Ent1],1
	xjmp L161
L160:
	.dbline 355
; }
	mov REG[0xd0],>_Ent1
	mov [_Ent1],0
L161:
	.dbline 356
; }
L158:
L156:
	.dbline 357
L146:
	.dbline 357
; }
	cmp [X+0],4
	jnz L145
	.dbline -2
	.dbline 358
; }
L144:
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
	.dbline 368
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
L163:
	.dbline 373
; }
; }
; }
; }
; }
	.dbline 374
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 375
; }
	mov A,>L166
	push A
	mov A,<L166
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 376
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 377
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L167
	.dbline 377
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L168
L167:
	.dbline 378
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L168:
	.dbline 379
; }
	xcall _bucle_temp
	.dbline 380
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 381
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L169
	.dbline 381
	xcall _Pitido
L169:
	.dbline 382
; }
	cmp [X+0],1
	jz L173
	cmp [X+0],2
	jnz L171
L173:
	.dbline 383
; }
	.dbline 384
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 385
; }
	xjmp L172
L171:
	.dbline 386
; }
	cmp [X+0],3
	jnz L174
	.dbline 387
; }
	.dbline 388
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L176
	.dbline 388
	mov [_Ent2],1
	xjmp L177
L176:
	.dbline 389
; }
	mov REG[0xd0],>_Ent2
	mov [_Ent2],0
L177:
	.dbline 390
; }
L174:
L172:
	.dbline 391
L164:
	.dbline 391
; }
	cmp [X+0],4
	jnz L163
	.dbline -2
	.dbline 392
; }
L162:
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
	.dbline 402
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
L179:
	.dbline 407
; }
; }
; }
; }
; }
	.dbline 408
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 409
; }
	mov A,>L182
	push A
	mov A,<L182
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 410
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 411
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L183
	.dbline 411
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L184
L183:
	.dbline 412
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L184:
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
	jnz L185
	.dbline 415
	xcall _Pitido
L185:
	.dbline 416
; }
	cmp [X+0],1
	jz L189
	cmp [X+0],2
	jnz L187
L189:
	.dbline 417
; }
	.dbline 418
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 419
; }
	xjmp L188
L187:
	.dbline 420
; }
	cmp [X+0],3
	jnz L190
	.dbline 421
; }
	.dbline 422
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L192
	.dbline 422
	mov [_Ent3],1
	xjmp L193
L192:
	.dbline 423
; }
	mov REG[0xd0],>_Ent3
	mov [_Ent3],0
L193:
	.dbline 424
; }
L190:
L188:
	.dbline 425
L180:
	.dbline 425
; }
	cmp [X+0],4
	jnz L179
	.dbline -2
	.dbline 426
; }
L178:
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
	.dbline 436
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
L195:
	.dbline 441
; }
; }
; }
; }
; }
	.dbline 442
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 443
; }
	mov A,>L198
	push A
	mov A,<L198
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 444
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 445
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L199
	.dbline 445
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L200
L199:
	.dbline 446
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L200:
	.dbline 447
; }
	xcall _bucle_temp
	.dbline 448
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 449
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L201
	.dbline 449
	xcall _Pitido
L201:
	.dbline 450
; }
	cmp [X+0],1
	jz L205
	cmp [X+0],2
	jnz L203
L205:
	.dbline 451
; }
	.dbline 452
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 453
; }
	xjmp L204
L203:
	.dbline 454
; }
	cmp [X+0],3
	jnz L206
	.dbline 455
; }
	.dbline 456
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L208
	.dbline 456
	mov [_Ent4],1
	xjmp L209
L208:
	.dbline 457
; }
	mov REG[0xd0],>_Ent4
	mov [_Ent4],0
L209:
	.dbline 458
; }
L206:
L204:
	.dbline 459
L196:
	.dbline 459
; }
	cmp [X+0],4
	jnz L195
	.dbline -2
	.dbline 460
; }
L194:
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
	.dbline 470
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
	.dbline 471
; }
	mov [X+1],1
L211:
	.dbline 475
; }
; }
; }
; }
	.dbline 476
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 477
; }
	mov A,>L214
	push A
	mov A,<L214
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 478
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 479
; }
	cmp [X+1],1
	jnz L215
	.dbline 480
; }
	.dbline 481
; }
	push X
	mov A,>L217
	push A
	mov A,<L217
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 482
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L218
	.dbline 482
	push X
	mov A,>L220
	push A
	mov A,<L220
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L216
L218:
	.dbline 483
; }
	push X
	mov A,>L221
	push A
	mov A,<L221
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 484
; }
	xjmp L216
L215:
	.dbline 485
; }
	cmp [X+1],2
	jnz L222
	.dbline 486
; }
	.dbline 487
; }
	push X
	mov A,>L224
	push A
	mov A,<L224
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 488
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L225
	.dbline 488
	push X
	mov A,>L220
	push A
	mov A,<L220
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L223
L225:
	.dbline 489
; }
	push X
	mov A,>L221
	push A
	mov A,<L221
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 490
; }
	xjmp L223
L222:
	.dbline 491
; }
	cmp [X+1],3
	jnz L227
	.dbline 492
; }
	.dbline 494
; }
; }
	push X
	mov A,>L229
	push A
	mov A,<L229
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 495
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L230
	.dbline 495
	push X
	mov A,>L220
	push A
	mov A,<L220
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L228
L230:
	.dbline 496
; }
	push X
	mov A,>L221
	push A
	mov A,<L221
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 497
; }
	xjmp L228
L227:
	.dbline 498
; }
	cmp [X+1],4
	jnz L232
	.dbline 499
; }
	.dbline 500
; }
	push X
	mov A,>L234
	push A
	mov A,<L234
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 501
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L235
	.dbline 501
	push X
	mov A,>L237
	push A
	mov A,<L237
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L236
L235:
	.dbline 502
; }
	push X
	mov A,>L221
	push A
	mov A,<L221
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L236:
	.dbline 503
; }
L232:
L228:
L223:
L216:
	.dbline 504
; }
	xcall _bucle_temp
	.dbline 505
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 506
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L238
	.dbline 506
	xcall _Pitido
L238:
	.dbline 507
; }
	cmp [X+0],1
	jnz L240
	.dbline 508
; }
	.dbline 509
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L242
X9:
	.dbline 509
	mov [X+1],1
	xjmp L241
L242:
	.dbline 510
; }
	inc [X+1]
	.dbline 511
; }
	xjmp L241
L240:
	.dbline 512
; }
	cmp [X+0],3
	jnz L244
	.dbline 513
; }
	.dbline 514
; }
	cmp [X+1],1
	jnz L246
	.dbline 514
	xcall _Flash1
	xjmp L245
L246:
	.dbline 515
; }
	cmp [X+1],2
	jnz L248
	.dbline 515
	xcall _Flash2
	xjmp L245
L248:
	.dbline 516
; }
	cmp [X+1],3
	jnz L250
	.dbline 516
	xcall _Flash3
	xjmp L245
L250:
	.dbline 517
; }
	cmp [X+1],4
	jnz L245
	.dbline 517
	xcall _Flash4
	.dbline 518
; }
	xjmp L245
L244:
	.dbline 519
; }
	cmp [X+0],2
	jnz L254
	.dbline 520
; }
	.dbline 521
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L256
X10:
	.dbline 521
	mov [X+1],4
	xjmp L257
L256:
	.dbline 522
; }
	dec [X+1]
L257:
	.dbline 523
; }
L254:
L245:
L241:
	.dbline 524
L212:
	.dbline 524
; }
	cmp [X+0],4
	jnz L211
	.dbline -2
	.dbline 525
; }
L210:
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
	.dbline 533
; }
; }
; }
; }
; }
; }
; }
; }
L259:
	.dbline 538
; }
; }
; }
; }
; }
	.dbline 539
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 540
; }
	mov A,>L262
	push A
	mov A,<L262
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 541
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 542
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L263
	.dbline 542
	push X
	mov A,>L265
	push A
	mov A,<L265
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L264
L263:
	.dbline 543
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],1
	jnz L266
	.dbline 543
	push X
	mov A,>L268
	push A
	mov A,<L268
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L267
L266:
	.dbline 544
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],2
	jnz L269
	.dbline 544
	push X
	mov A,>L271
	push A
	mov A,<L271
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L270
L269:
	.dbline 545
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],3
	jnz L272
	.dbline 545
	push X
	mov A,>L274
	push A
	mov A,<L274
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L272:
L270:
L267:
L264:
	.dbline 546
; }
	xcall _bucle_temp
	.dbline 547
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 548
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L275
	.dbline 548
	xcall _Pitido
L275:
	.dbline 549
; }
	cmp [X+0],1
	jz L279
	cmp [X+0],2
	jnz L277
L279:
	.dbline 550
; }
	.dbline 551
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 552
; }
	xjmp L278
L277:
	.dbline 553
; }
	cmp [X+0],3
	jnz L280
	.dbline 554
; }
	.dbline 555
; }
	mov A,1
	push A
	xcall _Tipo_fla
	add SP,-1
	.dbline 556
; }
L280:
L278:
	.dbline 557
L260:
	.dbline 557
; }
	cmp [X+0],4
	jnz L259
	.dbline -2
	.dbline 558
; }
L258:
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
	.dbline 568
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
L283:
	.dbline 573
; }
; }
; }
; }
; }
	.dbline 574
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 575
; }
	mov A,>L286
	push A
	mov A,<L286
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 576
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 577
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L287
	.dbline 577
	push X
	mov A,>L265
	push A
	mov A,<L265
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L288
L287:
	.dbline 578
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],1
	jnz L289
	.dbline 578
	push X
	mov A,>L268
	push A
	mov A,<L268
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L290
L289:
	.dbline 579
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],2
	jnz L291
	.dbline 579
	push X
	mov A,>L271
	push A
	mov A,<L271
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L292
L291:
	.dbline 580
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],3
	jnz L293
	.dbline 580
	push X
	mov A,>L274
	push A
	mov A,<L274
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L293:
L292:
L290:
L288:
	.dbline 581
; }
	xcall _bucle_temp
	.dbline 582
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 583
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L295
	.dbline 583
	xcall _Pitido
L295:
	.dbline 584
; }
	cmp [X+0],1
	jz L299
	cmp [X+0],2
	jnz L297
L299:
	.dbline 585
; }
	.dbline 586
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 587
; }
	xjmp L298
L297:
	.dbline 588
; }
	cmp [X+0],3
	jnz L300
	.dbline 589
; }
	.dbline 590
; }
	mov A,2
	push A
	xcall _Tipo_fla
	add SP,-1
	.dbline 591
; }
L300:
L298:
	.dbline 592
L284:
	.dbline 592
; }
	cmp [X+0],4
	jnz L283
	.dbline -2
	.dbline 593
; }
L282:
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
	.dbline 602
; }
; }
; }
; }
; }
; }
; }
; }
; }
L303:
	.dbline 607
; }
; }
; }
; }
; }
	.dbline 608
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 609
; }
	mov A,>L306
	push A
	mov A,<L306
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 610
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 611
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L307
	.dbline 611
	push X
	mov A,>L265
	push A
	mov A,<L265
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L308
L307:
	.dbline 612
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],1
	jnz L309
	.dbline 612
	push X
	mov A,>L268
	push A
	mov A,<L268
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L310
L309:
	.dbline 613
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],2
	jnz L311
	.dbline 613
	push X
	mov A,>L271
	push A
	mov A,<L271
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L312
L311:
	.dbline 614
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],3
	jnz L313
	.dbline 614
	push X
	mov A,>L274
	push A
	mov A,<L274
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L313:
L312:
L310:
L308:
	.dbline 615
; }
	xcall _bucle_temp
	.dbline 616
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 617
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L315
	.dbline 617
	xcall _Pitido
L315:
	.dbline 618
; }
	cmp [X+0],1
	jz L319
	cmp [X+0],2
	jnz L317
L319:
	.dbline 619
; }
	.dbline 620
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 621
; }
	xjmp L318
L317:
	.dbline 622
; }
	cmp [X+0],3
	jnz L320
	.dbline 623
; }
	.dbline 624
; }
	mov A,3
	push A
	xcall _Tipo_fla
	add SP,-1
	.dbline 625
; }
L320:
L318:
	.dbline 626
L304:
	.dbline 626
; }
	cmp [X+0],4
	jnz L303
	.dbline -2
	.dbline 627
; }
L302:
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
	.dbline 635
; }
; }
; }
; }
; }
; }
; }
; }
L323:
	.dbline 640
; }
; }
; }
; }
; }
	.dbline 641
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 642
; }
	mov A,>L326
	push A
	mov A,<L326
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 643
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 644
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L327
	.dbline 644
	push X
	mov A,>L265
	push A
	mov A,<L265
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L328
L327:
	.dbline 645
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],1
	jnz L329
	.dbline 645
	push X
	mov A,>L268
	push A
	mov A,<L268
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L330
L329:
	.dbline 646
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],2
	jnz L331
	.dbline 646
	push X
	mov A,>L271
	push A
	mov A,<L271
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L332
L331:
	.dbline 647
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],3
	jnz L333
	.dbline 647
	push X
	mov A,>L274
	push A
	mov A,<L274
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L333:
L332:
L330:
L328:
	.dbline 648
; }
	xcall _bucle_temp
	.dbline 649
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 650
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L335
	.dbline 650
	xcall _Pitido
L335:
	.dbline 651
; }
	cmp [X+0],1
	jz L339
	cmp [X+0],2
	jnz L337
L339:
	.dbline 652
; }
	.dbline 653
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 654
; }
	xjmp L338
L337:
	.dbline 655
; }
	cmp [X+0],3
	jnz L340
	.dbline 656
; }
	.dbline 657
; }
	mov A,4
	push A
	xcall _Tipo_fla
	add SP,-1
	.dbline 658
; }
L340:
L338:
	.dbline 659
L324:
	.dbline 659
; }
	cmp [X+0],4
	jnz L323
	.dbline -2
	.dbline 660
; }
L322:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e Tipo_fla _Tipo_fla fV
;              x -> X+2
;           menu -> X+1
;         pulsat -> X+0
;          flash -> X-4
_Tipo_fla::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 669
; }
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 673
; }
; }
; }
; }
	cmp [X-4],1
	jnz L343
	.dbline 673
	mov REG[0xd0],>_Fla1
	mov A,[_Fla1]
	add A,1
	mov [X+1],A
	xjmp L344
L343:
	.dbline 674
; }
	cmp [X-4],2
	jnz L345
	.dbline 674
	mov REG[0xd0],>_Fla2
	mov A,[_Fla2]
	add A,1
	mov [X+1],A
	xjmp L346
L345:
	.dbline 675
; }
	cmp [X-4],3
	jnz L347
	.dbline 675
	mov REG[0xd0],>_Fla3
	mov A,[_Fla3]
	add A,1
	mov [X+1],A
	xjmp L348
L347:
	.dbline 676
; }
	cmp [X-4],4
	jnz L349
	.dbline 676
	mov REG[0xd0],>_Fla4
	mov A,[_Fla4]
	add A,1
	mov [X+1],A
L349:
L348:
L346:
L344:
L351:
	.dbline 679
; }
; }
; }
	.dbline 680
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 681
; }
	mov A,>L354
	push A
	mov A,<L354
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 682
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 683
; }
	cmp [X+1],1
	jnz L355
	.dbline 683
	push X
	mov A,>L265
	push A
	mov A,<L265
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L356
L355:
	.dbline 684
; }
	cmp [X+1],2
	jnz L357
	.dbline 684
	push X
	mov A,>L268
	push A
	mov A,<L268
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L358
L357:
	.dbline 685
; }
	cmp [X+1],3
	jnz L359
	.dbline 685
	push X
	mov A,>L271
	push A
	mov A,<L271
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L360
L359:
	.dbline 686
; }
	cmp [X+1],4
	jnz L361
	.dbline 686
	push X
	mov A,>L274
	push A
	mov A,<L274
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L361:
L360:
L358:
L356:
	.dbline 687
; }
	xcall _bucle_temp
	.dbline 688
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 689
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L363
	.dbline 689
	xcall _Pitido
L363:
	.dbline 690
; }
	cmp [X+0],1
	jnz L365
	.dbline 691
; }
	.dbline 692
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L367
X11:
	.dbline 692
	mov [X+1],1
	xjmp L366
L367:
	.dbline 693
; }
	inc [X+1]
	.dbline 694
; }
	xjmp L366
L365:
	.dbline 695
; }
	cmp [X+0],3
	jnz L369
	.dbline 696
; }
	.dbline 697
; }
	cmp [X-4],1
	jnz L371
	.dbline 697
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Fla1
	mov [_Fla1],A
	xjmp L372
L371:
	.dbline 698
; }
	cmp [X-4],2
	jnz L373
	.dbline 698
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Fla2
	mov [_Fla2],A
	xjmp L374
L373:
	.dbline 699
; }
	cmp [X-4],3
	jnz L375
	.dbline 699
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Fla3
	mov [_Fla3],A
	xjmp L376
L375:
	.dbline 700
; }
	cmp [X-4],4
	jnz L377
	.dbline 700
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Fla4
	mov [_Fla4],A
L377:
L376:
L374:
L372:
	.dbline 701
; }
	mov [X+0],4
	.dbline 702
; }
	xjmp L370
L369:
	.dbline 703
; }
	cmp [X+0],2
	jnz L379
	.dbline 704
; }
	.dbline 705
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L381
X12:
	.dbline 705
	mov [X+1],4
	xjmp L382
L381:
	.dbline 706
; }
	dec [X+1]
L382:
	.dbline 707
; }
L379:
L370:
L366:
	.dbline 708
L352:
	.dbline 708
; }
	cmp [X+0],4
	jnz L351
	.dbline -2
	.dbline 709
; }
L342:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbsym l flash -4 c
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
	.dbline 719
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
	.dbline 721
; }
; }
	mov [X+1],1
L384:
	.dbline 725
; }
; }
; }
; }
	.dbline 726
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 727
; }
	mov A,>L387
	push A
	mov A,<L387
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 728
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 729
; }
	cmp [X+1],1
	jnz L388
	.dbline 729
	push X
	mov A,>L390
	push A
	mov A,<L390
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L389
L388:
	.dbline 730
; }
	cmp [X+1],2
	jnz L391
	.dbline 730
	push X
	mov A,>L393
	push A
	mov A,<L393
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L391:
L389:
	.dbline 731
; }
	xcall _bucle_temp
	.dbline 732
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 733
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L394
	.dbline 733
	xcall _Pitido
L394:
	.dbline 734
; }
	cmp [X+0],1
	jnz L396
	.dbline 735
; }
	.dbline 736
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L398
X13:
	.dbline 736
	mov [X+1],1
	xjmp L397
L398:
	.dbline 737
; }
	inc [X+1]
	.dbline 738
; }
	xjmp L397
L396:
	.dbline 739
; }
	cmp [X+0],3
	jnz L400
	.dbline 740
; }
	.dbline 741
; }
	cmp [X+1],1
	jnz L402
	.dbline 741
	xcall _Camara1
	xjmp L401
L402:
	.dbline 742
; }
	cmp [X+1],2
	jnz L401
	.dbline 742
	xcall _Camara2
	.dbline 743
; }
	xjmp L401
L400:
	.dbline 744
; }
	cmp [X+0],2
	jnz L406
	.dbline 745
; }
	.dbline 746
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L408
X14:
	.dbline 746
	mov [X+1],2
	xjmp L409
L408:
	.dbline 747
; }
	dec [X+1]
L409:
	.dbline 748
; }
L406:
L401:
L397:
	.dbline 749
L385:
	.dbline 749
; }
	cmp [X+0],4
	jnz L384
	.dbline -2
	.dbline 750
; }
L383:
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
	.dbline 759
; }
; }
; }
; }
; }
; }
; }
; }
; }
L411:
	.dbline 764
; }
; }
; }
; }
; }
	.dbline 765
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 766
; }
	mov A,>L414
	push A
	mov A,<L414
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 767
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 768
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],0
	jnz L415
	.dbline 768
	push X
	mov A,>L417
	push A
	mov A,<L417
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L416
L415:
	.dbline 769
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L418
	.dbline 769
	push X
	mov A,>L420
	push A
	mov A,<L420
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L419
L418:
	.dbline 770
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L421
	.dbline 770
	push X
	mov A,>L423
	push A
	mov A,<L423
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L422
L421:
	.dbline 771
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L424
	.dbline 771
	push X
	mov A,>L426
	push A
	mov A,<L426
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L424:
L422:
L419:
L416:
	.dbline 772
; }
	xcall _bucle_temp
	.dbline 773
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 774
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L427
	.dbline 774
	xcall _Pitido
L427:
	.dbline 775
; }
	cmp [X+0],1
	jz L431
	cmp [X+0],2
	jnz L429
L431:
	.dbline 776
; }
	.dbline 777
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 778
; }
	xjmp L430
L429:
	.dbline 779
; }
	cmp [X+0],3
	jnz L432
	.dbline 780
; }
	.dbline 781
; }
	mov A,1
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 782
; }
L432:
L430:
	.dbline 783
L412:
	.dbline 783
; }
	cmp [X+0],4
	jnz L411
	.dbline -2
	.dbline 784
; }
L410:
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
	.dbline 793
; }
; }
; }
; }
; }
; }
; }
; }
; }
L435:
	.dbline 798
; }
; }
; }
; }
; }
	.dbline 799
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 800
; }
	mov A,>L438
	push A
	mov A,<L438
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 801
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 802
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],0
	jnz L439
	.dbline 802
	push X
	mov A,>L417
	push A
	mov A,<L417
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L440
L439:
	.dbline 803
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L441
	.dbline 803
	push X
	mov A,>L420
	push A
	mov A,<L420
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L442
L441:
	.dbline 804
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L443
	.dbline 804
	push X
	mov A,>L423
	push A
	mov A,<L423
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L444
L443:
	.dbline 805
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L445
	.dbline 805
	push X
	mov A,>L426
	push A
	mov A,<L426
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L445:
L444:
L442:
L440:
	.dbline 806
; }
	xcall _bucle_temp
	.dbline 807
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 808
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L447
	.dbline 808
	xcall _Pitido
L447:
	.dbline 809
; }
	cmp [X+0],1
	jz L451
	cmp [X+0],2
	jnz L449
L451:
	.dbline 810
; }
	.dbline 811
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 812
; }
	xjmp L450
L449:
	.dbline 813
; }
	cmp [X+0],3
	jnz L452
	.dbline 814
; }
	.dbline 815
; }
	mov A,2
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 816
; }
L452:
L450:
	.dbline 817
L436:
	.dbline 817
; }
	cmp [X+0],4
	jnz L435
	.dbline -2
	.dbline 818
; }
L434:
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
	.dbline 828
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
	.dbline 832
; }
; }
; }
; }
	cmp [X-4],1
	jnz L455
	.dbline 832
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	add A,1
	mov [X+1],A
	xjmp L456
L455:
	.dbline 833
; }
	cmp [X-4],2
	jnz L457
	.dbline 833
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	add A,1
	mov [X+1],A
L457:
L456:
L459:
	.dbline 836
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
	mov A,>L462
	push A
	mov A,<L462
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 839
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 840
; }
	cmp [X+1],1
	jnz L463
	.dbline 840
	push X
	mov A,>L417
	push A
	mov A,<L417
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L464
L463:
	.dbline 841
; }
	cmp [X+1],2
	jnz L465
	.dbline 841
	push X
	mov A,>L420
	push A
	mov A,<L420
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L466
L465:
	.dbline 842
; }
	cmp [X+1],3
	jnz L467
	.dbline 842
	push X
	mov A,>L423
	push A
	mov A,<L423
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L468
L467:
	.dbline 843
; }
	cmp [X+1],4
	jnz L469
	.dbline 843
	push X
	mov A,>L426
	push A
	mov A,<L426
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L469:
L468:
L466:
L464:
	.dbline 844
; }
	xcall _bucle_temp
	.dbline 845
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 846
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L471
	.dbline 846
	xcall _Pitido
L471:
	.dbline 847
; }
	cmp [X+0],1
	jnz L473
	.dbline 848
; }
	.dbline 849
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L475
X15:
	.dbline 849
	mov [X+1],1
	xjmp L474
L475:
	.dbline 850
; }
	inc [X+1]
	.dbline 851
; }
	xjmp L474
L473:
	.dbline 852
; }
	cmp [X+0],3
	jnz L477
	.dbline 853
; }
	.dbline 854
; }
	cmp [X+1],1
	jz L481
	cmp [X+1],2
	jnz L479
L481:
	.dbline 855
; }
	.dbline 856
; }
	cmp [X-4],1
	jnz L482
	.dbline 856
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L480
L482:
	.dbline 857
; }
	cmp [X-4],2
	jnz L480
	.dbline 857
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 858
; }
	xjmp L480
L479:
	.dbline 859
; }
	cmp [X+1],3
	jnz L486
	.dbline 859
	mov A,[X-4]
	push A
	xcall _Intervalometro
	add SP,-1
	xjmp L487
L486:
	.dbline 860
; }
	cmp [X+1],4
	jnz L488
	.dbline 860
	mov A,[X-4]
	push A
	xcall _TimeLapse
	add SP,-1
L488:
L487:
L480:
	.dbline 861
; }
	mov [X+0],4
	.dbline 862
; }
	xjmp L478
L477:
	.dbline 863
; }
	cmp [X+0],2
	jnz L490
	.dbline 864
; }
	.dbline 865
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L492
X16:
	.dbline 865
	mov [X+1],4
	xjmp L493
L492:
	.dbline 866
; }
	dec [X+1]
L493:
	.dbline 867
; }
L490:
L478:
L474:
	.dbline 868
L460:
	.dbline 868
; }
	cmp [X+0],4
	jnz L459
	.dbline -2
	.dbline 869
; }
L454:
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
	.dbline 877
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 878
; }
	mov [X+1],1
	.dbline 881
; }
; }
; }
	cmp [X-4],1
	jnz L495
	.dbline 881
	mov REG[0xd0],>_Cam1
	mov [_Cam1],2
	xjmp L496
L495:
	.dbline 882
; }
	cmp [X-4],2
	jnz L497
	.dbline 882
	mov REG[0xd0],>_Cam2
	mov [_Cam2],2
L497:
L496:
L499:
	.dbline 884
; }
; }
	.dbline 885
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 886
; }
	mov A,>L502
	push A
	mov A,<L502
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
	cmp [X+1],1
	jnz L503
	.dbline 888
	push X
	mov A,>L505
	push A
	mov A,<L505
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L504
L503:
	.dbline 889
; }
	cmp [X+1],2
	jnz L506
	.dbline 889
	push X
	mov A,>L508
	push A
	mov A,<L508
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L506:
L504:
	.dbline 890
; }
	xcall _bucle_temp
	.dbline 891
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 892
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L509
	.dbline 892
	xcall _Pitido
L509:
	.dbline 893
; }
	cmp [X+0],1
	jnz L511
	.dbline 894
; }
	.dbline 895
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L513
X17:
	.dbline 895
	mov [X+1],1
	xjmp L512
L513:
	.dbline 896
; }
	inc [X+1]
	.dbline 897
; }
	xjmp L512
L511:
	.dbline 898
; }
	cmp [X+0],3
	jnz L515
	.dbline 899
; }
	.dbline 900
; }
	cmp [X+1],1
	jnz L517
	.dbline 901
; }
	.dbline 902
; }
	cmp [X-4],1
	jnz L519
	.dbline 903
; }
	.dbline 904
; }
	xcall _Numeros
	mov REG[0xd0],>_Int1_Tdisp
	mov [_Int1_Tdisp],A
	.dbline 905
; }
	xcall _Tiempos
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov [_Int1_Tdisp_Uni],A
	.dbline 906
; }
	xjmp L516
L519:
	.dbline 907
; }
	cmp [X-4],2
	jnz L516
	.dbline 908
; }
	.dbline 909
; }
	xcall _Numeros
	mov REG[0xd0],>_Int2_Tdisp
	mov [_Int2_Tdisp],A
	.dbline 910
; }
	xcall _Tiempos
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov [_Int2_Tdisp_Uni],A
	.dbline 911
; }
	.dbline 912
; }
	xjmp L516
L517:
	.dbline 913
; }
	cmp [X+1],2
	jnz L516
	.dbline 914
; }
	.dbline 915
; }
	cmp [X-4],1
	jnz L525
	.dbline 915
	xcall _Numeros
	mov REG[0xd0],>_Int1_Ndisp
	mov [_Int1_Ndisp],A
	xjmp L516
L525:
	.dbline 916
; }
	cmp [X-4],2
	jnz L516
	.dbline 916
	xcall _Numeros
	mov REG[0xd0],>_Int2_Ndisp
	mov [_Int2_Ndisp],A
	.dbline 917
; }
	.dbline 918
; }
	xjmp L516
L515:
	.dbline 919
; }
	cmp [X+0],2
	jnz L529
	.dbline 920
; }
	.dbline 921
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L531
X18:
	.dbline 921
	mov [X+1],2
	xjmp L532
L531:
	.dbline 922
; }
	dec [X+1]
L532:
	.dbline 923
; }
L529:
L516:
L512:
	.dbline 924
L500:
	.dbline 924
; }
	cmp [X+0],4
	jnz L499
	.dbline -2
	.dbline 926
; }
; }
L494:
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
	.dbline 934
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
	mov [X+1],1
	.dbline 938
; }
; }
; }
	cmp [X-4],1
	jnz L534
	.dbline 938
	mov REG[0xd0],>_Cam1
	mov [_Cam1],3
	xjmp L535
L534:
	.dbline 939
; }
	cmp [X-4],2
	jnz L536
	.dbline 939
	mov REG[0xd0],>_Cam2
	mov [_Cam2],3
L536:
L535:
L538:
	.dbline 941
; }
; }
	.dbline 942
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 943
; }
	mov A,>L541
	push A
	mov A,<L541
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 944
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 945
; }
	cmp [X+1],1
	jnz L542
	.dbline 945
	push X
	mov A,>L544
	push A
	mov A,<L544
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L543
L542:
	.dbline 946
; }
	cmp [X+1],2
	jnz L545
	.dbline 946
	push X
	mov A,>L547
	push A
	mov A,<L547
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L545:
L543:
	.dbline 947
; }
	xcall _bucle_temp
	.dbline 948
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 949
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L548
	.dbline 949
	xcall _Pitido
L548:
	.dbline 950
; }
	cmp [X+0],1
	jnz L550
	.dbline 951
; }
	.dbline 952
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L552
X19:
	.dbline 952
	mov [X+1],1
	xjmp L551
L552:
	.dbline 953
; }
	inc [X+1]
	.dbline 954
; }
	xjmp L551
L550:
	.dbline 955
; }
	cmp [X+0],3
	jnz L554
	.dbline 956
; }
	.dbline 957
; }
	cmp [X+1],1
	jnz L556
	.dbline 958
; }
	.dbline 959
; }
	cmp [X-4],1
	jnz L558
	.dbline 960
; }
	.dbline 961
; }
	xcall _Numeros
	mov REG[0xd0],>_TL1_Treal
	mov [_TL1_Treal],A
	.dbline 962
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL1_Treal_Uni
	mov [_TL1_Treal_Uni],A
	.dbline 963
; }
	xjmp L555
L558:
	.dbline 964
; }
	cmp [X-4],2
	jnz L555
	.dbline 965
; }
	.dbline 966
; }
	xcall _Numeros
	mov REG[0xd0],>_TL2_Treal
	mov [_TL2_Treal],A
	.dbline 967
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL2_Treal_Uni
	mov [_TL2_Treal_Uni],A
	.dbline 968
; }
	.dbline 969
; }
	xjmp L555
L556:
	.dbline 970
; }
	cmp [X+1],2
	jnz L555
	.dbline 971
; }
	.dbline 972
; }
	cmp [X-4],1
	jnz L564
	.dbline 973
; }
	.dbline 974
; }
	xcall _Numeros
	mov REG[0xd0],>_TL1_Tfilm
	mov [_TL1_Tfilm],A
	.dbline 975
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov [_TL1_Tfilm_Uni],A
	.dbline 976
; }
	xjmp L555
L564:
	.dbline 977
; }
	cmp [X-4],2
	jnz L555
	.dbline 978
; }
	.dbline 979
; }
	xcall _Numeros
	mov REG[0xd0],>_TL2_Tfilm
	mov [_TL2_Tfilm],A
	.dbline 980
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov [_TL2_Tfilm_Uni],A
	.dbline 981
; }
	.dbline 982
; }
	.dbline 983
; }
	xjmp L555
L554:
	.dbline 984
; }
	cmp [X+0],2
	jnz L568
	.dbline 985
; }
	.dbline 986
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L570
X20:
	.dbline 986
	mov [X+1],2
	xjmp L571
L570:
	.dbline 987
; }
	dec [X+1]
L571:
	.dbline 988
; }
L568:
L555:
L551:
	.dbline 989
L539:
	.dbline 989
; }
	cmp [X+0],4
	jnz L538
	.dbline -2
	.dbline 991
; }
; }
L533:
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
	.dbline 999
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 1000
; }
	mov [X+6],1
L573:
	.dbline 1004
; }
; }
; }
; }
	.dbline 1005
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1006
; }
	mov A,>L576
	push A
	mov A,<L576
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1007
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1008
; }
	mov [X+3],0
	mov [X+2],0
	mov [X+0],100
	mov A,[X+6]
	mov [X+1],A
	xjmp L580
L577:
	.dbline 1009
	.dbline 1010
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov REG[0xd0],>__r0
	xcall __divmodu_8X8_8
	pop A
	mov [X+4],A
	add SP,-1
	.dbline 1011
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	xcall __divmodu_8X8_8
	add SP,-1
	pop A
	mov [X+1],A
	.dbline 1012
	mov A,10
	push A
	mov A,[X+0]
	push A
	xcall __divmodu_8X8_8
	pop A
	mov [X+0],A
	add SP,-1
	.dbline 1013
	mov A,[X+4]
	add A,48
	push X
	xcall _LCD_WriteData
	pop X
	.dbline 1014
L578:
	.dbline 1008
	inc [X+3]
	adc [X+2],0
L580:
	.dbline 1008
	mov A,[X+3]
	sub A,3
	mov A,[X+2]
	sbb A,0
	jc L577
X21:
	.dbline 1015
; }
; }
; }
; }
; }
; }
; }
	xcall _bucle_temp
	.dbline 1016
; }
	xcall _Pulsador
	mov [X+5],A
	.dbline 1017
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L581
	.dbline 1017
	xcall _Pitido
L581:
	.dbline 1018
; }
	cmp [X+5],1
	jnz L583
	.dbline 1019
; }
	.dbline 1020
; }
	mov REG[0xd0],>__r0
	mov A,[X+6]
	add A,1
	mov [__r0],A
	mov A,100
	cmp A,[__r0]
	jnc L585
X22:
	.dbline 1020
	mov [X+6],1
	xjmp L584
L585:
	.dbline 1021
; }
	inc [X+6]
	.dbline 1022
; }
	xjmp L584
L583:
	.dbline 1023
; }
	cmp [X+5],3
	jnz L587
	.dbline 1024
; }
	.dbline 1025
; }
	mov A,[X+6]
	mov REG[0xd0],>__r0
	xjmp L572
L587:
	.dbline 1027
; }
; }
	cmp [X+5],2
	jnz L589
	.dbline 1028
; }
	.dbline 1029
; }
	mov REG[0xd0],>__r0
	mov A,[X+6]
	sub A,1
	cmp A,1
	jnc L591
X23:
	.dbline 1029
	mov [X+6],100
	xjmp L592
L591:
	.dbline 1030
; }
	dec [X+6]
L592:
	.dbline 1031
; }
L589:
L584:
	.dbline 1032
L574:
	.dbline 1032
; }
	cmp [X+5],5
	jnz L573
	.dbline -2
	.dbline 1033
; }
L572:
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
	.dbline 1041
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 1042
; }
	mov [X+1],1
L594:
	.dbline 1046
; }
; }
; }
; }
	.dbline 1047
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1048
; }
	mov A,>L597
	push A
	mov A,<L597
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1049
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1050
; }
	cmp [X+1],1
	jnz L598
	.dbline 1050
	push X
	mov A,>L600
	push A
	mov A,<L600
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L599
L598:
	.dbline 1051
; }
	cmp [X+1],2
	jnz L601
	.dbline 1051
	push X
	mov A,>L603
	push A
	mov A,<L603
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L602
L601:
	.dbline 1052
; }
	cmp [X+1],3
	jnz L604
	.dbline 1052
	push X
	mov A,>L606
	push A
	mov A,<L606
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L604:
L602:
L599:
	.dbline 1053
; }
	xcall _bucle_temp
	.dbline 1054
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1055
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L607
	.dbline 1055
	xcall _Pitido
L607:
	.dbline 1056
; }
	cmp [X+0],1
	jnz L609
	.dbline 1057
; }
	.dbline 1058
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L611
X24:
	.dbline 1058
	mov [X+1],1
	xjmp L610
L611:
	.dbline 1059
; }
	inc [X+1]
	.dbline 1060
; }
	xjmp L610
L609:
	.dbline 1061
; }
	cmp [X+0],3
	jnz L613
	.dbline 1062
; }
	.dbline 1063
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	xjmp L593
L613:
	.dbline 1065
; }
; }
	cmp [X+0],2
	jnz L615
	.dbline 1066
; }
	.dbline 1067
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L617
X25:
	.dbline 1067
	mov [X+1],3
	xjmp L618
L617:
	.dbline 1068
; }
	dec [X+1]
L618:
	.dbline 1069
; }
L615:
L610:
	.dbline 1070
L595:
	.dbline 1070
; }
	cmp [X+0],5
	jnz L594
	.dbline -2
	.dbline 1071
; }
L593:
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
	.dbline 1081
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
	.dbline 1082
; }
	mov [X+1],1
L620:
	.dbline 1086
; }
; }
; }
; }
	.dbline 1087
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1088
; }
	mov A,>L623
	push A
	mov A,<L623
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1089
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 1090
; }
	mov A,>L624
	push A
	mov A,<L624
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1091
; }
	xcall _bucle_temp
	.dbline 1092
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1093
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L625
	.dbline 1093
	xcall _Pitido
	xjmp L626
L625:
	.dbline 1094
; }
	cmp [X+0],3
	jnz L627
	.dbline 1095
; }
	.dbline 1096
; }
	cmp [X+1],1
	jnz L629
	.dbline 1096
	xcall _Ara
L629:
	.dbline 1097
; }
L627:
L626:
	.dbline 1098
L621:
	.dbline 1098
; }
	cmp [X+0],4
	jnz L620
	.dbline -2
	.dbline 1099
; }
L619:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 2 i
	.dbsym l menu 1 c
	.dbsym l pulsat 0 c
	.dbend
	.dbfunc e envio_valores _envio_valores fV
_envio_valores::
	.dbline -1
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
; }
; }
; }
; }
; }
; }
	.dbline 1115
; }
	xcall _Reset_PdT
	.dbline 1116
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1117
; }
	mov A,>L632
	push A
	mov A,<L632
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1118
; }
	mov A,1
	xcall _LCD_Control
	pop X
	.dbline 1119
; }
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	push A
	xcall _envia
	add SP,-1
	.dbline 1120
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1121
; }
	mov A,>L633
	push A
	mov A,<L633
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1122
; }
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	push A
	xcall _envia
	add SP,-1
	.dbline 1123
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1124
; }
	mov A,>L634
	push A
	mov A,<L634
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1125
; }
	mov REG[0xd0],>_Ent1
	mov A,[_Ent1]
	push A
	xcall _envia
	add SP,-1
	.dbline 1126
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1127
; }
	mov A,>L635
	push A
	mov A,<L635
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1128
; }
	mov REG[0xd0],>_Ent2
	mov A,[_Ent2]
	push A
	xcall _envia
	add SP,-1
	.dbline 1129
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1130
; }
	mov A,>L636
	push A
	mov A,<L636
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1131
; }
	mov REG[0xd0],>_Ent3
	mov A,[_Ent3]
	push A
	xcall _envia
	add SP,-1
	.dbline 1132
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1133
; }
	mov A,>L637
	push A
	mov A,<L637
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1134
; }
	mov REG[0xd0],>_Ent4
	mov A,[_Ent4]
	push A
	xcall _envia
	add SP,-1
	.dbline 1135
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1136
; }
	mov A,>L638
	push A
	mov A,<L638
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1137
; }
	mov REG[0xd0],>_Fla1
	mov A,[_Fla1]
	push A
	xcall _envia
	.dbline 1138
; }
	mov REG[0xd0],>_Fla2
	mov A,[_Fla2]
	push A
	xcall _envia
	add SP,-2
	.dbline 1139
; }
	mov REG[0xd0],>_Fla3
	mov A,[_Fla3]
	push A
	xcall _envia
	.dbline 1140
; }
	mov REG[0xd0],>_Fla4
	mov A,[_Fla4]
	push A
	xcall _envia
	add SP,-2
	.dbline 1144
; }
; }
; }
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L639
	.dbline 1145
; }
	mov REG[0xd0],>_Int1_Tdisp
	mov A,[_Int1_Tdisp]
	push A
	xcall _envia
	add SP,-1
L639:
	.dbline 1146
; }
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov A,[_Int1_Tdisp_Uni]
	push A
	xcall _envia
	.dbline 1147
; }
	mov REG[0xd0],>_Int1_Ndisp
	mov A,[_Int1_Ndisp]
	push A
	xcall _envia
	add SP,-2
	.dbline 1149
; }
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L641
	.dbline 1150
; }
	mov REG[0xd0],>_Int2_Tdisp
	mov A,[_Int2_Tdisp]
	push A
	xcall _envia
	add SP,-1
L641:
	.dbline 1151
; }
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov A,[_Int2_Tdisp_Uni]
	push A
	xcall _envia
	.dbline 1152
; }
	mov REG[0xd0],>_Int2_Ndisp
	mov A,[_Int2_Ndisp]
	push A
	xcall _envia
	add SP,-2
	.dbline 1154
; }
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L643
	.dbline 1155
; }
	mov REG[0xd0],>_TL1_Treal
	mov A,[_TL1_Treal]
	push A
	xcall _envia
	add SP,-1
L643:
	.dbline 1156
; }
	mov REG[0xd0],>_TL1_Treal_Uni
	mov A,[_TL1_Treal_Uni]
	push A
	xcall _envia
	add SP,-1
	.dbline 1157
; }
	mov REG[0xd0],>_TL1_Tfilm
	mov A,[_TL1_Tfilm]
	push A
	xcall _envia
	.dbline 1158
; }
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov A,[_TL1_Tfilm_Uni]
	push A
	xcall _envia
	add SP,-2
	.dbline 1160
; }
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L645
	.dbline 1161
; }
	mov REG[0xd0],>_TL2_Treal
	mov A,[_TL2_Treal]
	push A
	xcall _envia
	add SP,-1
L645:
	.dbline 1162
	mov REG[0xd0],>_TL2_Treal_Uni
	mov A,[_TL2_Treal_Uni]
	push A
	xcall _envia
	add SP,-1
	.dbline 1163
	mov REG[0xd0],>_TL2_Tfilm
	mov A,[_TL2_Tfilm]
	push A
	xcall _envia
	.dbline 1164
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov A,[_TL2_Tfilm_Uni]
	push A
	xcall _envia
	add SP,-2
	.dbline 1166
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L647
	.dbline 1166
	xcall _Pitido
L647:
	.dbline -2
	.dbline 1169
; }
; }
; }
; }
; }
; }
; }
; }
L631:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Ara _Ara fV
_Ara::
	.dbline -1
	.dbline 1182
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
	.dbline 1183
; }
	xcall _envio_valores
	.dbline 1184
; }
	xcall _Trabajando
	.dbline -2
	.dbline 1185
; }
L649:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Trabajando _Trabajando fV
;         pulsat -> X+2
;              x -> X+0
_Trabajando::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 1195
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
	.dbline 1199
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1200
; }
	mov A,>L651
	push A
	mov A,<L651
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1201
	mov [X+1],0
	mov [X+0],0
	xjmp L655
L652:
	.dbline 1201
L653:
	.dbline 1201
	inc [X+1]
	adc [X+0],0
L655:
	.dbline 1201
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
	jc L652
X27:
	.dbline 1202
	mov [X+1],0
	mov [X+0],0
	xjmp L659
L656:
	.dbline 1202
L657:
	.dbline 1202
	inc [X+1]
	adc [X+0],0
L659:
	.dbline 1202
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
	jc L656
X28:
	.dbline 1203
	mov [X+1],0
	mov [X+0],0
	xjmp L663
L660:
	.dbline 1203
L661:
	.dbline 1203
	inc [X+1]
	adc [X+0],0
L663:
	.dbline 1203
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
	jc L660
X29:
	.dbline 1205
; }
; }
L664:
	.dbline 1206
; }
	.dbline 1207
; }
	push X
	mov A,8
	xcall _LCD_Control
	.dbline 1208
; }
	mov A,1
	xcall _LCD_Control
	pop X
	.dbline 1210
; }
; }
	xcall _Pulsador
	mov [X+2],A
	.dbline 1211
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L668
	.dbline 1211
	xcall _Pitido
L668:
	.dbline 1212
; }
	cmp [X+2],1
	jz L673
	cmp [X+2],2
	jz L673
	cmp [X+2],4
	jnz L670
L673:
	.dbline 1213
; }
	.dbline 1214
; }
	push X
	mov A,14
	xcall _LCD_Control
	.dbline 1215
; }
	mov A,>L674
	push A
	mov A,<L674
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1216
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 1217
; }
	mov A,>L675
	push A
	mov A,<L675
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1218
	mov [X+1],0
	mov [X+0],0
	xjmp L679
L676:
	.dbline 1218
L677:
	.dbline 1218
	inc [X+1]
	adc [X+0],0
L679:
	.dbline 1218
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
	jc L676
X30:
	.dbline 1219
	mov [X+1],0
	mov [X+0],0
	xjmp L683
L680:
	.dbline 1219
L681:
	.dbline 1219
	inc [X+1]
	adc [X+0],0
L683:
	.dbline 1219
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
	jc L680
X31:
	.dbline 1220
; }
	xjmp L664
L670:
	.dbline 1221
	cmp [X+2],3
	jnz L664
	.dbline 1222
	.dbline 1223
	push X
	mov A,14
	xcall _LCD_Control
	.dbline 1224
	mov A,>L686
	push A
	mov A,<L686
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1225
	xcall _Resetear
	.dbline 1226
	.dbline 1227
	.dbline 1205
	.dbline 1205
	xjmp L664
X26:
	.dbline -2
L650:
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
	.dbline 1237
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
; }
; }
	.dbline 1238
; }
	xcall _Reset_PdT
	.dbline 1239
; }
	xcall _Principal
	.dbline -2
	.dbline 1240
; }
L687:
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
	.dbline 1250
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
	.dbline 1251
; }
	mov [X+1],1
L689:
	.dbline 1255
; }
; }
; }
; }
	.dbline 1256
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1257
; }
	mov A,>L692
	push A
	mov A,<L692
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1258
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1259
; }
	cmp [X+1],1
	jnz L693
	.dbline 1259
	push X
	mov A,>L695
	push A
	mov A,<L695
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L694
L693:
	.dbline 1260
; }
	cmp [X+1],2
	jnz L696
	.dbline 1260
	push X
	mov A,>L698
	push A
	mov A,<L698
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L697
L696:
	.dbline 1261
; }
	cmp [X+1],3
	jnz L699
	.dbline 1261
	push X
	mov A,>L701
	push A
	mov A,<L701
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L699:
L697:
L694:
	.dbline 1262
; }
	xcall _bucle_temp
	.dbline 1263
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1264
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L702
	.dbline 1264
	xcall _Pitido
L702:
	.dbline 1265
; }
	cmp [X+0],1
	jnz L704
	.dbline 1266
; }
	.dbline 1267
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L706
X32:
	.dbline 1267
	mov [X+1],1
	xjmp L705
L706:
	.dbline 1268
; }
	inc [X+1]
	.dbline 1269
; }
	xjmp L705
L704:
	.dbline 1270
; }
	cmp [X+0],3
	jnz L708
	.dbline 1271
; }
	.dbline 1272
; }
	cmp [X+1],1
	jnz L710
	.dbline 1272
	xcall _Reali_LCD
	xjmp L709
L710:
	.dbline 1273
; }
	cmp [X+1],2
	jnz L712
	.dbline 1273
	xcall _Zumbador
	xjmp L709
L712:
	.dbline 1274
; }
	cmp [X+1],3
	jnz L709
	.dbline 1274
	xcall _Ali_Led
	.dbline 1275
; }
	xjmp L709
L708:
	.dbline 1276
; }
	cmp [X+0],2
	jnz L716
	.dbline 1277
; }
	.dbline 1278
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L718
X33:
	.dbline 1278
	mov [X+1],3
	xjmp L719
L718:
	.dbline 1279
; }
	dec [X+1]
L719:
	.dbline 1280
; }
L716:
L709:
L705:
	.dbline 1281
L690:
	.dbline 1281
; }
	cmp [X+0],4
	jnz L689
	.dbline -2
	.dbline 1282
; }
L688:
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
	.dbline 1291
; }
; }
; }
; }
; }
; }
; }
; }
; }
L721:
	.dbline 1296
; }
; }
; }
; }
; }
	.dbline 1297
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1298
; }
	mov A,>L724
	push A
	mov A,<L724
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1299
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1300
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L725
	.dbline 1300
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L726
L725:
	.dbline 1301
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L726:
	.dbline 1302
; }
	xcall _bucle_temp
	.dbline 1303
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1304
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L727
	.dbline 1304
	xcall _Pitido
L727:
	.dbline 1305
; }
	cmp [X+0],1
	jz L731
	cmp [X+0],2
	jnz L729
L731:
	.dbline 1306
; }
	.dbline 1307
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1308
; }
	xjmp L730
L729:
	.dbline 1309
; }
	cmp [X+0],3
	jnz L732
	.dbline 1310
; }
	.dbline 1311
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L734
	.dbline 1312
; }
	.dbline 1313
; }
	or REG[ 0],2
	.dbline 1314
; }
	mov [_Luz_LCD],1
	.dbline 1315
; }
	xjmp L735
L734:
	.dbline 1317
; }
; }
	.dbline 1318
; }
	and REG[ 0],-3
	.dbline 1319
; }
	mov REG[0xd0],>_Luz_LCD
	mov [_Luz_LCD],0
	.dbline 1320
; }
L735:
	.dbline 1321
; }
L732:
L730:
	.dbline 1322
L722:
	.dbline 1322
; }
	cmp [X+0],4
	jnz L721
	.dbline -2
	.dbline 1323
; }
L720:
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
	.dbline 1332
; }
; }
; }
; }
; }
; }
; }
; }
; }
L737:
	.dbline 1337
; }
; }
; }
; }
; }
	.dbline 1338
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1339
; }
	mov A,>L740
	push A
	mov A,<L740
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1340
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1341
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L741
	.dbline 1341
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L742
L741:
	.dbline 1342
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L742:
	.dbline 1343
; }
	xcall _bucle_temp
	.dbline 1344
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1345
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L743
	.dbline 1345
	xcall _Pitido
L743:
	.dbline 1346
; }
	cmp [X+0],1
	jz L747
	cmp [X+0],2
	jnz L745
L747:
	.dbline 1347
; }
	.dbline 1348
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1349
; }
	xjmp L746
L745:
	.dbline 1350
; }
	cmp [X+0],3
	jnz L748
	.dbline 1351
; }
	.dbline 1352
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L750
	.dbline 1352
	mov [_Buzzer],1
	xjmp L751
L750:
	.dbline 1353
; }
	mov REG[0xd0],>_Buzzer
	mov [_Buzzer],0
L751:
	.dbline 1354
; }
L748:
L746:
	.dbline 1355
L738:
	.dbline 1355
; }
	cmp [X+0],4
	jnz L737
	.dbline -2
	.dbline 1356
; }
L736:
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
	.dbline 1365
; }
; }
; }
; }
; }
; }
; }
; }
; }
L753:
	.dbline 1370
; }
; }
; }
; }
; }
	.dbline 1371
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1372
; }
	mov A,>L756
	push A
	mov A,<L756
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1373
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1374
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L757
	.dbline 1374
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L758
L757:
	.dbline 1375
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L758:
	.dbline 1376
; }
	xcall _bucle_temp
	.dbline 1377
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1378
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L759
	.dbline 1378
	xcall _Pitido
L759:
	.dbline 1379
; }
	cmp [X+0],1
	jz L763
	cmp [X+0],2
	jnz L761
L763:
	.dbline 1380
; }
	.dbline 1381
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1382
; }
	xjmp L762
L761:
	.dbline 1383
; }
	cmp [X+0],3
	jnz L764
	.dbline 1384
; }
	.dbline 1385
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L766
	.dbline 1386
; }
	.dbline 1387
; }
	or REG[ 0],16
	.dbline 1388
; }
	mov [_Alimentacion],1
	.dbline 1389
; }
	xjmp L767
L766:
	.dbline 1391
; }
; }
	.dbline 1392
; }
	and REG[ 0],-17
	.dbline 1393
; }
	mov REG[0xd0],>_Alimentacion
	mov [_Alimentacion],0
	.dbline 1394
; }
L767:
	.dbline 1395
; }
L764:
L762:
	.dbline 1396
L754:
	.dbline 1396
; }
	cmp [X+0],4
	jnz L753
	.dbline -2
	.dbline 1397
; }
L752:
	add SP,-3
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 1 i
	.dbsym l pulsat 0 c
	.dbend
	.dbfile ./main.c
	.dbfunc e main _main fV
_main::
	.dbline -1
	.dbline 15
	.dbline 16
	xcall _Inicializacion
	.dbline 17
	xcall _Bienvenida
	.dbline 18
L769:
	.dbline 18
	xcall _Principal
	.dbline 18
	.dbline 18
	xjmp L769
X34:
	.dbline -2
L768:
	.dbline 0 ; func end
	jmp .
	.dbend
	.area lit(rom, con, rel)
L756:
	.byte 62,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L740:
	.byte 62,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o,0
L724:
	.byte 62,'L,'u,'z,32,'L,'C,'D,0
L701:
	.byte 51,45,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L698:
	.byte 50,45,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o
	.byte 0
L695:
	.byte 49,45,'L,'u,'z,32,'L,'C,'D,0
L692:
	.byte 62,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L686:
	.byte 'T,'r,'a,'b,'a,'j,'o,32,'p,'a,'r,'a,'d,'o,0
L675:
	.byte 'M,'a,'n,'t,'e,'n,32,'A,'m,'a,'r,'i,'l,'l,'o,0
L674:
	.byte 'P,'a,'r,'a,'r,32,'t,'r,'a,'b,'a,'j,'o,63,0
L651:
	.byte 'P,'h,'o,'t,'o,'S,'O,'C,32,'a,'c,'t,'i,'v,'o,0
L638:
	.byte 'a,'r,'r,'i,'b,'a,32,'E,'n,'t,52,0
L637:
	.byte 'a,'r,'r,'i,'b,'a,32,'E,'n,'t,51,0
L636:
	.byte 'a,'r,'r,'i,'b,'a,32,'E,'n,'t,50,0
L635:
	.byte 'a,'r,'r,'i,'b,'a,32,'E,'n,'t,49,0
L634:
	.byte 'a,'r,'r,'i,'b,'a,32,'c,'a,'m,50,0
L633:
	.byte 'a,'r,'r,'i,'b,'a,32,'c,'a,'m,49,0
L632:
	.byte 'a,'r,'r,'i,'b,'a,32,'r,'e,'s,'e,'t,0
L624:
	.byte 49,45,'A,'h,'o,'r,'a,0
L623:
	.byte 62,'E,'j,'e,'c,'u,'t,'a,'r,0
L606:
	.byte 'H,'o,'r,'a,'s,0
L603:
	.byte 'M,'i,'n,'u,'t,'o,'s,0
L600:
	.byte 'S,'e,'g,'u,'n,'d,'o,'s,0
L597:
	.byte 62,'U,'n,'i,46,32,'d,'e,32,'t,'i,'e,'m,'p,'o,0
L576:
	.byte 62,'N,'u,'m,'e,'r,'o,32,49,45,49,48,48,0
L547:
	.byte 'T,'i,'e,'m,'p,'o,32,'v,'i,'d,'e,'o,0
L544:
	.byte 'T,'i,'e,'m,'p,'o,32,'r,'e,'a,'l,0
L541:
	.byte 62,'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L508:
	.byte 'N,'u,'m,'e,'r,'o,32,'d,'e,32,'f,'o,'t,'o,'s,0
L505:
	.byte 'T,32,'e,'n,'t,'r,'e,32,'f,'o,'t,'o,0
L502:
	.byte 62,'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L462:
	.byte 62,'T,'i,'p,'o,32,'d,'e,32,'d,'i,'s,'p,46,0
L438:
	.byte 62,'C,'a,'m,'a,'r,'a,32,50,0
L426:
	.byte 'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L423:
	.byte 'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L420:
	.byte 'D,'i,'s,'p,46,32,'U,'n,'i,'c,'o,0
L417:
	.byte 'N,'o,32,'d,'i,'s,'p,'a,'r,'a,0
L414:
	.byte 62,'C,'a,'m,'a,'r,'a,32,49,0
L393:
	.byte 50,45,'C,'a,'m,'a,'r,'a,32,50,0
L390:
	.byte 49,45,'C,'a,'m,'a,'r,'a,32,49,0
L387:
	.byte 62,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L354:
	.byte 62,'A,'s,'i,'g,'n,'a,'c,'i,'o,'n,0
L326:
	.byte 62,'F,'l,'a,'s,'h,32,52,0
L306:
	.byte 62,'F,'l,'a,'s,'h,32,51,0
L286:
	.byte 62,'F,'l,'a,'s,'h,32,50,0
L274:
	.byte 'A,'m,'b,'a,'s,0
L271:
	.byte 'C,'a,'m,'a,'r,'a,32,50,0
L268:
	.byte 'C,'a,'m,'a,'r,'a,32,49,0
L265:
	.byte 'A,'p,'a,'g,'a,'d,'o,0
L262:
	.byte 62,'F,'l,'a,'s,'h,32,49,0
L237:
	.byte 32,32,40,'O,'f,'f,41,0
L234:
	.byte 52,45,'F,'l,'a,'s,'h,32,52,0
L229:
	.byte 51,45,'F,'l,'a,'s,'h,32,51,0
L224:
	.byte 50,45,'F,'l,'a,'s,'h,32,50,0
L221:
	.byte 32,40,'O,'n,41,0
L220:
	.byte 32,40,'O,'f,'f,41,0
L217:
	.byte 49,45,'F,'l,'a,'s,'h,32,49,0
L214:
	.byte 62,'C,'o,'n,'f,46,32,'F,'l,'a,'s,'h,'e,'s,0
L198:
	.byte 62,'D,'i,'g,'i,'t,'a,'l,32,50,32,53,'V,0
L182:
	.byte 62,'D,'i,'g,'i,'t,'a,'l,32,49,32,53,'V,0
L166:
	.byte 62,'B,'a,'r,'r,'e,'r,'a,32,50,32,49,50,'V,0
L152:
	.byte 'O,'N,0
L151:
	.byte 'O,'F,'F,0
L148:
	.byte 62,'B,'a,'r,'r,'e,'r,'a,32,49,32,49,50,'V,0
L123:
	.byte 52,45,'D,'i,'g,'i,'t,'a,'l,32,50,32,53,'V,0
L120:
	.byte 51,45,'D,'i,'g,'i,'t,'a,'l,32,49,32,53,'V,0
L117:
	.byte 50,45,'B,'a,'r,'r,'e,'r,'a,32,50,32,49,50,'V,0
L114:
	.byte 49,45,'B,'a,'r,'r,'e,'r,'a,32,49,32,49,50,'V,0
L111:
	.byte 62,'C,'o,'n,'f,46,32,'S,'e,'n,'s,'o,'r,'e,'s,0
L84:
	.byte 53,45,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L81:
	.byte 52,45,'E,'j,'e,'c,'u,'t,'a,'r,0
L78:
	.byte 51,45,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L75:
	.byte 50,45,'C,'o,'n,'f,46,32,'F,'l,'a,'s,'h,'e,'s,0
L72:
	.byte 49,45,'C,'o,'n,'f,46,32,'S,'e,'n,'s,'o,'r,'e,'s
	.byte 0
L69:
	.byte 62,'M,'e,'n,'u,32,'P,'r,'i,'n,'c,'i,'p,'a,'l,0
L20:
	.byte 'a,32,32,'P,'h,'o,'t,'o,'S,'o,'C,0
L19:
	.byte 'B,'i,'e,'n,'v,'e,'n,'i,'d,'o,'s,0
