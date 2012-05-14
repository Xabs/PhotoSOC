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
; }
; }
; }
	.dbline 81
; }
; }
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 82
; }
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 83
; }
	xcall _Timer8_Start
	.dbline 86
; }
; }
; }
	mov A,0
	xcall _UART_Start
	.dbline 89
; }
; }
; }
	xcall _LCD_Start
	.dbline 90
; }
	xcall _LCD_Init
	pop X
	.dbline 93
; }
; }
; }
	mov REG[ 0],-96
	.dbline -2
	.dbline 94
; }
L17:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Bienvenida _Bienvenida fV
_Bienvenida::
	.dbline -1
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
; }
; }
; }
; }
; }
	.dbline 113
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 114
; }
	mov X,1
	mov A,0
	xcall _LCD_Position
	.dbline 115
; }
	mov A,>L19
	push A
	mov A,<L19
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 116
; }
	mov X,3
	mov A,1
	xcall _LCD_Position
	.dbline 117
; }
	mov A,>L20
	push A
	mov A,<L20
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 118
; }
	xcall _bucle_temp
	.dbline -2
	.dbline 119
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
	.dbline 128
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
	mov [X+1],0
	mov [X+0],0
	xjmp L25
L22:
	.dbline 131
L23:
	.dbline 131
	inc [X+1]
	adc [X+0],0
L25:
	.dbline 131
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
	.dbline 132
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
	.dbline 144
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
	.dbline 148
; }
; }
; }
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 149
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L27
	.dbline 149
	xcall _Pitido
L27:
	.dbline 150
	cmp [X+0],0
	jz L29
	.dbline 151
	.dbline 152
	xcall _Menu
	.dbline 153
L29:
	.dbline -2
	.dbline 154
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
	.dbline 165
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
	.dbline 168
; }
; }
; }
	or REG[ 0],8
	.dbline 169
	mov [X+1],0
	mov [X+0],0
L32:
	.dbline 169
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
L33:
	.dbline 169
; }
	inc [X+1]
	adc [X+0],0
	.dbline 169
	mov A,[X+1]
	sub A,-96
	mov A,[X+0]
	xor A,-128
	sbb A,(15 ^ 0x80)
	jc L32
X1:
	.dbline 170
; }
	and REG[ 0],-9
	.dbline -2
	.dbline 171
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
	.dbline 187
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
	.dbline 190
; }
; }
; }
	or REG[ 0],4
	.dbline 191
	mov [X+1],0
	mov [X+0],0
L37:
	.dbline 191
L38:
	.dbline 191
; }
	inc [X+1]
	adc [X+0],0
	.dbline 191
	mov A,[X+1]
	sub A,-12
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L37
X2:
	.dbline 192
; }
	and REG[ 0],-5
	.dbline -2
	.dbline 193
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
; }
; }
; }
; }
	.dbline 211
; }
; }
; }
; }
	mov [X+2],0
L42:
	.dbline 215
; }
; }
; }
; }
	.dbline 216
; }
	push X
	xcall _UART_cReadChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+3],A
	.dbline 217
; }
	cmp [X+3],-1
	jnz L45
	.dbline 217
L45:
	.dbline 218
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],32
	jnz L47
	.dbline 218
	mov [X+2],1
L47:
	.dbline 219
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-128
	jnz L49
	.dbline 219
	mov [X+2],2
L49:
	.dbline 220
; }
	cmp [X+2],0
	jz L51
	.dbline 221
; }
	.dbline 222
	mov [X+1],0
	mov [X+0],0
	xjmp L56
L53:
	.dbline 222
L54:
	.dbline 222
	inc [X+1]
	adc [X+0],0
L56:
	.dbline 222
; }
	mov A,[X+1]
	sub A,100
	mov A,[X+0]
	sbb A,0
	jc L53
X3:
	.dbline 223
; }
	mov [X+1],0
	mov [X+0],0
	xjmp L60
L57:
	.dbline 224
; }
	.dbline 225
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],-96
	cmp [__r0],-96
	jnz L61
	.dbline 225
	mov A,[X+2]
	xjmp L41
L61:
	.dbline 226
	or REG[ 0],-96
	.dbline 227
L58:
	.dbline 223
	inc [X+1]
	adc [X+0],0
L60:
	.dbline 223
	mov A,[X+1]
	sub A,48
	mov A,[X+0]
	sbb A,117
	jc L57
X4:
	.dbline 228
; }
; }
; }
	add [X+2],2
	.dbline 229
; }
L51:
	.dbline 230
; }
	push X
	xcall _UART_cReadChar
	mov REG[0xd0],>__r0
	pop X
	cmp A,-5
	jnz L63
	.dbline 230
	xcall _Principal
L63:
	.dbline 231
L43:
	.dbline 231
; }
	cmp [X+2],0
	jz L42
	.dbline 232
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
; }
	.dbline 244
; }
	mov [X+0],1
L66:
	.dbline 248
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
	mov A,>L69
	push A
	mov A,<L69
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
	cmp [X+0],1
	jnz L70
	.dbline 252
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
	.dbline 253
; }
	cmp [X+0],2
	jnz L73
	.dbline 253
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
	.dbline 254
; }
	cmp [X+0],3
	jnz L76
	.dbline 254
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
	.dbline 255
; }
	cmp [X+0],4
	jnz L79
	.dbline 255
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
	.dbline 256
; }
	cmp [X+0],5
	jnz L82
	.dbline 256
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
	.dbline 257
; }
	xcall _bucle_temp
	.dbline 258
; }
	xcall _Pulsador
	mov [X+1],A
	.dbline 259
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L85
	.dbline 259
	xcall _Pitido
L85:
	.dbline 260
; }
	cmp [X+1],1
	jnz L87
	.dbline 261
; }
	.dbline 262
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	add A,1
	mov [__r0],A
	mov A,5
	cmp A,[__r0]
	jnc L89
X5:
	.dbline 262
	mov [X+0],1
	xjmp L88
L89:
	.dbline 263
; }
	inc [X+0]
	.dbline 264
; }
	xjmp L88
L87:
	.dbline 265
; }
	cmp [X+1],3
	jnz L91
	.dbline 266
; }
	.dbline 267
; }
	cmp [X+0],1
	jnz L93
	.dbline 267
	xcall _Sensors
	xjmp L92
L93:
	.dbline 268
; }
	cmp [X+0],2
	jnz L95
	.dbline 268
	xcall _Flashes
	xjmp L92
L95:
	.dbline 269
; }
	cmp [X+0],3
	jnz L97
	.dbline 269
	xcall _Dispar
	xjmp L92
L97:
	.dbline 270
; }
	cmp [X+0],4
	jnz L99
	.dbline 270
	xcall _Executar
	xjmp L92
L99:
	.dbline 271
; }
	cmp [X+0],5
	jnz L92
	.dbline 271
	xcall _Sistema
	.dbline 272
; }
	xjmp L92
L91:
	.dbline 273
; }
	cmp [X+1],2
	jnz L103
	.dbline 274
; }
	.dbline 275
; }
	mov REG[0xd0],>__r0
	mov A,[X+0]
	sub A,1
	cmp A,1
	jnc L105
X6:
	.dbline 275
	mov [X+0],5
	xjmp L106
L105:
	.dbline 276
; }
	dec [X+0]
L106:
	.dbline 277
; }
L103:
L92:
L88:
	.dbline 278
L67:
	.dbline 278
; }
	cmp [X+1],4
	jnz L66
	.dbline -2
	.dbline 279
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
	.dbline 289
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
	.dbline 290
; }
	mov [X+1],1
L108:
	.dbline 294
; }
; }
; }
; }
	.dbline 295
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 296
; }
	mov A,>L111
	push A
	mov A,<L111
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 297
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 298
; }
	cmp [X+1],1
	jnz L112
	.dbline 298
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
	.dbline 299
; }
	cmp [X+1],2
	jnz L115
	.dbline 299
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
	.dbline 300
; }
	cmp [X+1],3
	jnz L118
	.dbline 300
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
	.dbline 301
; }
	cmp [X+1],4
	jnz L121
	.dbline 301
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
	.dbline 302
; }
	xcall _bucle_temp
	.dbline 303
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 304
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L124
	.dbline 304
	xcall _Pitido
L124:
	.dbline 305
; }
	cmp [X+0],1
	jnz L126
	.dbline 306
; }
	.dbline 307
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L128
X7:
	.dbline 307
	mov [X+1],1
	xjmp L127
L128:
	.dbline 308
; }
	inc [X+1]
	.dbline 309
; }
	xjmp L127
L126:
	.dbline 310
; }
	cmp [X+0],3
	jnz L130
	.dbline 311
; }
	.dbline 312
; }
	cmp [X+1],1
	jnz L132
	.dbline 312
	xcall _Entrada1
	xjmp L131
L132:
	.dbline 313
; }
	cmp [X+1],2
	jnz L134
	.dbline 313
	xcall _Entrada2
	xjmp L131
L134:
	.dbline 314
; }
	cmp [X+1],3
	jnz L136
	.dbline 314
	xcall _Entrada3
	xjmp L131
L136:
	.dbline 315
; }
	cmp [X+1],4
	jnz L131
	.dbline 315
	xcall _Entrada4
	.dbline 316
; }
	xjmp L131
L130:
	.dbline 317
; }
	cmp [X+0],2
	jnz L140
	.dbline 318
; }
	.dbline 319
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L142
X8:
	.dbline 319
	mov [X+1],4
	xjmp L143
L142:
	.dbline 320
; }
	dec [X+1]
L143:
	.dbline 321
; }
L140:
L131:
L127:
	.dbline 322
L109:
	.dbline 322
; }
	cmp [X+0],4
	jnz L108
	.dbline -2
	.dbline 323
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
	.dbline 333
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
	.dbline 338
; }
; }
; }
; }
; }
	.dbline 339
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 340
; }
	mov A,>L148
	push A
	mov A,<L148
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 341
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 342
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L149
	.dbline 342
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
	.dbline 343
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
	.dbline 344
; }
	xcall _bucle_temp
	.dbline 345
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 346
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L153
	.dbline 346
	xcall _Pitido
L153:
	.dbline 347
; }
	cmp [X+0],1
	jz L157
	cmp [X+0],2
	jnz L155
L157:
	.dbline 348
; }
	.dbline 349
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 350
; }
	xjmp L156
L155:
	.dbline 351
; }
	cmp [X+0],3
	jnz L158
	.dbline 352
; }
	.dbline 353
; }
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L160
	.dbline 353
	mov [_Ent1],1
	xjmp L161
L160:
	.dbline 354
; }
	mov REG[0xd0],>_Ent1
	mov [_Ent1],0
L161:
	.dbline 355
; }
L158:
L156:
	.dbline 356
L146:
	.dbline 356
; }
	cmp [X+0],4
	jnz L145
	.dbline -2
	.dbline 357
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
	.dbline 367
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
	.dbline 372
; }
; }
; }
; }
; }
	.dbline 373
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 374
; }
	mov A,>L166
	push A
	mov A,<L166
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 375
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 376
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L167
	.dbline 376
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
	.dbline 377
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
	.dbline 378
; }
	xcall _bucle_temp
	.dbline 379
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 380
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L169
	.dbline 380
	xcall _Pitido
L169:
	.dbline 381
; }
	cmp [X+0],1
	jz L173
	cmp [X+0],2
	jnz L171
L173:
	.dbline 382
; }
	.dbline 383
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 384
; }
	xjmp L172
L171:
	.dbline 385
; }
	cmp [X+0],3
	jnz L174
	.dbline 386
; }
	.dbline 387
; }
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L176
	.dbline 387
	mov [_Ent2],1
	xjmp L177
L176:
	.dbline 388
; }
	mov REG[0xd0],>_Ent2
	mov [_Ent2],0
L177:
	.dbline 389
; }
L174:
L172:
	.dbline 390
L164:
	.dbline 390
; }
	cmp [X+0],4
	jnz L163
	.dbline -2
	.dbline 391
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
	.dbline 401
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
	.dbline 406
; }
; }
; }
; }
; }
	.dbline 407
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 408
; }
	mov A,>L182
	push A
	mov A,<L182
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 409
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 410
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L183
	.dbline 410
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
	.dbline 411
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
	.dbline 412
; }
	xcall _bucle_temp
	.dbline 413
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 414
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L185
	.dbline 414
	xcall _Pitido
L185:
	.dbline 415
; }
	cmp [X+0],1
	jz L189
	cmp [X+0],2
	jnz L187
L189:
	.dbline 416
; }
	.dbline 417
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 418
; }
	xjmp L188
L187:
	.dbline 419
; }
	cmp [X+0],3
	jnz L190
	.dbline 420
; }
	.dbline 421
; }
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L192
	.dbline 421
	mov [_Ent3],1
	xjmp L193
L192:
	.dbline 422
; }
	mov REG[0xd0],>_Ent3
	mov [_Ent3],0
L193:
	.dbline 423
; }
L190:
L188:
	.dbline 424
L180:
	.dbline 424
; }
	cmp [X+0],4
	jnz L179
	.dbline -2
	.dbline 425
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
	.dbline 435
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
	.dbline 440
; }
; }
; }
; }
; }
	.dbline 441
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 442
; }
	mov A,>L198
	push A
	mov A,<L198
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 443
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 444
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L199
	.dbline 444
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
	.dbline 445
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
	.dbline 446
; }
	xcall _bucle_temp
	.dbline 447
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 448
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L201
	.dbline 448
	xcall _Pitido
L201:
	.dbline 449
; }
	cmp [X+0],1
	jz L205
	cmp [X+0],2
	jnz L203
L205:
	.dbline 450
; }
	.dbline 451
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 452
; }
	xjmp L204
L203:
	.dbline 453
; }
	cmp [X+0],3
	jnz L206
	.dbline 454
; }
	.dbline 455
; }
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L208
	.dbline 455
	mov [_Ent4],1
	xjmp L209
L208:
	.dbline 456
; }
	mov REG[0xd0],>_Ent4
	mov [_Ent4],0
L209:
	.dbline 457
; }
L206:
L204:
	.dbline 458
L196:
	.dbline 458
; }
	cmp [X+0],4
	jnz L195
	.dbline -2
	.dbline 459
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
	.dbline 469
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
	.dbline 470
; }
	mov [X+1],1
L211:
	.dbline 474
; }
; }
; }
; }
	.dbline 475
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 476
; }
	mov A,>L214
	push A
	mov A,<L214
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 477
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 478
; }
	cmp [X+1],1
	jnz L215
	.dbline 479
; }
	.dbline 480
; }
	push X
	mov A,>L217
	push A
	mov A,<L217
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 481
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L218
	.dbline 481
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
	.dbline 482
; }
	push X
	mov A,>L221
	push A
	mov A,<L221
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 483
; }
	xjmp L216
L215:
	.dbline 484
; }
	cmp [X+1],2
	jnz L222
	.dbline 485
; }
	.dbline 486
; }
	push X
	mov A,>L224
	push A
	mov A,<L224
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 487
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L225
	.dbline 487
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
	.dbline 488
; }
	push X
	mov A,>L221
	push A
	mov A,<L221
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 489
; }
	xjmp L223
L222:
	.dbline 490
; }
	cmp [X+1],3
	jnz L227
	.dbline 491
; }
	.dbline 493
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
	.dbline 494
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L230
	.dbline 494
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
	.dbline 495
; }
	push X
	mov A,>L221
	push A
	mov A,<L221
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 496
; }
	xjmp L228
