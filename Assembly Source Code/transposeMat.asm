.model small
.stack 64
.data
    OUTPUT1 DB "Input: "
    OUTPUT2 DB "Matrix: "
    OUTPUT3 DB "Transposed Matrix: "
    PARA_LIST LABEL BYTE
        MAX_LEN DB 13
        ACT_LEN DB 13
        KB_DATA DB 13 DUP('?')
    TEMP DB 12 DUP('?') 
    CTR1 DB 0
    CTR2 DB 0
    ROW DB 3
    COL DB 4
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA BP, OUTPUT1
        MOV DX, 0
        MOV CX, 7        
        CALL DISPLAY 
        
        LEA DX, PARA_LIST
        CALL GETSTR
        
        LEA BP, OUTPUT2
        MOV DX, 0
        MOV DH, 1
        MOV CX, 8
        CALL DISPLAY
        
        MOV CTR2, 2
        CALL DISPMATRIX   
        
        CALL TRANSPOSE
        
        LEA BP, OUTPUT3
        MOV DX, 0
        MOV DH, 5
        MOV CX, 19
        CALL DISPLAY
        
        MOV COL, 3 
        MOV ROW, 4
        MOV CTR2, 6
        CALL DISPMATRIX
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    
    DISPLAY PROC NEAR
        MOV AH, 13H 
        MOV AL, 01H
        MOV BX, 0FH
        INT 10H
        RET
    DISPLAY ENDP
    
    GETSTR PROC NEAR
        MOV AH, 0AH
        INT 21H
        RET
    GETSTR ENDP
    
    DISPCHAR PROC NEAR
        MOV AH, 02H
        INC DL
        INT 10H
        MOV AH, 0AH
        MOV BX, 0FH
        MOV CX, 1  
        INT 10H
        RET
    DISPCHAR ENDP
    
    DISPMATRIX PROC NEAR   
        LEA SI, KB_DATA 
        MOV DL, 5
        MOV DH, CTR2 
        L2:
            L1:
                MOV AL, [SI]
                CALL DISPCHAR
                MOV AL, 2CH
                CALL DISPCHAR
                INC SI 
                INC CTR1   
                MOV AL, COL
                CMP CTR1, AL
           JNE L1 
           MOV CTR1, 0
           INC DH
           MOV DL, 5 
           MOV AL, CTR2
           ADD AL, ROW 
           CMP DH, AL 
        JNE L2
        RET
    DISPMATRIX ENDP  
    
    TRANSPOSE PROC NEAR  
        LEA SI, KB_DATA
        LEA DI, TEMP    
        MOV BX, 0
        L3:
            MOV CX, 3
            L4:
                MOV AL, [SI]
                MOV [DI], AL
                ADD SI, 4
                INC DI
            LOOP L4  
            LEA SI, KB_DATA
            INC BX
            ADD SI, BX
            CMP BL, COL
        JNE L3
        CALL ASSIGN
        RET
    TRANSPOSE ENDP
    
    ASSIGN PROC NEAR 
        CLD
        MOV CX, 12
        LEA SI, TEMP
        LEA DI, KB_DATA
        REP MOVSB
        RET
    ASSIGN ENDP