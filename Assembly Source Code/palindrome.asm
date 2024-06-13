.model small
.stack 64
.data
    PARA_LIST LABEL BYTE
        MAX_LEN DB 255
        ACT_LEN DB ?
        KB_DATA DB 255 DUP('?')
    OUTPUT1 DB "Is Palindrome: "  
    ANS DB '?'
.code
    MOV AX, @DATA
    MOV ES, AX
    MOV DS, AX
    
    MOV AH, 0AH
    LEA DX, PARA_LIST
    INT 21H
    
    MOV CL, ACT_LEN 
    LEA DI, KB_DATA
    MOV CH, 0
    ADD DI, CX
    DEC DI
    SHR CL, 1 
    LEA SI, KB_DATA
    
    L2:    
        MOV AL, [DI]
        CMP [SI], AL
        JNE EXIT
        INC SI
        DEC DI
    LOOP L2   
    
    EXIT:
    CMP CL, 0
    JNE SKIP
    MOV ANS, 1
    JMP SKIP2
    SKIP:
    MOV ANS, 0 
    
    SKIP2:
    MOV AH, 13H
    MOV AL, 01
    LEA BP, OUTPUT1
    MOV CX, 14
    MOV BX, 0FH
    MOV DX, 0
    MOV DH, 1
    INT 10H   
    
    MOV AH, 0AH
    MOV AL, ANS
    ADD AL, 30H
    MOV CX, 1
    MOV BX, 0FH
    INT 10H 
    
    MOV AX, 4C00H
    INT 21H   
    
    
    