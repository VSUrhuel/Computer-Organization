.model small
.stack 64
.data
    MAT DB 3, 4, 5
        DB 1, 2, 8
        DB 9, 6, 7   
    ROW DB 0
    COL DB 0
    OUTPUT1 DB "Row: "
    OUTPUT2 DB "Col: "
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA BP, OUTPUT1
        MOV CX, 5
        MOV DX, 0
        CALL DISPLAY  
        
        CALL GETCHR
        MOV ROW, AL
        
        LEA BP, OUTPUT2
        MOV CX, 5
        MOV DX, 0
        MOV DH, 1
        CALL DISPLAY
        
        CALL GETCHR
        MOV COL, AL
        
        MOV AL, ROW
        SUB AL, 30H
        MOV BL, 3
        MUL BL 
        SUB COL, 30H
        ADD AL, COL
         
        MOV AH, 02H
        MOV DH, 2
        INT 10H
        
        MOV AH, 0
        LEA SI, MAT
        ADD SI, AX
        MOV CX, 1
        
        MOV AL, [SI]
        MOV AH, 0AH 
        ADD AL, 30H
        MOV BX, 0FH
        INT 10H
        
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
    
    GETCHR PROC NEAR
        MOV AH, 01H
        INT 21H
        RET
    GETCHR ENDP    
