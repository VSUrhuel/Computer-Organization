.model small
.stack 64
.data
    ARR1 DB 1, 2, 3
         DB 4, 5, 6  
         DB 7, 8, 9
    ARR2 DB 7, 8, 9
         DB 10, 11, 12 
    ROW DB 2
    COL DB 3
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX   
        
        LEA BX, ARR1
        LEA DI, ARR2
        
        MOV AX, 0
        LROW:
            MOV CX, 0
            LCOL:
                MOV AL, [DI]  
                MOV SI, CX
                INC DI
                ADD [BX+SI], AL 
                INC CX
                CMP CL, COL
            JNE LCOL
            
            ADD BL, COL
            INC AH
            CMP AH, ROW
         JNE LROW
        
        
        
        
      