  ROM 4% full. 1540 bytes used (does not include absolute areas).
  RAM 1% full. 34 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   01A0   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  __func_lit_start
       01A2  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   01A2   01DA =    474. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A2  LoadConfigTBL_trabajov1
       0372  LoadConfigInit
       0372  _LoadConfigInit
       0376  _LoadConfig_trabajov1
       0376  LoadConfig_trabajov1
       037C  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   037C   02A9 =    681. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       037C  _UART_TX_ISR
       037D  _UART_RX_ISR
       03F0  _UART_EnableInt
       03F0  UART_EnableInt
       03F7  _UART_DisableInt
       03F7  UART_DisableInt
       03FE  _UART_SetTxIntMode
       03FE  UART_SetTxIntMode
       0410  UART_Start
       0410  _UART_Start
       0419  _UART_Stop
       0419  UART_Stop
       0420  UART_SendData
       0420  _UART_SendData
       0423  UART_bReadTxStatus
       0423  bUART_ReadTxStatus
       0423  _bUART_ReadTxStatus
       0423  _UART_bReadTxStatus
       0426  _bUART_ReadRxData
       0426  bUART_ReadRxData
       0426  _UART_bReadRxData
       0426  UART_bReadRxData
       0429  bUART_ReadRxStatus
       0429  UART_bReadRxStatus
       0429  _bUART_ReadRxStatus
       0429  _UART_bReadRxStatus
       042C  UART_TxIntMode
       042C  _UART_TxIntMode
       043F  UART_IntCntl
       043F  _UART_IntCntl
       046A  UART_PutSHexByte
       046A  _UART_PutSHexByte
       047D  UART_PutSHexInt
       047D  _UART_PutSHexInt
       0484  UART_PutChar
       0484  _UART_PutChar
       048C  UART_cGetChar
       048C  _UART_cGetChar
       0494  UART_cReadChar
       0494  _UART_cReadChar
       04AB  UART_iReadChar
       04AB  _UART_iReadChar
       04C1  _UART_PutString
       04C1  UART_PutString
       04D3  _UART_Write
       04D3  UART_Write
       04FB  _UART_CWrite
       04FB  UART_CWrite
       0527  _UART_CPutString
       0527  UART_CPutString
       0539  UART_PutCRLF
       0539  _UART_PutCRLF
       0542  _UART_CmdReset
       0542  UART_CmdReset
       0558  UART_bCmdCheck
       0558  _UART_bCmdCheck
       0560  UART_bErrCheck
       0560  _UART_bErrCheck
       056B  _UART_bCmdLength
       056B  UART_bCmdLength
       0571  _UART_szGetParam
       0571  UART_szGetParam
       05D0  _UART_szGetRestOfParams
       05D0  UART_szGetRestOfParams
       05DB  _Timer8_ISR
       05DC  _Timer8_EnableInt
       05DC  Timer8_EnableInt
       05E0  Timer8_DisableInt
       05E0  _Timer8_DisableInt
       05E4  _Timer8_Start
       05E4  Timer8_Start
       05E8  _Timer8_Stop
       05E8  Timer8_Stop
       05EC  Timer8_WritePeriod
       05EC  _Timer8_WritePeriod
       05EF  Timer8_WriteCompareValue
       05EF  _Timer8_WriteCompareValue
       05F2  _Timer8_bReadCompareValue
       05F2  _bTimer8_ReadCompareValue
       05F2  bTimer8_ReadCompareValue
       05F2  Timer8_bReadCompareValue
       05F5  bTimer8_ReadCounter
       05F5  _bTimer8_ReadCounter
       05F5  _bTimer8_ReadTimerSaveCV
       05F5  _Timer8_bReadTimerSaveCV
       05F5  Timer8_bReadTimerSaveCV
       05F5  bTimer8_ReadTimerSaveCV
       0620  bTimer8_CaptureCounter
       0620  _bTimer8_ReadTimer
       0620  _Timer8_bReadTimer
       0620  bTimer8_ReadTimer
       0620  _bTimer8_CaptureCounter
       0620  Timer8_bReadTimer
       0625  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0625   017F =    383. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0625  __text_start
       0625  _Inicio
       063D  _Ejecucion
       069B  _Dato
       06C6  _Deteccion
       0725  _Disparo
       0748  _Unico
       0773  _Intervalometro
       077B  _TimeLapse
       0783  _main
       07A4  __text_end
       07AE  __xidata_end

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
                    InterruptRAM   0000   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  _UART_fStatus
       0000  UART_fStatus
       0001  _UART_bRxCnt
       0001  UART_bRxCnt
       0002  NO_SHADOW
       0002  _NO_SHADOW

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        UART_RAM   0000   0011 =     17. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0002  UART_aRxBuffer
       0002  _UART_aRxBuffer

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0012   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0012  __r1
       0013  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   000D =     13. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0014  _Ent1
       0015  _Ent2
       0016  _Ent3
       0017  _Ent4
       0018  _Cam1
       001A  _Tilap
       001B  _Cam2
       001C  _Fla1
       001D  _Fla2
       001E  _Fla3
       001F  _Fla4
       0020  _Uni
       0021  _Inter

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, timer8int.asm, timer8.asm, psocconfigtbl.asm, psocconfig.asm, r1.asm, r0.asm ]


User Base Address Definitions

lit = 0x1a0
data = 0x0
SSCParmBlk:0x00F7.0x00FF
InterruptRAM = 0x0
virtual_registers = 0x12
trabajov1_RAM = 0x22

