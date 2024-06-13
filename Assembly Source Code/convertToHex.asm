.model small
.stack 64
.data
    INTH DB 'J'
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX 
        
        MOV AL, INTH
        
        SHR AL, 4
        ADD AL, 30H
        MOV AH, 0AH
        MOV CX, 1
        MOV BX, 0FH
        MOV DX, 0
        INT 10H
        
        MOV AL, INTH
        SHL AL, 4   
        SHR AL, 4
         
        CMP AL, 9
        JL SKIP
        MOV AH, 10
        ADD AL, 41H
        SUB AL, AH 
        JMP SKIP2
        SKIP: 
        ADD AL, 30H 
        SKIP2:
        MOV AH, 02H
        MOV DX, 0
        MOV DL, 1
        INT 10H
        MOV AH, 0AH
        MOV CX, 1
        MOV BX, 0FH
        INT 10H 
    MAIN ENDP
    
 
        
           