L227:
	.dbline 497
; }
	cmp [X+1],4
	jnz L232
	.dbline 498
; }
	.dbline 499
; }
	push X
	mov A,>L234
	push A
	mov A,<L234
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 500
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L235
	.dbline 500
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
	.dbline 501
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
	.dbline 502
; }
L232:
L228:
L223:
L216:
	.dbline 503
; }
	xcall _bucle_temp
	.dbline 504
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 505
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L238
	.dbline 505
	xcall _Pitido
L238:
	.dbline 506
; }
	cmp [X+0],1
	jnz L240
	.dbline 507
; }
	.dbline 508
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L242
X9:
	.dbline 508
	mov [X+1],1
	xjmp L241
L242:
	.dbline 509
; }
	inc [X+1]
	.dbline 510
; }
	xjmp L241
L240:
	.dbline 511
; }
	cmp [X+0],3
	jnz L244
	.dbline 512
; }
	.dbline 513
; }
	cmp [X+1],1
	jnz L246
	.dbline 513
	xcall _Flash1
	xjmp L245
L246:
	.dbline 514
; }
	cmp [X+1],2
	jnz L248
	.dbline 514
	xcall _Flash2
	xjmp L245
L248:
	.dbline 515
; }
	cmp [X+1],3
	jnz L250
	.dbline 515
	xcall _Flash3
	xjmp L245
L250:
	.dbline 516
; }
	cmp [X+1],4
	jnz L245
	.dbline 516
	xcall _Flash4
	.dbline 517
; }
	xjmp L245
L244:
	.dbline 518
; }
	cmp [X+0],2
	jnz L254
	.dbline 519
; }
	.dbline 520
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L256
X10:
	.dbline 520
	mov [X+1],4
	xjmp L257
L256:
	.dbline 521
; }
	dec [X+1]
L257:
	.dbline 522
; }
L254:
L245:
L241:
	.dbline 523
L212:
	.dbline 523
; }
	cmp [X+0],4
	jnz L211
	.dbline -2
	.dbline 524
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
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L264
L263:
	.dbline 543
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L264:
	.dbline 544
; }
	xcall _bucle_temp
	.dbline 545
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 546
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L265
	.dbline 546
	xcall _Pitido
L265:
	.dbline 547
; }
	cmp [X+0],1
	jz L269
	cmp [X+0],2
	jnz L267
L269:
	.dbline 548
; }
	.dbline 549
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 550
; }
	xjmp L268
L267:
	.dbline 551
; }
	cmp [X+0],3
	jnz L270
	.dbline 552
; }
	.dbline 553
; }
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],0
	jnz L272
	.dbline 553
	mov [_Fla1],1
	xjmp L273
L272:
	.dbline 554
; }
	mov REG[0xd0],>_Fla1
	mov [_Fla1],0
L273:
	.dbline 555
; }
L270:
L268:
	.dbline 556
L260:
	.dbline 556
; }
	cmp [X+0],4
	jnz L259
	.dbline -2
	.dbline 557
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
	.dbline 567
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
L275:
	.dbline 572
; }
; }
; }
; }
; }
	.dbline 573
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 574
; }
	mov A,>L278
	push A
	mov A,<L278
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 575
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 576
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L279
	.dbline 576
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L280
L279:
	.dbline 577
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L280:
	.dbline 578
; }
	xcall _bucle_temp
	.dbline 579
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 580
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L281
	.dbline 580
	xcall _Pitido
L281:
	.dbline 581
; }
	cmp [X+0],1
	jz L285
	cmp [X+0],2
	jnz L283
L285:
	.dbline 582
; }
	.dbline 583
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 584
; }
	xjmp L284
L283:
	.dbline 585
; }
	cmp [X+0],3
	jnz L286
	.dbline 586
; }
	.dbline 587
; }
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],0
	jnz L288
	.dbline 587
	mov [_Fla2],1
	xjmp L289
L288:
	.dbline 588
; }
	mov REG[0xd0],>_Fla2
	mov [_Fla2],0
L289:
	.dbline 589
; }
L286:
L284:
	.dbline 590
L276:
	.dbline 590
; }
	cmp [X+0],4
	jnz L275
	.dbline -2
	.dbline 591
; }
L274:
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
	.dbline 600
; }
; }
; }
; }
; }
; }
; }
; }
; }
L291:
	.dbline 605
; }
; }
; }
; }
; }
	.dbline 606
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 607
; }
	mov A,>L294
	push A
	mov A,<L294
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 608
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 609
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L295
	.dbline 609
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L296
L295:
	.dbline 610
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L296:
	.dbline 611
; }
	xcall _bucle_temp
	.dbline 612
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 613
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L297
	.dbline 613
	xcall _Pitido
L297:
	.dbline 614
; }
	cmp [X+0],1
	jz L301
	cmp [X+0],2
	jnz L299
L301:
	.dbline 615
; }
	.dbline 616
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 617
; }
	xjmp L300
L299:
	.dbline 618
; }
	cmp [X+0],3
	jnz L302
	.dbline 619
; }
	.dbline 620
; }
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],0
	jnz L304
	.dbline 620
	mov [_Fla3],1
	xjmp L305
L304:
	.dbline 621
; }
	mov REG[0xd0],>_Fla3
	mov [_Fla3],0
L305:
	.dbline 622
; }
L302:
L300:
	.dbline 623
L292:
	.dbline 623
; }
	cmp [X+0],4
	jnz L291
	.dbline -2
	.dbline 624
; }
L290:
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
	.dbline 633
; }
; }
; }
; }
; }
; }
; }
; }
; }
L307:
	.dbline 638
; }
; }
; }
; }
; }
	.dbline 639
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 640
; }
	mov A,>L310
	push A
	mov A,<L310
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 641
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 642
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L311
	.dbline 642
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L312
L311:
	.dbline 643
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L312:
	.dbline 644
; }
	xcall _bucle_temp
	.dbline 645
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 646
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L313
	.dbline 646
	xcall _Pitido
L313:
	.dbline 647
; }
	cmp [X+0],1
	jz L317
	cmp [X+0],2
	jnz L315
L317:
	.dbline 648
; }
	.dbline 649
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 650
; }
	xjmp L316
L315:
	.dbline 651
; }
	cmp [X+0],3
	jnz L318
	.dbline 652
; }
	.dbline 653
; }
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],0
	jnz L320
	.dbline 653
	mov [_Fla4],1
	xjmp L321
L320:
	.dbline 654
; }
	mov REG[0xd0],>_Fla4
	mov [_Fla4],0
L321:
	.dbline 655
; }
L318:
L316:
	.dbline 656
L308:
	.dbline 656
; }
	cmp [X+0],4
	jnz L307
	.dbline -2
	.dbline 657
; }
L306:
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
	.dbline 667
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
	.dbline 669
; }
; }
	mov [X+1],1
L323:
	.dbline 673
; }
; }
; }
; }
	.dbline 674
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 675
; }
	mov A,>L326
	push A
	mov A,<L326
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 676
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 677
; }
	cmp [X+1],1
	jnz L327
	.dbline 677
	push X
	mov A,>L329
	push A
	mov A,<L329
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L328
L327:
	.dbline 678
; }
	cmp [X+1],2
	jnz L330
	.dbline 678
	push X
	mov A,>L332
	push A
	mov A,<L332
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L330:
L328:
	.dbline 679
; }
	xcall _bucle_temp
	.dbline 680
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 681
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L333
	.dbline 681
	xcall _Pitido
L333:
	.dbline 682
; }
	cmp [X+0],1
	jnz L335
	.dbline 683
; }
	.dbline 684
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L337
X11:
	.dbline 684
	mov [X+1],1
	xjmp L336
L337:
	.dbline 685
; }
	inc [X+1]
	.dbline 686
; }
	xjmp L336
L335:
	.dbline 687
; }
	cmp [X+0],3
	jnz L339
	.dbline 688
; }
	.dbline 689
; }
	cmp [X+1],1
	jnz L341
	.dbline 689
	xcall _Camara1
	xjmp L340
L341:
	.dbline 690
; }
	cmp [X+1],2
	jnz L340
	.dbline 690
	xcall _Camara2
	.dbline 691
; }
	xjmp L340
L339:
	.dbline 692
; }
	cmp [X+0],2
	jnz L345
	.dbline 693
; }
	.dbline 694
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L347
X12:
	.dbline 694
	mov [X+1],2
	xjmp L348
L347:
	.dbline 695
; }
	dec [X+1]
L348:
	.dbline 696
; }
L345:
L340:
L336:
	.dbline 697
L324:
	.dbline 697
; }
	cmp [X+0],4
	jnz L323
	.dbline -2
	.dbline 698
; }
L322:
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
	.dbline 707
; }
; }
; }
; }
; }
; }
; }
; }
; }
L350:
	.dbline 712
; }
; }
; }
; }
; }
	.dbline 713
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 714
; }
	mov A,>L353
	push A
	mov A,<L353
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 715
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 716
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],0
	jnz L354
	.dbline 716
	push X
	mov A,>L356
	push A
	mov A,<L356
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L355
L354:
	.dbline 717
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L357
	.dbline 717
	push X
	mov A,>L359
	push A
	mov A,<L359
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L358
L357:
	.dbline 718
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L360
	.dbline 718
	push X
	mov A,>L362
	push A
	mov A,<L362
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L361
L360:
	.dbline 719
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L363
	.dbline 719
	push X
	mov A,>L365
	push A
	mov A,<L365
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L363:
L361:
L358:
L355:
	.dbline 720
; }
	xcall _bucle_temp
	.dbline 721
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 722
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L366
	.dbline 722
	xcall _Pitido
L366:
	.dbline 723
; }
	cmp [X+0],1
	jz L370
	cmp [X+0],2
	jnz L368
L370:
	.dbline 724
; }
	.dbline 725
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 726
; }
	xjmp L369
L368:
	.dbline 727
; }
	cmp [X+0],3
	jnz L371
	.dbline 728
; }
	.dbline 729
; }
	mov A,1
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 730
; }
L371:
L369:
	.dbline 731
L351:
	.dbline 731
; }
	cmp [X+0],4
	jnz L350
	.dbline -2
	.dbline 732
; }
L349:
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
	.dbline 741
; }
; }
; }
; }
; }
; }
; }
; }
; }
L374:
	.dbline 746
; }
; }
; }
; }
; }
	.dbline 747
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 748
; }
	mov A,>L377
	push A
	mov A,<L377
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 749
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 750
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],0
	jnz L378
	.dbline 750
	push X
	mov A,>L356
	push A
	mov A,<L356
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L379
L378:
	.dbline 751
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L380
	.dbline 751
	push X
	mov A,>L359
	push A
	mov A,<L359
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L381
L380:
	.dbline 752
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L382
	.dbline 752
	push X
	mov A,>L362
	push A
	mov A,<L362
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L383
L382:
	.dbline 753
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L384
	.dbline 753
	push X
	mov A,>L365
	push A
	mov A,<L365
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L384:
L383:
L381:
L379:
	.dbline 754
; }
	xcall _bucle_temp
	.dbline 755
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 756
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L386
	.dbline 756
	xcall _Pitido
L386:
	.dbline 757
; }
	cmp [X+0],1
	jz L390
	cmp [X+0],2
	jnz L388
L390:
	.dbline 758
; }
	.dbline 759
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 760
; }
	xjmp L389
L388:
	.dbline 761
; }
	cmp [X+0],3
	jnz L391
	.dbline 762
; }
	.dbline 763
; }
	mov A,2
	push A
	xcall _Tipo_disp
	add SP,-1
	.dbline 764
; }
L391:
L389:
	.dbline 765
L375:
	.dbline 765
; }
	cmp [X+0],4
	jnz L374
	.dbline -2
	.dbline 766
; }
L373:
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
	.dbline 776
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
	.dbline 780
; }
; }
; }
; }
	cmp [X-4],1
	jnz L394
	.dbline 780
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	add A,1
	mov [X+1],A
	xjmp L395
L394:
	.dbline 781
; }
	cmp [X-4],2
	jnz L396
	.dbline 781
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	add A,1
	mov [X+1],A
L396:
L395:
L398:
	.dbline 784
; }
; }
; }
	.dbline 785
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 786
; }
	mov A,>L401
	push A
	mov A,<L401
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 787
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 788
; }
	cmp [X+1],1
	jnz L402
	.dbline 788
	push X
	mov A,>L356
	push A
	mov A,<L356
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L403
L402:
	.dbline 789
; }
	cmp [X+1],2
	jnz L404
	.dbline 789
	push X
	mov A,>L359
	push A
	mov A,<L359
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L405
L404:
	.dbline 790
; }
	cmp [X+1],3
	jnz L406
	.dbline 790
	push X
	mov A,>L362
	push A
	mov A,<L362
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L407
L406:
	.dbline 791
; }
	cmp [X+1],4
	jnz L408
	.dbline 791
	push X
	mov A,>L365
	push A
	mov A,<L365
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L408:
L407:
L405:
L403:
	.dbline 792
; }
	xcall _bucle_temp
	.dbline 793
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 794
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L410
	.dbline 794
	xcall _Pitido
L410:
	.dbline 795
; }
	cmp [X+0],1
	jnz L412
	.dbline 796
; }
	.dbline 797
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,4
	cmp A,[__r0]
	jnc L414
X13:
	.dbline 797
	mov [X+1],1
	xjmp L413
L414:
	.dbline 798
; }
	inc [X+1]
	.dbline 799
; }
	xjmp L413
L412:
	.dbline 800
; }
	cmp [X+0],3
	jnz L416
	.dbline 801
; }
	.dbline 802
; }
	cmp [X+1],1
	jz L420
	cmp [X+1],2
	jnz L418
L420:
	.dbline 803
; }
	.dbline 804
; }
	cmp [X-4],1
	jnz L421
	.dbline 804
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	xjmp L419
L421:
	.dbline 805
; }
	cmp [X-4],2
	jnz L419
	.dbline 805
	mov A,[X+1]
	sub A,1
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 806
; }
	xjmp L419
L418:
	.dbline 807
; }
	cmp [X+1],3
	jnz L425
	.dbline 807
	mov A,[X-4]
	push A
	xcall _Intervalometro
	add SP,-1
	xjmp L426
L425:
	.dbline 808
; }
	cmp [X+1],4
	jnz L427
	.dbline 808
	mov A,[X-4]
	push A
	xcall _TimeLapse
	add SP,-1
L427:
L426:
L419:
	.dbline 809
; }
	mov [X+0],4
	.dbline 810
; }
	xjmp L417
L416:
	.dbline 811
; }
	cmp [X+0],2
	jnz L429
	.dbline 812
; }
	.dbline 813
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L431
X14:
	.dbline 813
	mov [X+1],4
	xjmp L432
L431:
	.dbline 814
; }
	dec [X+1]
L432:
	.dbline 815
; }
L429:
L417:
L413:
	.dbline 816
L399:
	.dbline 816
; }
	cmp [X+0],4
	jnz L398
	.dbline -2
	.dbline 817
; }
L393:
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
	.dbline 825
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 826
; }
	mov [X+1],1
	.dbline 829
; }
; }
; }
	cmp [X-4],1
	jnz L434
	.dbline 829
	mov REG[0xd0],>_Cam1
	mov [_Cam1],2
	xjmp L435
L434:
	.dbline 830
