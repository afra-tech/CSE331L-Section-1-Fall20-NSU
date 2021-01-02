
.MODEL SMALL
.STACK 100H


.DATA

MSG1 DB "Enter Lowercase Character:$"
MSG2 DB 0DH,0AH, "The Uppercase Character is: $"


.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1 
    MOV AH, 9
    INT 21H
    
    MOV AH, 1 ;take char input
    INT 21H
    
    MOV BL, AL  
    
    SUB BL,20H
    
    LEA DX, MSG2 ;display prompt
    MOV AH, 9
    INT 21H
    
    MOV AH, 2 ;print string
    MOV DL, BL
    INT 21H
    
    
    @EXIT:     
    MOV AH, 4CH   ;carriage return on exit
    INT 21H
    
MAIN ENDP
END MAIN
