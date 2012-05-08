; Generated by PSoC Designer ver 4.4  b1884 : 14 Jan, 2007
;
;==========================================================================
;  PSoCConfig.asm
;  @PSOC_VERSION
;
;  Version: 0.85
;  Revised: June 22, 2004
;  Copyright Cypress MicroSystems 2000-2004. All Rights Reserved.
;
;  This file is generated by the Device Editor on Application Generation.
;  It contains code which loads the configuration data table generated in
;  the file PSoCConfigTBL.asm
;
;  DO NOT EDIT THIS FILE MANUALLY, AS IT IS OVERWRITTEN!!!
;  Edits to this file will not be preserved.
;==========================================================================
;
include "m8c.inc"
include "memory.inc"
include "GlobalParams.inc"

export LoadConfigInit
export _LoadConfigInit
export LoadConfig_trabajo
export _LoadConfig_trabajo
export Port_2_Data_SHADE
export _Port_2_Data_SHADE
export Port_2_DriveMode_0_SHADE
export _Port_2_DriveMode_0_SHADE
export Port_2_DriveMode_1_SHADE
export _Port_2_DriveMode_1_SHADE


export NO_SHADOW
export _NO_SHADOW

FLAG_CFG_MASK:      equ 10h         ;M8C flag register REG address bit mask
END_CONFIG_TABLE:   equ ffh         ;end of config table indicator

AREA psoc_config(rom, rel)


;---------------------------------------------------------------------------
; LoadConfigInit - Establish the start-up configuration (except for a few
;                  parameters handled by boot code, like CPU speed). This
;                  function can be called from user code, but typically it
;                  is only called from boot.
;
;       INPUTS: None.
;      RETURNS: Nothing.
; SIDE EFFECTS: Registers are volatile: the A and X registers can be modified!
;               In the large memory model currently only the page
;               pointer registers listed below are modified.  This does
;               not guarantee that in future implementations of this
;               function other page pointer registers will not be
;               modified.
;          
;               Page Pointer Registers Modified: 
;               CUR_PP
;
_LoadConfigInit:
 LoadConfigInit:
    RAM_PROLOGUE RAM_USE_CLASS_4
    
	mov		[Port_2_Data_SHADE], 0h
	mov		[Port_2_DriveMode_0_SHADE], ffh
	mov		[Port_2_DriveMode_1_SHADE], 0h

	lcall	LoadConfig_trabajo


    RAM_EPILOGUE RAM_USE_CLASS_4
    ret

;---------------------------------------------------------------------------
; Load Configuration trabajo
;
;    Load configuration registers for trabajo.
;    IO Bank 0 registers a loaded first,then those in IO Bank 1.
;
;       INPUTS: None.
;      RETURNS: Nothing.
; SIDE EFFECTS: Registers are volatile: the CPU A and X registers may be
;               modified as may the Page Pointer registers!
;               In the large memory model currently only the page
;               pointer registers listed below are modified.  This does
;               not guarantee that in future implementations of this
;               function other page pointer registers will not be
;               modified.
;          
;               Page Pointer Registers Modified: 
;               CUR_PP
;
_LoadConfig_trabajo:
 LoadConfig_trabajo:
    RAM_PROLOGUE RAM_USE_CLASS_4
    lcall   LoadConfigTBL_trabajo            ; Call load config table routine


    M8C_SetBank0                    ; Force return to bank 0
    RAM_EPILOGUE RAM_USE_CLASS_4
    ret



AREA InterruptRAM(ram, rel)

NO_SHADOW:
_NO_SHADOW:
; write only register shadows
_Port_2_Data_SHADE:
Port_2_Data_SHADE:	BLK	1
_Port_2_DriveMode_0_SHADE:
Port_2_DriveMode_0_SHADE:	BLK	1
_Port_2_DriveMode_1_SHADE:
Port_2_DriveMode_1_SHADE:	BLK	1

