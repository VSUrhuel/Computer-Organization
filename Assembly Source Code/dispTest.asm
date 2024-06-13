.model small
.stack 64
.data 
    STR DB 20 DUP('?')
    OUTPUT1 DB "Count: "  
    CTR DB 0  
    CTR1 DB 0
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV AH, 13H
        MOV AL, 01
        MOV CX, 7
        MOV BX, 0FH
        LEA BP, OUTPUT1
        MOV DX, 0
        INT 10H
        
        MOV AH, 01H
        INT 21H 
        SUB AL, 30H
        MOV CTR, AL
        
        MOV BX, 0
        LEA DI, STR  
        
        MOV AH, 02H
        MOV DH, 1
        MOV DL, 0
        MOV CX, 0
        MOV CL, CTR
        INT 10H
        L1:
            MOV AH, 08H
            INT 21H 
            CLD
            STOSB
        LOOP L1   
        
        MOV CL, CTR
        LEA SI, STR  
        MOV DH, 1
        MOV DL, 0  
        
        L2:        
            CLD
            LODSB
            MOV AH, 0AH
            MOV CX, 1
            MOV BX, 0FH
            INT 10H
            MOV AH, 02H
            INC DL    
            INT 10H
            INC CTR1 
            MOV AL, CTR1
            CMP CTR, AL
           
        JNE L2
            
        
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
             
        