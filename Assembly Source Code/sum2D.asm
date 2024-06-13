.model small
.stack 64
.data
    ARR DB 3, 4, 5,
        DB 6, 7, 8,
        DB 9, 10, 11
    SUM DB 3 DUP('?')
    ROW DB 3
    COL DB 3
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA BX, ARR
        MOV AX, 0     
        LEA SI, SUM
        LROW:
           
            MOV CX, 0
            MOV AL, 0
            LCOL:          
                MOV DI, CX
                ADD AL, [BX+DI]
                INC CX
                CMP CL, COL
            JNE LCOL
            
            MOV [SI], AL
            INC SI 
            ADD BL, COL
            INC AH
            CMP AH, ROW
        JNE LROW
                