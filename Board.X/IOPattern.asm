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
    CLRF PORTB
MainLoop:
    BTG PORTA,RA7 ;Toggle PORTA PIN 7(LED's)
    BTG PORTA,RA6 ;Toggle PORTA PIN 7(LED's)
    BTG PORTA,RA5 ;Toggle PORTA PIN 7(LED's)
    BTG PORTA,RA4 ;Toggle PORTA PIN 7(LED's)
    BTFSS PORTB, RB4 ; If button is pressed, go to other label
    GOTO Delay_one
    GOTO MainLoop
    
LED1:
    BTG PORTA,RA7 ;Toggle PORTA PIN 7(LED's)
    BTFSS PORTB, RB4 ; If button is pressed, go to other label
    GOTO Delay_two
    GOTO Start
LED2:
    BTG PORTA,RA7
    BTG PORTA,RA6 ;Toggle PORTA PIN 7(LED's)
    BTFSS PORTB, RB4 ; If button is pressed, go to other label
    GOTO Delay_three
    GOTO Start
LED3:
    BTG PORTA,RA6
    BTG PORTA,RA5 ;Toggle PORTA PIN 7(LED's)
    BTFSS PORTB, RB4 ; If button is pressed, go to other label
    GOTO Delay_four
    GOTO Start
LED4:
    BTG PORTA,RA5
    BTG PORTA,RA4 ;Toggle PORTA PIN 7(LED's)
    BTFSS PORTB, RB4 ; If button is pressed, go to other label
    GOTO Delay_one
    GOTO Start

Delay_one:
    DECFSZ Delay1,1 ;Decrement Delay1 by 1, skip next instruction if Delay1 is 0
    GOTO Delay_one
    DECFSZ Delay2,1
    GOTO Delay_one
    GOTO LED1
Delay_two:
    DECFSZ Delay1,1 ;Decrement Delay1 by 1, skip next instruction if Delay1 is 0
    GOTO Delay_two
    DECFSZ Delay2,1
    GOTO Delay_two
    GOTO LED2
Delay_three:
    DECFSZ Delay1,1 ;Decrement Delay1 by 1, skip next instruction if Delay1 is 0
    GOTO Delay_three
    DECFSZ Delay2,1
    GOTO Delay_three
    GOTO LED3
Delay_four:
    DECFSZ Delay1,1 ;Decrement Delay1 by 1, skip next instruction if Delay1 is 0
    GOTO Delay_four
    DECFSZ Delay2,1
    GOTO Delay_four
    GOTO LED4
end


