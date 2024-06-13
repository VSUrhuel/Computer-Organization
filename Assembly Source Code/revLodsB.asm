.model small
.stack 64
.data
    STR DB "HELLO WORLD"
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        CLD   
         MOV CX, 11  
        LEA SI, STR
        
        L1:
        LODSB
        MOV AH, 0AH
        MOV BX, 0FH
        INT 10H
        LOOP L1 
        
        MOV AX, 4C00H
        INT 21H  
        
    MAIN ENDP
        