  ROM 11% full. 3729 bytes used (does not include absolute areas).
  RAM 5% full. 91 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   01A0   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A0  __func_lit_start
       01A2  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   01A2   01FE =    510. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01A2  LoadConfigTBL_trabajov1
       0396  LoadConfigInit
       0396  _LoadConfigInit
       039A  _LoadConfig_trabajov1
       039A  LoadConfig_trabajov1
       03A0  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   03A0   030D =    781. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       03A0  _UART_TX_ISR
       03A1  _UART_RX_ISR
       0414  UART_EnableInt
       0414  _UART_EnableInt
       041B  _UART_DisableInt
       041B  UART_DisableInt
       0422  _UART_SetTxIntMode
       0422  UART_SetTxIntMode
       0434  UART_Start
       0434  _UART_Start
       043D  UART_Stop
       043D  _UART_Stop
       0444  _UART_SendData
       0444  UART_SendData
       0447  bUART_ReadTxStatus
       0447  _UART_bReadTxStatus
       0447  UART_bReadTxStatus
       0447  _bUART_ReadTxStatus
       044A  UART_bReadRxData
       044A  _bUART_ReadRxData
       044A  _UART_bReadRxData
       044A  bUART_ReadRxData
       044D  UART_bReadRxStatus
       044D  _bUART_ReadRxStatus
       044D  _UART_bReadRxStatus
       044D  bUART_ReadRxStatus
       0450  UART_TxIntMode
       0450  _UART_TxIntMode
       0463  UART_IntCntl
       0463  _UART_IntCntl
       048E  UART_PutSHexByte
       048E  _UART_PutSHexByte
       04A1  UART_PutSHexInt
       04A1  _UART_PutSHexInt
       04A8  _UART_PutChar
       04A8  UART_PutChar
       04B0  UART_cGetChar
       04B0  _UART_cGetChar
       04B8  UART_cReadChar
       04B8  _UART_cReadChar
       04CF  UART_iReadChar
       04CF  _UART_iReadChar
       04E5  _UART_PutString
       04E5  UART_PutString
       04F7  _UART_Write
       04F7  UART_Write
       051F  UART_CWrite
       051F  _UART_CWrite
       054B  _UART_CPutString
       054B  UART_CPutString
       055D  _UART_PutCRLF
       055D  UART_PutCRLF
       0566  _UART_CmdReset
       0566  UART_CmdReset
       057C  UART_bCmdCheck
       057C  _UART_bCmdCheck
       0584  UART_bErrCheck
       0584  _UART_bErrCheck
       058F  UART_bCmdLength
       058F  _UART_bCmdLength
       0595  _UART_szGetParam
       0595  UART_szGetParam
       05F4  UART_szGetRestOfParams
       05F4  _UART_szGetRestOfParams
       05FF  _Timer8_ISR
       0600  Timer8_EnableInt
       0600  _Timer8_EnableInt
       0604  Timer8_DisableInt
       0604  _Timer8_DisableInt
       0608  _Timer8_Start
       0608  Timer8_Start
       060C  _Timer8_Stop
       060C  Timer8_Stop
       0610  Timer8_WritePeriod
       0610  _Timer8_WritePeriod
       0613  Timer8_WriteCompareValue
       0613  _Timer8_WriteCompareValue
       0616  Timer8_bReadCompareValue
       0616  _bTimer8_ReadCompareValue
       0616  _Timer8_bReadCompareValue
       0616  bTimer8_ReadCompareValue
       0619  bTimer8_ReadCounter
       0619  _Timer8_bReadTimerSaveCV
       0619  _bTimer8_ReadCounter
       0619  _bTimer8_ReadTimerSaveCV
       0619  bTimer8_ReadTimerSaveCV
       0619  Timer8_bReadTimerSaveCV
       0644  Timer8_bReadTimer
       0644  _bTimer8_CaptureCounter
       0644  bTimer8_CaptureCounter
       0644  _bTimer8_ReadTimer
       0644  _Timer8_bReadTimer
       0644  bTimer8_ReadTimer
       0649  _Segundos_ISR
       064D  _Segundos_EnableInt
       064D  Segundos_EnableInt
       0651  Segundos_DisableInt
       0651  _Segundos_DisableInt
       0655  Segundos_Start
       0655  _Segundos_Start
       0659  Segundos_Stop
       0659  _Segundos_Stop
       065D  Segundos_WritePeriod
       065D  _Segundos_WritePeriod
       0663  _Segundos_WriteCompareValue
       0663  Segundos_WriteCompareValue
       0669  Segundos_wReadCompareValue
       0669  wSegundos_ReadCompareValue
       0669  _Segundos_wReadCompareValue
       0669  _wSegundos_ReadCompareValue
       066F  _wSegundos_ReadCounter
       066F  _wSegundos_ReadTimerSaveCV
       066F  _Segundos_wReadTimerSaveCV
       066F  wSegundos_ReadCounter
       066F  wSegundos_ReadTimerSaveCV
       066F  Segundos_wReadTimerSaveCV
       06A5  wSegundos_ReadTimer
       06A5  wSegundos_CaptureCounter
       06A5  Segundos_wReadTimer
       06A5  _wSegundos_CaptureCounter
       06A5  _Segundos_wReadTimer
       06A5  _wSegundos_ReadTimer
       06AD  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   06AD   0984 =   2436. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       06AD  _envia
       06AD  __text_start
       06F8  _recibe
       074B  _inicializacion
       0760  _recibe_valores
       0829  _preparadisparo
       0A61  _calculosegundos
       0B0E  _activar_sensores
       0B34  _ejecucion
       0B41  _bucle
       0C38  _disparo
       0D1F  _envia_fintrabajo
       0D3B  _disparo_sensores
       0D7C  _MI_RSI_EXTERNA
       0D7D  _MI_RSI_DEL_TIMER
       0E80  _led1
       0EA7  _led2
       0ECE  _main
       0EDA  PSoC_GPIO_ISR
       0EDE  __divmodu_32X32_32
       0EED  __i_div32_block_util
       0F50  __i_mulu8_block_util
       0F6D  __mul16
       0FAB  __mul_32X32_32
       103B  __xidata_end
       1031  __text_end

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
               virtual_registers   0012   000F =     15. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0012  __rZ
       0013  __rY
       0014  __rX
       0015  __r11
       0016  __r10
       0017  __r9
       0018  __r8
       0019  __r7
       001A  __r6
       001B  __r5
       001C  __r4
       001D  __r3
       001E  __r2
       001F  __r1
       0020  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   0039 =     57. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       0021  _tpCam2
       0025  _tpCam1
       0029  _contador_trabajo2
       002D  _contador_trabajo1
       0031  _dspCam2
       0033  _dspCam1
       0035  _tempo
       0037  _contadordspCam1
       0039  _contadordspCam2
       003B  _tempo2
       003D  _Int1_Tdisp_Uni
       003E  _Int1_Ndisp
       003F  _Int2_Tdisp
       0040  _Int2_Tdisp_Uni
       0041  _Int2_Ndisp
       0042  _TL1_Treal
       0043  _TL1_Treal_Uni
       0044  _TL1_Tfilm
       0045  _TL1_Tfilm_Uni
       0046  _TL2_Treal
       0047  _TL2_Treal_Uni
       0048  _TL2_Tfilm
       0049  _TL2_Tfilm_Uni
       004A  _tocacam1
       004B  _tocacam2
       004C  _fintrabajo
       004D  _chivato1
       004E  _chivato2
       004F  _Fla1
       0051  _Cam1
       0052  _Cam2
       0053  _Ent1
       0054  _Ent2
       0055  _Ent3
       0056  _Ent4
       0057  _Fla2
       0058  _Fla3
       0059  _Fla4
       005A  _Int1_Tdisp

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, timer8int.asm, timer8.asm, segundosint.asm, segundos.asm, psocgpioint.asm ]
[ psocconfigtbl.asm, psocconfig.asm, rZ.asm, rY.asm, rX.asm, r11.asm, r10.asm, r9.asm, r8.asm, r7.asm ]
[ r6.asm, r5.asm, r4.asm, r3.asm, r2.asm, r1.asm, r0.asm, divmodu_32x32_32_util.asm, i_div32_block_util.asm ]
[ i_mulu8_block_util.asm, mul16_util.asm, mul32_util.asm ]

User Base Address Definitions

lit = 0x1a0
data = 0x0
SSCParmBlk:0x00F7.0x00FF
InterruptRAM = 0x0
virtual_registers = 0x12
trabajov1_RAM = 0x5b

