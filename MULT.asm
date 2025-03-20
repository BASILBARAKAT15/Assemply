   
   
   
   .model small
   
   
 .data
    multiplicand DW 20       ;  Multiplicand
           
    multiplier DW 120         ;  Multiplier
    
    result DW 0              ;  RESULT
    
   

.code

MOv AX,@DATA 

MOV DS,AX 

MOV AX,0


    MOV AX, multiplicand   ; STORDED THE MULIPLICAND IN AX  
    
    MOV BX, multiplier     ; STORDED THE MULTIPLIER IN BX
    
    MOV CX,0               ; CX = 0 
    
                  

multiply_loop:

    TEST BX, 1
                   ;  
    JZ skip_addition
             ; 
   ADD CX,AX
               
               
  COMMENT!             
               
  
       MOV SI,AX
       
       SUM:        ;SUNTION LOOP
       
       MOV DX,0
       
       XOR AX,CX   ; SUMTION WITHOUT A CAARY
      
       AND SI,CX   ; SUMTION WITH A CAARY
      
       SHL SI,1
      
       MOV CX,AX
      
       MOV AX,SI
      
       TEST SI,SI
      
       JNZ SUM
      
       MOV AX,CX
  
       !

  
               

skip_addition:

    SHL AX, 1
                    
    SHR BX, 1
                   
    JNZ multiply_loop        

    MOV [result], CX 
    
  
    
    
       

   nop
.exit
end
