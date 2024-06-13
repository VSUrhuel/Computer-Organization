.model small
.stack 64
.data
    ARR1 DB 3, 6, 2, 4
    ARR2 DB 8, 1, 9, 5
    ARR3 DB 8 DUP('?')
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA SI, ARR1
        LEA DI, ARR2
        LEA BX, ARR3
        MOV CX, 4
        L1:
            MOV AL, [SI]
            MOV [BX], AL
            INC SI
            INC BX
        LOOP L1
        
        MOV CX, 4
        L2:
            MOV AL, [DI]
            MOV [BX], AL
            INC DI
            INC BX
        LOOP L2
        
        CALL SORT
       
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    SORT PROC NEAR
        LEA BX, ARR3
        MOV CX, 7
        L3:    
            LEA BX, ARR3  
            MOV DX, 0
            L4:   
                MOV AL, [BX]
                MOV AH, [BX+1]
                CMP AL, AH
                JL SKIP
                XCHG AL, AH
                MOV [BX], AL
                MOV [BX+1], AH
                SKIP:
                INC DL
                INC BX
                CMP DL, CL
            JNE L4
        LOOP L3   
        RET
   SORT ENDP
            
            