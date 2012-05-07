  ROM 24% full. 7828 bytes used (does not include absolute areas).
  RAM 3% full. 55 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   0328 =    808. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       04C8  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   04C8   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       04C8  __func_lit_start
       04CA  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   04CA   01E3 =    483. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       04CA  LoadConfigTBL_terminalv1
       069A  LoadConfigInit
       069A  _LoadConfigInit
       06A7  _LoadConfig_terminalv1
       06A7  LoadConfig_terminalv1
       06AD  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   06AD   052D =   1325. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       06AD  _UART_TX_ISR
       06AE  _UART_RX_ISR
       0721  UART_EnableInt
       0721  _UART_EnableInt
       0728  UART_DisableInt
       0728  _UART_DisableInt
       072F  UART_SetTxIntMode
       072F  _UART_SetTxIntMode
       0741  _UART_Start
       0741  UART_Start
       074A  UART_Stop
       074A  _UART_Stop
       0751  _UART_SendData
       0751  UART_SendData
       0754  _bUART_ReadTxStatus
       0754  UART_bReadTxStatus
       0754  bUART_ReadTxStatus
       0754  _UART_bReadTxStatus
       0757  _bUART_ReadRxData
       0757  _UART_bReadRxData
       0757  UART_bReadRxData
       0757  bUART_ReadRxData
       075A  UART_bReadRxStatus
       075A  _bUART_ReadRxStatus
       075A  _UART_bReadRxStatus
       075A  bUART_ReadRxStatus
       075D  UART_TxIntMode
       075D  _UART_TxIntMode
       0770  _UART_IntCntl
       0770  UART_IntCntl
       079B  _UART_PutSHexByte
       079B  UART_PutSHexByte
       07AE  UART_PutSHexInt
       07AE  _UART_PutSHexInt
       07B5  _UART_PutChar
       07B5  UART_PutChar
       07BD  _UART_cGetChar
       07BD  UART_cGetChar
       07C5  _UART_cReadChar
       07C5  UART_cReadChar
       07DC  UART_iReadChar
       07DC  _UART_iReadChar
       07F2  UART_PutString
       07F2  _UART_PutString
       0804  _UART_Write
       0804  UART_Write
       082C  UART_CWrite
       082C  _UART_CWrite
       0858  _UART_CPutString
       0858  UART_CPutString
       086A  UART_PutCRLF
       086A  _UART_PutCRLF
       0873  UART_CmdReset
       0873  _UART_CmdReset
       0889  UART_bCmdCheck
       0889  _UART_bCmdCheck
       0891  _UART_bErrCheck
       0891  UART_bErrCheck
       089C  _UART_bCmdLength
       089C  UART_bCmdLength
       08A2  UART_szGetParam
       08A2  _UART_szGetParam
       0901  UART_szGetRestOfParams
       0901  _UART_szGetRestOfParams
       090C  _Timer8_ISR
       090D  _Timer8_EnableInt
       090D  Timer8_EnableInt
       0911  Timer8_DisableInt
       0911  _Timer8_DisableInt
       0915  Timer8_Start
       0915  _Timer8_Start
       0919  Timer8_Stop
       0919  _Timer8_Stop
       091D  Timer8_WritePeriod
       091D  _Timer8_WritePeriod
       0920  _Timer8_WriteCompareValue
       0920  Timer8_WriteCompareValue
       0923  _bTimer8_ReadCompareValue
       0923  bTimer8_ReadCompareValue
       0923  Timer8_bReadCompareValue
       0923  _Timer8_bReadCompareValue
       0926  bTimer8_ReadTimerSaveCV
       0926  _bTimer8_ReadTimerSaveCV
       0926  _Timer8_bReadTimerSaveCV
       0926  bTimer8_ReadCounter
       0926  _bTimer8_ReadCounter
       0926  Timer8_bReadTimerSaveCV
       0951  bTimer8_ReadTimer
       0951  Timer8_bReadTimer
       0951  _bTimer8_ReadTimer
       0951  _Timer8_bReadTimer
       0951  _bTimer8_CaptureCounter
       0951  bTimer8_CaptureCounter
       0956  _LCD_PrCString
       0956  LCD_PrCString
       0968  LCD_HEX_STR
       0978  LCD_PrHexByte
       0978  _LCD_PrHexByte
       098B  _LCD_PrHexInt
       098B  LCD_PrHexInt
       0992  LCD_PrString
       0992  _LCD_PrString
       09A4  LCD_WriteData
       09A4  _LCD_Write_Data
       09A4  LCD_Write_Data
       09A4  _LCD_WriteData
       09B8  LCD_Control
       09B8  _LCD_Control
       0A61  _LCD_Init
       0A61  LCD_Start
       0A61  LCD_Init
       0A61  _LCD_Start
       0AD0  LCD_ROW_OFFSET
       0AD4  _LCD_Position
       0AD4  LCD_Position
       0AE4  _LCD_Delay50uTimes
       0AE4  LCD_Delay50uTimes
       0AEA  LCD_Delay50u_Table
       0AF2  _LCD_Delay50u
       0AF2  LCD_Delay50u
       0B06  _LCD_DrawBG
       0B33  _LCD_DrawVBG
       0B67  LCD_InitVBG
       0B67  _LCD_InitVBG
       0B98  LCD_BG_TYPE1
       0B9F  LCD_BG_TYPE2
       0BA6  LCD_InitBG
       0BA6  _LCD_InitBG
       0BDA  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0BDA   145A =   5210. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0BDA  __text_start
       0BDA  _bucle_temp
       0C0E  _Pitido
       0C3A  _Reset_PdT
       0C76  _Pulsador
       0D18  _Principal
       0D60  _Menu
       0E5D  _Sensors
       0F3C  _Entrada1
       0FBE  _Entrada2
       1040  _Entrada3
       10C2  _Entrada4
       1144  _Flashes
       12AB  _Flash1
       132D  _Flash2
       13AF  _Flash3
       1432  _Flash4
       14B6  _Dispar
       1560  _Camara1
       160D  _Camara2
       16BA  _Tipo_disp
       17DC  _Intervalometro
       18DC  _TimeLapse
       19EA  _Numeros
       1AB9  _Tiempos
       1B6B  _Executar
       1BBE  _Ara
       1C30  _Envia
       1C63  _Trabajando
       1D69  _Resetear
       1D74  _Sistema
       1E3A  _Reali_LCD
       1EC5  _Zumbador
       1F4A  _Ali_Led
       1FD5  _main
       2003  __divmodu_8X8_8
       201B  __i_div8_block_util
       2034  __text_end
       203A  __xidata_end

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
               virtual_registers   0015   0006 =      6. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0015  __rY
       0016  __rX
       0017  __r3
       0018  __r2
       0019  __r1
       001A  __r0

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0000   001B =     27. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __data_start
       001B  _Luz_LCD
       001C  _Buzzer
       001D  _Alimentacion
       001E  _Ent1
       001F  _Ent2
       0020  _Ent3
       0021  _Ent4
       0022  _Fla1
       0023  _Fla2
       0024  _Fla3
       0025  _Fla4
       0026  _Cam1
       0027  _Int1_Tdisp
       0028  _Int1_Tdisp_Uni
       0029  _Int1_Ndisp
       002A  _Cam2
       002B  _Int2_Tdisp
       002C  _Int2_Tdisp_Uni
       002D  _Int2_Ndisp
       002E  _TL2_Tfilm_Uni
       002F  _TL2_Tfilm
       0030  _TL2_Treal_Uni
       0031  _TL2_Treal
       0032  _TL1_Tfilm_Uni
       0033  _TL1_Tfilm
       0034  _TL1_Treal_Uni
       0035  _TL1_Treal

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
./obj/main.o	[ main.c ]
<library>	[ uartint.asm, uart.asm, timer8int.asm, timer8.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm ]
[ rY.asm, rX.asm, r3.asm, r2.asm, r1.asm, r0.asm, divmodu_8x8_8_util.asm, i_div8_block_util.asm ]

User Base Address Definitions

lit = 0x1a0
data = 0x0
SSCParmBlk:0x00F7.0x00FF
InterruptRAM = 0x0
virtual_registers = 0x15
terminalv1_RAM = 0x37

