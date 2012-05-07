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
	.dbline 30
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
; {	
; 	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
; 	Timer8_WriteCompareValue(156/2);
; 	Timer8_Start();
; 	
; 	Segundos_WritePeriod(10000);		
; 	Segundos_WriteCompareValue(0);
; 	Segundos_Start();
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
	.dbline 33
; 	/*
; 		
; 		x=UART_cGetChar();  //Esta se espera a que llegue un byte. 
L2:
	.dbline 34
	.dbline 35
	xcall _Dato
	mov [X+0],A
	.dbline 36
	mov REG[0xd0],>_inici
	mov [_inici],1
	.dbline 37
	cmp [X+0],9
	jnz L2
	.dbline 37
	xcall _Ejecucion
	.dbline 39
	.dbline 33
	.dbline 33
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
	.dbline 49
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
; 	*/
	.dbline 50
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Ent1
	mov [_Ent1],A
	.dbline 51
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Ent2
	mov [_Ent2],A
	.dbline 52
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Ent3
	mov [_Ent3],A
	.dbline 53
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Ent4
	mov [_Ent4],A
	.dbline 54
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Cam1
	mov [_Cam1],A
	.dbline 55
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Cam2
	mov [_Cam2],A
	.dbline 56
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Fla1
	mov [_Fla1],A
	.dbline 57
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Fla2
	mov [_Fla2],A
	.dbline 58
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Fla3
	mov [_Fla3],A
	.dbline 59
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Fla4
	mov [_Fla4],A
	.dbline 60
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Uni
	mov [_Uni],A
	.dbline 61
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Inter
	mov [_Inter],A
	.dbline 62
; 	*/
	xcall _Dato
	mov REG[0xd0],>_Tilap
	mov [_Tilap],A
	.dbline 63
; 	*/
	xcall _Deteccion
	.dbline -2
	.dbline 64
; 	*/
L8:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Dato _Dato fc
;       confirma -> X+1
;       recibido -> X+0
_Dato::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 73
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
	.dbline 77
; 	*/
; 	*/
; 	*/
; 	*/
	.dbline 78
; 	*/
	push X
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 79
; 	*/
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	.dbline 80
; 	*/
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+1],A
	.dbline 81
L11:
	.dbline 81
; 	*/
	cmp [X+1],5
	jnz L10
	.dbline 82
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
	.dbsym l recibido 0 c
	.dbend
	.dbfunc e Deteccion _Deteccion fV
_Deteccion::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Disparo _Disparo fV
_Disparo::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Unico _Unico fV
_Unico::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Intervalometro _Intervalometro fV
;         camara -> X-4
_Intervalometro::
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l camara -4 c
	.dbend
	.dbfunc e TimeLapse _TimeLapse fV
_TimeLapse::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Reset _Reset fV
_Reset::
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
_inici::
	.byte 0
	.dbfile ./trabajo.h
	.dbsym e inici _inici c