; }
	cmp [X-4],2
	jnz L436
	.dbline 830
	mov REG[0xd0],>_Cam2
	mov [_Cam2],2
L436:
L435:
L438:
	.dbline 832
; }
; }
	.dbline 833
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 834
; }
	mov A,>L441
	push A
	mov A,<L441
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 835
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 836
; }
	cmp [X+1],1
	jnz L442
	.dbline 836
	push X
	mov A,>L444
	push A
	mov A,<L444
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L443
L442:
	.dbline 837
; }
	cmp [X+1],2
	jnz L445
	.dbline 837
	push X
	mov A,>L447
	push A
	mov A,<L447
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L445:
L443:
	.dbline 838
; }
	xcall _bucle_temp
	.dbline 839
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 840
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L448
	.dbline 840
	xcall _Pitido
L448:
	.dbline 841
; }
	cmp [X+0],1
	jnz L450
	.dbline 842
; }
	.dbline 843
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L452
X15:
	.dbline 843
	mov [X+1],1
	xjmp L451
L452:
	.dbline 844
; }
	inc [X+1]
	.dbline 845
; }
	xjmp L451
L450:
	.dbline 846
; }
	cmp [X+0],3
	jnz L454
	.dbline 847
; }
	.dbline 848
; }
	cmp [X+1],1
	jnz L456
	.dbline 849
; }
	.dbline 850
; }
	cmp [X-4],1
	jnz L458
	.dbline 851
; }
	.dbline 852
; }
	xcall _Numeros
	mov REG[0xd0],>_Int1_Tdisp
	mov [_Int1_Tdisp],A
	.dbline 853
; }
	xcall _Tiempos
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov [_Int1_Tdisp_Uni],A
	.dbline 854
; }
	xjmp L455
L458:
	.dbline 855
; }
	cmp [X-4],2
	jnz L455
	.dbline 856
; }
	.dbline 857
; }
	xcall _Numeros
	mov REG[0xd0],>_Int2_Tdisp
	mov [_Int2_Tdisp],A
	.dbline 858
; }
	xcall _Tiempos
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov [_Int2_Tdisp_Uni],A
	.dbline 859
; }
	.dbline 860
; }
	xjmp L455
L456:
	.dbline 861
; }
	cmp [X+1],2
	jnz L455
	.dbline 862
; }
	.dbline 863
; }
	cmp [X-4],1
	jnz L464
	.dbline 863
	xcall _Numeros
	mov REG[0xd0],>_Int1_Ndisp
	mov [_Int1_Ndisp],A
	xjmp L455
L464:
	.dbline 864
; }
	cmp [X-4],2
	jnz L455
	.dbline 864
	xcall _Numeros
	mov REG[0xd0],>_Int2_Ndisp
	mov [_Int2_Ndisp],A
	.dbline 865
; }
	.dbline 866
; }
	xjmp L455
L454:
	.dbline 867
; }
	cmp [X+0],2
	jnz L468
	.dbline 868
; }
	.dbline 869
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L470
X16:
	.dbline 869
	mov [X+1],2
	xjmp L471
L470:
	.dbline 870
; }
	dec [X+1]
L471:
	.dbline 871
; }
L468:
L455:
L451:
	.dbline 872
L439:
	.dbline 872
; }
	cmp [X+0],4
	jnz L438
	.dbline -2
	.dbline 874
; }
; }
L433:
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
	.dbline 882
; }
; }
; }
; }
; }
; }
; }
; }
	.dbline 883
; }
	mov [X+1],1
	.dbline 886
; }
; }
; }
	cmp [X-4],1
	jnz L473
	.dbline 886
	mov REG[0xd0],>_Cam1
	mov [_Cam1],3
	xjmp L474
L473:
	.dbline 887
; }
	cmp [X-4],2
	jnz L475
	.dbline 887
	mov REG[0xd0],>_Cam2
	mov [_Cam2],3
L475:
L474:
L477:
	.dbline 889
; }
; }
	.dbline 890
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 891
; }
	mov A,>L480
	push A
	mov A,<L480
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 892
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 893
; }
	cmp [X+1],1
	jnz L481
	.dbline 893
	push X
	mov A,>L483
	push A
	mov A,<L483
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L482
L481:
	.dbline 894
; }
	cmp [X+1],2
	jnz L484
	.dbline 894
	push X
	mov A,>L486
	push A
	mov A,<L486
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L484:
L482:
	.dbline 895
; }
	xcall _bucle_temp
	.dbline 896
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 897
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L487
	.dbline 897
	xcall _Pitido
L487:
	.dbline 898
; }
	cmp [X+0],1
	jnz L489
	.dbline 899
; }
	.dbline 900
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,2
	cmp A,[__r0]
	jnc L491
X17:
	.dbline 900
	mov [X+1],1
	xjmp L490
L491:
	.dbline 901
; }
	inc [X+1]
	.dbline 902
; }
	xjmp L490
L489:
	.dbline 903
; }
	cmp [X+0],3
	jnz L493
	.dbline 904
; }
	.dbline 905
; }
	cmp [X+1],1
	jnz L495
	.dbline 906
; }
	.dbline 907
; }
	cmp [X-4],1
	jnz L497
	.dbline 908
; }
	.dbline 909
; }
	xcall _Numeros
	mov REG[0xd0],>_TL1_Treal
	mov [_TL1_Treal],A
	.dbline 910
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL1_Treal_Uni
	mov [_TL1_Treal_Uni],A
	.dbline 911
; }
	xjmp L494
L497:
	.dbline 912
; }
	cmp [X-4],2
	jnz L494
	.dbline 913
; }
	.dbline 914
; }
	xcall _Numeros
	mov REG[0xd0],>_TL2_Treal
	mov [_TL2_Treal],A
	.dbline 915
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL2_Treal_Uni
	mov [_TL2_Treal_Uni],A
	.dbline 916
; }
	.dbline 917
; }
	xjmp L494
L495:
	.dbline 918
; }
	cmp [X+1],2
	jnz L494
	.dbline 919
; }
	.dbline 920
; }
	cmp [X-4],1
	jnz L503
	.dbline 921
; }
	.dbline 922
; }
	xcall _Numeros
	mov REG[0xd0],>_TL1_Tfilm
	mov [_TL1_Tfilm],A
	.dbline 923
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov [_TL1_Tfilm_Uni],A
	.dbline 924
; }
	xjmp L494
L503:
	.dbline 925
; }
	cmp [X-4],2
	jnz L494
	.dbline 926
; }
	.dbline 927
; }
	xcall _Numeros
	mov REG[0xd0],>_TL2_Tfilm
	mov [_TL2_Tfilm],A
	.dbline 928
; }
	xcall _Tiempos
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov [_TL2_Tfilm_Uni],A
	.dbline 929
; }
	.dbline 930
; }
	.dbline 931
; }
	xjmp L494
L493:
	.dbline 932
; }
	cmp [X+0],2
	jnz L507
	.dbline 933
; }
	.dbline 934
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L509
X18:
	.dbline 934
	mov [X+1],2
	xjmp L510
L509:
	.dbline 935
; }
	dec [X+1]
L510:
	.dbline 936
; }
L507:
L494:
L490:
	.dbline 937
L478:
	.dbline 937
; }
	cmp [X+0],4
	jnz L477
	.dbline -2
	.dbline 939
; }
; }
L472:
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
	.dbline 947
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
	mov [X+6],1
L512:
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
	mov A,>L515
	push A
	mov A,<L515
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 955
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 956
; }
	mov [X+3],0
	mov [X+2],0
	mov [X+0],100
	mov A,[X+6]
	mov [X+1],A
	xjmp L519
