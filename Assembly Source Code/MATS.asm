.MODEL SMALL

.STACK 64

.DATA
    PARA_LIST LABEL BYTE:
        MAX_LEN DB 20
        ACT_LEN DB ?
        KB_DATA DB 20 DUP(' ')
        
    REV_STR DB 19 DUP(' ')    
        
.CODE
    MAIN PROC NEAR
        MOV AX,@DATA
        MOV DS,AX
        MOV ES,AX
        
        MOV AH,0AH
        LEA DX,PARA_LIST
        INT 21H
        
        MOV AX,00H
        MOV BH,0
        MOV BL,ACT_LEN
        DEC BX
        LEA SI,KB_DATA
        LEA DI,REV_STR
        
        L1:
            MOV DL,[SI+BX]
            MOV [DI],DL
            CMP BX,0
            JE EXIT
            INC DI
            DEC BX
            JMP L1
        
        EXIT:
        
        MOV AH,13H
        MOV AL,01H
        MOV BH,0
        MOV BL,0FH
        LEA BP,REV_STR
        MOV CH,0
        MOV CL,ACT_LEN
        MOV DX,00
        INT 10H    
        
        MOV AX,4C00H
        INT 21H
        
    MAIN ENDP         