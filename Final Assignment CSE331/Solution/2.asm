                                                                                          
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

STRING1 DB ? 
REVERSED    DB ?
      
MSG1    DB  13, 10, "Please Enter The Alphabets:$"   
MSG2    DB  13, 10, "The reversed alphabets:$"
NLINE   DB  13,10,"$"

.CODE
        
 MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    OUTPUT MSG1 
                 
      
    LEA SI, STRING1  
  
    MOV CX, 0H 
     
                                                     
   @READ:  
    INPUT          
    CMP AL, 13
    JE @REVERSE
    
    MOV [SI],AL
    INC SI 
    INC CX 
    JMP @READ
   
     
     
    @REVERSE: 
     

      LEA DI,REVERSED 
      
      LOOP:  
      DEC SI
      MOV AX,[SI]  
      MOV [DI],AX  
      
      INC DI 
     
      loop LOOP
      
      
      MOV AL,'$'
      MOV [DI],AL
      
      OUTPUT NLINE
      OUTPUT REVERSED
     
  

    @EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN
