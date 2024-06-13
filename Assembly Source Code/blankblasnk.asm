.model small
.stack 64
.data
    A DB 12
    B DB 6 
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV CX, 00
        MOV CL, B
        
        L1:
            MOV AH, 02H
            MOV BH, 00
            MOV DH, A
            MOV DL, 10
            INT 10H
                MOV AH, 0AH
                MOV AL, 6AH
                MOV BH, 00
                INT 10H
                INC A
        LOOP L1
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP