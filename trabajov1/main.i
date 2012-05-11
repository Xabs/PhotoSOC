#line 1 "./main.c"









#line 1 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/CY8C29~1/m8c.h"




















typedef  unsigned char  BOOL;
typedef  unsigned char  BYTE;
typedef  signed   char  CHAR;
typedef  unsigned int   WORD;
typedef  signed   int   INT;
typedef  unsigned long  DWORD;
typedef  signed   long  LONG;












































#pragma  ioport   PRT0DR:     0x000
BYTE              PRT0DR;
#pragma  ioport   PRT0IE:     0x001
BYTE              PRT0IE;
#pragma  ioport   PRT0GS:     0x002
BYTE              PRT0GS;
#pragma  ioport   PRT0DM2:    0x003
BYTE              PRT0DM2;

#pragma  ioport   PRT1DR:     0x004
BYTE              PRT1DR;
#pragma  ioport   PRT1IE:     0x005
BYTE              PRT1IE;
#pragma  ioport   PRT1GS:     0x006
BYTE              PRT1GS;
#pragma  ioport   PRT1DM2:    0x007
BYTE              PRT1DM2;

#pragma  ioport   PRT2DR:     0x008
BYTE              PRT2DR;
#pragma  ioport   PRT2IE:     0x009
BYTE              PRT2IE;
#pragma  ioport   PRT2GS:     0x00A
BYTE              PRT2GS;
#pragma  ioport   PRT2DM2:    0x00B
BYTE              PRT2DM2;

#pragma  ioport   PRT3DR:     0x00C
BYTE              PRT3DR;
#pragma  ioport   PRT3IE:     0x00D
BYTE              PRT3IE;
#pragma  ioport   PRT3GS:     0x00E
BYTE              PRT3GS;
#pragma  ioport   PRT3DM2:    0x00F
BYTE              PRT3DM2;

#pragma  ioport   PRT4DR:     0x010
BYTE              PRT4DR;
#pragma  ioport   PRT4IE:     0x011
BYTE              PRT4IE;
#pragma  ioport   PRT4GS:     0x012
BYTE              PRT4GS;
#pragma  ioport   PRT4DM2:    0x013
BYTE              PRT4DM2;

#pragma  ioport   PRT5DR:     0x014
BYTE              PRT5DR;
#pragma  ioport   PRT5IE:     0x015
BYTE              PRT5IE;
#pragma  ioport   PRT5GS:     0x016
BYTE              PRT5GS;
#pragma  ioport   PRT5DM2:    0x017
BYTE              PRT5DM2;

#pragma  ioport   PRT6DR:     0x018
BYTE              PRT6DR;
#pragma  ioport   PRT6IE:     0x019
BYTE              PRT6IE;
#pragma  ioport   PRT6GS:     0x01A
BYTE              PRT6GS;
#pragma  ioport   PRT6DM2:    0x01B
BYTE              PRT6DM2;

#pragma  ioport   PRT7DR:     0x01C
BYTE              PRT7DR;
#pragma  ioport   PRT7IE:     0x01D
BYTE              PRT7IE;
#pragma  ioport   PRT7GS:     0x01E
BYTE              PRT7GS;
#pragma  ioport   PRT7DM2:    0x01F
BYTE              PRT7DM2;







#pragma  ioport   DBB00DR0:   0x020
BYTE              DBB00DR0;
#pragma  ioport   DBB00DR1:   0x021
BYTE              DBB00DR1;
#pragma  ioport   DBB00DR2:   0x022
BYTE              DBB00DR2;
#pragma  ioport   DBB00CR0:   0x023
BYTE              DBB00CR0;


#pragma  ioport   DBB01DR0:   0x024
BYTE              DBB01DR0;
#pragma  ioport   DBB01DR1:   0x025
BYTE              DBB01DR1;
#pragma  ioport   DBB01DR2:   0x026
BYTE              DBB01DR2;
#pragma  ioport   DBB01CR0:   0x027
BYTE              DBB01CR0;


#pragma  ioport   DCB02DR0:   0x028
BYTE              DCB02DR0;
#pragma  ioport   DCB02DR1:   0x029
BYTE              DCB02DR1;
#pragma  ioport   DCB02DR2:   0x02A
BYTE              DCB02DR2;
#pragma  ioport   DCB02CR0:   0x02B
BYTE              DCB02CR0;


#pragma  ioport   DCB03DR0:   0x02C
BYTE              DCB03DR0;
#pragma  ioport   DCB03DR1:   0x02D
BYTE              DCB03DR1;
#pragma  ioport   DCB03DR2:   0x02E
BYTE              DCB03DR2;
#pragma  ioport   DCB03CR0:   0x02F
BYTE              DCB03CR0;


#pragma  ioport   DBB10DR0:   0x030
BYTE              DBB10DR0;
#pragma  ioport   DBB10DR1:   0x031
BYTE              DBB10DR1;
#pragma  ioport   DBB10DR2:   0x032
BYTE              DBB10DR2;
#pragma  ioport   DBB10CR0:   0x033
BYTE              DBB10CR0;


#pragma  ioport   DBB11DR0:   0x034
BYTE              DBB11DR0;
#pragma  ioport   DBB11DR1:   0x035
BYTE              DBB11DR1;
#pragma  ioport   DBB11DR2:   0x036
BYTE              DBB11DR2;
#pragma  ioport   DBB11CR0:   0x037
BYTE              DBB11CR0;


#pragma  ioport   DCB12DR0:   0x038
BYTE              DCB12DR0;
#pragma  ioport   DCB12DR1:   0x039
BYTE              DCB12DR1;
#pragma  ioport   DCB12DR2:   0x03A
BYTE              DCB12DR2;
#pragma  ioport   DCB12CR0:   0x03B
BYTE              DCB12CR0;


#pragma  ioport   DCB13DR0:   0x03C
BYTE              DCB13DR0;
#pragma  ioport   DCB13DR1:   0x03D
BYTE              DCB13DR1;
#pragma  ioport   DCB13DR2:   0x03E
BYTE              DCB13DR2;
#pragma  ioport   DCB13CR0:   0x03F
BYTE              DCB13CR0;


#pragma  ioport   DBB20DR0:   0x040
BYTE              DBB20DR0;
#pragma  ioport   DBB20DR1:   0x041
BYTE              DBB20DR1;
#pragma  ioport   DBB20DR2:   0x042
BYTE              DBB20DR2;
#pragma  ioport   DBB20CR0:   0x043
BYTE              DBB20CR0;


#pragma  ioport   DBB21DR0:   0x044
BYTE              DBB21DR0;
#pragma  ioport   DBB21DR1:   0x045
BYTE              DBB21DR1;
#pragma  ioport   DBB21DR2:   0x046
BYTE              DBB21DR2;
#pragma  ioport   DBB21CR0:   0x047
BYTE              DBB21CR0;


#pragma  ioport   DCB22DR0:   0x048
BYTE              DCB22DR0;
#pragma  ioport   DCB22DR1:   0x049
BYTE              DCB22DR1;
#pragma  ioport   DCB22DR2:   0x04A
BYTE              DCB22DR2;
#pragma  ioport   DCB22CR0:   0x04B
BYTE              DCB22CR0;


#pragma  ioport   DCB23DR0:   0x04C
BYTE              DCB23DR0;
#pragma  ioport   DCB23DR1:   0x04D
BYTE              DCB23DR1;
#pragma  ioport   DCB23DR2:   0x04E
BYTE              DCB23DR2;
#pragma  ioport   DCB23CR0:   0x04F
BYTE              DCB23CR0;


#pragma  ioport   DBB30DR0:   0x050
BYTE              DBB30DR0;
#pragma  ioport   DBB30DR1:   0x051
BYTE              DBB30DR1;
#pragma  ioport   DBB30DR2:   0x052
BYTE              DBB30DR2;
#pragma  ioport   DBB30CR0:   0x053
BYTE              DBB30CR0;


#pragma  ioport   DBB31DR0:   0x054
BYTE              DBB31DR0;
#pragma  ioport   DBB31DR1:   0x055
BYTE              DBB31DR1;
#pragma  ioport   DBB31DR2:   0x056
BYTE              DBB31DR2;
#pragma  ioport   DBB31CR0:   0x057
BYTE              DBB31CR0;


#pragma  ioport   DCB32DR0:   0x058
BYTE              DCB32DR0;
#pragma  ioport   DCB32DR1:   0x059
BYTE              DCB32DR1;
#pragma  ioport   DCB32DR2:   0x05A
BYTE              DCB32DR2;
#pragma  ioport   DCB32CR0:   0x05B
BYTE              DCB32CR0;


#pragma  ioport   DCB33DR0:   0x05C
BYTE              DCB33DR0;
#pragma  ioport   DCB33DR1:   0x05D
BYTE              DCB33DR1;
#pragma  ioport   DCB33DR2:   0x05E
BYTE              DCB33DR2;
#pragma  ioport   DCB33CR0:   0x05F
BYTE              DCB33CR0;





#pragma  ioport   AMX_IN:     0x060
BYTE              AMX_IN;





#pragma  ioport   ARF_CR:     0x063
BYTE              ARF_CR;







#pragma  ioport   CMP_CR0:     0x064
BYTE              CMP_CR0;









#pragma  ioport   ASY_CR:     0x065
BYTE              ASY_CR;





#pragma  ioport  CMP_CR1:     0x66
BYTE             CMP_CR1;













#pragma  ioport   ACB00CR3:   0x070
BYTE              ACB00CR3;
#pragma  ioport   ACB00CR0:   0x071
BYTE              ACB00CR0;
#pragma  ioport   ACB00CR1:   0x072
BYTE              ACB00CR1;
#pragma  ioport   ACB00CR2:   0x073
BYTE              ACB00CR2;


#pragma  ioport   ACB01CR3:   0x074
BYTE              ACB01CR3;
#pragma  ioport   ACB01CR0:   0x075
BYTE              ACB01CR0;
#pragma  ioport   ACB01CR1:   0x076
BYTE              ACB01CR1;
#pragma  ioport   ACB01CR2:   0x077
BYTE              ACB01CR2;


#pragma  ioport   ACB02CR3:   0x078
BYTE              ACB02CR3;
#pragma  ioport   ACB02CR0:   0x079
BYTE              ACB02CR0;
#pragma  ioport   ACB02CR1:   0x07A
BYTE              ACB02CR1;
#pragma  ioport   ACB02CR2:   0x07B
BYTE              ACB02CR2;


#pragma  ioport   ACB03CR3:   0x07C
BYTE              ACB03CR3;
#pragma  ioport   ACB03CR0:   0x07D
BYTE              ACB03CR0;
#pragma  ioport   ACB03CR1:   0x07E
BYTE              ACB03CR1;
#pragma  ioport   ACB03CR2:   0x07F
BYTE              ACB03CR2;


#pragma  ioport   ASC10CR0:   0x080
BYTE              ASC10CR0;
#pragma  ioport   ASC10CR1:   0x081
BYTE              ASC10CR1;
#pragma  ioport   ASC10CR2:   0x082
BYTE              ASC10CR2;
#pragma  ioport   ASC10CR3:   0x083
BYTE              ASC10CR3;


#pragma  ioport   ASD11CR0:   0x084
BYTE              ASD11CR0;
#pragma  ioport   ASD11CR1:   0x085
BYTE              ASD11CR1;
#pragma  ioport   ASD11CR2:   0x086
BYTE              ASD11CR2;
#pragma  ioport   ASD11CR3:   0x087
BYTE              ASD11CR3;


#pragma  ioport   ASC12CR0:   0x088
BYTE              ASC12CR0;
#pragma  ioport   ASC12CR1:   0x089
BYTE              ASC12CR1;
#pragma  ioport   ASC12CR2:   0x08A
BYTE              ASC12CR2;
#pragma  ioport   ASC12CR3:   0x08B
BYTE              ASC12CR3;


#pragma  ioport   ASD13CR0:   0x08C
BYTE              ASD13CR0;
#pragma  ioport   ASD13CR1:   0x08D
BYTE              ASD13CR1;
#pragma  ioport   ASD13CR2:   0x08E
BYTE              ASD13CR2;
#pragma  ioport   ASD13CR3:   0x08F
BYTE              ASD13CR3;


#pragma  ioport   ASD20CR0:   0x090
BYTE              ASD20CR0;
#pragma  ioport   ASD20CR1:   0x091
BYTE              ASD20CR1;
#pragma  ioport   ASD20CR2:   0x092
BYTE              ASD20CR2;
#pragma  ioport   ASD20CR3:   0x093
BYTE              ASD20CR3;


