                                                                                          
.MODEL SMALL
.STACK 100H

.DATA
      
MSG1    DB  13, 10, "Please Enter a String: $"   
MSG2    DB  13, 10, "Total Number of Vowels in the String: $"     

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H  
    MOV BX,0   
    
    MOV AH, 1
    INT 21H  
   @READ            
    CMP AL, 13
    JE @PRINT
   
    CMP AL,'A'
    JE increase      
    CMP AL, 'O'
    JE increase
    CMP AL 'E'
    JE increase 
    CMP AL, 'I'
    JE increase
    CMP AL, 'U'
    JE increase
    
    MOV AH, 1
    INT 21H
    JMP @READ
    
    increase:
    INC BX  
    MOV AH, 1
    INT 21H
    JMP @READ
    
    
    @PRINT 
    MOV AH,9
    MOV DL,BX
    INT 21H
       
    @EXIT:  
    MOV AH, 4CH
    INT 21H

 
    MAIN ENDP
    END MAIN