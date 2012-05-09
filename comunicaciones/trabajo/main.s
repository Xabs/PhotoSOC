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
; //Prototipos
; void numero_a_LCD (int f_numero);
; 
; //Funciones usuario
; void numero_a_LCD (int f_numero)
; {
; 	char f_num[5],f_i,f_k;
; 	int f_division,f_mod,f_j;
	.dbline 22
; 	
; 	f_i=0;
; 	f_j=1000;
	mov [X+0],0
	.dbline 23
; 	f_mod=f_numero;
	mov [X+1],0
	xjmp L3
L2:
	.dbline 26
; 
; 	for (f_k=0;f_k<4;f_k++)
; 	{
	.dbline 27
; 		f_division=f_mod/f_j;	
	push X
	mov A,[X-4]
	xcall _UART_PutChar
	.dbline 28
; 		f_mod=f_mod%f_j;		
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+2],A
	.dbline 30
; 		
; 		if (f_division>0)
	mov A,[X+2]
	cmp A,[X-4]
	jnz L5
	.dbline 30
	mov [X+0],-5
L5:
	.dbline 31
; 			{
	push X
	mov A,[X+0]
	xcall _UART_PutChar
	pop X
	.dbline 32
; 				f_num[f_i]=f_division+48;
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 33
; 				f_i++;
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
; 			}
; 		if (f_division==0 && f_i>0)
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
; 			{
; 				f_num[f_i]=48;
; 				f_i++;
; 			}
; 		f_j=f_j/10;
; 	}
; 	
; 	f_num[f_i]=0;
; 	
; 	LCD_PrString (f_num);
; 	
; }
; 
; 
; //Programa principal
	.dbline 53
; void main()
; {	
; 	unsigned char x,prueba1,prueba2,prueba3;
	mov [X+0],0
	.dbline 54
; 	unsigned int temp1;
	mov [X+1],0
	xjmp L11
L10:
	.dbline 57
; 	
; 	//- Inicializacion de parametros basicos del sistema al encender	
; 		Timer8_WritePeriod(156);		//Este valor es Fosc/Baudios/8
	.dbline 58
; 		Timer8_WriteCompareValue(156/2);
	push X
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+2],A
	.dbline 59
; 		Timer8_Start();
	push X
	mov A,[X+2]
	xcall _UART_PutChar
	.dbline 61
; 		
; 		UART_Start(UART_PARITY_NONE);
	xcall _UART_cGetChar
	mov REG[0xd0],>__r0
	pop X
	mov [X+0],A
	.dbline 62
; 		
	cmp [X+0],-5
	jnz L13
	.dbline 62
	mov A,[X+2]
	xjmp L9
L13:
	.dbline 63
; 		LCD_Start();
	mov A,[X+1]
	mov REG[0xd0],>__r0
	mov [__r0],A
	add A,1
	mov [X+1],A
	mov A,[__r0]
	mov [X+1],A
	.dbline 64
; 		LCD_Init();	
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
; 		
; 		LCD_Control(0x01);
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
	.dbfunc e numero_a_LCD _numero_a_LCD fV
;          f_num -> X+8
;            f_k -> X+7
;          f_mod -> X+5
;            f_i -> X+4
;     f_division -> X+2
;            f_j -> X+0
;       f_numero -> X-5
_numero_a_LCD::
	.dbline -1
	push X
	mov X,SP
	add SP,13
	.dbline 17
	.dbline 21
	mov [X+4],0
	.dbline 22
	mov [X+1],-24
	mov [X+0],3
	.dbline 23
	mov A,[X-4]
	mov [X+6],A
	mov A,[X-5]
	mov [X+5],A
	.dbline 25
	mov [X+7],0
	xjmp L21
L18:
	.dbline 26
	.dbline 27
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov A,[X+5]
	push A
	mov A,[X+6]
	push A
	mov REG[0xd0],>__r0
	xcall __divmod_16X16_16
	pop A
	mov [X+3],A
	pop A
	mov [X+2],A
	add SP,-2
	.dbline 28
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov A,[X+5]
	push A
	mov A,[X+6]
	push A
	xcall __divmod_16X16_16
	add SP,-2
	pop A
	mov [X+6],A
	pop A
	mov [X+5],A
	.dbline 30
	mov A,0
	sub A,[X+3]
	mov A,[X+2]
	xor A,-128
	mov [__rX],A
	mov A,(0 ^ 0x80)
	sbb A,[__rX]
	jnc L22
