                                                                                          


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

STRING DB "abcdefghijklmnopqrstuvwxyz$"  
NLINE DB 13,10,"$"
      

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
                 
      
    LEA SI, STRING  
                 
                
    MOV CX, 25 
    
    ADD SI,CX
 
    
    
    OUTPUT NLINE
     
     
   @PRINT:
    
    MOV AH,2
    MOV DL,[SI]
    INT 21H 
    DEC SI 
    loop @PRINT
    
    

    @EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN
