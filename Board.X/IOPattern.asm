#include <p18F45K50.inc>
    
CONFIG WDTEN=OFF; disable watchdog timer
CONFIG MCLRE = ON; MCLEAR Pin on
CONFIG DEBUG = ON; Enable Debug Mode
CONFIG LVP = ON; Low-Voltage programming
CONFIG PBADEN = OFF
CONFIG FOSC = INTOSCIO;Internal oscillator as primary OSC
Delay1 EQU 0X00
Delay2 EQU 0X02
org 0; start code at 0
Start:
    CLRF TRISA
    CLRF PORTA
    CLRF LATA
MainLoop:
    BTG PORTA,RA7 ;Toggle PORTA PIN 7(LED's)
Delay:
    DECFSZ Delay1,1 ;Decrement Delay1 by 1, skip next instruction if 
    Delay1 is 0
    GOTO Delay
    DECFSZ Delay2,1
    GOTO Delay
    GOTO MainLoop
end

