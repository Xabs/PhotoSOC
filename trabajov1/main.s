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
; //unsigned int tempo,tempo2; 		//Para debuggar
; 
; //void led1(void);
	.dbline 22
; //void led2(void);
; 
; void MI_RSI_EXTERNA(void)		//Interrupción externa
	mov [X+0],0
	.dbline 23
; {
	mov [X+1],0
	xjmp L3
L2:
	.dbline 26
; 	disparo_sensores();
; }
; 
	.dbline 27
; void MI_RSI_DEL_TIMER (void)	//Interrupción del timer Segundos
	push X
	mov A,[X-4]
	xcall _UART_PutChar
	.dbline 28
; {
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+2],A
	.dbline 30
; 	contador_trabajo1++;
; 	contador_trabajo2++;
	mov A,[X+2]
	cmp A,[X-4]
	jnz L5
	.dbline 30
	mov [X+0],79
L5:
	.dbline 31
; 	
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	pop X
	.dbline 32
; 	if (contador_trabajo1==tpCam1) 
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 33
; 	{
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
; 		chivato1=on;
; 		contador_trabajo1=0;
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
; 	}
; 	
; 	if (contador_trabajo2==tpCam2) 
; 	{
; 		chivato2=on;
; 		contador_trabajo2=0;
; 	}
; }
; 
; /*
; void led1(void)	//Rutina para debuggar
; {
; 	PRT0DR=PRT0DR|0x01; //0000-0001
; 	for (tempo=0;tempo<5000;tempo++) ;
; 	PRT0DR=PRT0DR&0xFE;
	.dbline 53
; }
; void led2(void)	//Rutina para debuggar
; {
	mov [X+0],0
	.dbline 54
; 	PRT0DR=PRT0DR|0x04; //0000-0100
	mov [X+1],0
	xjmp L11
L10:
	.dbline 57
; 	for (tempo2=0;tempo2<500;tempo2++) ;
; 	PRT0DR=PRT0DR&0xFB;
; }
	.dbline 58
; */
	push X
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+2],A
	.dbline 59
; 
	push X
	mov A,[X+2]
	xcall _UART_PutChar
	.dbline 61
; void main()						//Programa principal
; {	
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 62
; 	inicializacion ();
	cmp [X+0],79
	jnz L13
	.dbline 63
; 	recibe_valores();
	mov A,[X+2]
	xjmp L9
L13:
	.dbline 64
; 	preparadisparo();
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 65
; 	activar_sensores();	
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
; 	ejecucion();
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
	pop X
	.dbline -2
	.dbline 71
; }		
L17:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e recibe_valores _recibe_valores fV
_recibe_valores::
	.dbline -1
	.dbline 86
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
	.dbline 87
; }		
	xcall _recibe
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	.dbline 88
; }		
	xcall _recibe
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 89
; }		
	xcall _recibe
	mov REG[0xd0],>_Ent1
	mov [_Ent1],A
	.dbline 90
; }		
	xcall _recibe
	mov REG[0xd0],>_Ent2
	mov [_Ent2],A
	.dbline 91
; }		
	xcall _recibe
	mov REG[0xd0],>_Ent3
	mov [_Ent3],A
	.dbline 92
; }		
	xcall _recibe
	mov REG[0xd0],>_Ent4
	mov [_Ent4],A
	.dbline 93
; }		
	xcall _recibe
	mov REG[0xd0],>_Fla1
	mov [_Fla1],A
	.dbline 94
; }		
	xcall _recibe
	mov REG[0xd0],>_Fla2
	mov [_Fla2],A
	.dbline 95
; }		
	xcall _recibe
	mov REG[0xd0],>_Fla3
	mov [_Fla3],A
	.dbline 96
; }		
	xcall _recibe
	mov REG[0xd0],>_Fla4
	mov [_Fla4],A
	.dbline 98
; }		
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jnz L19
	.dbline 99
; }		
	xcall _recibe
	mov REG[0xd0],>_Int1_Tdisp
	mov [_Int1_Tdisp],A
L19:
	.dbline 100
; }		
	xcall _recibe
	mov REG[0xd0],>_Int1_Tdisp_Uni
	mov [_Int1_Tdisp_Uni],A
	.dbline 101
; }		
	xcall _recibe
	mov REG[0xd0],>_Int1_Ndisp
	mov [_Int1_Ndisp],A
	.dbline 103
; }		
; }		
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jnz L21
	.dbline 104
; }		
	xcall _recibe
	mov REG[0xd0],>_Int2_Tdisp
	mov [_Int2_Tdisp],A
L21:
	.dbline 105
; }		
	xcall _recibe
	mov REG[0xd0],>_Int2_Tdisp_Uni
	mov [_Int2_Tdisp_Uni],A
	.dbline 106
; }		
	xcall _recibe
	mov REG[0xd0],>_Int2_Ndisp
	mov [_Int2_Ndisp],A
	.dbline 108
; }		
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],3
	jnz L23
	.dbline 109
; }		
	xcall _recibe
	mov REG[0xd0],>_TL1_Treal
	mov [_TL1_Treal],A
L23:
	.dbline 110
; }		
	xcall _recibe
	mov REG[0xd0],>_TL1_Treal_Uni
	mov [_TL1_Treal_Uni],A
	.dbline 111
; }		
	xcall _recibe
	mov REG[0xd0],>_TL1_Tfilm
	mov [_TL1_Tfilm],A
	.dbline 112
; }		
	xcall _recibe
	mov REG[0xd0],>_TL1_Tfilm_Uni
	mov [_TL1_Tfilm_Uni],A
	.dbline 114
; }		
; }		
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],3
	jnz L25
	.dbline 115
; }		
	xcall _recibe
	mov REG[0xd0],>_TL2_Treal
	mov [_TL2_Treal],A
L25:
	.dbline 116
; }		
	xcall _recibe
	mov REG[0xd0],>_TL2_Treal_Uni
	mov [_TL2_Treal_Uni],A
	.dbline 117
; }		
	xcall _recibe
	mov REG[0xd0],>_TL2_Tfilm
	mov [_TL2_Tfilm],A
	.dbline 118
; }		
	xcall _recibe
	mov REG[0xd0],>_TL2_Tfilm_Uni
	mov [_TL2_Tfilm_Uni],A
	.dbline -2
	.dbline 121
; }		
; }		
; }		
L18:
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
	.dbline 136
; }		
; }		
; }		
; }		
; }		
; }		
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
; }		
; }		
; }		
; }		
; }		
	mov REG[0xd0],>_tocacam1
	mov [_tocacam1],1
	.dbline 143
; }		
	mov REG[0xd0],>_tocacam2
	mov [_tocacam2],1
	.dbline 145
; }		
; }		
	mov REG[0xd0],>_Cam1
	mov A,[_Cam1]
	mov [X+9],A
	mov [X+8],0
	cmp [X+8],0
	jnz X2
	cmp [X+9],2
	jz L31
X2:
	cmp [X+8],0
	jnz X3
	cmp [X+9],3
	jz L32
X3:
	xjmp L28
X0:
	.dbline 146
; }		
L31:
	.dbline 148
; }		
; }		
	mov REG[0xd0],>_Int1_Ndisp
	mov A,[_Int1_Ndisp]
	push A
	mov REG[0xd0],>_dspCam1
	mov [_dspCam1],0
	pop A
	mov [_dspCam1+1],A
	.dbline 149
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
	.dbline 150
; }		
	xjmp L29
L32:
	.dbline 152
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
	.dbline 153
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
	.dbline 154
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
	.dbline 155
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
	.dbline 156
; }		
L28:
L29:
	.dbline 158
; }		
; }		
	mov REG[0xd0],>_Cam2
	mov A,[_Cam2]
	mov [X+11],A
	mov [X+10],0
	cmp [X+10],0
	jnz X4
	cmp [X+11],2
	jz L36
X4:
	cmp [X+10],0
	jnz X5
	cmp [X+11],3
	jz L37
X5:
	xjmp L33
X1:
	.dbline 159
; }		
L36:
	.dbline 161
; }		
; }		
	mov REG[0xd0],>_Int2_Ndisp
	mov A,[_Int2_Ndisp]
	push A
	mov REG[0xd0],>_dspCam2
	mov [_dspCam2],0
	pop A
	mov [_dspCam2+1],A
	.dbline 162
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
	.dbline 163
