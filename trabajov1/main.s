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
; //              Programa principal del PSoC de trabajo			  //
; //----------------------------------------------------------------//
; 
; #include <m8c.h>        		// part specific constants and macros
; #include "PSoCAPI.h"   	 		// PSoC API definitions for all User Modules
; #include "stdlib.h"
; #include "trabajo.h"			// Libreria creada para el PSoc de trabajo por Albert y Xavi para el proyecto
; 
; #pragma interrupt_handler MI_RSI_EXTERNA
; #pragma interrupt_handler MI_RSI_DEL_TIMER
; 
; void MI_RSI_EXTERNA(void)		//Interrupción externa
; {
; 	disparo_sensores();
	.dbline 22
; }
; 
; void MI_RSI_DEL_TIMER (void)	//Interrupción del timer Segundos
	mov [X+0],0
	.dbline 23
; {
	mov [X+1],0
	xjmp L3
L2:
	.dbline 26
; 	contador_trabajo1++;
; 	if (contador_trabajo1==tpCam1) chivato1=on;
; 	contador_trabajo2++;
	.dbline 27
; 	if (contador_trabajo2==tpCam2) chivato2=on;
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
; 
; 
	mov A,[X+2]
	cmp A,[X-4]
	jnz L5
	.dbline 30
	mov [X+0],79
L5:
	.dbline 31
; void main()						//Programa principal
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	pop X
	.dbline 32
; {	
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 33
; 	inicializacion ();
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
; 	recibe_valores();
; 	activar_sensores();	
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
; 	ejecucion();
; 	envia_fintrabajo();
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
	.dbfile ./trabajo.h
	.dbsym e Cam1 _Cam1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Cam2::
	.byte 0
	.dbsym e Cam2 _Cam2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Ent1::
	.byte 0
	.dbsym e Ent1 _Ent1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Ent2::
	.byte 0
	.dbsym e Ent2 _Ent2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Ent3::
	.byte 0
	.dbsym e Ent3 _Ent3 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Ent4::
	.byte 0
	.dbsym e Ent4 _Ent4 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Fla1::
	.byte 0
	.dbsym e Fla1 _Fla1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Fla2::
	.byte 0
	.dbsym e Fla2 _Fla2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Fla3::
	.byte 0
	.dbsym e Fla3 _Fla3 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Fla4::
	.byte 0
	.dbsym e Fla4 _Fla4 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Int1_Tdisp::
	.byte 0
	.dbsym e Int1_Tdisp _Int1_Tdisp c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Int1_Tdisp_Uni::
	.byte 0
	.dbsym e Int1_Tdisp_Uni _Int1_Tdisp_Uni c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Int1_Ndisp::
	.byte 0
	.dbsym e Int1_Ndisp _Int1_Ndisp c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Int2_Tdisp::
	.byte 0
	.dbsym e Int2_Tdisp _Int2_Tdisp c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Int2_Tdisp_Uni::
	.byte 0
	.dbsym e Int2_Tdisp_Uni _Int2_Tdisp_Uni c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Int2_Ndisp::
	.byte 0
	.dbsym e Int2_Ndisp _Int2_Ndisp c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_TL1_Treal::
	.byte 0
	.dbsym e TL1_Treal _TL1_Treal c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_TL1_Treal_Uni::
	.byte 0
	.dbsym e TL1_Treal_Uni _TL1_Treal_Uni c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_TL1_Tfilm::
	.byte 0
	.dbsym e TL1_Tfilm _TL1_Tfilm c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_TL1_Tfilm_Uni::
	.byte 0
	.dbsym e TL1_Tfilm_Uni _TL1_Tfilm_Uni c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_TL2_Treal::
	.byte 0
	.dbsym e TL2_Treal _TL2_Treal c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_TL2_Treal_Uni::
	.byte 0
	.dbsym e TL2_Treal_Uni _TL2_Treal_Uni c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_TL2_Tfilm::
	.byte 0
	.dbsym e TL2_Tfilm _TL2_Tfilm c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_TL2_Tfilm_Uni::
	.byte 0
	.dbsym e TL2_Tfilm_Uni _TL2_Tfilm_Uni c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_tocacam1::
	.byte 0
	.dbsym e tocacam1 _tocacam1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_tocacam2::
	.byte 0
	.dbsym e tocacam2 _tocacam2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_dspCam1::
	.word 0
	.dbsym e dspCam1 _dspCam1 i
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_dspCam2::
	.word 0
	.dbsym e dspCam2 _dspCam2 i
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_tpCam1::
	.word 0,0
	.dbsym e tpCam1 _tpCam1 l
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_tpCam2::
	.word 0,0
	.dbsym e tpCam2 _tpCam2 l
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_fintrabajo::
	.byte 0
	.dbsym e fintrabajo _fintrabajo c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_contador_trabajo1::
	.word 0,0
	.dbsym e contador_trabajo1 _contador_trabajo1 l
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_contador_trabajo2::
	.word 0,0
	.dbsym e contador_trabajo2 _contador_trabajo2 l
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_chivato1::
	.byte 0
	.dbsym e chivato1 _chivato1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_chivato2::
	.byte 0
	.dbsym e chivato2 _chivato2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_contadordspCam1::
	.word 0
	.dbsym e contadordspCam1 _contadordspCam1 i
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_contadordspCam2::
	.word 0
	.dbsym e contadordspCam2 _contadordspCam2 i
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area text(rom, con, rel)
	.dbfile ./trabajo.h
	.dbfunc e inicializacion _inicializacion fV
_inicializacion::
	.dbline -1
	.dbline 63
	.dbline 65
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 66
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 67
	xcall _Timer8_Start
	.dbline 70
; }		
; }		
; }		
	mov A,0
	xcall _UART_Start
	.dbline 73
