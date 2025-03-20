

.model small




.data 



ARRAY DW 40,-20,34,88,400,575,2000


RES DW ?

REM DW ?


.code 


 MOV AX ,@DATA

 MOV DS ,AX

 
 MOV AX,0    ; SUMMTION  IN AX REGSTER

 MOV BX,OFFSET ARRAY
            
            
 MOV CX, 7 ;LOOP COUNTING

 LP: 


    ADD AX ,[BX]

    ADD BX ,  2 
         
  

 LOOP LP   ;DEREMENT CX ,JUMP BACK TO LP IF CX IS NOT EQUAL  O 

      
      
      ;CALCULTE AVERAGE < TO CIVIOTION<USE !^ BIT DIVITION
  MOV BX,7 
  
  CWD     ;SIGN EXTEND AX TO DX:AX   
  
  IDIV BX
            
            
 MOV RES,AX 

 MOV REM,DX


    nop

      .exit
         
         
         
end
  