; }		
	xjmp L34
L37:
	.dbline 165
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
	.dbline 166
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
	.dbline 167
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
	.dbline 168
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
	.dbline 169
; }		
L33:
L34:
	.dbline -2
	.dbline 171
; }		
; }		
L27:
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
	.dbline 186
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
	.dbline 188
; }		
; }		
	cmp [X-5],1
	jnz L39
	.dbline 188
	mov A,[X-4]
	mov [X+3],A
	mov [X+2],0
	mov [X+1],0
	mov [X+0],0
L39:
	.dbline 189
; }		
	cmp [X-5],2
	jnz L41
	.dbline 189
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
L41:
	.dbline 190
; }		
	cmp [X-5],3
	jnz L43
	.dbline 190
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
L43:
	.dbline 191
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
L38:
	add SP,-4
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l resultado 0 l
	.dbsym l unidades -5 c
	.dbsym l numero -4 c
	.dbend
	.dbfunc e activar_sensores _activar_sensores fV
_activar_sensores::
	.dbline -1
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
; }		
; }		
	.dbline 208
; }		
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],1
	jz L50
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],1
	jz L50
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],1
	jz L50
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],1
	jnz L46
L50:
	.dbline 209
	.dbline 210
	or REG[0xe0],32
	.dbline 211
		or  F, 01h

	.dbline 212
L46:
	.dbline -2
	.dbline 213
; }		
; }		
; }		
; }		
; }		
L45:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e ejecucion _ejecucion fV
_ejecucion::
	.dbline -1
	.dbline 228
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
L52:
	.dbline 230
; }		
; }		
	.dbline 231
; }		
	xcall _bucle
	.dbline 232
; }		
L53:
	.dbline 233
; }		
	mov REG[0xd0],>_fintrabajo
	cmp [_fintrabajo],-1
	jnz L52
	.dbline 235
; }		
; }		
	xcall _envia_fintrabajo
	.dbline -2
	.dbline 236
; }		
L51:
	.dbline 0 ; func end
	ret
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
; }		
; }		
; }		
; }		
; }		
	.dbline 252
; }		
	mov [X+0],0
	.dbline 252
	mov [X+1],0
	.dbline 253
; }		
	mov [X+2],0
	.dbline 253
	mov [X+3],0
	.dbline 256
; }		
; }		
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],2
	jz L60
	cmp [_Cam1],3
	jz L60
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],2
	jz L60
	cmp [_Cam2],3
	jnz L56
L60:
	.dbline 257
; }		
	.dbline 258
; }		
	push X
	xcall _Segundos_EnableInt
	pop X
	.dbline 259
; }		
		or  F, 01h

	.dbline 260
; }		
	push X
	mov X,39
	mov A,16
	xcall _Segundos_WritePeriod
	.dbline 261
; }		
	xcall _Segundos_Start
	pop X
	.dbline 262
; }		
L56:
L61:
	.dbline 265
; }		
; }		
; }		
	.dbline 266
	mov REG[0xd0],>_tocacam1
	cmp [_tocacam1],1
	jz L66
	mov REG[0xd0],>_tocacam2
	cmp [_tocacam2],1
	jnz L64
L66:
	.dbline 266
; }		
	xcall _disparo
L64:
	.dbline 268
; }		
; }		
	cmp [X+0],0
	jnz L67
	.dbline 269
; }		
	.dbline 270
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],0
	jz L71
	cmp [_Cam1],1
	jnz L69
L71:
	.dbline 270
; }		
	mov [X+0],1
	xjmp L70
L69:
	.dbline 272
; }		
; }		
	.dbline 273
; }		
	mov REG[0xd0],>_chivato1
	cmp [_chivato1],1
	jnz L72
	.dbline 274
; }		
	.dbline 275
; }		
	mov REG[0xd0],>_tocacam1
	mov [_tocacam1],1
	.dbline 276
; }		
	mov REG[0xd0],>_chivato1
	mov [_chivato1],0
	.dbline 277
; }		
L72:
	.dbline 278
