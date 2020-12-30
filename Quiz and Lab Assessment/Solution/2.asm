
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

Arr DB 10
PrefixArr DB 10

MOV BX,OFFSET Arr
MOV [BX],1H
MOV [BX+1],1H   

MOV DI,2
MOV SI,0H
MOV CX,8   

LOOP:  

MOV DX,[BX+SI]
INC SI
ADD DX,[BX+SI]  
MOV [BX+DI],DX 
INC DI
loop LOOP


;Arr now contains the fibonacci numbers



ret




