                
.MODEL SMALL
.STACK 100H

.DATA
      
MSG1    DB  13, 10, "ENTER INTEGER: $"   
MSG2    DB  13, 10, "SMALLEST: $"    

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
            
    MOV AH, 1
    INT 21H  
    
    MOV BL, AL  
   
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H  
    
    MOV AH, 1
    INT 21H
    
    MOV BH, AL  
    
    LEA DX, MSG2
    MOV AH, 9
    INT 21H 
      
  
    CMP BH, BL
    JA  @PRINT_2
    MOV DL, BH
    MOV AH, 2
    INT 21H   
    JMP @EXIT
   
    @PRINT_2:
    MOV DL, BL
    MOV AH, 2
    INT 21H  
    JMP @EXIT
       
    @EXIT:  
    MOV AH, 4CH
    INT 21H

 
    MAIN ENDP
    END MAIN
