.model small
.stack 64
.data
    PARA_LIST1 LABEL BYTE
        MAX_LEN1 DB 255
        ACT_LEN1 DB ?
        KB_DATA1 DB 255 DUP('?')
    PARA_LIST2 LABEL BYTE
        MAX_LEN2 DB 255
        ACT_LEN2 DB ?
        KB_DATA2 DB 255 DUP('?')  
    ANS DB '?'
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV AH, 0AH
        LEA DX, PARA_LIST1
        INT 21H
        
        MOV AH, 0AH
        LEA DX, PARA_LIST2
        INT 21H
        
        CLD
        MOV CX, 0
        MOV CL, ACT_LEN1
        LEA SI, KB_DATA1
        LEA DI, KB_DATA2
        REPE CMPSB
        
        CMP CL, 0
        JNE SKIP: 
        MOV ANS, 1
        JMP SKIP2
        SKIP:
        MOV ANS, 0 
        
        SKIP2:
        MOV AH, 0AH
        MOV AL, ANS
        ADD AL, 30H
        MOV CX, 1
        MOV BX, 0FH
        MOV DX, 0
        INT 10H
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
        
        