L516:
	.dbline 957
	.dbline 958
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov REG[0xd0],>__r0
	xcall __divmodu_8X8_8
	pop A
	mov [X+4],A
	add SP,-1
	.dbline 959
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	xcall __divmodu_8X8_8
	add SP,-1
	pop A
	mov [X+1],A
	.dbline 960
	mov A,10
	push A
	mov A,[X+0]
	push A
	xcall __divmodu_8X8_8
	pop A
	mov [X+0],A
	add SP,-1
	.dbline 961
	mov A,[X+4]
	add A,48
	push X
	xcall _LCD_WriteData
	pop X
	.dbline 962
L517:
	.dbline 956
	inc [X+3]
	adc [X+2],0
L519:
	.dbline 956
	mov A,[X+3]
	sub A,3
	mov A,[X+2]
	sbb A,0
	jc L516
X19:
	.dbline 963
; }
; }
; }
; }
; }
; }
; }
	xcall _bucle_temp
	.dbline 964
; }
	xcall _Pulsador
	mov [X+5],A
	.dbline 965
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L520
	.dbline 965
	xcall _Pitido
L520:
	.dbline 966
; }
	cmp [X+5],1
	jnz L522
	.dbline 967
; }
	.dbline 968
; }
	mov REG[0xd0],>__r0
	mov A,[X+6]
	add A,1
	mov [__r0],A
	mov A,100
	cmp A,[__r0]
	jnc L524
X20:
	.dbline 968
	mov [X+6],1
	xjmp L523
L524:
	.dbline 969
; }
	inc [X+6]
	.dbline 970
; }
	xjmp L523
L522:
	.dbline 971
; }
	cmp [X+5],3
	jnz L526
	.dbline 972
; }
	.dbline 973
; }
	mov A,[X+6]
	mov REG[0xd0],>__r0
	xjmp L511
L526:
	.dbline 975
; }
; }
	cmp [X+5],2
	jnz L528
	.dbline 976
; }
	.dbline 977
; }
	mov REG[0xd0],>__r0
	mov A,[X+6]
	sub A,1
	cmp A,1
	jnc L530
X21:
	.dbline 977
	mov [X+6],100
	xjmp L531
L530:
	.dbline 978
; }
	dec [X+6]
L531:
	.dbline 979
; }
L528:
L523:
	.dbline 980
L513:
	.dbline 980
; }
	cmp [X+5],5
	jnz L512
	.dbline -2
	.dbline 981
; }
L511:
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
	.dbline 989
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
	mov [X+1],1
L533:
	.dbline 994
; }
; }
; }
; }
	.dbline 995
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 996
; }
	mov A,>L536
	push A
	mov A,<L536
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 997
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 998
; }
	cmp [X+1],1
	jnz L537
	.dbline 998
	push X
	mov A,>L539
	push A
	mov A,<L539
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L538
L537:
	.dbline 999
; }
	cmp [X+1],2
	jnz L540
	.dbline 999
	push X
	mov A,>L542
	push A
	mov A,<L542
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L541
L540:
	.dbline 1000
; }
	cmp [X+1],3
	jnz L543
	.dbline 1000
	push X
	mov A,>L545
	push A
	mov A,<L545
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L543:
L541:
L538:
	.dbline 1001
; }
	xcall _bucle_temp
	.dbline 1002
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1003
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L546
	.dbline 1003
	xcall _Pitido
L546:
	.dbline 1004
; }
	cmp [X+0],1
	jnz L548
	.dbline 1005
; }
	.dbline 1006
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L550
X22:
	.dbline 1006
	mov [X+1],1
	xjmp L549
L550:
	.dbline 1007
; }
	inc [X+1]
	.dbline 1008
; }
	xjmp L549
L548:
	.dbline 1009
; }
	cmp [X+0],3
	jnz L552
	.dbline 1010
; }
	.dbline 1011
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	xjmp L532
L552:
	.dbline 1013
; }
; }
	cmp [X+0],2
	jnz L554
	.dbline 1014
; }
	.dbline 1015
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L556
X23:
	.dbline 1015
	mov [X+1],3
	xjmp L557
L556:
	.dbline 1016
; }
	dec [X+1]
L557:
	.dbline 1017
; }
L554:
L549:
	.dbline 1018
L534:
	.dbline 1018
; }
	cmp [X+0],5
	jnz L533
	.dbline -2
	.dbline 1019
; }
L532:
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
L559:
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
	mov A,>L562
	push A
	mov A,<L562
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1037
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 1038
; }
	mov A,>L563
	push A
	mov A,<L563
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1039
; }
	xcall _bucle_temp
	.dbline 1040
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1041
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L564
	.dbline 1041
	xcall _Pitido
	xjmp L565
L564:
	.dbline 1042
; }
	cmp [X+0],3
	jnz L566
	.dbline 1043
; }
	.dbline 1044
; }
	cmp [X+1],1
	jnz L568
	.dbline 1044
	xcall _Ara
L568:
	.dbline 1045
; }
L566:
L565:
	.dbline 1046
L560:
	.dbline 1046
; }
	cmp [X+0],4
	jnz L559
	.dbline -2
	.dbline 1047
; }
L558:
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
	.dbline 1062
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
	.dbline 1063
; }
	xcall _Reset_PdT
	.dbline 1064
; }
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	push A
	xcall _envia
	.dbline 1065
; }
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	push A
	xcall _envia
	add SP,-2
	.dbline 1066
; }
	mov REG[0xd0],>_Ent1
	mov A,[_Ent1]
	push A
	xcall _envia
	.dbline 1067
; }
	mov REG[0xd0],>_Ent2
	mov A,[_Ent2]
	push A
	xcall _envia
	add SP,-2
	.dbline 1068
; }
	mov REG[0xd0],>_Ent3
	mov A,[_Ent3]
	push A
	xcall _envia
	.dbline 1069
; }
	mov REG[0xd0],>_Ent4
	mov A,[_Ent4]
	push A
	xcall _envia
	add SP,-2
	.dbline 1070
; }
	mov REG[0xd0],>_Fla1
	mov A,[_Fla1]
	push A
	xcall _envia
	.dbline 1071
; }
	mov REG[0xd0],>_Fla2
	mov A,[_Fla2]
	push A
	xcall _envia
	add SP,-2
	.dbline 1072
; }
	mov REG[0xd0],>_Fla3
	mov A,[_Fla3]
	push A
	xcall _envia
	.dbline 1073
; }
	mov REG[0xd0],>_Fla4
	mov A,[_Fla4]
	push A
	xcall _envia
	add SP,-2
	.dbline 1075
; }
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L571
	.dbline 1076
; }
	mov REG[0xd0],>_Int1_Tdisp
	mov A,[_Int1_Tdisp]
	push A
	xcall _envia
	add SP,-1
L571:
	.dbline 1077
; }
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov A,[_Int1_Tdisp_Uni]
	push A
	xcall _envia
	.dbline 1078
; }
	mov REG[0xd0],>_Int1_Ndisp
	mov A,[_Int1_Ndisp]
	push A
	xcall _envia
	add SP,-2
	.dbline 1080
; }
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L573
	.dbline 1081
; }
	mov REG[0xd0],>_Int2_Tdisp
	mov A,[_Int2_Tdisp]
	push A
	xcall _envia
	add SP,-1
L573:
	.dbline 1082
; }
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov A,[_Int2_Tdisp_Uni]
	push A
	xcall _envia
	.dbline 1083
; }
	mov REG[0xd0],>_Int2_Ndisp
	mov A,[_Int2_Ndisp]
	push A
	xcall _envia
	add SP,-2
	.dbline 1085
; }
; }
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L575
	.dbline 1086
; }
	mov REG[0xd0],>_TL1_Treal
	mov A,[_TL1_Treal]
	push A
	xcall _envia
	add SP,-1
L575:
	.dbline 1087
; }
	mov REG[0xd0],>_TL1_Treal_Uni
	mov A,[_TL1_Treal_Uni]
	push A
	xcall _envia
	add SP,-1
	.dbline 1088
