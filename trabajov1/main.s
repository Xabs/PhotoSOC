	cpu LMM
	.module main.c
	.area data(ram, con, rel)
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
	.area text(rom, con, rel)
	.dbfile ./trabajo.h
	.dbfunc e inicializacion _inicializacion fV
_inicializacion::
	.dbline -1
	.dbline 60
; //----------------------------------------------------------------//
; //     Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
; //                   By Albert Sagol & Xavi Vicient			      //
; //                 PhotoSoC - Controlador fotográfico		  	  //
; //----------------------------------------------------------------//
; //              Programa principal del PSoC de trabajo			  //
; //----------------------------------------------------------------//
; 
; 
; #include <m8c.h>        		// part specific constants and macros
; #include "PSoCAPI.h"   	 		// PSoC API definitions for all User Modules
; #include "stdlib.h"
; #include "trabajo.h"			// Libreria creada para el PSoc de trabajo por Albert y Xavi para el proyecto
; #include "comunicaciones.h" 	// Libreria de comunicaciones creada por Albert y Xavi para el proyecto
; 
; 
; 
; void main()
; {	
; 	inicializacion ();
; 	recibe_valores();	
; 	ejecucion();
; }		
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
	.dbline 62
; 
; 
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 63
; 
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 64
; 
	xcall _Timer8_Start
	.dbline 67
; 
; 
; 
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 70
; 
; 
; 
	xcall _LCD_Start
	.dbline 71
; 
	xcall _LCD_Init
	.dbline 73
; 
; 
	push X
	mov X,39
	mov A,16
	xcall _Segundos_WritePeriod
	.dbline 74
; 
	mov A,0
	mov X,A
	xcall _Segundos_WriteCompareValue
	.dbline 75
; 
	xcall _Segundos_Start
	pop X
	.dbline -2
	.dbline 76
; 
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e recibe_valores _recibe_valores fV
_recibe_valores::
	.dbline -1
	.dbline 93
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
	.dbline 94
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	.dbline 95
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 96
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Ent1
	mov [_Ent1],A
	.dbline 97
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Ent2
	mov [_Ent2],A
	.dbline 98
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Ent3
	mov [_Ent3],A
	.dbline 99
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Ent4
	mov [_Ent4],A
	.dbline 100
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Fla1
	mov [_Fla1],A
	.dbline 101
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Fla2
	mov [_Fla2],A
	.dbline 102
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Fla3
	mov [_Fla3],A
	.dbline 103
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Fla4
	mov [_Fla4],A
	.dbline 105
; 
; 
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L3
	.dbline 106
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Int1_Tdisp
	mov [_Int1_Tdisp],A
L3:
	.dbline 107
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov [_Int1_Tdisp_Uni],A
	.dbline 108
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Int1_Ndisp
	mov [_Int1_Ndisp],A
	.dbline 110
; 
; 
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L5
	.dbline 111
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Int2_Tdisp
	mov [_Int2_Tdisp],A
L5:
	.dbline 112
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov [_Int2_Tdisp_Uni],A
	.dbline 113
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_Int2_Ndisp
	mov [_Int2_Ndisp],A
	.dbline 115
; 
; 
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L7
	.dbline 116
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_TL1_Treal
	mov [_TL1_Treal],A
L7:
	.dbline 117
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_TL1_Treal_Uni
	mov [_TL1_Treal_Uni],A
	.dbline 118
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_TL1_Tfilm
	mov [_TL1_Tfilm],A
	.dbline 119
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov [_TL1_Tfilm_Uni],A
	.dbline 121
; 
; 
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L9
	.dbline 122
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_TL2_Treal
	mov [_TL2_Treal],A
L9:
	.dbline 123
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_TL2_Treal_Uni
	mov [_TL2_Treal_Uni],A
	.dbline 124
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_TL2_Tfilm
	mov [_TL2_Tfilm],A
	.dbline 125
; 
	xcall _recibe
	mov REG[0xd0],>__r0
	mov A,[__r1]
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov [_TL2_Tfilm_Uni],A
	.dbline -2
	.dbline 128
; 
; 
; 
L2:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ejecucion _ejecucion fV
_ejecucion::
	.dbline -1
	.dbline 147
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
	.dbline 148
; 
	xcall _tipodisparo
	.dbline -2
	.dbline 150
; 
; 
L11:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e tipodisparo _tipodisparo fV
_tipodisparo::
	.dbline -1
	push X
	mov X,SP
	add SP,4
	.dbline 168
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
	.dbline 169
; 
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L17
	mov [X+1],1
	mov [X+0],0
	xjmp L18
L17:
	mov [X+1],0
	mov [X+0],0
L18:
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L19
	mov [X+3],1
	mov [X+2],0
	xjmp L20
L19:
	mov [X+3],0
	mov [X+2],0
L20:
	mov REG[0xd0],>__r0
	mov A,[X+1]
	or A,[X+3]
	mov [__r1],A
	mov A,[X+0]
	or A,[X+2]
	cmp A,0
	jnz X0
	cmp [__r1],0
	jz L13
X0:
	.dbline 170
; 
	xcall _activar_sensores
L13:
	.dbline 172
; 
; 
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L21
	.dbline 173
; 
	.dbline 175
; 
; 
L21:
	.dbline 177
; 
; 
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L23
	.dbline 178
; 
	.dbline 180
; 
; 
L23:
	.dbline 182
; 
; 
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L25
	.dbline 183
; 
	.dbline 185
; 
; 
L25:
	.dbline 187
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L27
	.dbline 188
	.dbline 190
L27:
	.dbline -2
	.dbline 191
; 
; 
; 
; 
; 
; 
L12:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e activar_sensores _activar_sensores fV
_activar_sensores::
	.dbline -1
	.dbline 209
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
; 
	.dbline -2
	.dbline 210
; 
L29:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Intervalometro _Intervalometro fV
_Intervalometro::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfile ./comunicaciones.h
	.dbfunc e envia _envia fV
;     envia_dato -> X-4
_envia::
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l envia_dato -4 c
	.dbend
	.dbfunc e recibe _recibe fc
_recibe::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfile ./main.c
	.dbfunc e main _main fV
_main::
	.dbline 0 ; func end
	jmp .
	.dbend
	.area data(ram, con, rel)
	.dbfile ./main.c
_listo_tl2::
	.byte 0
	.dbfile ./trabajo.h
	.dbsym e listo_tl2 _listo_tl2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_listo_tl1::
	.byte 0
	.dbsym e listo_tl1 _listo_tl1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_listo_int2::
	.byte 0
	.dbsym e listo_int2 _listo_int2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_listo_int1::
	.byte 0
	.dbsym e listo_int1 _listo_int1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_inici::
	.byte 0
	.dbsym e inici _inici c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Td_tl2::
	.byte 0
	.dbsym e Td_tl2 _Td_tl2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_D_t12::
	.byte 0
	.dbsym e D_t12 _D_t12 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Td_tl1::
	.byte 0
	.dbsym e Td_tl1 _Td_tl1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_D_tl1::
	.byte 0
	.dbsym e D_tl1 _D_tl1 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Td_int2::
	.byte 0
	.dbsym e Td_int2 _Td_int2 c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Td_int1::
	.byte 0
	.dbsym e Td_int1 _Td_int1 c