; }		
; }		
; }		
	mov X,39
	mov A,16
	xcall _Segundos_WritePeriod
	.dbline 74
; }		
	mov A,0
	mov X,A
	xcall _Segundos_WriteCompareValue
	.dbline 75
; }		
	xcall _Segundos_Start
	pop X
	.dbline -2
	.dbline 76
; }		
L17:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e recibe_valores _recibe_valores fV
_recibe_valores::
	.dbline -1
	.dbline 91
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
	.dbline 92
; }		
	xcall _recibe
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	.dbline 93
; }		
	xcall _recibe
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 94
; }		
	xcall _recibe
	mov REG[0xd0],>_Ent1
	mov [_Ent1],A
	.dbline 95
; }		
	xcall _recibe
	mov REG[0xd0],>_Ent2
	mov [_Ent2],A
	.dbline 96
; }		
	xcall _recibe
	mov REG[0xd0],>_Ent3
	mov [_Ent3],A
	.dbline 97
; }		
	xcall _recibe
	mov REG[0xd0],>_Ent4
	mov [_Ent4],A
	.dbline 98
; }		
	xcall _recibe
	mov REG[0xd0],>_Fla1
	mov [_Fla1],A
	.dbline 99
; }		
	xcall _recibe
	mov REG[0xd0],>_Fla2
	mov [_Fla2],A
	.dbline 100
; }		
	xcall _recibe
	mov REG[0xd0],>_Fla3
	mov [_Fla3],A
	.dbline 101
; }		
	xcall _recibe
	mov REG[0xd0],>_Fla4
	mov [_Fla4],A
	.dbline 103
; }		
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L19
	.dbline 104
; }		
	xcall _recibe
	mov REG[0xd0],>_Int1_Tdisp
	mov [_Int1_Tdisp],A
L19:
	.dbline 105
; }		
	xcall _recibe
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov [_Int1_Tdisp_Uni],A
	.dbline 106
; }		
	xcall _recibe
	mov REG[0xd0],>_Int1_Ndisp
	mov [_Int1_Ndisp],A
	.dbline 108
; }		
; }		
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L21
	.dbline 109
; }		
	xcall _recibe
	mov REG[0xd0],>_Int2_Tdisp
	mov [_Int2_Tdisp],A
L21:
	.dbline 110
; }		
	xcall _recibe
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov [_Int2_Tdisp_Uni],A
	.dbline 111
; }		
	xcall _recibe
	mov REG[0xd0],>_Int2_Ndisp
	mov [_Int2_Ndisp],A
	.dbline 113
; }		
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L23
	.dbline 114
; }		
	xcall _recibe
	mov REG[0xd0],>_TL1_Treal
	mov [_TL1_Treal],A
L23:
	.dbline 115
; }		
	xcall _recibe
	mov REG[0xd0],>_TL1_Treal_Uni
	mov [_TL1_Treal_Uni],A
	.dbline 116
; }		
	xcall _recibe
	mov REG[0xd0],>_TL1_Tfilm
	mov [_TL1_Tfilm],A
	.dbline 117
; }		
	xcall _recibe
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov [_TL1_Tfilm_Uni],A
	.dbline 119