X0:
	.dbline 31
	.dbline 32
	mov REG[0xd0],>__r0
	mov A,[X+3]
	add A,48
	mov [__r0],A
	mov [__r2],7
	mov [__r3],X
	add [__r3],8
	mov A,[X+4]
	add A,[__r3]
	mov [__r3],A
	mov A,0
	adc A,[__r2]
	mov REG[0xd5],A
	mov A,[__r0]
	mvi [__r3],A
	.dbline 33
	inc [X+4]
	.dbline 34
L22:
	.dbline 35
	cmp [X+2],0
	jnz L24
	cmp [X+3],0
	jnz L24
X1:
	mov A,0
	cmp A,[X+4]
	jnc L24
X2:
	.dbline 36
	.dbline 37
	mov REG[0xd0],>__r0
	mov [__r0],7
	mov [__r1],X
	add [__r1],8
	mov A,[X+4]
	add A,[__r1]
	mov [__r1],A
	mov A,0
	adc A,[__r0]
	mov REG[0xd5],A
	mov A,48
	mvi [__r1],A
	.dbline 38
	inc [X+4]
	.dbline 39
L24:
	.dbline 40
	mov A,0
	push A
	mov A,10
	push A
	mov A,[X+0]
	push A
	mov A,[X+1]
	push A
	mov REG[0xd0],>__r0
	xcall __divmod_16X16_16
	pop A
	mov [X+1],A
	pop A
	mov [X+0],A
	add SP,-2
	.dbline 41
L19:
	.dbline 25
	inc [X+7]
L21:
	.dbline 25
	cmp [X+7],4
	jc L18
X3:
	.dbline 43
	mov REG[0xd0],>__r0
	mov [__r0],7
	mov [__r1],X
	add [__r1],8
	mov A,[X+4]
	add A,[__r1]
	mov [__r1],A
	mov A,0
	adc A,[__r0]
	mov REG[0xd5],A
	mov A,0
	mvi [__r1],A
	.dbline 45
	mov [__r1],X
	add [__r1],8
	push X
	mov A,7
	push A
	mov A,[__r1]
	mov X,A
	pop A
	xcall _LCD_PrString
	pop X
	.dbline -2
	.dbline 47
L17:
	add SP,-13
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l f_num 8 A[5:5]c
	.dbsym l f_k 7 c
	.dbsym l f_mod 5 I
	.dbsym l f_i 4 c
	.dbsym l f_division 2 I
	.dbsym l f_j 0 I
	.dbsym l f_numero -5 I
	.dbend
	.dbfunc e main _main fV
;              x -> X+5
;        prueba3 -> X+4
;        prueba2 -> X+3
;        prueba1 -> X+2
;          temp1 -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,6
	.dbline 52
	.dbline 57
	push X
	mov A,-100
	xcall _Timer8_WritePeriod
	.dbline 58
	mov A,78
	xcall _Timer8_WriteCompareValue
	.dbline 59
	xcall _Timer8_Start
	.dbline 61
	mov A,0
	xcall _UART_Start
	.dbline 63
	xcall _LCD_Start
	.dbline 64
	xcall _LCD_Init
	.dbline 66
	mov A,1
	xcall _LCD_Control
	.dbline 67
; 		LCD_PrCString ("Recibiendo");	
	mov A,>L27
	push A
	mov A,<L27
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 68
	mov [X+1],0
	mov [X+0],0
	xjmp L31
L28:
	.dbline 68
L29:
	.dbline 68
	inc [X+1]
	adc [X+0],0
L31:
	.dbline 68
; 		for (temp1=0;temp1<50000;temp1++);
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
	jc L28
X4:
	.dbline 69
; 		LCD_Control(0x01);
	push X
	mov A,1
	xcall _LCD_Control
	pop X
	.dbline 72
; 	
; 	// Recepción de datos
; 		prueba1=recibe();
	xcall _recibe
	mov REG[0xd0],>__r0
	mov [X+2],A
	.dbline 73
; 		prueba2=recibe();
	xcall _recibe
	mov REG[0xd0],>__r0
	mov [X+3],A
	.dbline 74
; 		prueba3=recibe();
	xcall _recibe
	mov REG[0xd0],>__r0
	mov [X+4],A
	.dbline 77
; 		
; 	//Envio al LCD	
; 		LCD_Control(0x01);
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 78
; 		LCD_PrCString ("prueba1");	
	mov A,>L32
	push A
	mov A,<L32
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 79
	mov [X+1],0
	mov [X+0],0
	xjmp L36
