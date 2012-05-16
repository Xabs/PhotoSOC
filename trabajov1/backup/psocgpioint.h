/******************************************************************************
*  Generated by PSoC Designer ver 4.4  b1884 : 14 Jan, 2007
******************************************************************************/
#include <m8c.h>
/*
*   PSoCGPIOINT.h
*   Data: 04 June, 2002
*   Copyright Cypress MicroSystems 2002
*
*  This file is generated by the Device Editor on Application Generation.
*  It contains equates that are useful in writing code relating to GPIO
*  related values.
*  
*  DO NOT EDIT THIS FILE MANUALLY, AS IT IS OVERWRITTEN!!!
*  Edits to this file will not be preserved.
*/
// Entrada4_12V address and mask defines
#pragma	ioport	Entrada4_12V_Data_ADDR:	0x0
BYTE			Entrada4_12V_Data_ADDR;
#pragma	ioport	Entrada4_12V_DriveMode_0_ADDR:	0x100
BYTE			Entrada4_12V_DriveMode_0_ADDR;
#pragma	ioport	Entrada4_12V_DriveMode_1_ADDR:	0x101
BYTE			Entrada4_12V_DriveMode_1_ADDR;
#pragma	ioport	Entrada4_12V_DriveMode_2_ADDR:	0x3
BYTE			Entrada4_12V_DriveMode_2_ADDR;
#pragma	ioport	Entrada4_12V_GlobalSelect_ADDR:	0x2
BYTE			Entrada4_12V_GlobalSelect_ADDR;
#pragma	ioport	Entrada4_12V_IntCtrl_0_ADDR:	0x102
BYTE			Entrada4_12V_IntCtrl_0_ADDR;
#pragma	ioport	Entrada4_12V_IntCtrl_1_ADDR:	0x103
BYTE			Entrada4_12V_IntCtrl_1_ADDR;
#pragma	ioport	Entrada4_12V_IntEn_ADDR:	0x1
BYTE			Entrada4_12V_IntEn_ADDR;
#define Entrada4_12V_MASK 0x80
// Flash1 address and mask defines
#pragma	ioport	Flash1_Data_ADDR:	0x0
BYTE			Flash1_Data_ADDR;
#pragma	ioport	Flash1_DriveMode_0_ADDR:	0x100
BYTE			Flash1_DriveMode_0_ADDR;
#pragma	ioport	Flash1_DriveMode_1_ADDR:	0x101
BYTE			Flash1_DriveMode_1_ADDR;
#pragma	ioport	Flash1_DriveMode_2_ADDR:	0x3
BYTE			Flash1_DriveMode_2_ADDR;
#pragma	ioport	Flash1_GlobalSelect_ADDR:	0x2
BYTE			Flash1_GlobalSelect_ADDR;
#pragma	ioport	Flash1_IntCtrl_0_ADDR:	0x102
BYTE			Flash1_IntCtrl_0_ADDR;
#pragma	ioport	Flash1_IntCtrl_1_ADDR:	0x103
BYTE			Flash1_IntCtrl_1_ADDR;
#pragma	ioport	Flash1_IntEn_ADDR:	0x1
BYTE			Flash1_IntEn_ADDR;
#define Flash1_MASK 0x1
// Entrada1_5V address and mask defines
#pragma	ioport	Entrada1_5V_Data_ADDR:	0x0
BYTE			Entrada1_5V_Data_ADDR;
#pragma	ioport	Entrada1_5V_DriveMode_0_ADDR:	0x100
BYTE			Entrada1_5V_DriveMode_0_ADDR;
#pragma	ioport	Entrada1_5V_DriveMode_1_ADDR:	0x101
BYTE			Entrada1_5V_DriveMode_1_ADDR;
#pragma	ioport	Entrada1_5V_DriveMode_2_ADDR:	0x3
BYTE			Entrada1_5V_DriveMode_2_ADDR;
#pragma	ioport	Entrada1_5V_GlobalSelect_ADDR:	0x2
BYTE			Entrada1_5V_GlobalSelect_ADDR;
#pragma	ioport	Entrada1_5V_IntCtrl_0_ADDR:	0x102
BYTE			Entrada1_5V_IntCtrl_0_ADDR;
#pragma	ioport	Entrada1_5V_IntCtrl_1_ADDR:	0x103
BYTE			Entrada1_5V_IntCtrl_1_ADDR;
#pragma	ioport	Entrada1_5V_IntEn_ADDR:	0x1
BYTE			Entrada1_5V_IntEn_ADDR;
#define Entrada1_5V_MASK 0x2
// Flash2 address and mask defines
#pragma	ioport	Flash2_Data_ADDR:	0x0
BYTE			Flash2_Data_ADDR;
#pragma	ioport	Flash2_DriveMode_0_ADDR:	0x100
BYTE			Flash2_DriveMode_0_ADDR;
#pragma	ioport	Flash2_DriveMode_1_ADDR:	0x101
BYTE			Flash2_DriveMode_1_ADDR;
#pragma	ioport	Flash2_DriveMode_2_ADDR:	0x3
BYTE			Flash2_DriveMode_2_ADDR;
#pragma	ioport	Flash2_GlobalSelect_ADDR:	0x2
BYTE			Flash2_GlobalSelect_ADDR;
#pragma	ioport	Flash2_IntCtrl_0_ADDR:	0x102
BYTE			Flash2_IntCtrl_0_ADDR;
#pragma	ioport	Flash2_IntCtrl_1_ADDR:	0x103
BYTE			Flash2_IntCtrl_1_ADDR;
#pragma	ioport	Flash2_IntEn_ADDR:	0x1
BYTE			Flash2_IntEn_ADDR;
#define Flash2_MASK 0x4
// Entrada2_5V address and mask defines
#pragma	ioport	Entrada2_5V_Data_ADDR:	0x0
BYTE			Entrada2_5V_Data_ADDR;
#pragma	ioport	Entrada2_5V_DriveMode_0_ADDR:	0x100
BYTE			Entrada2_5V_DriveMode_0_ADDR;
#pragma	ioport	Entrada2_5V_DriveMode_1_ADDR:	0x101
BYTE			Entrada2_5V_DriveMode_1_ADDR;
#pragma	ioport	Entrada2_5V_DriveMode_2_ADDR:	0x3
BYTE			Entrada2_5V_DriveMode_2_ADDR;
#pragma	ioport	Entrada2_5V_GlobalSelect_ADDR:	0x2
BYTE			Entrada2_5V_GlobalSelect_ADDR;
#pragma	ioport	Entrada2_5V_IntCtrl_0_ADDR:	0x102
BYTE			Entrada2_5V_IntCtrl_0_ADDR;
#pragma	ioport	Entrada2_5V_IntCtrl_1_ADDR:	0x103
BYTE			Entrada2_5V_IntCtrl_1_ADDR;
#pragma	ioport	Entrada2_5V_IntEn_ADDR:	0x1
BYTE			Entrada2_5V_IntEn_ADDR;
#define Entrada2_5V_MASK 0x8
// Flash3 address and mask defines
#pragma	ioport	Flash3_Data_ADDR:	0x0
BYTE			Flash3_Data_ADDR;
#pragma	ioport	Flash3_DriveMode_0_ADDR:	0x100
BYTE			Flash3_DriveMode_0_ADDR;
#pragma	ioport	Flash3_DriveMode_1_ADDR:	0x101
BYTE			Flash3_DriveMode_1_ADDR;
#pragma	ioport	Flash3_DriveMode_2_ADDR:	0x3
BYTE			Flash3_DriveMode_2_ADDR;
#pragma	ioport	Flash3_GlobalSelect_ADDR:	0x2
BYTE			Flash3_GlobalSelect_ADDR;
#pragma	ioport	Flash3_IntCtrl_0_ADDR:	0x102
BYTE			Flash3_IntCtrl_0_ADDR;
#pragma	ioport	Flash3_IntCtrl_1_ADDR:	0x103
BYTE			Flash3_IntCtrl_1_ADDR;
#pragma	ioport	Flash3_IntEn_ADDR:	0x1
BYTE			Flash3_IntEn_ADDR;
#define Flash3_MASK 0x10
// Entrada3_12V address and mask defines
#pragma	ioport	Entrada3_12V_Data_ADDR:	0x0
BYTE			Entrada3_12V_Data_ADDR;
#pragma	ioport	Entrada3_12V_DriveMode_0_ADDR:	0x100
BYTE			Entrada3_12V_DriveMode_0_ADDR;
#pragma	ioport	Entrada3_12V_DriveMode_1_ADDR:	0x101
BYTE			Entrada3_12V_DriveMode_1_ADDR;
#pragma	ioport	Entrada3_12V_DriveMode_2_ADDR:	0x3
BYTE			Entrada3_12V_DriveMode_2_ADDR;
#pragma	ioport	Entrada3_12V_GlobalSelect_ADDR:	0x2
BYTE			Entrada3_12V_GlobalSelect_ADDR;
#pragma	ioport	Entrada3_12V_IntCtrl_0_ADDR:	0x102
BYTE			Entrada3_12V_IntCtrl_0_ADDR;
#pragma	ioport	Entrada3_12V_IntCtrl_1_ADDR:	0x103
BYTE			Entrada3_12V_IntCtrl_1_ADDR;
#pragma	ioport	Entrada3_12V_IntEn_ADDR:	0x1
BYTE			Entrada3_12V_IntEn_ADDR;
#define Entrada3_12V_MASK 0x20
// Flash4 address and mask defines
#pragma	ioport	Flash4_Data_ADDR:	0x0
BYTE			Flash4_Data_ADDR;
#pragma	ioport	Flash4_DriveMode_0_ADDR:	0x100
BYTE			Flash4_DriveMode_0_ADDR;
#pragma	ioport	Flash4_DriveMode_1_ADDR:	0x101
BYTE			Flash4_DriveMode_1_ADDR;
#pragma	ioport	Flash4_DriveMode_2_ADDR:	0x3
BYTE			Flash4_DriveMode_2_ADDR;
#pragma	ioport	Flash4_GlobalSelect_ADDR:	0x2
BYTE			Flash4_GlobalSelect_ADDR;
#pragma	ioport	Flash4_IntCtrl_0_ADDR:	0x102
BYTE			Flash4_IntCtrl_0_ADDR;
#pragma	ioport	Flash4_IntCtrl_1_ADDR:	0x103
BYTE			Flash4_IntCtrl_1_ADDR;
#pragma	ioport	Flash4_IntEn_ADDR:	0x1
BYTE			Flash4_IntEn_ADDR;
#define Flash4_MASK 0x40
// _ address and mask defines
#pragma	ioport	__Data_ADDR:	0x4
BYTE			__Data_ADDR;
#pragma	ioport	__DriveMode_0_ADDR:	0x104
BYTE			__DriveMode_0_ADDR;
#pragma	ioport	__DriveMode_1_ADDR:	0x105
BYTE			__DriveMode_1_ADDR;
#pragma	ioport	__DriveMode_2_ADDR:	0x7
BYTE			__DriveMode_2_ADDR;
#pragma	ioport	__GlobalSelect_ADDR:	0x6
BYTE			__GlobalSelect_ADDR;
#pragma	ioport	__IntCtrl_0_ADDR:	0x106
BYTE			__IntCtrl_0_ADDR;
#pragma	ioport	__IntCtrl_1_ADDR:	0x107
BYTE			__IntCtrl_1_ADDR;
#pragma	ioport	__IntEn_ADDR:	0x5
BYTE			__IntEn_ADDR;
#define __MASK 0x1
// UART_TX address and mask defines
#pragma	ioport	UART_TX_Data_ADDR:	0x4
BYTE			UART_TX_Data_ADDR;
#pragma	ioport	UART_TX_DriveMode_0_ADDR:	0x104
BYTE			UART_TX_DriveMode_0_ADDR;
#pragma	ioport	UART_TX_DriveMode_1_ADDR:	0x105
BYTE			UART_TX_DriveMode_1_ADDR;
#pragma	ioport	UART_TX_DriveMode_2_ADDR:	0x7
BYTE			UART_TX_DriveMode_2_ADDR;
#pragma	ioport	UART_TX_GlobalSelect_ADDR:	0x6
BYTE			UART_TX_GlobalSelect_ADDR;
#pragma	ioport	UART_TX_IntCtrl_0_ADDR:	0x106
BYTE			UART_TX_IntCtrl_0_ADDR;
#pragma	ioport	UART_TX_IntCtrl_1_ADDR:	0x107
BYTE			UART_TX_IntCtrl_1_ADDR;
#pragma	ioport	UART_TX_IntEn_ADDR:	0x5
BYTE			UART_TX_IntEn_ADDR;
#define UART_TX_MASK 0x10
// UART_RX address and mask defines
#pragma	ioport	UART_RX_Data_ADDR:	0x4
BYTE			UART_RX_Data_ADDR;
#pragma	ioport	UART_RX_DriveMode_0_ADDR:	0x104
BYTE			UART_RX_DriveMode_0_ADDR;
#pragma	ioport	UART_RX_DriveMode_1_ADDR:	0x105
BYTE			UART_RX_DriveMode_1_ADDR;
#pragma	ioport	UART_RX_DriveMode_2_ADDR:	0x7
BYTE			UART_RX_DriveMode_2_ADDR;
#pragma	ioport	UART_RX_GlobalSelect_ADDR:	0x6
BYTE			UART_RX_GlobalSelect_ADDR;
#pragma	ioport	UART_RX_IntCtrl_0_ADDR:	0x106
BYTE			UART_RX_IntCtrl_0_ADDR;
#pragma	ioport	UART_RX_IntCtrl_1_ADDR:	0x107
BYTE			UART_RX_IntCtrl_1_ADDR;
#pragma	ioport	UART_RX_IntEn_ADDR:	0x5
BYTE			UART_RX_IntEn_ADDR;
#define UART_RX_MASK 0x40
// Enfoque1 address and mask defines
#pragma	ioport	Enfoque1_Data_ADDR:	0x8
BYTE			Enfoque1_Data_ADDR;
#pragma	ioport	Enfoque1_DriveMode_0_ADDR:	0x108
BYTE			Enfoque1_DriveMode_0_ADDR;
#pragma	ioport	Enfoque1_DriveMode_1_ADDR:	0x109
BYTE			Enfoque1_DriveMode_1_ADDR;
#pragma	ioport	Enfoque1_DriveMode_2_ADDR:	0xb
BYTE			Enfoque1_DriveMode_2_ADDR;
#pragma	ioport	Enfoque1_GlobalSelect_ADDR:	0xa
BYTE			Enfoque1_GlobalSelect_ADDR;
#pragma	ioport	Enfoque1_IntCtrl_0_ADDR:	0x10a
BYTE			Enfoque1_IntCtrl_0_ADDR;
#pragma	ioport	Enfoque1_IntCtrl_1_ADDR:	0x10b
BYTE			Enfoque1_IntCtrl_1_ADDR;
#pragma	ioport	Enfoque1_IntEn_ADDR:	0x9
BYTE			Enfoque1_IntEn_ADDR;
#define Enfoque1_MASK 0x1
// Obturador1 address and mask defines
#pragma	ioport	Obturador1_Data_ADDR:	0x8
BYTE			Obturador1_Data_ADDR;
#pragma	ioport	Obturador1_DriveMode_0_ADDR:	0x108
BYTE			Obturador1_DriveMode_0_ADDR;
#pragma	ioport	Obturador1_DriveMode_1_ADDR:	0x109
BYTE			Obturador1_DriveMode_1_ADDR;
#pragma	ioport	Obturador1_DriveMode_2_ADDR:	0xb
BYTE			Obturador1_DriveMode_2_ADDR;
#pragma	ioport	Obturador1_GlobalSelect_ADDR:	0xa
BYTE			Obturador1_GlobalSelect_ADDR;
#pragma	ioport	Obturador1_IntCtrl_0_ADDR:	0x10a
BYTE			Obturador1_IntCtrl_0_ADDR;
#pragma	ioport	Obturador1_IntCtrl_1_ADDR:	0x10b
BYTE			Obturador1_IntCtrl_1_ADDR;
#pragma	ioport	Obturador1_IntEn_ADDR:	0x9
BYTE			Obturador1_IntEn_ADDR;
#define Obturador1_MASK 0x4
// Enfoque2 address and mask defines
#pragma	ioport	Enfoque2_Data_ADDR:	0x8
BYTE			Enfoque2_Data_ADDR;
#pragma	ioport	Enfoque2_DriveMode_0_ADDR:	0x108
BYTE			Enfoque2_DriveMode_0_ADDR;
#pragma	ioport	Enfoque2_DriveMode_1_ADDR:	0x109
BYTE			Enfoque2_DriveMode_1_ADDR;
#pragma	ioport	Enfoque2_DriveMode_2_ADDR:	0xb
BYTE			Enfoque2_DriveMode_2_ADDR;
#pragma	ioport	Enfoque2_GlobalSelect_ADDR:	0xa
BYTE			Enfoque2_GlobalSelect_ADDR;
#pragma	ioport	Enfoque2_IntCtrl_0_ADDR:	0x10a
BYTE			Enfoque2_IntCtrl_0_ADDR;
#pragma	ioport	Enfoque2_IntCtrl_1_ADDR:	0x10b
BYTE			Enfoque2_IntCtrl_1_ADDR;
#pragma	ioport	Enfoque2_IntEn_ADDR:	0x9
BYTE			Enfoque2_IntEn_ADDR;
#define Enfoque2_MASK 0x10
// Obturador2 address and mask defines
#pragma	ioport	Obturador2_Data_ADDR:	0x8
BYTE			Obturador2_Data_ADDR;
#pragma	ioport	Obturador2_DriveMode_0_ADDR:	0x108
BYTE			Obturador2_DriveMode_0_ADDR;
#pragma	ioport	Obturador2_DriveMode_1_ADDR:	0x109
BYTE			Obturador2_DriveMode_1_ADDR;
#pragma	ioport	Obturador2_DriveMode_2_ADDR:	0xb
BYTE			Obturador2_DriveMode_2_ADDR;
#pragma	ioport	Obturador2_GlobalSelect_ADDR:	0xa
BYTE			Obturador2_GlobalSelect_ADDR;
#pragma	ioport	Obturador2_IntCtrl_0_ADDR:	0x10a
BYTE			Obturador2_IntCtrl_0_ADDR;
#pragma	ioport	Obturador2_IntCtrl_1_ADDR:	0x10b
BYTE			Obturador2_IntCtrl_1_ADDR;
#pragma	ioport	Obturador2_IntEn_ADDR:	0x9
BYTE			Obturador2_IntEn_ADDR;
#define Obturador2_MASK 0x40
