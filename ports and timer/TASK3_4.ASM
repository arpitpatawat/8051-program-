ORG 000H
MOV TMOD,#10H ; TIMER 1 MODE 1
HERE:MOV TL1,#66H
MOV TH1,#0FCH
CPL P1.0
ACALL DELAY
SJMP HERE
DELAY: SETB TR1
AGAIN:JNB TF1, AGAIN
CLR TR1
CLR TF1 
RET
END