	cpu LMM
	.module main.c
	.area data(ram, con, rel)
_Ent1::
	.byte 0
	.dbfile ./trabajo.h
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
_Cam1::
	.byte 0
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
_Uni::
	.byte 0
	.dbsym e Uni _Uni c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Inter::
	.byte 0
	.dbsym e Inter _Inter c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
_Tilap::
	.byte 0
	.dbsym e Tilap _Tilap c
	.area data(ram, con, rel)
	.dbfile ./trabajo.h
	.area text(rom, con, rel)
	.dbfile ./trabajo.h
	.dbfunc e Inicio _Inicio fV
;           coms -> X+0
_Inicio::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 28
; //----------------------------------------------------------------------------
; // PSoC de trabajo del proyecto PhotoSOC
; // 
; // TxD en P1.4 y RxD en P1.6.  19200 baudios sin paridad
; //----------------------------------------------------------------------------
; 
; #include <m8c.h>        // part specific constants and macros
; #include "PSoCAPI.h"    // PSoC API definitions for all User Modules
; #include "stdlib.h"
; #include "trabajo.h"
; 
; void main()
; {	char x;
; 	int num;
; 	char a[10];
; 	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
; 	Timer8_WriteCompareValue(156/2);
; 	Timer8_Start();
; 	
; 	UART_Start(UART_PARITY_NONE);
; 	
; 	//falta activar las direntes entradas 
; 	// y variables
; 	
; 	for(;;) Inicio();
; }		
; 	
; 	//Posibles utiles del PSoC de trabajo
	.dbline 31
; 	/*
; 		
; 		x=UART_cGetChar();  //Esta se espera a que llegue un byte. 
L2:
	.dbline 32
	.dbline 33
	xcall _Dato
	mov REG[0xd0],>__r0
	mov [X+0],A
	.dbline 34
	cmp [X+0],9
	jnz L2
	.dbline 34
	xcall _Ejecucion
	.dbline 36
	.dbline 31
	.dbline 31
	xjmp L2
X0:
	.dbline -2
L1:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l coms 0 c
	.dbend
	.dbfunc e Ejecucion _Ejecucion fV
_Ejecucion::
	.dbline -1
	.dbline 46
; 		Ver tambien UART_cReadChar()
; 	
; 		PRT0DR=PRT0DR | 0x40;
; 		for(num=0;num<20000;num++);
; 		PRT0DR=PRT0DR & 0xBF;
; 		for(;;);
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
	.dbline 47
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Ent1
	mov [_Ent1],A
	.dbline 48
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Ent2
	mov [_Ent2],A
	.dbline 49
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Ent3
	mov [_Ent3],A
	.dbline 50
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Ent4
	mov [_Ent4],A
	.dbline 51
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	.dbline 52
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 53
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Fla1
	mov [_Fla1],A
	.dbline 54
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Fla2
	mov [_Fla2],A
	.dbline 55
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Fla3
	mov [_Fla3],A
	.dbline 56
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Fla4
	mov [_Fla4],A
	.dbline 57
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Uni
	mov [_Uni],A
	.dbline 58
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Inter
	mov [_Inter],A
	.dbline 59
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Tilap
	mov [_Tilap],A
	.dbline 60
; 	*/
	xcall _Deteccion
	.dbline -2
	.dbline 61
; 	*/
L8:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Dato _Dato fc
;       confirma -> X+1
;       recivido -> X+0
_Dato::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 70
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
L10:
	.dbline 74
; 	*/
; 	*/
; 	*/
; 	*/
	.dbline 75
; 	*/
	push X
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 76
; 	*/
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	.dbline 77
; 	*/
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+1],A
	.dbline 78
L11:
	.dbline 78
; 	*/
	cmp [X+1],5
	jnz L10
	.dbline 79
; 	*/
	mov A,[X+0]
	mov REG[0xd0],>__r0
	.dbline -2
L9:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l confirma 1 c
	.dbsym l recivido 0 c
	.dbend
	.dbfunc e Deteccion _Deteccion fV
;         sensor -> X+0
_Deteccion::
	.dbline -1
	push X
	mov X,SP
	add SP,1
	.dbline 90
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
	.dbline 91
; 	*/
	mov [X+0],0
	.dbline 93
; 	*/
; 	*/
	mov REG[ 0],-86
L14:
	.dbline 96
; 	*/
; 	*/
; 	*/
	.dbline 97
