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
; 
; #include <m8c.h>        // part specific constants and macros
; #include "PSoCAPI.h"    // PSoC API definitions for all User Modules
; #include "stdlib.h"
; #include "comunicaciones.h"	// Libreria creada por Albert y Xavi para el proyecto
; 
; 
; void main()
; {	
; 
; unsigned char prueba1,prueba2,prueba3;
; 
; //- Inicializacion de parametros basicos del sistema al encender	
; 	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	.dbline 22
; 	Timer8_WriteCompareValue(156/2);
; 	Timer8_Start();
; 	
	mov [X+0],48
	.dbline 23
; 	UART_Start(UART_PARITY_NONE);
	mov [X+1],0
	xjmp L3
L2:
	.dbline 26
; 	
; 
; // Envio de datos
	.dbline 27
; 
	push X
	mov A,[X-4]
	xcall _UART_PutChar
	.dbline 28
; 	prueba1=50;
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+2],A
	.dbline 30
; 	prueba2=58;
; 	prueba3=62;
	mov A,[X+2]
	cmp A,[X-4]
	jnz L5
	.dbline 30
	mov [X+0],49
L5:
	.dbline 31
; 	
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	pop X
	.dbline 32
; 	envia(prueba1);
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 33
; 	envia(prueba2);
	cmp [X+1],10
	jnz L7
	.dbline 33
	mov [X+0],1
L7:
	.dbline 34
L3:
	.dbline 25
	cmp [X+0],48
	jz L2
	.dbline -2
	.dbline 35
; 	envia(prueba3);
; 	
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
	cmp [X+0],48
	jnz L13
	.dbline 62
	mov A,[X+2]
	xjmp L9
L13:
	.dbline 63
; }
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 64
; }
	cmp [X+1],10
	jnz L15
	.dbline 64
	mov [X+0],1
L15:
	.dbline 65
L11:
	.dbline 56
	cmp [X+0],0
	jz L10
	.dbline 66
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
	.dbfile ./main.c
	.dbfunc e main _main fV
;        prueba3 -> X+2
;        prueba2 -> X+1
;        prueba1 -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 14
	.dbline 19
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 20
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 21
	xcall _Timer8_Start
	.dbline 23
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 28
	mov [X+0],50
	.dbline 29
	mov [X+1],58
	.dbline 30
	mov [X+2],62
	.dbline 32
	mov A,[X+0]
	push A
	xcall _envia
	add SP,-1
	.dbline 33
	mov A,[X+1]
	push A
	xcall _envia
	.dbline 34
	mov A,[X+2]
	push A
	xcall _envia
	add SP,-2
	.dbline -2
	.dbline 36
L17:
	add SP,-3
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l prueba3 2 c
	.dbsym l prueba2 1 c
	.dbsym l prueba1 0 c
	.dbend
