;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: Timer1seg.inc
;;   Version: 2.5, Updated on 2006/06/19 at 11:17:22
;;  Generated by PSoC Designer ver 4.4  b1884 : 14 Jan, 2007
;;
;;  DESCRIPTION: Assembler declarations for the Timer16 user module interface
;;               for the 22/24/27/29xxx PSoC family of devices
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress MicroSystems 2000-2004. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"


;--------------------------------------------------
; Constants for Timer1seg API's.
;--------------------------------------------------

Timer1seg_CONTROL_REG_START_BIT:           equ 0x01    ; Control register start bit
Timer1seg_INT_REG:                         equ 0x0e1
Timer1seg_INT_MASK:                        equ 0x20


;--------------------------------------------------
; Constants for Timer1seg user defined values
;--------------------------------------------------

Timer1seg_PERIOD:                          equ 0x0
Timer1seg_COMPARE_VALUE:                   equ 0x0


;--------------------------------------------------
; Register Address Constants for Timer1seg
;--------------------------------------------------

Timer1seg_COUNTER_LSB_REG:             equ 0x30   ; DR0 Counter register
Timer1seg_COUNTER_MSB_REG:             equ 0x34
Timer1seg_PERIOD_LSB_REG:              equ 0x31   ; DR1 Period register
Timer1seg_PERIOD_MSB_REG:              equ 0x35
Timer1seg_COMPARE_LSB_REG:             equ 0x32   ; DR2 CompareValue register
Timer1seg_COMPARE_MSB_REG:             equ 0x36
Timer1seg_CONTROL_LSB_REG:             equ 0x33   ; Control register
Timer1seg_CONTROL_MSB_REG:             equ 0x37
Timer1seg_FUNC_LSB_REG:                equ 0x30   ; Function register
Timer1seg_FUNC_MSB_REG:                equ 0x34
Timer1seg_INPUT_LSB_REG:               equ 0x31   ; Input register
Timer1seg_INPUT_MSB_REG:               equ 0x35
Timer1seg_OUTPUT_LSB_REG:              equ 0x32   ; Output register
Timer1seg_OUTPUT_MSB_REG:              equ 0x36


;--------------------------------------------------
; Timer1seg Macro 'Functions'
;--------------------------------------------------

   macro Timer1seg_Start_M
   or    reg[Timer1seg_CONTROL_LSB_REG],  Timer1seg_CONTROL_REG_START_BIT
   endm

   macro Timer1seg_Stop_M
   and   reg[Timer1seg_CONTROL_LSB_REG], ~Timer1seg_CONTROL_REG_START_BIT
   endm

   macro Timer1seg_EnableInt_M
   M8C_EnableIntMask Timer1seg_INT_REG, Timer1seg_INT_MASK
   endm

   macro Timer1seg_DisableInt_M
   M8C_DisableIntMask Timer1seg_INT_REG, Timer1seg_INT_MASK
   endm


; end of file Timer1seg.inc