L33:
	.dbline 79
L34:
	.dbline 79
	inc [X+1]
	adc [X+0],0
L36:
	.dbline 79
; 		for (temp1=0;temp1<50000;temp1++);
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
	jc L33
X5:
	.dbline 80
; 		LCD_Control(0x01);
	push X
	mov A,1
	xcall _LCD_Control
	pop X
	.dbline 81
; 		numero_a_LCD(prueba1);		
	mov REG[0xd0],>__r0
	mov A,[X+2]
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _numero_a_LCD
	add SP,-2
	.dbline 82
	mov [X+1],0
	mov [X+0],0
	xjmp L40
L37:
	.dbline 82
L38:
	.dbline 82
	inc [X+1]
	adc [X+0],0
L40:
	.dbline 82
; 		for (temp1=0;temp1<50000;temp1++);
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
	jc L37
X6:
	.dbline 83
; 		LCD_Control(0x01);
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 84
; 		LCD_PrCString ("Prueba2");	
	mov A,>L41
	push A
	mov A,<L41
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 85
	mov [X+1],0
	mov [X+0],0
	xjmp L45
L42:
	.dbline 85
L43:
	.dbline 85
	inc [X+1]
	adc [X+0],0
L45:
	.dbline 85
; 		for (temp1=0;temp1<50000;temp1++);
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
	jc L42
X7:
	.dbline 86
; 		LCD_Control(0x01);
	push X
	mov A,1
	xcall _LCD_Control
	pop X
	.dbline 87
; 		numero_a_LCD(prueba2);		
	mov REG[0xd0],>__r0
	mov A,[X+3]
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _numero_a_LCD
	add SP,-2
	.dbline 88
	mov [X+1],0
	mov [X+0],0
	xjmp L49
L46:
	.dbline 88
L47:
	.dbline 88
	inc [X+1]
	adc [X+0],0
L49:
	.dbline 88
; 		for (temp1=0;temp1<50000;temp1++);
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
	jc L46
X8:
	.dbline 89
; 		LCD_Control(0x01);
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 90
; 		LCD_PrCString ("Prueba3");	
	mov A,>L50
	push A
	mov A,<L50
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 91
	mov [X+1],0
	mov [X+0],0
	xjmp L54
L51:
	.dbline 91
L52:
	.dbline 91
	inc [X+1]
	adc [X+0],0
L54:
	.dbline 91
; 		for (temp1=0;temp1<50000;temp1++);
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
	jc L51
X9:
	.dbline 92
; 		LCD_Control(0x01);
	push X
	mov A,1
	xcall _LCD_Control
	pop X
	.dbline 93
; 		numero_a_LCD(prueba3);		
	mov REG[0xd0],>__r0
	mov A,[X+4]
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _numero_a_LCD
	add SP,-2
	.dbline 94
	mov [X+1],0
	mov [X+0],0
	xjmp L58
L55:
	.dbline 94
L56:
	.dbline 94
	inc [X+1]
	adc [X+0],0
L58:
	.dbline 94
; 		for (temp1=0;temp1<50000;temp1++);
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
	jc L55
X10:
	.dbline 96
; 
; 		LCD_Control(0x01);
	push X
	mov A,1
	xcall _LCD_Control
	.dbline 97
; 		LCD_PrCString ("Fin programa");	
	mov A,>L59
	push A
	mov A,<L59
	mov X,A
	pop A
	xcall _LCD_PrCString
	pop X
	.dbline 98
	mov [X+1],0
	mov [X+0],0
	xjmp L63
L60:
	.dbline 98
L61:
	.dbline 98
	inc [X+1]
	adc [X+0],0
L63:
	.dbline 98
; 		for (temp1=0;temp1<50000;temp1++);
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
	jc L60
X11:
	.dbline -2
	.dbline 99
; }
L26:
	add SP,-6
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l x 5 c
	.dbsym l prueba3 4 c
	.dbsym l prueba2 3 c
	.dbsym l prueba1 2 c
	.dbsym l temp1 0 i
	.dbend
	.area lit(rom, con, rel)
L59:
	.byte 'F,'i,'n,32,'p,'r,'o,'g,'r,'a,'m,'a,0
L50:
	.byte 'P,'r,'u,'e,'b,'a,51,0
L41:
	.byte 'P,'r,'u,'e,'b,'a,50,0
L32:
	.byte 'p,'r,'u,'e,'b,'a,49,0
L27:
	.byte 'R,'e,'c,'i,'b,'i,'e,'n,'d,'o,0
