org 100H

A DB 1,1,2,2,3,3
B DB 6 DUP(?)   

MOV DX, OFFSET A
MOV BX, OFFSET B

MOV CX, 6

loopcopy:  
MOV AL, [A]
MOV [B], AL
INC DX
INC BX
LOOP loopcopy


ret
