
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h  

A EQU 2
B EQU 2
C EQU 2
D EQU 2
E EQU 2  

ADD AX,A
ADD AX,B
ADD AX,C
ADD AX,D
ADD AX,E
MOV BX,AX


ret