; }		
	mov REG[0xd0],>_contadordspCam1
	mov A,[_contadordspCam1]
	mov REG[0xd0],>_dspCam1
	cmp A,[_dspCam1]
	jnz L74
	mov REG[0xd0],>_contadordspCam1
	mov A,[_contadordspCam1+1]
	mov REG[0xd0],>_dspCam1
	cmp A,[_dspCam1+1]
	jnz L74
X10:
	.dbline 278
	mov [X+0],1
L74:
	.dbline 279
; }		
L70:
	.dbline 280
; }		
L67:
	.dbline 282
; }		
; }		
	cmp [X+1],0
	jnz L76
	.dbline 283
; }		
	.dbline 284
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],0
	jz L80
	cmp [_Cam2],1
	jnz L78
L80:
	.dbline 284
; }		
	mov [X+1],1
	xjmp L79
L78:
	.dbline 286
; }		
; }		
	.dbline 287
; }		
	mov REG[0xd0],>_chivato2
	cmp [_chivato2],1
	jnz L81
	.dbline 288
; }		
	.dbline 289
; }		
	mov REG[0xd0],>_tocacam2
	mov [_tocacam2],1
	.dbline 290
; }		
	mov REG[0xd0],>_chivato2
	mov [_chivato2],0
	.dbline 291
; }		
L81:
	.dbline 292
; }		
	mov REG[0xd0],>_contadordspCam2
	mov A,[_contadordspCam2]
	mov REG[0xd0],>_dspCam2
	cmp A,[_dspCam2]
	jnz L83
	mov REG[0xd0],>_contadordspCam2
	mov A,[_contadordspCam2+1]
	mov REG[0xd0],>_dspCam2
	cmp A,[_dspCam2+1]
	jnz L83
X11:
	.dbline 292
	mov [X+1],1
L83:
	.dbline 293
; }		
L79:
	.dbline 294
; }		
L76:
	.dbline 295
; }		
L62:
	.dbline 296
; }		
	cmp [X+0],0
	jz L61
	cmp [X+1],0
	jz L61
	.dbline 298
; }		
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jz L87
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L85
L87:
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],1
	jz L90
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],1
	jz L90
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],1
	jz L90
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],1
	jnz L85
L90:
	.dbline 298
L91:
	.dbline 298
	.dbline 298
	.dbline 298
	xjmp L91
L85:
	.dbline 300
; }		
; }		
	mov REG[0xd0],>_fintrabajo
	mov [_fintrabajo],-1
	.dbline -2
	.dbline 301
; }		
L55:
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
	.dbline 316
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
	.dbline 320
; }		
; }		
; }		
; }		
	mov REG[0xd0],>_tocacam1
	cmp [_tocacam1],1
	jnz L96
	.dbline 321
; }		
	.dbline 322
; }		
	or REG[0x8],1
	.dbline 323
; }		
	or REG[0x8],4
	.dbline 324
; }		
	mov REG[0xd0],>_contadordspCam1
	inc [_contadordspCam1+1]
	adc [_contadordspCam1],0
	.dbline 325
; }		
L96:
	.dbline 326
; }		
	mov REG[0xd0],>_tocacam2
	cmp [_tocacam2],1
	jnz L98
	.dbline 327
; }		
	.dbline 328
; }		
	or REG[0x8],16
	.dbline 329
; }		
	or REG[0x8],64
	.dbline 330
; }		
	mov REG[0xd0],>_contadordspCam2
	inc [_contadordspCam2+1]
	adc [_contadordspCam2],0
	.dbline 331
; }		
L98:
	.dbline 334
; }		
; }		
; }		
	mov REG[0xd0],>_tocacam1
	cmp [_tocacam1],1
	jnz L100
	.dbline 335
; }		
	.dbline 336
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],1
	jz L104
	cmp [_Fla1],3
	jnz L102
L104:
	.dbline 336
; }		
	or REG[ 0],1
L102:
	.dbline 337
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],1
	jz L107
	cmp [_Fla2],3
	jnz L105
L107:
	.dbline 337
; }		
	or REG[ 0],4
L105:
	.dbline 338
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],1
	jz L110
	cmp [_Fla3],3
	jnz L108
