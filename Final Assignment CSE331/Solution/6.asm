                                                                                          
.MODEL SMALL
.STACK 100H

OUTPUT MACRO MSG
    LEA DX,MSG
    MOV AH,9
    INT 21H
ENDM  

INPUT MACRO 
    MOV AH,1
    INT 21H
ENDM

.DATA 

N1 DW ? 
N2 DW ? 
GCD DW ?
LCM DW ?
      
MSG1    DB  13, 10, "Please Enter First Digit:$"   
MSG2    DB  13, 10, "Please Enter Second Digit:$"   

NLINE   DB  13,10,"$"

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    OUTPUT MSG1 
    
    INPUT  
     
    MOV AH,0H
    SUB AL,30H
    MOV N1,AX
     
    
    OUTPUT MSG2
    
    INPUT 
    MOV AH,0H
    SUB AL,30H
    MOV N2,AX 
    
    CALC:  
    
    MOV AX,N1  
    MOV BX,N2
    
    GCDLOOP:
    MOV DX,0
    MOV CX, BX
    DIV CX
    MOV BX,DX
    MOV AX, CX
    CMP BX,0
    JNE GCDLOOP 
    
    MOV GCD,AX
    MOV CX,AX
    MOV AX, N1
    MOV BX,N2
    MUL BX
    DIV CX
    MOV LCM, AX 

    
  
    

    @EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN
