.model small
.stack 64
.data
    STR DB "COMPUTTTTTER OIZATIO"
    CHA DB '0'
    CTR DB 0
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA DI, STR
        MOV CX, 22
        L1:
            MOV AL, 0
            MOV AH, [DI]  
            LEA SI, STR
            ADD SI, CX
            L2:       
                CMP [SI], AH
                JNE SKIP
                INC AL
                SKIP:
                DEC SI
                CMP SI, 0
            JNE L2 
            
            CMP CTR, AL
            JG SKIP1
            MOV CTR, AL
            MOV AL, [DI]
            MOV CHA, AL
            SKIP1:
            INC DI
        LOOP L1
        
        MOV AH, 0AH
        MOV AL, CHA
        MOV CX, 1
        MOV BX, 0FH
        MOV DX, 0
        INT 10H
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
        