#pragma  ioport   ASC21CR0:   0x094
BYTE              ASC21CR0;
#pragma  ioport   ASC21CR1:   0x095
BYTE              ASC21CR1;
#pragma  ioport   ASC21CR2:   0x096
BYTE              ASC21CR2;
#pragma  ioport   ASC21CR3:   0x097
BYTE              ASC21CR3;


#pragma  ioport   ASD22CR0:   0x098
BYTE              ASD22CR0;
#pragma  ioport   ASD22CR1:   0x099
BYTE              ASD22CR1;
#pragma  ioport   ASD22CR2:   0x09A
BYTE              ASD22CR2;
#pragma  ioport   ASD22CR3:   0x09B
BYTE              ASD22CR3;


#pragma  ioport   ASC23CR0:   0x09C
BYTE              ASC23CR0;
#pragma  ioport   ASC23CR1:   0x09D
BYTE              ASC23CR1;
#pragma  ioport   ASC23CR2:   0x09E
BYTE              ASC23CR2;
#pragma  ioport   ASC23CR3:   0x09F
BYTE              ASC23CR3;




#pragma  ioport   TMP0_DR:     0x6C
BYTE              TMP0_DR;
#pragma  ioport   TMP1_DR:     0x6D
BYTE              TMP1_DR;
#pragma  ioport   TMP2_DR:     0x6E
BYTE              TMP2_DR;
#pragma  ioport   TMP3_DR:     0x6F
BYTE              TMP3_DR;

#pragma  ioport   TMP_DR0:     0x6C
BYTE              TMP_DR0;
#pragma  ioport   TMP_DR1:     0x6D
BYTE              TMP_DR1;
#pragma  ioport   TMP_DR2:     0x6E
BYTE              TMP_DR2;
#pragma  ioport   TMP_DR3:     0x6F
BYTE              TMP_DR3;








#pragma  ioport   RDI0RI:     0x0B0
BYTE              RDI0RI;
#pragma  ioport   RDI0SYN:    0x0B1
BYTE              RDI0SYN;
#pragma  ioport   RDI0IS:     0x0B2
BYTE              RDI0IS;
#pragma  ioport   RDI0LT0:    0x0B3
BYTE              RDI0LT0;
#pragma  ioport   RDI0LT1:    0x0B4
BYTE              RDI0LT1;
#pragma  ioport   RDI0RO0:    0x0B5
BYTE              RDI0RO0;
#pragma  ioport   RDI0RO1:    0x0B6
BYTE              RDI0RO1;

#pragma  ioport   RDI1RI:     0x0B8
BYTE              RDI1RI;
#pragma  ioport   RDI1SYN:    0x0B9
BYTE              RDI1SYN;
#pragma  ioport   RDI1IS:     0x0BA
BYTE              RDI1IS;
#pragma  ioport   RDI1LT0:    0x0BB
BYTE              RDI1LT0;
#pragma  ioport   RDI1LT1:    0x0BC
BYTE              RDI1LT1;
#pragma  ioport   RDI1RO0:    0x0BD
BYTE              RDI1RO0;
#pragma  ioport   RDI1RO1:    0x0BE
BYTE              RDI1RO1;

#pragma  ioport   RDI2RI:     0x0C0
BYTE              RDI2RI;
#pragma  ioport   RDI2SYN:    0x0C1
BYTE              RDI2SYN;
#pragma  ioport   RDI2IS:     0x0C2
BYTE              RDI2IS;
#pragma  ioport   RDI2LT0:    0x0C3
BYTE              RDI2LT0;
#pragma  ioport   RDI2LT1:    0x0C4
BYTE              RDI2LT1;
#pragma  ioport   RDI2RO0:    0x0C5
BYTE              RDI2RO0;
#pragma  ioport   RDI2RO1:    0x0C6
BYTE              RDI2RO1;

#pragma  ioport   RDI3RI:     0x0C8
BYTE              RDI3RI;
#pragma  ioport   RDI3SYN:    0x0C9
BYTE              RDI3SYN;
#pragma  ioport   RDI3IS:     0x0CA
BYTE              RDI3IS;
#pragma  ioport   RDI3LT0:    0x0CB
BYTE              RDI3LT0;
#pragma  ioport   RDI3LT1:    0x0CC
BYTE              RDI3LT1;
#pragma  ioport   RDI3RO0:    0x0CD
BYTE              RDI3RO0;
#pragma  ioport   RDI3RO1:    0x0CE
BYTE              RDI3RO1;




#pragma  ioport   CUR_PP:     0x0D0
BYTE              CUR_PP;
#pragma  ioport   STK_PP:     0x0D1
BYTE              STK_PP;
#pragma  ioport   IDX_PP:     0x0D3
BYTE              IDX_PP;
#pragma  ioport   MVR_PP:     0x0D4
BYTE              MVR_PP;
#pragma  ioport   MVW_PP:     0x0D5
BYTE              MVW_PP;




#pragma  ioport   I2C_CFG:    0x0D6
BYTE              I2C_CFG;











#pragma  ioport   I2C_SCR:    0x0D7
BYTE              I2C_SCR;









#pragma  ioport   I2C_DR:     0x0D8
BYTE              I2C_DR;

#pragma  ioport   I2C_MSCR:   0x0D9
BYTE              I2C_MSCR;








#pragma  ioport   INT_CLR0:   0x0DA
BYTE              INT_CLR0;
#pragma  ioport   INT_CLR1:   0x0DB
BYTE              INT_CLR1;
#pragma  ioport   INT_CLR2:   0x0DC
BYTE              INT_CLR2;
#pragma  ioport   INT_CLR3:   0x0DD
BYTE              INT_CLR3;

#pragma  ioport   INT_MSK3:   0x0DE
BYTE              INT_MSK3;



#pragma  ioport   INT_MSK2:   0x0DF
BYTE              INT_MSK2;









#pragma  ioport   INT_MSK0:   0x0E0
BYTE              INT_MSK0;









#pragma  ioport   INT_MSK1:   0x0E1
BYTE              INT_MSK1;









#pragma  ioport   INT_VC:     0x0E2
BYTE              INT_VC;
#pragma  ioport   RES_WDT:    0x0E3
BYTE              RES_WDT;


#pragma  ioport   DEC_DH:     0x0E4
CHAR              DEC_DH;
#pragma  ioport   DEC_DL:     0x0E5
CHAR              DEC_DL;
#pragma  ioport   DEC_CR0:    0x0E6
BYTE              DEC_CR0;
#pragma  ioport   DEC_CR1:    0x0E7
BYTE              DEC_CR1;




