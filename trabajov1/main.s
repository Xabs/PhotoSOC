	cpu LMM
	.module main.c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.dbfunc e main _main fV
;            num -> X+11
;              a -> X+1
;              x -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,13
	.dbline 12
; //----------------------------------------------------------------------------
; // Envia una serie de caracteres por el canal serie cuando iniciamos el programa
; // Luego visualiza por el LCD los caracteres que nos llegan
; // TxD en P1.4 y RxD en P1.6.  19200 baudios sin paridad
; //----------------------------------------------------------------------------
; 
; #include <m8c.h>        // part specific constants and macros
; #include "PSoCAPI.h"    // PSoC API definitions for all User Modules
; #include "stdlib.h"
; 
; void main()
; {	char x;
	.dbline 15
; 	int num;
; 	char a[10];
; 	Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 16
; 	Timer8_WriteCompareValue(156/2);
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 17
; 	Timer8_Start();
	xcall _Timer8_Start
	pop X
	.dbline 18
; 	LCD_Start();
	xcall _LCD_Start
	.dbline 19
; 	LCD_Init();
	xcall _LCD_Init
	.dbline 20
; 	LCD_PrCString("UART");
	mov A,>L2
	push A
	mov A,<L2
	push A
	xcall _LCD_PrCString
	add SP,-2
	.dbline 21
; 	UART_Start(UART_PARITY_NONE);
	push X
	mov A,0
	xcall _UART_Start
	pop X
	.dbline 22
; 	for (x='A';x<'Z';x++) 
	mov [X+0],65
	xjmp L6
L3:
	.dbline 23
	.dbline 23
	push X
	mov A,>L7
	push A
	mov A,<L7
	mov X,A
	pop A
	xcall _UART_CPutString
	pop X
	.dbline 24
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	pop X
	.dbline 25
	mov A,0
	push A
	mov A,10
	push A
	mov REG[0xd0],>__r0
	mov A,[X+0]
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	mov [__r1],X
	add [__r1],1
	mov A,7
	push A
	mov A,[__r1]
	push A
	xcall _itoa
	add SP,-6
	.dbline 26
	push X
	mov A,>L8
	push A
	mov A,<L8
	mov X,A
	pop A
	xcall _UART_CPutString
	pop X
	.dbline 27
	mov REG[0xd0],>__r0
	mov [__r1],X
	add [__r1],1
	push X
	mov A,7
	push A
	mov A,[__r1]
	mov X,A
	pop A
	xcall _UART_PutString
	.dbline 28
	mov A,>L9
	push A
	mov A,<L9
	mov X,A
	pop A
	xcall _UART_CPutString
	pop X
	.dbline 29
L4:
	.dbline 22
	inc [X+0]
L6:
	.dbline 22
	cmp [X+0],90
	jc L3
X1:
	.dbline 30
; 	{	UART_CPutString("La x vale ");
; 		UART_PutChar(x);
; 		itoa(a,x,10);
; 		UART_CPutString(" y en numero es ");		
; 		UART_PutString(a);
; 		UART_CPutString("\r\n");
; 	}
; 	LCD_Position(1,0);
	mov A,0
	push A
	push A
	push A
	mov A,1
	push A
	xcall _LCD_Position
	add SP,-4
	.dbline 31
; 	for(;;)
L10:
	.dbline 32
	.dbline 32
	push X
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 33
	mov A,[X+0]
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LCD_WriteData
	add SP,-2
	.dbline 35
	.dbline 31
	.dbline 31
	xjmp L10
X0:
	.dbline -2
L1:
	add SP,-13
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l num 11 I
	.dbsym l a 1 A[10:10]c
	.dbsym l x 0 c
	.dbend
	.area lit(rom, con, rel)
L9:
	.byte 13,10,0
L8:
	.byte 32,'y,32,'e,'n,32,'n,'u,'m,'e,'r,'o,32,'e,'s,32
	.byte 0
L7:
	.byte 'L,'a,32,'x,32,'v,'a,'l,'e,32,0
L2:
	.byte 'U,'A,'R,'T,0
