FLUSH
INC R1
JGT R0 R1 0
JGT R0 R1 0
JGT R0 R1 0
JGT R0 R1 0
JGT R1 R0 16
MOVFSI R0 R3 0
RDTM R1
MOVFU R2 0
RDTM R2
SUB R2 R2 R1
MOVFU R1 58
JEQ R2 R1 34
INC R0
MOVT R0 19
JMP 16
MOVT R0 200
MOVF R1 35
INC R1
MOVT R1 35
MOVF R1 15
INC R1
MOVT R1 15
MOVF R1 56
MOVF R0 56
MOVT R0 19
JMP 0
00 00
04 00