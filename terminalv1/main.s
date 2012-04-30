	cpu LMM
	.module main.c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.dbfunc e main _main fV
;              x -> X+1
;             xx -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,2
	.dbline 12
; //------------------------------------------------------------//
; //   Proyecto de GS Desarrollo Productos Electronicos EPSS	  //
; //                 By Albert Sagol & Xavi Vicient			  //
; //               PhotoSoC - Controlador fotográfico		  	  //
; //------------------------------------------------------------//
; 
; #include <m8c.h>        // part specific constants and macros
; #include "PSoCAPI.h"    // PSoC API definitions for all User Modules
; #include "stdlib.h"
; 
; void main()
; {	char x,xx;
	.dbline 17
; 	
; 	//Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
; 	//Timer8_WriteCompareValue(156/2);
; 	//Timer8_Start();
; 	LCD_Start();
	push X
	xcall _LCD_Start
	.dbline 18
; 	LCD_Init();
	xcall _LCD_Init
	.dbline 20
; 	
; 	LCD_PrCString("PHOTOSoC V0");
	mov A,>L2
	push A
	mov A,<L2
	mov X,A
	pop A
	xcall _LCD_PrCString
	.dbline 22
; 	//UART_Start(UART_PARITY_NONE);
; 	LCD_Position (1,0);
	mov X,0
	mov A,1
	xcall _LCD_Position
	pop X
	.dbline 29
; 	
; 	
; 	//for(;;)
; 	//{ x=UART_cGetChar();  //Esta se espera a que llegue un byte. Ver tambien UART_cReadChar()
; 	//  LCD_WriteData(x);
; 	//}
; 	PRT0DR=PRT0DR|0x20;
	or REG[ 0],32
	.dbline 30
; 	for (;;)
	.dbline 31
; 	{
L7:
	.dbline 32
L8:
	.dbline 32
; 	while((PRT0DR & 0x20)==0x20);
	mov A,REG[ 0]
	mov REG[0xd0],>__r0
	mov [__r0],A
	and [__r0],32
	cmp [__r0],32
	jz L7
	.dbline 33
; 	PRT0DR=PRT0DR|0x20;
	or REG[ 0],32
	.dbline 34
	mov [X+0],0
	xjmp L13
L10:
	.dbline 34
L11:
	.dbline 34
	inc [X+0]
L13:
	.dbline 34
; 	for(xx=0;xx<100;xx++);
	cmp [X+0],100
	jc L10
X1:
	xjmp L15
L14:
	.dbline 35
	or REG[ 0],32
L15:
	.dbline 35
; 	while((PRT0DR & 0x20)==0x00)	PRT0DR=PRT0DR|0x20;
	tst REG[ 0],32
	jz L14
	.dbline 36
	mov [X+0],0
	xjmp L20
L17:
	.dbline 36
L18:
	.dbline 36
	inc [X+0]
L20:
	.dbline 36
	cmp [X+0],100
	jc L17
X2:
	.dbline 37
	push X
	mov A,>L21
	push A
	mov A,<L21
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 38
	.dbline 30
	.dbline 30
	xjmp L8
X0:
	.dbline -2
L1:
	add SP,-2
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l x 1 c
	.dbsym l xx 0 c
	.dbend
	.area lit(rom, con, rel)
L21:
	.byte 'B,'o,'t,'o,'n,32,'r,'o,'j,'o,0
L2:
	.byte 'P,'H,'O,'T,'O,'S,'o,'C,32,'V,48,0