L110:
	.dbline 338
; }		
	or REG[ 0],16
L108:
	.dbline 339
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],1
	jz L113
	cmp [_Fla4],3
	jnz L111
L113:
	.dbline 339
; }		
	or REG[ 0],64
L111:
	.dbline 340
; }		
L100:
	.dbline 341
; }		
	mov REG[0xd0],>_tocacam2
	cmp [_tocacam2],1
	jnz L114
	.dbline 342
; }		
	.dbline 343
	mov REG[0xd0],>_Fla1
	cmp [_Fla1],2
	jz L118
	cmp [_Fla1],3
	jnz L116
L118:
	.dbline 343
; }		
	or REG[ 0],1
L116:
	.dbline 344
	mov REG[0xd0],>_Fla2
	cmp [_Fla2],2
	jz L121
	cmp [_Fla2],3
	jnz L119
L121:
	.dbline 344
; }		
	or REG[ 0],4
L119:
	.dbline 345
	mov REG[0xd0],>_Fla3
	cmp [_Fla3],2
	jz L124
	cmp [_Fla3],3
	jnz L122
L124:
	.dbline 345
; }		
	or REG[ 0],16
L122:
	.dbline 346
	mov REG[0xd0],>_Fla4
	cmp [_Fla4],2
	jz L127
	cmp [_Fla4],3
	jnz L125
L127:
	.dbline 346
; }		
	or REG[ 0],64
L125:
	.dbline 347
; }		
L114:
	.dbline 349
	mov [X+1],0
	mov [X+0],0
L128:
	.dbline 349
L129:
	.dbline 349
; }		
; }		
	inc [X+1]
	adc [X+0],0
	.dbline 349
	mov A,[X+1]
	sub A,-24
	mov A,[X+0]
	xor A,-128
	sbb A,(3 ^ 0x80)
	jc L128
X12:
	.dbline 352
; }		
; }		
; }		
	and REG[ 0],-86
	.dbline 355
; }		
; }		
; }		
	and REG[0x8],-86
	.dbline 358
; }		
; }		
; }		
	mov REG[0xd0],>_tocacam1
	mov [_tocacam1],0
	.dbline 359
; }		
	mov REG[0xd0],>_tocacam2
	mov [_tocacam2],0
	.dbline -2
	.dbline 360
; }		
L95:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 I
	.dbend
	.dbfunc e envia_fintrabajo _envia_fintrabajo fV
_envia_fintrabajo::
	.dbline -1
	.dbline 375
	.dbline 377
	mov REG[0xd0],>_fintrabajo
	mov [_fintrabajo],-1
	mov REG[0xd0],>__r0
	mov [__r0],-1
	cmp [__r0],0
	jz L133
	.dbline 378
	.dbline 379
	mov REG[0xd0],>_fintrabajo
	mov A,[_fintrabajo]
	push A
	xcall _envia
	add SP,-1
	.dbline 380
L133:
	.dbline -2
	.dbline 381
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
L132:
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
	.dbline 396
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
; }		
	.dbline 401
; }		
; }		
; }		
; }		
; }		
	mov A,REG[ 0]
	and A,-86
	mov [X+0],A
	.dbline 404
; }		
; }		
; }		
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],0
	jnz L136
	.dbline 404
	and [X+0],127
L136:
	.dbline 405
; }		
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],0
	jnz L138
	.dbline 405
	and [X+0],-33
L138:
	.dbline 406
; }		
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],0
	jnz L140
	.dbline 406
	and [X+0],-9
L140:
	.dbline 407
; }		
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],0
	jnz L142
	.dbline 407
	and [X+0],-3
L142:
	.dbline 410
; }		
; }		
; }		
	cmp [X+0],0
	jz L144
	.dbline 411
; }		
	.dbline 412
; }		
	mov REG[0xd0],>_Cam1
	cmp [_Cam1],1
	jnz L146
	.dbline 412
	mov REG[0xd0],>_tocacam1
	mov [_tocacam1],1
L146:
	.dbline 413
; }		
	mov REG[0xd0],>_Cam2
	cmp [_Cam2],1
	jnz L148
	.dbline 413
	mov REG[0xd0],>_tocacam2
	mov [_tocacam2],1
