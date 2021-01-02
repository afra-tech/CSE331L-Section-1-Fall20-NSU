
.MODEL SMALL
.STACK 100H


.DATA

MSG1 DB 13,10,"Enter Digit:$"
MSG2 DB 13,10,"Multiplied by 4 using SHL:$"

.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1 
    MOV AH, 9
    INT 21H
    
    MOV AH, 1 
    INT 21H   
    
    SUB AL,30H     
    
    MOV CL,2       ; 2 shifts so multiplication by 4
    
    SHL AL,CL 
    
    MOV BL,AL
    
    LEA DX, MSG2 
    MOV AH, 9
    INT 21H   
    
    ADD BL,30H        
    
    MOV AH, 2 
    MOV DL, BL
    INT 21H
    
    
    @EXIT:     
    MOV AH, 4CH  
    INT 21H
    
MAIN ENDP
END MAIN
