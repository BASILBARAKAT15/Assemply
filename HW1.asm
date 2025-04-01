



.MODEL SMALL
   
.DATA
                 
  INARRAY DB "AAA#AAKKBCCcccDDD",0
  
  TEPA DB '?'
  
  
  COUNTA DB ?
  ACHAR  DB ?
  
  
  OUTARRAY DB 100 DUP(?)   
   

.CODE   
  
  
  MOV AX,@DATA
  MOV DS,AX
  
  
  MOV SI,OFFSET INARRAY 
  
  MOV DI,OFFSET OUTARRAY 
  
  
  
  MOV CX, 18
  SUB CX,1 
  
  
  
   

    LO:    ; lOOP TO READ THE INPUT PUT IT IN THE STACK MOMERY
    
    
    MOV AL,[SI]
    
    PUSH AX  
    
    INC SI
    
    LOOP LO ;END THE PUSH TO STACK

    
  MOV CX, 18 ; SET THE COUNET TO READ A STACK 
  
  SUB CX,1   ; SUBTRCTION THE NULL CHARACTERS 
       
       
      
      JMP  TASET_THE_COMPARSON  
       
       
    ACOUNTER:
   
   INC BX
  
   MOV DL ,AL 
   
   MOV COUNTA ,BL
   
   
   
 
 TASET_THE_COMPARSON:
 
 
   POP AX
                                       
                                       
   CMP AL ,'D'  ;  "AAAAAKKBCCccc#DDD"  
   
    JE ACOUNTER
   
   CMP AL ,'#'
   
   
 
   
   JE EXIT 
 
   
   
 
 LOOP TASET_THE_COMPARSON 
 
 
 EXIT:

 
    MOV AH ,02H
    
    INT 21H 
    
      
      MOV AH ,02H 
      
      ADD COUNTA,30H
      
      MOV DL,COUNTA
    
    INT 21H 
   
    
  
  
  
  
  
  
  
  
  
  
  
  
  
    
    
    
    COMMENT !




LP:    ; lOOP TO READ THE INPUT PUT IT IN THE STACK MOMERY

MOV AH,01H

   ;READ A FIRST NUBER
   
   
INT 21H      ; STORD IN AL  



    PUSH AX
             
  ; STORED THE WRETIN INPUT IN INPUT ARRAY
 
  LOOP LP
 
 
 
 
  
 ; ADD CL, BL  ; CALCULTE THE SUMTTION 
   
    MOV CX,2
    MOV BX,0
 
 
 
  POP AX  
  
  ;//////////////////////////
  LL: 
 
   
   CMP AL ,'A'  ; COMPARARION THE CHARACTR "A"
   
   JZ ACOUNTER 
   
   
   
 ;  ACOUNTER:
   
   INC BX
   
   
   MOV DL ,AL
   
    
    
   
     
   
  
  ;/////////////////////////
  
    ; PRINT THE OUT OUTPUT
   
  LOOP LL
  
  
  
  
    MOV AH ,02H
    
    INT 21H 
          
          
    MOV TEPA,BL 
    
    ADD TEPA,30H
    
    MOV DL,TEPA
      MOV AH ,02H
    
    INT 21H 
          
    !    
           
    

  NOP
.EXIT
END



