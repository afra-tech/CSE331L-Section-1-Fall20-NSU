               
.MODEL SMALL
.STACK 100H

.DATA
  
  line_1 DB "*****"
  line_2 DB "**"    
  line_3 DB "***"

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX   
    
    MOV CX, 5
    
    PTRN:
       LEA DX, line_1
       MOV AH, 9
       INT 21H
    
    loop PTRN
     
   
    MOV AH, 4CH
    INT 21H

 
    MAIN ENDP
    END MAIN
