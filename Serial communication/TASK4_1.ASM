ORG 000H
XX: MOV DPTR, #MYDATA
MOV TMOD, #20H
MOV TH1,#-3
MOV SCON,#50H
SETB TR1
MOV R1,#15
AGAIN:CLR A
MOVC A,@A+DPTR
MOV SBUF,A
HERE: JNB TI,HERE
CLR TI
INC DPTR
DJNZ R1,AGAIN
SJMP XX
MYDATA: DB 'ARPIT 19BEC0358'
END