ORG 0000h
MOV A, #001H     ;  add  5 DIGIT OF REG NO. 8 bit number(01, 9B, EC , 03, 58) h
MOV B, #09BH
ADD A,B
JNC L1
INC R0
L1: MOV B,A
MOV A, #0ECH
ADD A,B
JNC L2
INC R0
L2: MOV B,A
MOV A, #003H
ADD A,B
JNC L3
INC R0
L3: MOV B,A
MOV A, #058H
ADD A,B
JNC L4
INC R0
L4:
END