; }
	mov REG[0xd0],>_TL1_Tfilm
	mov A,[_TL1_Tfilm]
	push A
	xcall _envia
	.dbline 1089
; }
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov A,[_TL1_Tfilm_Uni]
	push A
	xcall _envia
	add SP,-2
	.dbline 1091
; }
; }
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L577
	.dbline 1092
; }
	mov REG[0xd0],>_TL2_Treal
	mov A,[_TL2_Treal]
	push A
	xcall _envia
	add SP,-1
L577:
	.dbline 1093
	mov REG[0xd0],>_TL2_Treal_Uni
	mov A,[_TL2_Treal_Uni]
	push A
	xcall _envia
	add SP,-1
	.dbline 1094
	mov REG[0xd0],>_TL2_Tfilm
	mov A,[_TL2_Tfilm]
	push A
	xcall _envia
	.dbline 1095
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov A,[_TL2_Tfilm_Uni]
	push A
	xcall _envia
	add SP,-2
	.dbline 1097
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L579
	.dbline 1097
	xcall _Pitido
L579:
	.dbline -2
	.dbline 1098
; }
; }
; }
; }
; }
; }
L570:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Ara _Ara fV
_Ara::
	.dbline -1
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
; }
; }
; }
; }
	.dbline 1112
; }
	xcall _envio_valores
	.dbline 1113
; }
	xcall _Trabajando
	.dbline -2
	.dbline 1114
; }
L581:
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
	.dbline 1124
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
	.dbline 1128
; }
; }
; }
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1129
; }
	mov A,>L583
	push A
	mov A,<L583
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1130
	mov [X+1],0
	mov [X+0],0
	xjmp L587
L584:
	.dbline 1130
L585:
	.dbline 1130
	inc [X+1]
	adc [X+0],0
L587:
	.dbline 1130
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
	jc L584
X25:
	.dbline 1132
; }
; }
L588:
	.dbline 1133
; }
	.dbline 1134
; }
	push X
	mov A,8
	xcall _LCD_Control
	.dbline 1135
; }
	mov A,1
	xcall _LCD_Control
	pop X
	.dbline 1137
; }
; }
	xcall _Pulsador
	mov [X+2],A
	.dbline 1138
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L592
	.dbline 1138
	xcall _Pitido
L592:
	.dbline 1139
; }
	cmp [X+2],1
	jz L597
	cmp [X+2],2
	jz L597
	cmp [X+2],4
	jnz L594
L597:
	.dbline 1140
; }
	.dbline 1141
; }
	push X
	mov A,14
	xcall _LCD_Control
	.dbline 1142
; }
	mov A,>L598
	push A
	mov A,<L598
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1143
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	.dbline 1144
; }
	mov A,>L599
	push A
	mov A,<L599
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1145
	mov [X+1],0
	mov [X+0],0
	xjmp L603
L600:
	.dbline 1145
L601:
	.dbline 1145
	inc [X+1]
	adc [X+0],0
L603:
	.dbline 1145
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
	jc L600
X26:
	.dbline 1146
; }
	xjmp L588
L594:
	.dbline 1147
; }
	cmp [X+2],3
	jnz L588
	.dbline 1148
; }
	.dbline 1149
; }
	push X
	mov A,14
	xcall _LCD_Control
	.dbline 1150
; }
	mov A,>L606
	push A
	mov A,<L606
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 1151
	mov [X+1],0
	mov [X+0],0
	xjmp L610
L607:
	.dbline 1151
L608:
	.dbline 1151
	inc [X+1]
	adc [X+0],0
L610:
	.dbline 1151
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
	jc L607
X27:
	.dbline 1152
	xcall _Resetear
	.dbline 1153
	.dbline 1154
	.dbline 1132
	.dbline 1132
	xjmp L588
X24:
	.dbline -2
L582:
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
	.dbline 1164
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
	.dbline 1165
; }
	xcall _Reset_PdT
	.dbline 1166
; }
	xcall _Principal
	.dbline -2
	.dbline 1167
; }
L611:
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
	.dbline 1177
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
	.dbline 1178
; }
	mov [X+1],1
L613:
	.dbline 1182
; }
; }
; }
; }
	.dbline 1183
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1184
; }
	mov A,>L616
	push A
	mov A,<L616
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1185
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1186
; }
	cmp [X+1],1
	jnz L617
	.dbline 1186
	push X
	mov A,>L619
	push A
	mov A,<L619
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L618
L617:
	.dbline 1187
; }
	cmp [X+1],2
	jnz L620
	.dbline 1187
	push X
	mov A,>L622
	push A
	mov A,<L622
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L621
L620:
	.dbline 1188
; }
	cmp [X+1],3
	jnz L623
	.dbline 1188
	push X
	mov A,>L625
	push A
	mov A,<L625
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L623:
L621:
L618:
	.dbline 1189
; }
	xcall _bucle_temp
	.dbline 1190
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1191
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L626
	.dbline 1191
	xcall _Pitido
L626:
	.dbline 1192
; }
	cmp [X+0],1
	jnz L628
	.dbline 1193
; }
	.dbline 1194
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	add A,1
	mov [__r0],A
	mov A,3
	cmp A,[__r0]
	jnc L630
X28:
	.dbline 1194
	mov [X+1],1
	xjmp L629
L630:
	.dbline 1195
; }
	inc [X+1]
	.dbline 1196
; }
	xjmp L629
L628:
	.dbline 1197
; }
	cmp [X+0],3
	jnz L632
	.dbline 1198
; }
	.dbline 1199
; }
	cmp [X+1],1
	jnz L634
	.dbline 1199
	xcall _Reali_LCD
	xjmp L633
L634:
	.dbline 1200
; }
	cmp [X+1],2
	jnz L636
	.dbline 1200
	xcall _Zumbador
	xjmp L633
L636:
	.dbline 1201
; }
	cmp [X+1],3
	jnz L633
	.dbline 1201
	xcall _Ali_Led
	.dbline 1202
; }
	xjmp L633
L632:
	.dbline 1203
; }
	cmp [X+0],2
	jnz L640
	.dbline 1204
; }
	.dbline 1205
; }
	mov REG[0xd0],>__r0
	mov A,[X+1]
	sub A,1
	cmp A,1
	jnc L642
X29:
	.dbline 1205
	mov [X+1],3
	xjmp L643
L642:
	.dbline 1206
; }
	dec [X+1]
L643:
	.dbline 1207
; }
L640:
L633:
L629:
	.dbline 1208
L614:
	.dbline 1208
; }
	cmp [X+0],4
	jnz L613
	.dbline -2
	.dbline 1209
; }
L612:
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
	.dbline 1218
; }
; }
; }
; }
; }
; }
; }
; }
; }
L645:
	.dbline 1223
; }
; }
; }
; }
; }
	.dbline 1224
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1225
; }
	mov A,>L648
	push A
	mov A,<L648
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1226
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1227
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L649
	.dbline 1227
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L650
L649:
	.dbline 1228
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L650:
	.dbline 1229
; }
	xcall _bucle_temp
	.dbline 1230
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1231
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L651
	.dbline 1231
	xcall _Pitido
L651:
	.dbline 1232
; }
	cmp [X+0],1
	jz L655
	cmp [X+0],2
	jnz L653
L655:
	.dbline 1233
; }
	.dbline 1234
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1235
; }
	xjmp L654
L653:
	.dbline 1236
; }
	cmp [X+0],3
	jnz L656
	.dbline 1237
; }
	.dbline 1238
; }
	mov REG[0xd0],>_Luz_LCD
	cmp [_Luz_LCD],0
	jnz L658
	.dbline 1239
; }
	.dbline 1240
; }
	or REG[ 0],2
	.dbline 1241
; }
	mov [_Luz_LCD],1
	.dbline 1242
