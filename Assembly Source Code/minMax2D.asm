.model small
.stack 64
.data
    ARR DB 3, 4, 12, 32
        DB 9, 32, 2, 82
    MIN DB 0
    MAX DB 0 
    COL DB 4
    ROW DB 2
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA BX, ARR
        MOV DX, 0
        MOV AL, [BX]
        MOV MIN, AL
        MOV MAX, AL
        LROW:
            MOV CX, 0
            
            LCOL:
                MOV SI, CX
                MOV AL, [BX+SI]
                CMP MIN, AL
                JL SKIP1
                MOV MIN, AL
                SKIP1:
                CMP MAX, AL
                JG SKIP2
                MOV MAX, AL
                SKIP2:
                INC CX
                CMP CL, COL
            JNE LCOL
            
            ADD BL, COL
            INC DX
            CMP DL, ROW
        JNE LROW
        
                