; }		
; }		
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L25
	.dbline 120
; }		
	xcall _recibe
	mov REG[0xd0],>_TL2_Treal
	mov [_TL2_Treal],A
L25:
	.dbline 121
; }		
	xcall _recibe
	mov REG[0xd0],>_TL2_Treal_Uni
	mov [_TL2_Treal_Uni],A
	.dbline 122
; }		
	xcall _recibe
	mov REG[0xd0],>_TL2_Tfilm
	mov [_TL2_Tfilm],A
	.dbline 123
; }		
	xcall _recibe
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov [_TL2_Tfilm_Uni],A
	.dbline -2
	.dbline 126
; }		
; }		
; }		
L18:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e activar_sensores _activar_sensores fV
_activar_sensores::
	.dbline -1
	.dbline 141
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
	.dbline 142
; }		
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],1
	jz L32
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],1
	jz L32
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],1
	jz L32
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],1
	jnz L28
L32:
	.dbline 143
	.dbline 144
		or  F, 01h

	.dbline 145
	or REG[0xe0],32
	.dbline 146
L28:
	.dbline -2
	.dbline 147
; }		
; }		
; }		
; }		
; }		
L27:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e disparo_sensores _disparo_sensores fV
; disparo_sensores_sensores -> X+0
_disparo_sensores::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 162
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
	.dbline 167
; }		
; }		
; }		
; }		
; }		
	mov A,REG[ 0]
	and A,-86
	mov [X+0],A
	.dbline 170
; }		
; }		
; }		
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L34
	.dbline 170
	and [X+0],127
L34:
	.dbline 171
; }		
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L36
	.dbline 171
	and [X+0],-33
L36:
	.dbline 172
; }		
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L38
	.dbline 172
	and [X+0],-9
L38:
	.dbline 173
; }		
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L40
	.dbline 173
	and [X+0],-3
L40:
	.dbline 176
	cmp [X+0],0
	jz L42
	.dbline 177
	xcall _bucle
L42:
	.dbline -2
	.dbline 178
; }		
; }		
; }		
; }		
; }		
L33:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l disparo_sensores_sensores 0 c
	.dbend
	.dbfunc e ejecucion _ejecucion fV
_ejecucion::
	.dbline -1
	.dbline 193
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
	.dbline 194
; }		
	xcall _preparadisparo
L45:
	.dbline 196
; }		
; }		
	.dbline 197
; }		
	xcall _bucle
	.dbline 198
; }		
L46:
	.dbline 199
; }		
	mov REG[0xd0],>_fintrabajo
	cmp [_fintrabajo],-1
	jnz L45
	.dbline 200
; }		
	xcall _envia_fintrabajo
	.dbline -2
	.dbline 201
; }		
L44:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e preparadisparo _preparadisparo fV
; preparadisparo_tp_clip -> X+4
; preparadisparo_tp_real -> X+0
_preparadisparo::
	.dbline -1
	push X
	mov X,SP
	add SP,12
	.dbline 216
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
	.dbline 221
; }		
; }		
; }		
; }		
; }		
	mov REG[0xd0],>_tocacam1
	mov [_tocacam1],1
	.dbline 222
; }		
	mov REG[0xd0],>_tocacam2
	mov [_tocacam2],1
	.dbline 223
; }		
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	mov [X+9],A
	mov [X+8],0
	cmp [X+8],0
	jnz X2
	cmp [X+9],2
	jz L52
X2:
	cmp [X+8],0
	jnz X3
	cmp [X+9],3
	jz L53
X3:
	xjmp L49
X0:
	.dbline 224
; }		
L52:
	.dbline 226
; }		
; }		
	mov REG[0xd0],>_Int1_Ndisp
	mov A,[_Int1_Ndisp]
	push A
	mov REG[0xd0],>_dspCam1
	mov [_dspCam1],0
	pop A
	mov [_dspCam1+1],A
	.dbline 227
; }		
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov A,[_Int1_Tdisp_Uni]
	push A
	mov REG[0xd0],>_Int1_Tdisp
	mov A,[_Int1_Tdisp]
	push A
	xcall _calculosegundos
	add SP,-2
	mov REG[0xd0],>__r0
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	mov REG[0xd0],>_tpCam1
	mov [_tpCam1+3],A
	pop A
	mov [_tpCam1+2],A
	pop A
	mov [_tpCam1+1],A
	pop A
	mov [_tpCam1],A
	.dbline 228
