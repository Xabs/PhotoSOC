  ROM 4% full. 1372 bytes used (does not include absolute areas).
  RAM 1% full. 23 bytes used (does not include stack usage).

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   01A0   0017 =     23. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01B7  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                        func_lit   01B7   0002 =      2. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01B7  __func_lit_start
       01B9  __func_lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   01B9   01E3 =    483. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       01B9  LoadConfigTBL_terminalv1
       0389  LoadConfigInit
       0389  _LoadConfigInit
       0396  _LoadConfig_terminalv1
       0396  LoadConfig_terminalv1
       039C  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   039C   02F9 =    761. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       039C  _UART_TX_ISR
       039D  _UART_RX_ISR
       0410  _Timer8_ISR
       0411  LCD_PrCString
       0411  _LCD_PrCString
       0423  LCD_HEX_STR
       0433  _LCD_PrHexByte
       0433  LCD_PrHexByte
       0446  _LCD_PrHexInt
       0446  LCD_PrHexInt
       044D  LCD_PrString
       044D  _LCD_PrString
       045F  _LCD_WriteData
       045F  _LCD_Write_Data
       045F  LCD_WriteData
       045F  LCD_Write_Data
       0473  _LCD_Control
       0473  LCD_Control
       051C  LCD_Init
       051C  _LCD_Init
       051C  LCD_Start
       051C  _LCD_Start
       058B  LCD_ROW_OFFSET
       058F  LCD_Position
       058F  _LCD_Position
       059F  LCD_Delay50uTimes
       059F  _LCD_Delay50uTimes
       05A5  LCD_Delay50u_Table
       05AD  LCD_Delay50u
       05AD  _LCD_Delay50u
       05C1  _LCD_DrawBG
       05EE  _LCD_DrawVBG
       0622  LCD_InitVBG
       0622  _LCD_InitVBG
       0653  LCD_BG_TYPE1
       065A  LCD_BG_TYPE2
       0661  LCD_InitBG
       0661  _LCD_InitBG
       0695  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0695   0067 =    103. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0695  _main
       0695  __text_start
       06FC  __text_end
       06FE  __xidata_end

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
                        UART_RAM   0000   0010 =     16. bytes (rel,con,ram)

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
<library>	[ uartint.asm, timer8int.asm, psocconfigtbl.asm, psocconfig.asm, lcd.asm, r1.asm, r0.asm ]

User Base Address Definitions

lit = 0x1a0
data = 0x0
SSCParmBlk:0x00F7.0x00FF
InterruptRAM = 0x0
virtual_registers = 0x15
terminalv1_RAM

