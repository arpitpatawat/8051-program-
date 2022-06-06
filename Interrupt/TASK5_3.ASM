;UART -> P0
; P1 -> UART + P2
;5KHZ FREQ WAVE AT P3.2 TIMER 1 MODE 1

ORG 000H
LJMP MAIN

ORG 000BH ;timer 0 Interrupt vector label
MOV TH0,#0FFH ;for 5 KHz wave
MOV TL0,#0A4H
CPL P3.2 ;toggle P3.2

RETI ;return from ISR

ORG 0023H ;serial interrupt vector table
LJMP SERIAL

ORG 0030H ;-- after vector table space
MAIN: MOV P1,#0FFH ;make P1 an input port
MOV TMOD,#00100001B ;TIMER 1 MODE 2 FOR SER COM & TIMER 0 MODE 1 FOR WAVE

MOV SCON,#50H ;8-bit, 1 stop, REN enabled
MOV IE,#10010010B ;enable serial, timer 0 int.
MOV TH1,#-6 ;4800 baud rate
SETB TR0 ;start timer 0
SETB TR1 ;start timer 1
BACK: MOV A,P1 ;read data from port 1
MOV SBUF,A ;give a copy to SBUF
MOV P2,A ;write it to P2
HERE:JNB TI,HERE
CLR TI
SJMP BACK 
	
SERIAL:MOV A,SBUF ;recieve data from UART and copy to A
MOV P0,A ;send serial data to P0
CLR RI 
RETI ;return from ISR
END
