               
.MODEL SMALL
.STACK 100H

.DATA
      
MSG1    DB  13, 10, "Digits: $"   
MSG2    DB  13, 10, "SUM: $"     

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    MOV BL, 0 
    MOV CL, 0
    
   @LABEL:         
    MOV DL, BL
    MOV AH, 2
    INT 21H 
    INC BL
    ADD CL, BL
    CMP BL, 10 
    JA @EXIT
    JMP @LABEL
    
    
       
    @EXIT: 
    LEA DX, MSG2
    MOV AH, 9
    INT 21H  
        
    MOV DL, CL
    MOV AH, 2
    INT 21H
     
   
    MOV AH, 4CH
    INT 21H

 
    MAIN ENDP
    END MAIN