L148:
	.dbline 414
	xcall _disparo
	.dbline 415
L144:
	.dbline -2
	.dbline 416
; }		
; }		
; }		
L135:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l disparo_sensores_sensores 0 c
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
	.dbline 23
	.dbline 24
	xcall _disparo_sensores
	.dbline -2
	.dbline 25
L150:
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
	.dbline 28
	.dbline 29
	mov REG[0xd0],>_contador_trabajo1
	add [_contador_trabajo1+3],1
	adc [_contador_trabajo1+2],0
	adc [_contador_trabajo1+1],0
	adc [_contador_trabajo1],0
	.dbline 30
	mov REG[0xd0],>_contador_trabajo2
	add [_contador_trabajo2+3],1
	adc [_contador_trabajo2+2],0
	adc [_contador_trabajo2+1],0
	adc [_contador_trabajo2],0
	.dbline 32
	mov REG[0xd0],>_contador_trabajo1
	mov A,[_contador_trabajo1]
	mov REG[0xd0],>_tpCam1
	cmp A,[_tpCam1]
	jnz L152
	mov REG[0xd0],>_contador_trabajo1
	mov A,[_contador_trabajo1+1]
	mov REG[0xd0],>_tpCam1
	cmp A,[_tpCam1+1]
	jnz L152
	mov REG[0xd0],>_contador_trabajo1
	mov A,[_contador_trabajo1+2]
	mov REG[0xd0],>_tpCam1
	cmp A,[_tpCam1+2]
	jnz L152
	mov REG[0xd0],>_contador_trabajo1
	mov A,[_contador_trabajo1+3]
	mov REG[0xd0],>_tpCam1
	cmp A,[_tpCam1+3]
	jnz L152
X13:
	.dbline 33
	.dbline 34
	mov REG[0xd0],>_chivato1
	mov [_chivato1],1
	.dbline 35
	mov REG[0xd0],>_contador_trabajo1
	mov [_contador_trabajo1],0
	mov [_contador_trabajo1+1],0
	mov [_contador_trabajo1+2],0
	mov [_contador_trabajo1+3],0
	.dbline 36
L152:
	.dbline 38
	mov REG[0xd0],>_contador_trabajo2
	mov A,[_contador_trabajo2]
	mov REG[0xd0],>_tpCam2
	cmp A,[_tpCam2]
	jnz L154
	mov REG[0xd0],>_contador_trabajo2
	mov A,[_contador_trabajo2+1]
	mov REG[0xd0],>_tpCam2
	cmp A,[_tpCam2+1]
	jnz L154
	mov REG[0xd0],>_contador_trabajo2
	mov A,[_contador_trabajo2+2]
	mov REG[0xd0],>_tpCam2
	cmp A,[_tpCam2+2]
	jnz L154
	mov REG[0xd0],>_contador_trabajo2
	mov A,[_contador_trabajo2+3]
	mov REG[0xd0],>_tpCam2
	cmp A,[_tpCam2+3]
	jnz L154
X14:
	.dbline 39
	.dbline 40
	mov REG[0xd0],>_chivato2
	mov [_chivato2],1
	.dbline 41
	mov REG[0xd0],>_contador_trabajo2
	mov [_contador_trabajo2],0
	mov [_contador_trabajo2+1],0
	mov [_contador_trabajo2+2],0
	mov [_contador_trabajo2+3],0
	.dbline 42
L154:
	.dbline -2
	.dbline 43
L151:
	pop A
	mov REG[208],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e main _main fV
_main::
	.dbline -1
	.dbline 61
	.dbline 62
	xcall _inicializacion
	.dbline 63
	xcall _recibe_valores
	.dbline 64
	xcall _preparadisparo
	.dbline 65
	xcall _activar_sensores
	.dbline 66
	xcall _ejecucion
	.dbline -2
	.dbline 67
L156:
	.dbline 0 ; func end
	jmp .
	.dbend
	.area data(ram, con, rel)
	.dbfile ./main.c
_tempo::
	.byte 0,0
	.dbfile ./trabajo.h
	.dbsym e tempo _tempo i