; }		
	xjmp L50
L53:
	.dbline 230
; }		
; }		
	mov REG[0xd0],>_TL1_Treal_Uni
	mov A,[_TL1_Treal_Uni]
	push A
	mov REG[0xd0],>_TL1_Treal
	mov A,[_TL1_Treal]
	push A
	xcall _calculosegundos
	mov REG[0xd0],>__r0
	mov A,[__r0]
	mov [X+0],A
	mov A,[__r1]
	mov [X+1],A
	mov A,[__r2]
	mov [X+2],A
	mov A,[__r3]
	mov [X+3],A
	.dbline 231
; }		
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov A,[_TL1_Tfilm_Uni]
	push A
	mov REG[0xd0],>_TL1_Tfilm
	mov A,[_TL1_Tfilm]
	push A
	xcall _calculosegundos
	add SP,-4
	mov REG[0xd0],>__r0
	mov A,[__r0]
	mov [X+4],A
	mov A,[__r1]
	mov [X+5],A
	mov A,[__r2]
	mov [X+6],A
	mov A,[__r3]
	mov [X+7],A
	.dbline 232
; }		
	mov A,[X+4]
	push A
	mov A,[X+5]
	push A
	mov A,[X+6]
	push A
	mov A,[X+7]
	push A
	mov A,0
	push A
	push A
	push A
	mov A,25
	push A
	xcall __mul_32X32_32
	add SP,-4
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	pop A
	mov A,[__r3]
	mov [__r1],A
	mov A,[__r2]
	mov [__r0],A
	mov A,[__r1]
	push A
	mov A,[__r0]
	mov REG[0xd0],>_dspCam1
	mov [_dspCam1],A
	pop A
	mov [_dspCam1+1],A
	.dbline 233
; }		
	mov A,[_dspCam1+1]
	mov REG[0xd0],>__r0
	mov [__r3],A
	mov REG[0xd0],>_dspCam1
	mov A,[_dspCam1]
	mov REG[0xd0],>__r0
	mov [__r2],A
	mov A,0
	push A
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov A,[X+2]
	push A
	mov A,[X+3]
	push A
	xcall __divmodu_32X32_32
	pop A
	mov REG[0xd0],>_tpCam1
	mov [_tpCam1+3],A
	pop A
	mov [_tpCam1+2],A
	pop A
	mov [_tpCam1+1],A
	pop A
	mov [_tpCam1],A
	add SP,-4
	.dbline 234
; }		
L49:
L50:
	.dbline 236
; }		
; }		
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	mov [X+11],A
	mov [X+10],0
	cmp [X+10],0
	jnz X4
	cmp [X+11],2
	jz L57
X4:
	cmp [X+10],0
	jnz X5
	cmp [X+11],3
	jz L58
X5:
	xjmp L54
X1:
	.dbline 237
; }		
L57:
	.dbline 239
; }		
; }		
	mov REG[0xd0],>_Int2_Ndisp
	mov A,[_Int2_Ndisp]
	push A
	mov REG[0xd0],>_dspCam2
	mov [_dspCam2],0
	pop A
	mov [_dspCam2+1],A
	.dbline 240
; }		
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov A,[_Int2_Tdisp_Uni]
	push A
	mov REG[0xd0],>_Int2_Tdisp
	mov A,[_Int2_Tdisp]
	push A
	xcall _calculosegundos
	add SP,-2
	mov REG[0xd0],>__r0
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	mov REG[0xd0],>_tpCam2
	mov [_tpCam2+3],A
	pop A
	mov [_tpCam2+2],A
	pop A
	mov [_tpCam2+1],A
	pop A
	mov [_tpCam2],A
	.dbline 241
; }		
	xjmp L55
L58:
	.dbline 243
; }		
; }		
	mov REG[0xd0],>_TL2_Treal_Uni
	mov A,[_TL2_Treal_Uni]
	push A
	mov REG[0xd0],>_TL2_Treal
	mov A,[_TL2_Treal]
	push A
	xcall _calculosegundos
	mov REG[0xd0],>__r0
	mov A,[__r0]
	mov [X+0],A
	mov A,[__r1]
	mov [X+1],A
	mov A,[__r2]
	mov [X+2],A
	mov A,[__r3]
	mov [X+3],A
	.dbline 244
