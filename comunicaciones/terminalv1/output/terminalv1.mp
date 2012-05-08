  ROM 4% full. 1381 bytes used (does not include absolute areas).
  RAM 1% full. 24 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   01A0   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  __func_lit_start
       01A2  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   01A2   01E3 =    483. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A2  LoadConfigTBL_terminalv1
       0372  LoadConfigInit
       0372  _LoadConfigInit
       037F  _LoadConfig_terminalv1
       037F  LoadConfig_terminalv1
       0385  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   0385   02A9 =    681. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0385  _UART_TX_ISR
       0386  _UART_RX_ISR
       03F9  _UART_EnableInt
       03F9  UART_EnableInt
       0400  _UART_DisableInt
       0400  UART_DisableInt
       0407  _UART_SetTxIntMode
       0407  UART_SetTxIntMode
       0419  UART_Start
       0419  _UART_Start
       0422  _UART_Stop
       0422  UART_Stop
       0429  UART_SendData
       0429  _UART_SendData
       042C  UART_bReadTxStatus
       042C  bUART_ReadTxStatus
       042C  _bUART_ReadTxStatus
       042C  _UART_bReadTxStatus
       042F  _bUART_ReadRxData
       042F  bUART_ReadRxData
       042F  _UART_bReadRxData
       042F  UART_bReadRxData
       0432  bUART_ReadRxStatus
       0432  UART_bReadRxStatus
       0432  _bUART_ReadRxStatus
       0432  _UART_bReadRxStatus
       0435  UART_TxIntMode
       0435  _UART_TxIntMode
       0448  UART_IntCntl
       0448  _UART_IntCntl
       0473  UART_PutSHexByte
       0473  _UART_PutSHexByte
       0486  UART_PutSHexInt
       0486  _UART_PutSHexInt
       048D  UART_PutChar
       048D  _UART_PutChar
       0495  UART_cGetChar
       0495  _UART_cGetChar
       049D  UART_cReadChar
       049D  _UART_cReadChar
       04B4  UART_iReadChar
       04B4  _UART_iReadChar
       04CA  _UART_PutString
       04CA  UART_PutString
       04DC  _UART_Write
       04DC  UART_Write
       0504  _UART_CWrite
       0504  UART_CWrite
       0530  _UART_CPutString
       0530  UART_CPutString
       0542  UART_PutCRLF
       0542  _UART_PutCRLF
       054B  _UART_CmdReset
       054B  UART_CmdReset
       0561  UART_bCmdCheck
       0561  _UART_bCmdCheck
       0569  UART_bErrCheck
       0569  _UART_bErrCheck
       0574  _UART_bCmdLength
       0574  UART_bCmdLength
       057A  _UART_szGetParam
       057A  UART_szGetParam
       05D9  _UART_szGetRestOfParams
       05D9  UART_szGetRestOfParams
       05E4  _Timer8_ISR
       05E5  _Timer8_EnableInt
       05E5  Timer8_EnableInt
       05E9  Timer8_DisableInt
       05E9  _Timer8_DisableInt
       05ED  _Timer8_Start
       05ED  Timer8_Start
       05F1  _Timer8_Stop
       05F1  Timer8_Stop
       05F5  Timer8_WritePeriod
       05F5  _Timer8_WritePeriod
       05F8  Timer8_WriteCompareValue
       05F8  _Timer8_WriteCompareValue
       05FB  _Timer8_bReadCompareValue
       05FB  _bTimer8_ReadCompareValue
       05FB  bTimer8_ReadCompareValue
       05FB  Timer8_bReadCompareValue
       05FE  bTimer8_ReadCounter
       05FE  _bTimer8_ReadCounter
       05FE  _bTimer8_ReadTimerSaveCV
       05FE  _Timer8_bReadTimerSaveCV
       05FE  Timer8_bReadTimerSaveCV
       05FE  bTimer8_ReadTimerSaveCV
       0629  bTimer8_CaptureCounter
       0629  _bTimer8_ReadTimer
       0629  _Timer8_bReadTimer
       0629  bTimer8_ReadTimer
       0629  _bTimer8_CaptureCounter
       0629  Timer8_bReadTimer
       062E  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   062E   00D7 =    215. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       062E  _envia
       062E  __text_start
       0679  _recibe
       06CC  _main
       0705  __text_end
       0707  __xidata_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0068   013A =    314. bytes (abs,ovr,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       0137  bGetPowerSetting
       0137  _bGetPowerSetting

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0000   0005 =      5. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  UART_fStatus
       0000  _UART_fStatus
       0001  _UART_bRxCnt
       0001  UART_bRxCnt
       0002  _Port_2_Data_SHADE
       0002  _NO_SHADOW
       0002  NO_SHADOW
       0002  Port_2_Data_SHADE
       0003  Port_2_DriveMode_0_SHADE
       0003  _Port_2_DriveMode_0_SHADE
       0004  _Port_2_DriveMode_1_SHADE
       0004  Port_2_DriveMode_1_SHADE

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        UART_RAM   0000   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0005  UART_aRxBuffer
       0005  _UART_aRxBuffer

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0015   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0015  __r1
       0016  __r0

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, timer8int.asm, timer8.asm, psocconfigtbl.asm, psocconfig.asm, r1.asm, r0.asm ]


User Base Address Definitions

lit = 0x1a0
data = 0x0
SSCParmBlk:0x00F7.0x00FF
InterruptRAM = 0x0
virtual_registers = 0x15
terminalv1_RAM = 0x18

