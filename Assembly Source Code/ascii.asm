.model small
.stack 64
.data             
    ANS DB 255 DUP (?)
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        ;GET CHAR FROM USER
        MOV AH, 01H
        INT 21H
        
        ;VERIFY IF ASCII
        CMP AH, 00
        JE STOP
        
        ;OFFSET THE ANSWER
        MOV DL, AL 
        LEA SI, ANS 
        
        ;SET VALUE OF CX 
        MOV CX, 255 
        SUB CL, DL
         
        ;ASSIGN THE PRECEEDING ASCCI
        L1:      
            CMP DL, 255  
            JE OUT1
            INC AL
            MOV [SI], AL     
            INC DL    
            INC SI
        jmp L1         
          
        ;DISPLAY STRING
        OUT1:
            MOV AH, 13H
            MOV AL, 01
            MOV BH, 00
            MOV BL, 1EH
            LEA BP, ANS
                  
            MOV DH, 0
            MOV DL, 1
            INT 10H
        
       ;END PROG
        STOP:
            MOV AX, 4C00H
            INT 21H
            
    MAIN ENDP