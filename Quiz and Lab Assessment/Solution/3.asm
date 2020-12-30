                                                                                          
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
            
    MOV AH, 2
    INT 21H  
   
    MOV BL,AL 
    
  
       
    @EXIT:  
    MOV AH, 4CH
    INT 21H

 
    MAIN ENDP
    END MAIN