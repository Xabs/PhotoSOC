//*****************************************************************************
//*****************************************************************************
//  FILENAME: Timer1seg.h
//   Version: 2.5, Updated on 2006/06/19 at 11:17:22
//  Generated by PSoC Designer ver 4.4  b1884 : 14 Jan, 2007
//
//  DESCRIPTION: Timer16 User Module C Language interface file
//               for the 22/24/27/29xxx PSoC family of devices
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress MicroSystems 2000-2004. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************

#include <m8c.h>

#pragma fastcall16 Timer1seg_EnableInt
#pragma fastcall16 Timer1seg_DisableInt
#pragma fastcall16 Timer1seg_Start
#pragma fastcall16 Timer1seg_Stop
#pragma fastcall16 Timer1seg_wReadTimer                // Read  DR0
#pragma fastcall16 Timer1seg_wReadTimerSaveCV          // Read  DR0      
#pragma fastcall16 Timer1seg_WritePeriod               // Write DR1
#pragma fastcall16 Timer1seg_wReadCompareValue         // Read  DR2
#pragma fastcall16 Timer1seg_WriteCompareValue         // Write DR2

// The following symbols are deprecated.
// They may be omitted in future releases
//
#pragma fastcall16 wTimer1seg_ReadCounter              // Read  DR0 "Obsolete"
#pragma fastcall16 wTimer1seg_CaptureCounter           // Read  DR0 "Obsolete"
#pragma fastcall16 wTimer1seg_ReadTimer                // Read  DR0 (Deprecated)
#pragma fastcall16 wTimer1seg_ReadTimerSaveCV          // Read  DR0 (Deprecated)
#pragma fastcall16 wTimer1seg_ReadCompareValue         // Read  DR2 (Deprecated)


//-------------------------------------------------
// Prototypes of the Timer1seg API.
//-------------------------------------------------

extern void Timer1seg_EnableInt(void);                           // Proxy 1
extern void Timer1seg_DisableInt(void);                          // Proxy 1
extern void Timer1seg_Start(void);                               // Proxy 1
extern void Timer1seg_Stop(void);                                // Proxy 1
extern WORD Timer1seg_wReadTimer(void);                          // Proxy 1
extern WORD Timer1seg_wReadTimerSaveCV(void);                    // Proxy 2
extern void Timer1seg_WritePeriod(WORD wPeriod);                 // Proxy 1
extern WORD Timer1seg_wReadCompareValue(void);                   // Proxy 1
extern void Timer1seg_WriteCompareValue(WORD wCompareValue);     // Proxy 1

// The following functions are deprecated.
// They may be omitted in future releases
//
extern WORD wTimer1seg_ReadCompareValue(void);       // Deprecated
extern WORD wTimer1seg_ReadTimerSaveCV(void);        // Deprecated
extern WORD wTimer1seg_ReadCounter(void);            // Obsolete
extern WORD wTimer1seg_ReadTimer(void);              // Deprecated
extern WORD wTimer1seg_CaptureCounter(void);         // Obsolete


//--------------------------------------------------
// Constants for Timer1seg API's.
//--------------------------------------------------

#define Timer1seg_CONTROL_REG_START_BIT        ( 0x01 )
#define Timer1seg_INT_REG_ADDR                 ( 0x0e1 )
#define Timer1seg_INT_MASK                     ( 0x20 )


//--------------------------------------------------
// Constants for Timer1seg user defined values
//--------------------------------------------------

#define Timer1seg_PERIOD                       ( 0x0 )
#define Timer1seg_COMPARE_VALUE                ( 0x0 )


//-------------------------------------------------
// Register Addresses for Timer1seg
//-------------------------------------------------

#pragma ioport  Timer1seg_COUNTER_LSB_REG:  0x030          //Count register LSB
BYTE            Timer1seg_COUNTER_LSB_REG;
#pragma ioport  Timer1seg_COUNTER_MSB_REG:  0x034          //Count register MSB
BYTE            Timer1seg_COUNTER_MSB_REG;
#pragma ioport  Timer1seg_PERIOD_LSB_REG:   0x031          //Period register LSB
BYTE            Timer1seg_PERIOD_LSB_REG;
#pragma ioport  Timer1seg_PERIOD_MSB_REG:   0x035          //Period register MSB
BYTE            Timer1seg_PERIOD_MSB_REG;
#pragma ioport  Timer1seg_COMPARE_LSB_REG:  0x032          //Compare register LSB
BYTE            Timer1seg_COMPARE_LSB_REG;
#pragma ioport  Timer1seg_COMPARE_MSB_REG:  0x036          //Compare register MSB
BYTE            Timer1seg_COMPARE_MSB_REG;
#pragma ioport  Timer1seg_CONTROL_LSB_REG:  0x033          //Control register LSB
BYTE            Timer1seg_CONTROL_LSB_REG;
#pragma ioport  Timer1seg_CONTROL_MSB_REG:  0x037          //Control register MSB
BYTE            Timer1seg_CONTROL_MSB_REG;
#pragma ioport  Timer1seg_FUNC_LSB_REG: 0x130              //Function register LSB
BYTE            Timer1seg_FUNC_LSB_REG;
#pragma ioport  Timer1seg_FUNC_MSB_REG: 0x134              //Function register MSB
BYTE            Timer1seg_FUNC_MSB_REG;
#pragma ioport  Timer1seg_INPUT_LSB_REG:    0x131          //Input register LSB
BYTE            Timer1seg_INPUT_LSB_REG;
#pragma ioport  Timer1seg_INPUT_MSB_REG:    0x135          //Input register MSB
BYTE            Timer1seg_INPUT_MSB_REG;
#pragma ioport  Timer1seg_OUTPUT_LSB_REG:   0x132          //Output register LSB
BYTE            Timer1seg_OUTPUT_LSB_REG;
#pragma ioport  Timer1seg_OUTPUT_MSB_REG:   0x136          //Output register MSB
BYTE            Timer1seg_OUTPUT_MSB_REG;
#pragma ioport  Timer1seg_INT_REG:       0x0e1             //Interrupt Mask Register
BYTE            Timer1seg_INT_REG;


//-------------------------------------------------
// Timer1seg Macro 'Functions'
//-------------------------------------------------

#define Timer1seg_Start_M \
   ( Timer1seg_CONTROL_LSB_REG |=  Timer1seg_CONTROL_REG_START_BIT )

#define Timer1seg_Stop_M  \
   ( Timer1seg_CONTROL_LSB_REG &= ~Timer1seg_CONTROL_REG_START_BIT )

#define Timer1seg_EnableInt_M   \
   M8C_EnableIntMask(  Timer1seg_INT_REG, Timer1seg_INT_MASK )

#define Timer1seg_DisableInt_M  \
   M8C_DisableIntMask( Timer1seg_INT_REG, Timer1seg_INT_MASK )


// end of file Timer1seg.h


