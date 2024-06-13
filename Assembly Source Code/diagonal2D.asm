.model small
.stack 64
.data
    ARR DB 1, 2, 3
        DB 4, 2, 6
        DB 7, 8, 3
    ROW DB 3
    COL DB 3
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA BX, ARR
        MOV AX, 0
        LROW:
            MOV CX, 0  
            
            LCOL: 
                CMP CL, AH
                JNE SKIP:   
                MOV SI, CX
                ADD AL, [BX+SI]
                SKIP:
                INC CL
                CMP CL, COL
            JNE LCOL  
            INC AH
            ADD BL, COL
            CMP AH, ROW
         JNE LROW
                