; }		
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov A,[_TL2_Tfilm_Uni]
	push A
	mov REG[0xd0],>_TL2_Tfilm
	mov A,[_TL2_Tfilm]
	push A
	xcall _calculosegundos
	add SP,-4
	mov REG[0xd0],>__r0
	mov A,[__r0]
	mov [X+4],A
	mov A,[__r1]
	mov [X+5],A
	mov A,[__r2]
	mov [X+6],A
	mov A,[__r3]
	mov [X+7],A
	.dbline 245
; }		
	mov A,[X+4]
	push A
	mov A,[X+5]
	push A
	mov A,[X+6]
	push A
	mov A,[X+7]
	push A
	mov A,0
	push A
	push A
	push A
	mov A,25
	push A
	xcall __mul_32X32_32
	add SP,-4
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	pop A
	mov A,[__r3]
	mov [__r1],A
	mov A,[__r2]
	mov [__r0],A
	mov A,[__r1]
	push A
	mov A,[__r0]
	mov REG[0xd0],>_dspCam2
	mov [_dspCam2],A
	pop A
	mov [_dspCam2+1],A
	.dbline 246
; }		
	mov A,[_dspCam2+1]
	mov REG[0xd0],>__r0
	mov [__r3],A
	mov REG[0xd0],>_dspCam2
	mov A,[_dspCam2]
	mov REG[0xd0],>__r0
	mov [__r2],A
	mov A,0
	push A
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov A,[X+2]
	push A
	mov A,[X+3]
	push A
	xcall __divmodu_32X32_32
	pop A
	mov REG[0xd0],>_tpCam2
	mov [_tpCam2+3],A
	pop A
	mov [_tpCam2+2],A
	pop A
	mov [_tpCam2+1],A
	pop A
	mov [_tpCam2],A
	add SP,-4
	.dbline 247
; }		
L54:
L55:
	.dbline -2
	.dbline 249
; }		
; }		
L48:
	add SP,-12
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l preparadisparo_tp_clip 4 l
	.dbsym l preparadisparo_tp_real 0 l
	.dbend
	.dbfunc e calculosegundos _calculosegundos fl
;      resultado -> X+0
;       unidades -> X-5
;         numero -> X-4
_calculosegundos::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 264
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
	.dbline 266
; }		
; }		
	cmp [X-5],1
	jnz L60
	.dbline 266
	mov A,[X-4]
	mov [X+3],A
	mov [X+2],0
	mov [X+1],0
	mov [X+0],0
L60:
	.dbline 267
; }		
	cmp [X-5],2
	jnz L62
	.dbline 267
	mov REG[0xd0],>__r0
	mov A,[X-4]
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	mov A,0
	push A
	mov A,60
	push A
	xcall __mul16
	add SP,-4
	mov A,[__rX]
	mov [__r1],A
	mov A,[__rY]
	mov [__r0],A
	mov A,[__r1]
	mov [X+3],A
	mov A,[__r0]
	mov [X+2],A
	tst [X+2],-128
	jz X6
	mov [X+1],-1
	mov [X+0],-1
	jmp X7
X6:
	mov [X+1],0
	mov [X+0],0
X7:
L62:
	.dbline 268
; }		
	cmp [X-5],3
	jnz L64
	.dbline 268
	mov REG[0xd0],>__r0
	mov A,[X-4]
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	mov A,14
	push A
	mov A,16
	push A
	xcall __mul16
	add SP,-4
	mov A,[__rX]
	mov [__r1],A
	mov A,[__rY]
	mov [__r0],A
	mov A,[__r1]
	mov [X+3],A
	mov A,[__r0]
	mov [X+2],A
	tst [X+2],-128
	jz X8
	mov [X+1],-1
	mov [X+0],-1
	jmp X9
X8:
	mov [X+1],0
	mov [X+0],0
X9:
L64:
	.dbline 269
; }		
	mov REG[0xd0],>__r0
	mov A,[X+0]
	mov [__r0],A
	mov A,[X+1]
	mov [__r1],A
	mov A,[X+2]
	mov [__r2],A
	mov A,[X+3]
	mov [__r3],A
	.dbline -2
L59:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l resultado 0 l
	.dbsym l unidades -5 c
	.dbsym l numero -4 c
	.dbend
	.dbfunc e bucle _bucle fV
;    fintrabajo2 -> X+3
;    fintrabajo1 -> X+2
;   bucle_acaba2 -> X+1
;   bucle_acaba1 -> X+0
_bucle::
	.dbline -1
	push X
	mov X,SP
	add SP,4
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
; }		
; }		
; }		
; }		
; }		
; }		
	.dbline 286