; 	*/
	mov REG[0xd0],>_Ent1
	cmp [_Ent1],1
	jnz L17
	.dbline 97
	tst REG[ 0],1
	jz L19
	.dbline 97
	mov [X+0],1
	xjmp L20
L19:
	.dbline 99
; 	*/
; 	*/
	mov REG[0xd0],>_Ent2
	cmp [_Ent2],1
	jnz L21
	.dbline 99
	tst REG[ 0],1
	jz L23
	.dbline 99
	mov [X+0],2
	xjmp L24
L23:
	.dbline 101
; 	*/
; 	*/
	mov REG[0xd0],>_Ent3
	cmp [_Ent3],1
	jnz L25
	.dbline 102
; 	*/
	.dbline 103
; 	*/
	mov A,0
	jz L26
	.dbline 104
; 	*/
	.dbline 105
; 	*/
	mov [X+0],3
	.dbline 106
; 	*/
	or REG[ 0],8
	.dbline 107
; 	*/
	.dbline 108
; 	*/
	xjmp L26
L25:
	.dbline 109
; 	*/
	mov REG[0xd0],>_Ent4
	cmp [_Ent4],1
	jnz L29
	.dbline 110
; 	*/
	.dbline 111
; 	*/
	mov A,0
	jz L31
	.dbline 112
; 	*/
	.dbline 113
; 	*/
	mov [X+0],4
	.dbline 114
; 	*/
	or REG[ 0],2
	.dbline 115
; 	*/
L31:
	.dbline 116
; 	*/
L29:
L26:
L24:
L21:
L20:
L17:
	.dbline 117
L15:
	.dbline 117
; 	*/
	cmp [X+0],0
	jz L14
	.dbline 118
; 	*/
	xcall _Disparo
	.dbline -2
	.dbline 119
; 	*/
L13:
	add SP,-1
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l sensor 0 c
	.dbend
	.dbfunc e Disparo _Disparo fV
_Disparo::
	.dbline -1
	.dbline 128
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
	.dbline 129
; 	*/
	mov REG[0xd0],>_Uni
	cmp [_Uni],1
	jnz L34
	.dbline 129
	xcall _Unico
	xjmp L35
L34:
	.dbline 130
; 	*/
	mov REG[0xd0],>_Inter
	cmp [_Inter],1
	jnz L36
	.dbline 130
	xcall _Intervalometro
	xjmp L37
L36:
	.dbline 131
; 	*/
	mov REG[0xd0],>_Tilap
	cmp [_Tilap],1
	jnz L38
	.dbline 131
	xcall _TimeLapse
L38:
L37:
L35:
	.dbline -2
	.dbline 133
; 	*/
; 	*/
L33:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Unico _Unico fV
;              x -> X+0
_Unico::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 141
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
	.dbline 144
; 	*/
; 	*/
; 	*/
	or REG[ 0],85
	.dbline 145
; 	*/
	or REG[0x8],85
	.dbline 146
	mov [X+1],0
	mov [X+0],0
L41:
	.dbline 146
L42:
	.dbline 146
; 	*/
	inc [X+1]
	adc [X+0],0
	.dbline 146
	mov A,[X+1]
	sub A,44
	mov A,[X+0]
	xor A,-128
	sbb A,(1 ^ 0x80)
	jc L41
X1:
	.dbline 147
; 	*/
	and REG[ 0],-86
	.dbline 148
; 	*/
	and REG[0x8],-86
	.dbline -2
	.dbline 150
; 	*/
; 	*/
L40:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 I
	.dbend
	.dbfunc e Intervalometro _Intervalometro fV
;              x -> X+0
_Intervalometro::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 158
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
	.dbline -2
	.dbline 163
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
L45:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 I
	.dbend
	.dbfunc e TimeLapse _TimeLapse fV
;              x -> X+0
_TimeLapse::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 171
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
	.dbline -2
	.dbline 176
; 	*/
; 	*/
; 	*/
; 	*/
; 	*/
L46:
	add SP,-2
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l x 0 I
	.dbend
	.dbfile ./main.c
	.dbfunc e main _main fV
;              a -> X+3
;            num -> X+1
;              x -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,13
	.dbline 13
	.dbline 16
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 17
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 18
	xcall _Timer8_Start
	.dbline 20
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 25
L48:
	.dbline 25
	xcall _Inicio
	.dbline 25
	.dbline 25
	xjmp L48
X2:
	.dbline -2
L47:
	add SP,-13
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l a 3 A[10:10]c
	.dbsym l num 1 I
	.dbsym l x 0 c
	.dbend