#pragma  ioport   MUL_X:         0x0E8
CHAR              MUL_X;
#pragma  ioport   MUL_Y:         0x0E9
CHAR              MUL_Y;
#pragma  ioport   MUL_DH:        0x0EA
CHAR              MUL_DH;
#pragma  ioport   MUL_DL:        0x0EB
CHAR              MUL_DL;
#pragma  ioport   MUL_RESULT:    0x0EA
INT               MUL_RESULT;
#pragma  ioport   MAC_X:         0x0EC
CHAR              MAC_X;
#pragma  ioport   MAC_Y:         0x0ED
CHAR              MAC_Y;
#pragma  ioport   MAC_CL0:       0x0EE
BYTE              MAC_CL0;
#pragma  ioport   MAC_CL1:       0x0EF
BYTE              MAC_CL1;
#pragma  ioport   ACC_DR1:       0x0EC
CHAR              ACC_DR1;
#pragma  ioport   ACC_DR0:       0x0ED
CHAR              ACC_DR0;
#pragma  ioport   ACC_LOW_WORD:  0x0EC
INT               ACC_LOW_WORD;
#pragma  ioport   ACC_DR3:       0x0EE
CHAR              ACC_DR3;
#pragma  ioport   ACC_DR2:       0x0EF
CHAR              ACC_DR2;
#pragma  ioport   ACC_HI_WORD:   0x0EE
INT               ACC_HI_WORD;


#pragma  ioport   MUL0_X:        0x0E8
CHAR              MUL0_X;
#pragma  ioport   MUL0_Y:        0x0E9
CHAR              MUL0_Y;
#pragma  ioport   MUL0_DH:       0x0EA
CHAR              MUL0_DH;
#pragma  ioport   MUL0_DL:       0x0EB
CHAR              MUL0_DL;
#pragma  ioport   MUL0_RESULT:   0x0EA
INT               MUL0_RESULT;
#pragma  ioport   MAC0_X:        0x0EC
CHAR              MAC0_X;
#pragma  ioport   MAC0_Y:        0x0ED
CHAR              MAC0_Y;
#pragma  ioport   MAC0_CL0:      0x0EE
BYTE              MAC0_CL0;
#pragma  ioport   MAC0_CL1:      0x0EF
BYTE              MAC0_CL1;
#pragma  ioport   ACC0_DR1:      0x0EC
CHAR              ACC0_DR1;
#pragma  ioport   ACC0_DR0:      0x0ED
CHAR              ACC0_DR0;
#pragma  ioport   ACC0_LOW_WORD: 0x0EC
INT               ACC0_LOW_WORD;
#pragma  ioport   ACC0_DR3:      0x0EE
CHAR              ACC0_DR3;
#pragma  ioport   ACC0_DR2:      0x0EF
CHAR              ACC0_DR2;
#pragma  ioport   ACC0_HI_WORD:  0x0EE
INT               ACC0_HI_WORD;


#pragma  ioport   MUL1_X:        0x0A8
CHAR              MUL1_X;
#pragma  ioport   MUL1_Y:        0x0A9
CHAR              MUL1_Y;
#pragma  ioport   MUL1_DH:       0x0AA
CHAR              MUL1_DH;
#pragma  ioport   MUL1_DL:       0x0AB
CHAR              MUL1_DL;
#pragma  ioport   MUL1_RESULT:   0x0AA
INT               MUL1_RESULT;
#pragma  ioport   MAC1_X:        0x0AC
CHAR              MAC1_X;
#pragma  ioport   MAC1_Y:        0x0AD
CHAR              MAC1_Y;
#pragma  ioport   MAC1_CL0:      0x0AE
BYTE              MAC1_CL0;
#pragma  ioport   MAC1_CL1:      0x0AF
BYTE              MAC1_CL1;
#pragma  ioport   ACC1_DR1:      0x0AC
CHAR              ACC1_DR1;
#pragma  ioport   ACC1_DR0:      0x0AD
CHAR              ACC1_DR0;
#pragma  ioport   ACC1_LOW_WORD: 0x0AC
INT               ACC1_LOW_WORD;
#pragma  ioport   ACC1_DR3:      0x0AE
CHAR              ACC1_DR3;
#pragma  ioport   ACC1_DR2:      0x0AF
CHAR              ACC1_DR2;
#pragma  ioport   ACC1_HI_WORD:  0x0AE
INT               ACC1_HI_WORD;







#pragma  ioport   CPU_F:      0xF7
BYTE              CPU_F;

#pragma  ioport   CPU_SCR1:   0xFE
BYTE              CPU_SCR1;






#pragma  ioport   CPU_SCR0:   0x0FF
BYTE              CPU_SCR0;



















#pragma  ioport   PRT0DM0:    0x100
BYTE              PRT0DM0;
#pragma  ioport   PRT0DM1:    0x101
BYTE              PRT0DM1;
#pragma  ioport   PRT0IC0:    0x102
BYTE              PRT0IC0;
#pragma  ioport   PRT0IC1:    0x103
BYTE              PRT0IC1;

#pragma  ioport   PRT1DM0:    0x104
BYTE              PRT1DM0;
#pragma  ioport   PRT1DM1:    0x105
BYTE              PRT1DM1;
#pragma  ioport   PRT1IC0:    0x106
BYTE              PRT1IC0;
#pragma  ioport   PRT1IC1:    0x107
BYTE              PRT1IC1;

#pragma  ioport   PRT2DM0:    0x108
BYTE              PRT2DM0;
#pragma  ioport   PRT2DM1:    0x109
BYTE              PRT2DM1;
#pragma  ioport   PRT2IC0:    0x10A
BYTE              PRT2IC0;
#pragma  ioport   PRT2IC1:    0x10B
BYTE              PRT2IC1;

#pragma  ioport   PRT3DM0:    0x10C
BYTE              PRT3DM0;
#pragma  ioport   PRT3DM1:    0x10D
BYTE              PRT3DM1;
#pragma  ioport   PRT3IC0:    0x10E
BYTE              PRT3IC0;
#pragma  ioport   PRT3IC1:    0x10F
BYTE              PRT3IC1;

#pragma  ioport   PRT4DM0:    0x110
BYTE              PRT4DM0;
#pragma  ioport   PRT4DM1:    0x111
BYTE              PRT4DM1;
#pragma  ioport   PRT4IC0:    0x112
BYTE              PRT4IC0;
#pragma  ioport   PRT4IC1:    0x113
BYTE              PRT4IC1;