; }
	xjmp L659
L658:
	.dbline 1244
; }
; }
	.dbline 1245
; }
	and REG[ 0],-3
	.dbline 1246
; }
	mov REG[0xd0],>_Luz_LCD
	mov [_Luz_LCD],0
	.dbline 1247
; }
L659:
	.dbline 1248
; }
L656:
L654:
	.dbline 1249
L646:
	.dbline 1249
; }
	cmp [X+0],4
	jnz L645
	.dbline -2
	.dbline 1250
; }
L644:
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
	.dbline 1259
; }
; }
; }
; }
; }
; }
; }
; }
; }
L661:
	.dbline 1264
; }
; }
; }
; }
; }
	.dbline 1265
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1266
; }
	mov A,>L664
	push A
	mov A,<L664
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1267
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1268
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L665
	.dbline 1268
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L666
L665:
	.dbline 1269
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L666:
	.dbline 1270
; }
	xcall _bucle_temp
	.dbline 1271
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1272
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L667
	.dbline 1272
	xcall _Pitido
L667:
	.dbline 1273
; }
	cmp [X+0],1
	jz L671
	cmp [X+0],2
	jnz L669
L671:
	.dbline 1274
; }
	.dbline 1275
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1276
; }
	xjmp L670
L669:
	.dbline 1277
; }
	cmp [X+0],3
	jnz L672
	.dbline 1278
; }
	.dbline 1279
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],0
	jnz L674
	.dbline 1279
	mov [_Buzzer],1
	xjmp L675
L674:
	.dbline 1280
; }
	mov REG[0xd0],>_Buzzer
	mov [_Buzzer],0
L675:
	.dbline 1281
; }
L672:
L670:
	.dbline 1282
L662:
	.dbline 1282
; }
	cmp [X+0],4
	jnz L661
	.dbline -2
	.dbline 1283
; }
L660:
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
	.dbline 1292
; }
; }
; }
; }
; }
; }
; }
; }
; }
L677:
	.dbline 1297
; }
; }
; }
; }
; }
	.dbline 1298
; }
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 1299
; }
	mov A,>L680
	push A
	mov A,<L680
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 1300
; }
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 1301
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L681
	.dbline 1301
	push X
	mov A,>L151
	push A
	mov A,<L151
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	xjmp L682
L681:
	.dbline 1302
; }
	push X
	mov A,>L152
	push A
	mov A,<L152
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
L682:
	.dbline 1303
; }
	xcall _bucle_temp
	.dbline 1304
; }
	xcall _Pulsador
	mov [X+0],A
	.dbline 1305
; }
	mov REG[0xd0],>_Buzzer
	cmp [_Buzzer],1
	jnz L683
	.dbline 1305
	xcall _Pitido
L683:
	.dbline 1306
; }
	cmp [X+0],1
	jz L687
	cmp [X+0],2
	jnz L685
L687:
	.dbline 1307
; }
	.dbline 1308
; }
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov REG[ 0],A
	.dbline 1309
; }
	xjmp L686
L685:
	.dbline 1310
; }
	cmp [X+0],3
	jnz L688
	.dbline 1311
; }
	.dbline 1312
; }
	mov REG[0xd0],>_Alimentacion
	cmp [_Alimentacion],0
	jnz L690
	.dbline 1313
; }
	.dbline 1314
; }
	or REG[ 0],16
	.dbline 1315
; }
	mov [_Alimentacion],1
	.dbline 1316
; }
	xjmp L691
L690:
	.dbline 1318
; }
; }
	.dbline 1319
; }
	and REG[ 0],-17
	.dbline 1320
; }
	mov REG[0xd0],>_Alimentacion
	mov [_Alimentacion],0
	.dbline 1321
; }
L691:
	.dbline 1322
; }
L688:
L686:
	.dbline 1323
L678:
	.dbline 1323
; }
	cmp [X+0],4
	jnz L677
	.dbline -2
	.dbline 1324
; }
L676:
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
L693:
	.dbline 18
	xcall _Principal
	.dbline 18
	.dbline 18
	xjmp L693
X30:
	.dbline -2
L692:
	.dbline 0 ; func end
	jmp .
	.dbend
	.area lit(rom, con, rel)
L680:
	.byte 62,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L664:
	.byte 62,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o,0
L648:
	.byte 62,'L,'u,'z,32,'L,'C,'D,0
L625:
	.byte 51,45,'L,'e,'d,32,'d,'e,32,'m,'a,'r,'c,'h,'a,0
L622:
	.byte 50,45,'P,'i,'t,'i,'d,'o,32,'i,'n,'t,'e,'r,'n,'o
	.byte 0
L619:
	.byte 49,45,'L,'u,'z,32,'L,'C,'D,0
L616:
	.byte 62,'C,'o,'n,'f,46,32,'S,'i,'s,'t,'e,'m,'a,0
L606:
	.byte 'T,'r,'a,'b,'a,'j,'o,32,'p,'a,'r,'a,'d,'o,0
L599:
	.byte 'M,'a,'n,'t,'e,'n,'e,'r,32,'A,'m,'a,'r,'i,'l,'l
	.byte 'o,0
L598:
	.byte 'Q,'u,'i,'e,'r,'e,32,'p,'a,'r,'a,'r,'l,'o,63,0
L583:
	.byte 'P,'h,'o,'t,'o,'S,'O,'C,32,'a,'c,'t,'i,'v,'o,0
L563:
	.byte 49,45,'A,'h,'o,'r,'a,0
L562:
	.byte 62,'E,'j,'e,'c,'u,'t,'a,'r,0
L545:
	.byte 'H,'o,'r,'a,'s,0
L542:
	.byte 'M,'i,'n,'u,'t,'o,'s,0
L539:
	.byte 'S,'e,'g,'u,'n,'d,'o,'s,0
L536:
	.byte 62,'U,'n,'i,46,32,'d,'e,32,'t,'i,'e,'m,'p,'o,0
L515:
	.byte 62,'N,'u,'m,'e,'r,'o,32,49,45,49,48,48,0
L486:
	.byte 'T,'i,'e,'m,'p,'o,32,'v,'i,'d,'e,'o,0
L483:
	.byte 'T,'i,'e,'m,'p,'o,32,'r,'e,'a,'l,0
L480:
	.byte 62,'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L447:
	.byte 'N,'u,'m,'e,'r,'o,32,'d,'e,32,'f,'o,'t,'o,'s,0
L444:
	.byte 'T,32,'e,'n,'t,'r,'e,32,'f,'o,'t,'o,0
L441:
	.byte 62,'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L401:
	.byte 62,'T,'i,'p,'o,32,'d,'e,32,'d,'i,'s,'p,46,0
L377:
	.byte 62,'C,'a,'m,'a,'r,'a,32,50,0
L365:
	.byte 'T,'i,'m,'e,32,'L,'a,'p,'s,'e,0
L362:
	.byte 'I,'n,'t,'e,'r,'v,'a,'l,'o,'m,'e,'t,'r,'o,0
L359:
	.byte 'D,'i,'s,'p,46,32,'U,'n,'i,'c,'o,0
L356:
	.byte 'N,'o,32,'d,'i,'s,'p,'a,'r,'a,0
L353:
	.byte 62,'C,'a,'m,'a,'r,'a,32,49,0
L332:
	.byte 50,45,'C,'a,'m,'a,'r,'a,32,50,0
L329:
	.byte 49,45,'C,'a,'m,'a,'r,'a,32,49,0
L326:
	.byte 62,'C,'o,'n,'f,46,32,'D,'i,'s,'p,'a,'r,'o,0
L310:
	.byte 62,'F,'l,'a,'s,'h,32,52,0
L294:
	.byte 62,'F,'l,'a,'s,'h,32,51,0
L278:
	.byte 62,'F,'l,'a,'s,'h,32,50,0
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