; }		
	mov [X+0],0
	.dbline 286
	mov [X+1],0
	.dbline 287
; }		
	mov [X+2],0
	.dbline 287
	mov [X+3],0
L67:
	.dbline 290
; }		
; }		
; }		
	.dbline 291
; }		
	xcall _disparo
	.dbline 292
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L72
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jz L70
L72:
	.dbline 293
; }		
	.dbline 294
; }		
	push X
	mov X,3
	mov A,-24
	xcall _Segundos_WritePeriod
	.dbline 295
; }		
	xcall _Segundos_Start
	.dbline 296
; }		
	xcall _Segundos_EnableInt
	pop X
	.dbline 297
; }		
		or  F, 01h

	.dbline 298
; }		
L70:
	.dbline 301
; }		
; }		
; }		
	cmp [X+0],0
	jnz L73
	.dbline 302
; }		
	.dbline 303
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L75
	.dbline 303
	mov [X+0],1
	xjmp L76
L75:
	.dbline 305
; }		
; }		
	.dbline 306
; }		
	mov REG[0xd0],>_chivato1
	cmp [_chivato1],1
	jnz L77
	.dbline 307
; }		
	.dbline 308
; }		
	mov REG[0xd0],>_tocacam1
	mov [_tocacam1],1
	.dbline 309
; }		
	mov REG[0xd0],>_contador_trabajo1
	mov [_contador_trabajo1],0
	mov [_contador_trabajo1+1],0
	mov [_contador_trabajo1+2],0
	mov [_contador_trabajo1+3],0
	.dbline 310
; }		
L77:
	.dbline 311
; }		
	mov REG[0xd0],>_contadordspCam1
	mov A,[_contadordspCam1]
	mov REG[0xd0],>_dspCam1
	cmp A,[_dspCam1]
	jnz L79
	mov REG[0xd0],>_contadordspCam1
	mov A,[_contadordspCam1+1]
	mov REG[0xd0],>_dspCam1
	cmp A,[_dspCam1+1]
	jnz L79
X10:
	.dbline 312
; }		
	.dbline 313
; }		
	mov [X+0],1
	.dbline 314
; }		
	mov [X+2],-1
	.dbline 315
; }		
L79:
	.dbline 316
; }		
L76:
	.dbline 317
; }		
L73:
	.dbline 319
; }		
; }		
	cmp [X+1],0
	jnz L81
	.dbline 320
; }		
	.dbline 321
; }		
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L83
	.dbline 321
	mov [X+1],1
	xjmp L84
L83:
	.dbline 323
; }		
; }		
	.dbline 324
; }		
	mov REG[0xd0],>_chivato2
	cmp [_chivato2],1
	jnz L85
	.dbline 325
; }		
	.dbline 326
; }		
	mov REG[0xd0],>_tocacam2
	mov [_tocacam2],1
	.dbline 327
; }		
	mov REG[0xd0],>_contador_trabajo2
	mov [_contador_trabajo2],0
	mov [_contador_trabajo2+1],0
	mov [_contador_trabajo2+2],0
	mov [_contador_trabajo2+3],0
	.dbline 328
; }		
L85:
	.dbline 329
; }		
	mov REG[0xd0],>_contadordspCam2
	mov A,[_contadordspCam2]
	mov REG[0xd0],>_dspCam2
	cmp A,[_dspCam2]
	jnz L87
	mov REG[0xd0],>_contadordspCam2
	mov A,[_contadordspCam2+1]
	mov REG[0xd0],>_dspCam2
	cmp A,[_dspCam2+1]
	jnz L87
X11:
	.dbline 330
; }		
	.dbline 331
; }		
	mov [X+1],1
	.dbline 332
; }		
	mov [X+3],-1
	.dbline 333
; }		
L87:
	.dbline 334
; }		
L84:
	.dbline 335
; }		
L81:
	.dbline 336
; }		
L68:
	.dbline 337
	cmp [X+0],0
	jz L67
	cmp [X+1],0
	jz L67
	.dbline 339
	cmp [X+2],-1
	jnz L89
	cmp [X+3],-1
	jnz L89
	.dbline 339
	mov REG[0xd0],>_fintrabajo
	mov [_fintrabajo],-1
L89:
	.dbline -2
	.dbline 340
; }		
; }		
; }		
; }		
L66:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l fintrabajo2 3 c
	.dbsym l fintrabajo1 2 c
	.dbsym l bucle_acaba2 1 c
	.dbsym l bucle_acaba1 0 c
	.dbend
	.dbfunc e disparo _disparo fV
