
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h  

A DB 5 dup(?)

MOV BX, OFFSET A
MOV [A],5
MOV [A+1],4
MOV [A+2],3
MOV [A+3],2
MOV [A+4],1


ret