#pragma  ioport   PRT5DM0:    0x114
BYTE              PRT5DM0;
#pragma  ioport   PRT5DM1:    0x115
BYTE              PRT5DM1;
#pragma  ioport   PRT5IC0:    0x116
BYTE              PRT5IC0;
#pragma  ioport   PRT5IC1:    0x117
BYTE              PRT5IC1;

#pragma  ioport   PRT6DM0:    0x118
BYTE              PRT6DM0;
#pragma  ioport   PRT6DM1:    0x119
BYTE              PRT6DM1;
#pragma  ioport   PRT6IC0:    0x11A
BYTE              PRT6IC0;
#pragma  ioport   PRT6IC1:    0x11B
BYTE              PRT6IC1;

#pragma  ioport   PRT7DM0:    0x11C
BYTE              PRT7DM0;
#pragma  ioport   PRT7DM1:    0x11D
BYTE              PRT7DM1;
#pragma  ioport   PRT7IC0:    0x11E
BYTE              PRT7IC0;
#pragma  ioport   PRT7IC1:    0x11F
BYTE              PRT7IC1;







#pragma  ioport   DBB00FN:    0x120
BYTE              DBB00FN;
#pragma  ioport   DBB00IN:    0x121
BYTE              DBB00IN;
#pragma  ioport   DBB00OU:    0x122
BYTE              DBB00OU;


#pragma  ioport   DBB01FN:    0x124
BYTE              DBB01FN;
#pragma  ioport   DBB01IN:    0x125
BYTE              DBB01IN;
#pragma  ioport   DBB01OU:    0x126
BYTE              DBB01OU;


#pragma  ioport   DCB02FN:    0x128
BYTE              DCB02FN;
#pragma  ioport   DCB02IN:    0x129
BYTE              DCB02IN;
#pragma  ioport   DCB02OU:    0x12A
BYTE              DCB02OU;


#pragma  ioport   DCB03FN:    0x12C
BYTE              DCB03FN;
#pragma  ioport   DCB03IN:    0x12D
BYTE              DCB03IN;
#pragma  ioport   DCB03OU:    0x12E
BYTE              DCB03OU;


#pragma  ioport   DBB10FN:    0x130
BYTE              DBB10FN;
#pragma  ioport   DBB10IN:    0x131
BYTE              DBB10IN;
#pragma  ioport   DBB10OU:    0x132
BYTE              DBB10OU;


#pragma  ioport   DBB11FN:    0x134
BYTE              DBB11FN;
#pragma  ioport   DBB11IN:    0x135
BYTE              DBB11IN;
#pragma  ioport   DBB11OU:    0x136
BYTE              DBB11OU;


#pragma  ioport   DCB12FN:    0x138
BYTE              DCB12FN;
#pragma  ioport   DCB12IN:    0x139
BYTE              DCB12IN;
#pragma  ioport   DCB12OU:    0x13A
BYTE              DCB12OU;


#pragma  ioport   DCB13FN:    0x13C
BYTE              DCB13FN;
#pragma  ioport   DCB13IN:    0x13D
BYTE              DCB13IN;
#pragma  ioport   DCB13OU:    0x13E
BYTE              DCB13OU;


#pragma  ioport   DBB20FN:    0x140
BYTE              DBB20FN;
#pragma  ioport   DBB20IN:    0x141
BYTE              DBB20IN;
#pragma  ioport   DBB20OU:    0x142
BYTE              DBB20OU;


#pragma  ioport   DBB21FN:    0x144
BYTE              DBB21FN;
#pragma  ioport   DBB21IN:    0x145
BYTE              DBB21IN;
#pragma  ioport   DBB21OU:    0x146
BYTE              DBB21OU;


#pragma  ioport   DCB22FN:    0x148
BYTE              DCB22FN;
#pragma  ioport   DCB22IN:    0x149
BYTE              DCB22IN;
#pragma  ioport   DCB22OU:    0x14A
BYTE              DCB22OU;


#pragma  ioport   DCB23FN:    0x14C
BYTE              DCB23FN;
#pragma  ioport   DCB23IN:    0x14D
BYTE              DCB23IN;
#pragma  ioport   DCB23OU:    0x14E
BYTE              DCB23OU;


#pragma  ioport   DBB30FN:    0x150
BYTE              DBB30FN;
#pragma  ioport   DBB30IN:    0x151
BYTE              DBB30IN;
#pragma  ioport   DBB30OU:    0x152
BYTE              DBB30OU;


#pragma  ioport   DBB31FN:    0x154
BYTE              DBB31FN;
#pragma  ioport   DBB31IN:    0x155
BYTE              DBB31IN;
#pragma  ioport   DBB31OU:    0x156
BYTE              DBB31OU;


#pragma  ioport   DCB32FN:    0x158
BYTE              DCB32FN;
#pragma  ioport   DCB32IN:    0x159
BYTE              DCB32IN;
#pragma  ioport   DCB32OU:    0x15A
BYTE              DCB32OU;


#pragma  ioport   DCB33FN:    0x15C
BYTE              DCB33FN;
#pragma  ioport   DCB33IN:    0x15D
BYTE              DCB33IN;
#pragma  ioport   DCB33OU:    0x15E
BYTE              DCB33OU;







#pragma  ioport   CLK_CR0:    0x160
BYTE              CLK_CR0;





#pragma  ioport   CLK_CR1:    0x161
BYTE              CLK_CR1;




#pragma  ioport   ABF_CR0:    0x162
BYTE              ABF_CR0;









#pragma  ioport   AMD_CR0:    0x163
BYTE              AMD_CR0;



#pragma  ioport   AMD_CR1:    0x166
BYTE              AMD_CR1;



#pragma  ioport   ALT_CR0:    0x167
BYTE              ALT_CR0;



#pragma  ioport   ALT_CR1:    0x168
BYTE              ALT_CR1;



#pragma  ioport   CLK_CR2:    0x169
BYTE              CLK_CR2;







#pragma  ioport   GDI_O_IN:   0x1D0
BYTE              GDI_O_IN;
#pragma  ioport   GDI_E_IN:   0x1D1
BYTE              GDI_E_IN;
#pragma  ioport   GDI_O_OU:   0x1D2
BYTE              GDI_O_OU;
#pragma  ioport   GDI_E_OU:   0x1D3
BYTE              GDI_E_OU;





#pragma  ioport   OSC_GO_EN:  0x1DD
BYTE              OSC_GO_EN;









#pragma  ioport   OSC_CR4:    0x1DE
BYTE              OSC_CR4;





#pragma  ioport   OSC_CR3:    0x1DF
BYTE              OSC_CR3;

#pragma  ioport   OSC_CR0:    0x1E0
BYTE              OSC_CR0;


















#pragma  ioport   OSC_CR1:    0x1E1
BYTE              OSC_CR1;



#pragma  ioport   OSC_CR2:    0x1E2
BYTE              OSC_CR2;




#pragma  ioport   VLT_CR:     0x1E3
BYTE              VLT_CR;













#pragma  ioport   VLT_CMP:    0x1E4
BYTE              VLT_CMP;




#pragma  ioport   DEC_CR2:    0x1E7
BYTE              DEC_CR2;

#pragma  ioport   IMO_TR:     0x1E8
BYTE              IMO_TR;
#pragma  ioport   ILO_TR:     0x1E9
BYTE              ILO_TR;
#pragma  ioport   BDG_TR:     0x1EA
BYTE              BDG_TR;
#pragma  ioport   ECO_TR:     0x1EB
BYTE              ECO_TR;
























































































#line 11 "./main.c"
#line 1 "./lib/PSoCAPI.h"

#line 4 "./lib/PSoCAPI.h"
#line 1 "./lib/Segundos.h"













#line 1 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/CY8C29~1/m8c.h"





















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 15 "./lib/Segundos.h"

#pragma fastcall16 Segundos_EnableInt
#pragma fastcall16 Segundos_DisableInt
#pragma fastcall16 Segundos_Start
#pragma fastcall16 Segundos_Stop
#pragma fastcall16 Segundos_wReadTimer
#pragma fastcall16 Segundos_wReadTimerSaveCV
#pragma fastcall16 Segundos_WritePeriod
#pragma fastcall16 Segundos_wReadCompareValue
#pragma fastcall16 Segundos_WriteCompareValue




#pragma fastcall16 wSegundos_ReadCounter
#pragma fastcall16 wSegundos_CaptureCounter
#pragma fastcall16 wSegundos_ReadTimer
#pragma fastcall16 wSegundos_ReadTimerSaveCV
#pragma fastcall16 wSegundos_ReadCompareValue






extern void Segundos_EnableInt(void);
extern void Segundos_DisableInt(void);
extern void Segundos_Start(void);
extern void Segundos_Stop(void);
extern WORD Segundos_wReadTimer(void);
extern WORD Segundos_wReadTimerSaveCV(void);
extern void Segundos_WritePeriod(WORD wPeriod);
extern WORD Segundos_wReadCompareValue(void);
extern void Segundos_WriteCompareValue(WORD wCompareValue);




extern WORD wSegundos_ReadCompareValue(void);
extern WORD wSegundos_ReadTimerSaveCV(void);
extern WORD wSegundos_ReadCounter(void);
extern WORD wSegundos_ReadTimer(void);
extern WORD wSegundos_CaptureCounter(void);























#pragma ioport  Segundos_COUNTER_LSB_REG:   0x030
BYTE            Segundos_COUNTER_LSB_REG;
#pragma ioport  Segundos_COUNTER_MSB_REG:   0x034
BYTE            Segundos_COUNTER_MSB_REG;
#pragma ioport  Segundos_PERIOD_LSB_REG:    0x031
BYTE            Segundos_PERIOD_LSB_REG;
#pragma ioport  Segundos_PERIOD_MSB_REG:    0x035
BYTE            Segundos_PERIOD_MSB_REG;
#pragma ioport  Segundos_COMPARE_LSB_REG:   0x032
BYTE            Segundos_COMPARE_LSB_REG;
#pragma ioport  Segundos_COMPARE_MSB_REG:   0x036
BYTE            Segundos_COMPARE_MSB_REG;
#pragma ioport  Segundos_CONTROL_LSB_REG:   0x033
BYTE            Segundos_CONTROL_LSB_REG;
#pragma ioport  Segundos_CONTROL_MSB_REG:   0x037
BYTE            Segundos_CONTROL_MSB_REG;
#pragma ioport  Segundos_FUNC_LSB_REG:  0x130
BYTE            Segundos_FUNC_LSB_REG;
#pragma ioport  Segundos_FUNC_MSB_REG:  0x134
BYTE            Segundos_FUNC_MSB_REG;
#pragma ioport  Segundos_INPUT_LSB_REG: 0x131
BYTE            Segundos_INPUT_LSB_REG;
#pragma ioport  Segundos_INPUT_MSB_REG: 0x135
BYTE            Segundos_INPUT_MSB_REG;
#pragma ioport  Segundos_OUTPUT_LSB_REG:    0x132
BYTE            Segundos_OUTPUT_LSB_REG;
#pragma ioport  Segundos_OUTPUT_MSB_REG:    0x136
BYTE            Segundos_OUTPUT_MSB_REG;
#pragma ioport  Segundos_INT_REG:       0x0e1
BYTE            Segundos_INT_REG;







#line 119 "./lib/Segundos.h"


#line 122 "./lib/Segundos.h"


#line 125 "./lib/Segundos.h"


#line 128 "./lib/Segundos.h"





#line 5 "./lib/PSoCAPI.h"
#line 1 "./lib/Timer8.h"













#line 1 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/CY8C29~1/m8c.h"





















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 15 "./lib/Timer8.h"

#pragma fastcall16 Timer8_EnableInt
#pragma fastcall16 Timer8_DisableInt
#pragma fastcall16 Timer8_Start
#pragma fastcall16 Timer8_Stop
#pragma fastcall16 Timer8_bReadTimer
#pragma fastcall16 Timer8_bReadTimerSaveCV
#pragma fastcall16 Timer8_WritePeriod
#pragma fastcall16 Timer8_bReadCompareValue
#pragma fastcall16 Timer8_WriteCompareValue




#pragma fastcall16 bTimer8_ReadCounter
#pragma fastcall16 bTimer8_CaptureCounter
#pragma fastcall16 bTimer8_ReadTimer
#pragma fastcall16 bTimer8_ReadTimerSaveCV
#pragma fastcall16 bTimer8_ReadCompareValue