;              x -> X+0
_disparo::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 355
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
	.dbline 358
; }		
; }		
; }		
	mov REG[0xd0],>_tocacam1
	cmp [_tocacam1],1
	jnz L92
	.dbline 359
; }		
	.dbline 360
; }		
	or REG[0x8],1
	.dbline 361
; }		
	or REG[0x8],4
	.dbline 362
; }		
	mov [_tocacam1],0
	.dbline 363
; }		
	mov REG[0xd0],>_contadordspCam1
	inc [_contadordspCam1+1]
	adc [_contadordspCam1],0
	.dbline 364
; }		
L92:
	.dbline 365
; }		
	mov REG[0xd0],>_tocacam2
	cmp [_tocacam2],1
	jnz L94
	.dbline 366
; }		
	.dbline 367
; }		
	or REG[0x8],16
	.dbline 368
; }		
	or REG[0x8],64
	.dbline 369
; }		
	mov [_tocacam2],0
	.dbline 370
; }		
	mov REG[0xd0],>_contadordspCam2
	inc [_contadordspCam2+1]
	adc [_contadordspCam2],0
	.dbline 371
; }		
L94:
	.dbline 373
; }		
; }		
	mov REG[0xd0],>_tocacam1
	cmp [_tocacam1],1
	jnz L96
	.dbline 374
; }		
	.dbline 375
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],1
	jz L100
	cmp [_Fla1],3
	jnz L98
L100:
	.dbline 375
; }		
	or REG[ 0],1
L98:
	.dbline 376
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],1
	jz L103
	cmp [_Fla2],3
	jnz L101
L103:
	.dbline 376
; }		
	or REG[ 0],4
L101:
	.dbline 377
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],1
	jz L106
	cmp [_Fla3],3
	jnz L104
L106:
	.dbline 377
; }		
	or REG[ 0],16
L104:
	.dbline 378
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],1
	jz L109
	cmp [_Fla4],3
	jnz L107
L109:
	.dbline 378
; }		
	or REG[ 0],64
L107:
	.dbline 379
; }		
L96:
	.dbline 380
; }		
	mov REG[0xd0],>_tocacam2
	cmp [_tocacam2],1
	jnz L110
	.dbline 381
; }		
	.dbline 382
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],2
	jz L114
	cmp [_Fla1],3
	jnz L112
L114:
	.dbline 382
; }		
	or REG[ 0],1
L112:
	.dbline 383
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],2
	jz L117
	cmp [_Fla2],3
	jnz L115
L117:
	.dbline 383
; }		
	or REG[ 0],4
L115:
	.dbline 384
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],2
	jz L120
	cmp [_Fla3],3
	jnz L118
L120:
	.dbline 384
; }		
	or REG[ 0],16
L118:
	.dbline 385
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],2
	jz L123
	cmp [_Fla4],3
	jnz L121
L123:
	.dbline 385
; }		
	or REG[ 0],64
L121:
	.dbline 386
; }		
L110:
	.dbline 388
	mov [X+1],0
	mov [X+0],0
L124:
	.dbline 388
L125:
	.dbline 388
; }		
; }		
	inc [X+1]
	adc [X+0],0
	.dbline 388
	mov A,[X+1]
	sub A,44
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L124
X12:
	.dbline 391
; }		
; }		
; }		
	and REG[ 0],-86
	.dbline 394
; }		
; }		
; }		
	and REG[0x8],-86
	.dbline -2
	.dbline 395
; }		
L91:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 I
	.dbend
	.dbfunc e envia_fintrabajo _envia_fintrabajo fV
_envia_fintrabajo::
	.dbline -1
	.dbline 411
	.dbline 413
	mov REG[0xd0],>_fintrabajo
	mov [_fintrabajo],-1
	mov REG[0xd0],>__r0
	mov [__r0],-1
	cmp [__r0],0
	jz L129
	.dbline 414
	.dbline 415
	mov REG[0xd0],>_fintrabajo
	mov A,[_fintrabajo]
	push A
	xcall _envia
	add SP,-1
	.dbline 416
L129:
	.dbline -2
	.dbline 417
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
; }		
; }		
; }		
; }		
L128:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfile ./main.c
	.dbfunc e MI_RSI_EXTERNA _MI_RSI_EXTERNA fV
