.model small
.stack 64
.data
    PARA_LIST LABEL BYTE
        MAX_LEN DB 13
        ACT_LEN DB ?
        KB_DATA DB 13 DUP('?')
    OUTPUT1 DB "Input: "
    OUTPUT2 DB "Matrix: " 
    CTR1 DB 0
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA BP, OUTPUT1
        MOV CX, 7
        MOV DH, 0
        CALL DISPLAY
        
        LEA DX, PARA_LIST
        MOV AH, 0AH
        INT 21H     
        
        LEA BP, OUTPUT2
        MOV CX, 8
        MOV DX, 0
        MOV DH, 1
        CALL DISPLAY
        
        CALL DISPMATRIX
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    DISPLAY PROC NEAR
        MOV AH, 13H
        MOV AL, 01
        MOV BX, 0FH
        INT 10H
        RET
    DISPLAY ENDP
                        
    DISPCHAR PROC NEAR  
        MOV AH, 02H
        INC DL
        INT 10H
        MOV AH, 0AH
        MOV CX, 1
        MOV BX, 0FH 
        INT 10H
        RET
    DISPCHAR ENDP
                            
                        
    DISPMATRIX PROC NEAR
        LEA SI, KB_DATA
        MOV DX, 0
        MOV DL, 5
        MOV DH, 2  
        L1:
            L2:
                MOV AL, [SI]
                CALL DISPCHAR
                MOV AL, '-'
                CALL DISPCHAR
                INC SI 
                INC CTR1
                CMP CTR1, 4
            JNE L2 
            MOV CTR1, 0 
            MOV DL, 5
            INC DH
            CMP DH, 5 
        JNE L1 
        RET      
     DISPMATRIX ENDP             