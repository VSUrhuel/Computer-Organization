.model small
.stack 64
.data
    ARR DB "COMPUTER ORGANIZATION$"    
    OUTPUT1 DB "Input: "
    OUTPUT2 DB "Count: " 
    CTR DB 0
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV AH, 13H
        MOV AL, 01
        LEA BP, OUTPUT1
        MOV CX, 7
        MOV BX, 0FH
        MOV DX, 0
        INT 10H
        
        
        MOV AH, 01H
        INT 21H
        
        MOV CX, 22 
        MOV AH, AL      
        MOV AL, 0
        LEA DI, ARR
        L1:
            CMP [DI], AH
            JNE SKIP
            INC AL
            SKIP:
            INC DI 
        LOOP L1 
        
        MOV CTR, AL   
        
        MOV AH, 13H 
        MOV AL, 01H
        LEA BP, OUTPUT2
        MOV CX, 7
        MOV BX, 0FH
        MOV DX, 0
        MOV DH, 1
        INT 10H
        
        MOV AH, 0AH 
        MOV AL, CTR
        ADD AL, 30H
        MOV CX, 1
        MOV DX, 0
        MOV BX, 0FH
        INT 10H
        
        MOV AX, 4C00H 
        INT 21H
    MAIN ENDP