_MI_RSI_EXTERNA::
	.dbline -1
	or F,-64
	push A
	mov A,REG[0xd0]
	push A
	mov A,REG[0xd3]
	push A
	mov A,REG[0xd4]
	push A
	mov A,REG[0xd5]
	push A
	mov REG[0xd0],>__r0
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[__r4]
	push A
	mov A,[__r5]
	push A
	mov A,[__r6]
	push A
	mov A,[__r7]
	push A
	mov A,[__r8]
	push A
	mov A,[__r9]
	push A
	mov A,[__r10]
	push A
	mov A,[__r11]
	push A
	mov A,[__rX]
	push A
	mov A,[__rY]
	push A
	mov A,[__rZ]
	push A
	.dbline 18
	.dbline 19
	xcall _disparo_sensores
	.dbline -2
	.dbline 20
L131:
	mov REG[0xD0],>__r0
	pop A
	mov [__rZ],A
	pop A
	mov [__rY],A
	pop A
	mov [__rX],A
	pop A
	mov [__r11],A
	pop A
	mov [__r10],A
	pop A
	mov [__r9],A
	pop A
	mov [__r8],A
	pop A
	mov [__r7],A
	pop A
	mov [__r6],A
	pop A
	mov [__r5],A
	pop A
	mov [__r4],A
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	mov [__r0],A
	pop A
	mov REG[213],A
	pop A
	mov REG[212],A
	pop A
	mov REG[211],A
	pop A
	mov REG[208],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e MI_RSI_DEL_TIMER _MI_RSI_DEL_TIMER fV
_MI_RSI_DEL_TIMER::
	.dbline -1
	or F,-64
	push A
	mov A,REG[0xd0]
	push A
	.dbline 23
	.dbline 24
	mov REG[0xd0],>_contador_trabajo1
	add [_contador_trabajo1+3],1
	adc [_contador_trabajo1+2],0
	adc [_contador_trabajo1+1],0
	adc [_contador_trabajo1],0
	.dbline 25
	mov A,[_contador_trabajo1]
	mov REG[0xd0],>_tpCam1
	cmp A,[_tpCam1]
	jnz L133
	mov REG[0xd0],>_contador_trabajo1
	mov A,[_contador_trabajo1+1]
	mov REG[0xd0],>_tpCam1
	cmp A,[_tpCam1+1]
	jnz L133
	mov REG[0xd0],>_contador_trabajo1
	mov A,[_contador_trabajo1+2]
	mov REG[0xd0],>_tpCam1
	cmp A,[_tpCam1+2]
	jnz L133
	mov REG[0xd0],>_contador_trabajo1
	mov A,[_contador_trabajo1+3]
	mov REG[0xd0],>_tpCam1
	cmp A,[_tpCam1+3]
	jnz L133
X13:
	.dbline 25
	mov REG[0xd0],>_chivato1
	mov [_chivato1],1
L133:
	.dbline 26
	mov REG[0xd0],>_contador_trabajo2
	add [_contador_trabajo2+3],1
	adc [_contador_trabajo2+2],0
	adc [_contador_trabajo2+1],0
	adc [_contador_trabajo2],0
	.dbline 27
	mov A,[_contador_trabajo2]
	mov REG[0xd0],>_tpCam2
	cmp A,[_tpCam2]
	jnz L135
	mov REG[0xd0],>_contador_trabajo2
	mov A,[_contador_trabajo2+1]
	mov REG[0xd0],>_tpCam2
	cmp A,[_tpCam2+1]
	jnz L135
	mov REG[0xd0],>_contador_trabajo2
	mov A,[_contador_trabajo2+2]
	mov REG[0xd0],>_tpCam2
	cmp A,[_tpCam2+2]
	jnz L135
	mov REG[0xd0],>_contador_trabajo2
	mov A,[_contador_trabajo2+3]
	mov REG[0xd0],>_tpCam2
	cmp A,[_tpCam2+3]
	jnz L135
X14:
	.dbline 27
	mov REG[0xd0],>_chivato2
	mov [_chivato2],1
L135:
	.dbline -2
	.dbline 28
L132:
	pop A
	mov REG[208],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
_main::
	.dbline -1
	.dbline 32
	.dbline 33
	xcall _inicializacion
	.dbline 34
	xcall _recibe_valores
	.dbline 35
	xcall _activar_sensores
	.dbline 36
	xcall _ejecucion
	.dbline 37
	xcall _envia_fintrabajo
	.dbline -2
	.dbline 38
L137:
	.dbline 0 ; func end
	jmp .
	.dbend
