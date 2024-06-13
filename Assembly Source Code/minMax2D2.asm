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
        MOV AL, [BX]
        MOV MIN, AL
        MOV MAX, AL 
        MOV DX, 0
        LROW:
            MOV CL, COL
            
            LCOL:
                MOV SI, CX
                MOV AL, [BX+SI]
                CMP MIN, AL
                JL SKIP  
                MOV MIN, AL
                SKIP:
                CMP MAX, AL
                JG SKIP1
                MOV MAX, AL  
                SKIP1: 
            LOOP LCOL  
            
            ADD BL, COL   
            INC DX
            CMP DL, ROW
         JNE LROW
            
            
        