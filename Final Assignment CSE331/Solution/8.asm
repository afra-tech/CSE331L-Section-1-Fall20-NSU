                                                                                          


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

STRING DB ? 
REV    DB ?
      
MSG1    DB  13, 10, "Please Enter a String: $"   
MSG2    DB  13, 10, "The string is a palindrome. $"
MSG3    DB  13, 10, "The string is NOT a palindrome. $"  
LINE    DB  13,10,"$"

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    OUTPUT MSG1 
                 
      
    LEA SI, STRING  
  
    MOV CX, 0H 
     
                                                     
   @READ:  
    INPUT 
    MOV BL,AL           
    CMP BL, 13
    JE @PRINT
    
    MOV [SI],BL
    INC SI 
    INC CX 
    JMP @READ
   
     
     
    @PRINT:
        
      OUTPUT LINE   
      MOV AL, '$'
      MOV [SI], AL 
      DEC SI
      OUTPUT STRING 
      OUTPUT LINE
        
      LEA DI,REV 
      DEC CX
      
      LOOP1: 
      MOV AL,[SI]
      MOV [DI],AL 
      INC DI 
      DEC SI
      loop LOOP1 
      
      
      MOV AL,'$'
      MOV [DI],AL
      
      OUTPUT REV
     
  
    @CHECK: 
    
     LEA DI,REV 
     LEA SI,STRING
     
     LOOP2:
     MOV AL,[SI]  
     CMP [DI],AL
     JNE @NOPE
   
     INC DI
     INC SI  
     loop LOOP2
       
    
    @YEP:  
    OUTPUT MSG2   
    JMP @EXIT
       
    @NOPE:  
    OUTPUT MSG3

    @EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN
