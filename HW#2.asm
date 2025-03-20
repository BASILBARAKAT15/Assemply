




.model small



.code 


MAIN:


IN Al , 02H ; READ THE PUSHPOTTUN 

AND AL , 01H 

CMP Al, 00H

JZ SYSTYAM_OFF



CALL READ_TEMP

CALL 7_SEGEMANT



   SYSTYAM_OFF: 
   
   MOV Al ,3FH ;'O'  CODE 
   
   MOV 40H,Al  ;SEND THE OFF TO 7_SEGAMENT
   
   
   
   MOV AL, 71H ; 'F' CODE
   
   MOV 41H,Al  ;SEND THE OFF TO 7_SEGAMENT
   
   
   
   MOV Al,71H  ; 'F' CODE  
   
   MOV 42H,Al  ;SEND THE OFF TO 7_SEGAMENT
   
   
   
 
   
   JMP MAIN



nop
.exit  


   READ_TEMP PROC
    
    IN AL,0FH  ;READN THE TEMPERATURE FRO ADC
    
    
    MOV BL ,AL   ; SAVE THE VALUE IN THE BL
    
    
    ;TEMPERATURE EQUTION IS T=-0.0232X  
    
    
    
    MOV CX ,-23  
    
    MOV AX,1000
    
    IDIV CX
    
    
    MOV AL,AH     ; PUT THE REMAINDER IN AL= -0.023 
    
    
    IMUL BL       ;  -0.023*X=BL RESELT IN AX
    
    
    ADD AL,35     ;   (-0.023*X)+3.5
    
    
    
    
    
    ret
    
    
    
    
     7_SEGEMANT PROC
        
        
     MOV BL,AL  ; SAVE THE TEMPERATURE iN BL
     
     
     
     
     MOV CX , 10   ; TO FIND FIRST NUMBER
     
     MOV AX ,0
     
     MOV AL ,BL
     
     DIV CL
     
     MOV BH,AH     ; STORD THE FIRST NUMBER IN BH
     
     
     
     
     MOV AL,BL     ; FIND THE SECOUND NUMBER
     
     DIV CL
     
     MOV BL,AL     ;STORD THE SECOUND NUMBER IN BL
     
     
     
     
     MOV AL,BL      ; FIND THE THEARD NUMBER
     
     
     MOV CL,10
     
     DIV CL
     
     MOV CH,Al     ; STORD THE THEARD NUMBER IN CH
     
     
     
     
     
     MOV AL,CH
     
     OUT 40H,AL    ; DESPlYE THR THEARD NUMBER
     
     CALL DELAY
     
     
     
     MOV AL,BL 
     
     OUT 41H,AL ;DESPLYE THE SECOND NUMBER
     
     
     CALL DELAY
     
     
     
     
     
     MOV AL,BH
     
     OUT 42H,AL   ;DESPLY THE FIRST NUMBER
     
     CALL DELAY  


     RET
     
     
     
     
     
     
     
     DELAY PROC
        
        PUSH CX
        
        
        MOV CX,60
        
        LP:
        
        NOP
        
        LOOP LP
        
        
        POP CX
        
        RET





end