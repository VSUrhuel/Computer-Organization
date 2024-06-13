.model small
.stack 64
.data
    ARR DB 1, 21, 32
        DB 83, 2, 32 
        DB 8, 17, 3  
    SUM DB 0
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
                MOV DI, CX
                MOV AL, [BX+DI]
                CMP CL, AH
                JNE SKIP
                ADD SUM, AL
                SKIP:
                INC CL
                CMP CL, 3
            JNE LCOL
            
            ADD BX, 3
            INC AH  
            CMP AH, 3  
            
        JNE LROW 
         
        CALL DISPLAY
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    DISPLAY PROC NEAR
        MOV AL, SUM
        ADD AL, 30H
        MOV AH, 0AH
        MOV CX, 1
        MOV BX, 0FH
        INT 10H
        RET
    DISPLAY ENDP
            
                
            
            