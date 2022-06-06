ORG 0000h	 ;  add  5 MAX 8 bit number(FF, FF, FF, FF, FF) h
MOV A, #0FFH   ;load FF to A  
MOV B, #0FFH ;load FF to B
ADD A,B ;add A and B
JNC L1 ;jump to L1 label if there is no carry
INC R0	; increment R0
L1: MOV B,A
MOV A, #0FFH
ADD A,B
JNC L2
INC R0
L2: MOV B,A
MOV A, #0FFH
ADD A,B
JNC L3
INC R0
L3: MOV B,A
MOV A, #0FFH
ADD A,B
JNC L4
INC R0
L4:
END