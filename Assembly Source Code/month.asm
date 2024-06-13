.model small
.stack 64
.data  
    MONTH_TBL DB 'January..'
                DB 'February.'
                DB 'March....'
                DB 'April....'
                DB 'May......'
                DB 'June.....'
                DB 'July.....'
                DB 'August...'
                DB 'September'
                DB 'October..'
                DB 'November.'
                DB 'December.'  
    OUTPUT1 DB "Input: "
    OUTPUT2 DB "Output: "  
    ANS DB 0
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA BP, OUTPUT1
        MOV CX, 7
        MOV DX, 0
        CALL DISPLAY
        
        MOV AH, 01H
        INT 21H    
        MOV ANS, AL
        
        LEA BP, OUTPUT2
        MOV CX, 8
        MOV DX, 0
        INC DH
        CALL DISPLAY
        
        MOV AH, 0  
        MOV AL, ANS  
        CMP AL, 39H
        JLE SKIP
        SUB AL, 41H  
        ADD AL, 10
        JMP SKIP2
        SKIP:
        SUB AL, 30H
        SKIP2:
        DEC AL
        MOV BL, 9
        MUL BL
        
        LEA BP, MONTH_TBL
        ADD BP, AX
        MOV CX, 9
        MOV DH, 1
        MOV DL, 8
        CALL DISPLAY
        
        
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    DISPLAY PROC NEAR
        MOV AH, 13H
        MOV AL, 01
        MOV BX, 0FH
        INT 10H
        RET
    DISPLAY ENDP    