extern void Timer8_EnableInt(void);
extern void Timer8_DisableInt(void);
extern void Timer8_Start(void);
extern void Timer8_Stop(void);
extern BYTE Timer8_bReadTimer(void);
extern BYTE Timer8_bReadTimerSaveCV(void);
extern void Timer8_WritePeriod(BYTE bPeriod);
extern BYTE Timer8_bReadCompareValue(void);
extern void Timer8_WriteCompareValue(BYTE bCompareValue);




extern BYTE bTimer8_ReadCompareValue(void);
extern BYTE bTimer8_ReadTimerSaveCV(void);
extern BYTE bTimer8_ReadCounter(void);
extern BYTE bTimer8_ReadTimer(void);
extern BYTE bTimer8_CaptureCounter(void);























#pragma ioport  Timer8_COUNTER_REG: 0x020
BYTE            Timer8_COUNTER_REG;
#pragma ioport  Timer8_PERIOD_REG:  0x021
BYTE            Timer8_PERIOD_REG;
#pragma ioport  Timer8_COMPARE_REG: 0x022
BYTE            Timer8_COMPARE_REG;
#pragma ioport  Timer8_CONTROL_REG: 0x023
BYTE            Timer8_CONTROL_REG;
#pragma ioport  Timer8_FUNC_REG:    0x120
BYTE            Timer8_FUNC_REG;
#pragma ioport  Timer8_INPUT_REG:   0x121
BYTE            Timer8_INPUT_REG;
#pragma ioport  Timer8_OUTPUT_REG:  0x122
BYTE            Timer8_OUTPUT_REG;
#pragma ioport  Timer8_INT_REG:       0x0e1
BYTE            Timer8_INT_REG;







#line 105 "./lib/Timer8.h"


#line 108 "./lib/Timer8.h"


#line 111 "./lib/Timer8.h"


#line 114 "./lib/Timer8.h"



#line 6 "./lib/PSoCAPI.h"
#line 1 "./lib/UART.h"














#line 1 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/CY8C29~1/m8c.h"





















































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































#line 16 "./lib/UART.h"








extern char UART_aRxBuffer[];
extern BYTE UART_bRxCnt;
extern BYTE UART_fStatus;






#pragma fastcall16  UART_SetTxIntMode
#pragma fastcall16  UART_EnableInt
#pragma fastcall16  UART_DisableInt
#pragma fastcall16  UART_Start
#pragma fastcall16  UART_Stop
#pragma fastcall16  UART_SendData
#pragma fastcall16  UART_bReadTxStatus
#pragma fastcall16  UART_bReadRxData
#pragma fastcall16  UART_bReadRxStatus
#pragma fastcall16  UART_PutSHexByte
#pragma fastcall16  UART_PutSHexInt
#pragma fastcall16  UART_CPutString
#pragma fastcall16  UART_PutString
#pragma fastcall16  UART_PutChar
#pragma fastcall16  UART_Write
#pragma fastcall16  UART_CWrite

#pragma fastcall16  UART_cGetChar
#pragma fastcall16  UART_cReadChar
#pragma fastcall16  UART_iReadChar
#pragma fastcall16  UART_IntCntl
#pragma fastcall16  UART_TxIntMode
#pragma fastcall16  UART_PutCRLF


#pragma fastcall16  UART_CmdReset
#pragma fastcall16  UART_bCmdCheck
#pragma fastcall16  UART_bErrCheck
#pragma fastcall16  UART_bCmdLength
#pragma fastcall16  UART_szGetParam
#pragma fastcall16  UART_szGetRestOfParams





extern void  UART_SetTxIntMode(BYTE bTxIntMode);
extern void  UART_EnableInt(void);
extern void  UART_DisableInt(void);
extern void  UART_Start(BYTE bParitySetting);
extern void  UART_Stop(void);
extern void  UART_SendData(BYTE bTxData);
extern BYTE  UART_bReadTxStatus(void);
extern BYTE  UART_bReadRxData(void);
extern BYTE  UART_bReadRxStatus(void);


extern void   UART_CPutString(const BYTE * szRomString);
extern void   UART_PutString(BYTE * szRamString);
extern void   UART_PutChar(CHAR cData);
extern void   UART_Write(BYTE * szRamString, BYTE bCount);
extern void   UART_CWrite(const BYTE * szRomString, INT iCount);
extern void   UART_PutSHexByte(BYTE bValue);
extern void   UART_PutSHexInt(INT iValue);
extern void   UART_PutCRLF(void);
extern void   UART_TxIntMode(BYTE bMask);


extern CHAR   UART_cGetChar(void);
extern CHAR   UART_cReadChar(void);
extern INT    UART_iReadChar(void);
extern void   UART_IntCntl(BYTE bMask);


extern void   UART_CmdReset(void);
extern BYTE   UART_bCmdCheck(void);
extern BYTE   UART_bErrCheck(void);
extern BYTE   UART_bCmdLength(void);
extern BYTE * UART_szGetParam(void);
extern BYTE * UART_szGetRestOfParams(void);





















































#pragma ioport  UART_TX_CONTROL_REG:    0x02b
BYTE            UART_TX_CONTROL_REG;
#pragma ioport  UART_TX_SHIFT_REG:  0x028
BYTE            UART_TX_SHIFT_REG;
#pragma ioport  UART_TX_BUFFER_REG: 0x029
BYTE            UART_TX_BUFFER_REG;
#pragma ioport  UART_TX_FUNC_REG:   0x128
BYTE            UART_TX_FUNC_REG;
#pragma ioport  UART_TX_INPUT_REG:  0x129
BYTE            UART_TX_INPUT_REG;
#pragma ioport  UART_TX_OUTPUT_REG: 0x12a
BYTE            UART_TX_OUTPUT_REG;
#pragma ioport  UART_RX_CONTROL_REG:    0x02f
BYTE            UART_RX_CONTROL_REG;
#pragma ioport  UART_RX_SHIFT_REG:  0x02c
BYTE            UART_RX_SHIFT_REG;
#pragma ioport  UART_RX_BUFFER_REG: 0x02e
BYTE            UART_RX_BUFFER_REG;
#pragma ioport  UART_RX_FUNC_REG:   0x12c
BYTE            UART_RX_FUNC_REG;
#pragma ioport  UART_RX_INPUT_REG:  0x12d
BYTE            UART_RX_INPUT_REG;
#pragma ioport  UART_RX_OUTPUT_REG: 0x12e
BYTE            UART_RX_OUTPUT_REG;

#pragma ioport  UART_TX_INT_REG:       0x0e1
BYTE            UART_TX_INT_REG;
#pragma ioport  UART_RX_INT_REG:       0x0e1
BYTE            UART_RX_INT_REG;












#pragma fastcall16  bUART_ReadTxStatus
#pragma fastcall16  bUART_ReadRxData
#pragma fastcall16  bUART_ReadRxStatus
extern BYTE  bUART_ReadTxStatus(void);
extern BYTE  bUART_ReadRxData(void);
extern BYTE  bUART_ReadRxStatus(void);



























#line 7 "./lib/PSoCAPI.h"
#line 12 "./main.c"
#line 1 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/stdlib.h"


#line 1 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/_const.h"




#line 10 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/_const.h"







#line 4 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/stdlib.h"






#line 1 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/limits.h"






















#line 11 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/stdlib.h"




typedef unsigned int size_t;










#line 40 "C:/ARCHIV~1/CYPRES~1/PSOCDE~1/tools/include/stdlib.h"
char *ftoa(float f, int *status);

int abs(int);
double atof( char *);
int atoi( char *);
long atol( char *);
int rand(void);
void srand(unsigned);
long strtol( char *, char **, int);
unsigned long strtoul( char *, char **, int);


char *ltoa(char *buf, long i, int base);
char *itoa(char *buf, int i, int base);
char *ultoa(char *buf, unsigned long i, int base);
char *utoa(char *buf, unsigned i, int base);





















#line 13 "./main.c"
#line 1 "./trabajo.h"














char Cam1=0, Cam2=0;
char Ent1=0, Ent2=0, Ent3=0, Ent4=0;
char Fla1=0, Fla2=0, Fla3=0, Fla4=0;

unsigned char Int1_Tdisp=0, Int1_Tdisp_Uni=0, Int1_Ndisp=0;
unsigned char Int2_Tdisp=0, Int2_Tdisp_Uni=0, Int2_Ndisp=0;
unsigned char TL1_Treal=0, TL1_Treal_Uni=0, TL1_Tfilm=0, TL1_Tfilm_Uni=0;
unsigned char TL2_Treal=0, TL2_Treal_Uni=0, TL2_Tfilm=0, TL2_Tfilm_Uni=0;

char Td_int1, Td_int2, D_tl1, Td_tl1, D_t12,Td_tl2;
char inici;
char listo_int1, listo_int2, listo_tl1, listo_tl2;



void inicializacion(void);
void recibe_valores(void);
void ejecucion(void);
void tipodisparo(void);

void Inicio(void);
char Dato(void);
void Deteccion(void);
void Disparo_camara(char disparo_camara_numero);
void Dispara_camaras (void);
void Disparo_flash(char disparo_flash_numero);
void Unico(void);
void Intervalometro(void);
void TimeLapse(void);







#line 58 "./trabajo.h"

void inicializacion(void)
{

	Timer8_WritePeriod(156);
	Timer8_WriteCompareValue(156/2);
	Timer8_Start();


	UART_Start(0x00);


	LCD_Start();
	LCD_Init();

	Segundos_WritePeriod(10000);
	Segundos_WriteCompareValue(0);
	Segundos_Start();
}







#line 91 "./trabajo.h"

void recibe_valores(void)
{
	Cam1=recibe();
	Cam2=recibe();
	Ent1=recibe();
	Ent2=recibe();
	Ent3=recibe();
	Ent4=recibe();
	Fla1=recibe();
	Fla2=recibe();
	Fla3=recibe();
	Fla4=recibe();

	if (Cam1==2)
	Int1_Tdisp=recibe();
	Int1_Tdisp_Uni=recibe();
	Int1_Ndisp=recibe();

	if (Cam2==2)
	Int2_Tdisp=recibe();
	Int2_Tdisp_Uni=recibe();
	Int2_Ndisp=recibe();

	if (Cam1==3)
	TL1_Treal=recibe();
	TL1_Treal_Uni=recibe();
	TL1_Tfilm=recibe();
	TL1_Tfilm_Uni=recibe();

	if (Cam2==3)
	TL2_Treal=recibe();
	TL2_Treal_Uni=recibe();
	TL2_Tfilm=recibe();
	TL2_Tfilm_Uni=recibe();


}









#line 145 "./trabajo.h"

void ejecucion (void)
{
	tipodisparo();

}








#line 166 "./trabajo.h"

void tipodisparo(void)
{
	if(Cam1==1|Cam2==1)
	activar_sensores();

	if(Cam1==2)
	{

	}

	if(Cam1==3)
	{

	}

	if(Cam2==2)
	{

	}

	if (Cam2==3)
	{

	}
}








#line 207 "./trabajo.h"

void activar_sensores(void)
{
}










#line 228 "./trabajo.h"

void Intervalometro(void)
{
	unsigned char intervalometro_x;




	for (intervalometro_x=0;intervalometro_x<Int_Ndisp;intervalometro_x++)
	{
		Dispara_camaras();
		Temporizador(Int_Tdisp);
	}
}











#line 500 "./trabajo.h"
#line 14 "./main.c"
#line 1 "./comunicaciones.h"





void envia (unsigned char envia_dato);
unsigned char recibe(void);



#line 18 "./comunicaciones.h"
void envia (unsigned char envia_dato)
{
	unsigned char envia_recibe, envia_confirmacion, envia_contador;

	envia_confirmacion=0;
	envia_contador=0;

	while (envia_confirmacion==0)
	{
		UART_PutChar(envia_dato);
		envia_recibe=UART_cGetChar();

		if (envia_recibe==envia_dato) envia_confirmacion='O';
		UART_PutChar(envia_confirmacion);
		envia_contador=envia_contador++;
		if (envia_contador==10)envia_confirmacion=1;
	}
}






#line 49 "./comunicaciones.h"
unsigned char recibe(void)
{
	unsigned char recibe_dato, recibe_confirmacion, recibe_contador;

	recibe_confirmacion=0;
	recibe_contador=0;

	while (recibe_confirmacion==0)
	{
		recibe_dato=UART_cGetChar();
		UART_PutChar(recibe_dato);

		recibe_confirmacion=UART_cGetChar();
		if (recibe_confirmacion=='O')
		return recibe_dato;
		recibe_contador=recibe_contador++;
		if (recibe_contador==10) recibe_confirmacion=1;
	}
	return 255;
}
#line 15 "./main.c"



void main()
{
	inicializacion ();
	recibe_valores();
	ejecucion();
}

