.model small
.stack 64
.data
    PARAM_LIST LABEL BYTE
        MAX_LEN DB 20
        ACT_LEN DB ?
        KB_DATA DB 20 DUP ('?') 
    REVERSE DB 20 DUP ('?')
    CURSORLOCCOL DB 00H
    CURSORLOCROW DB 00H 
        
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
                 
        
        MOV AH, 0AH
        LEA DX, PARAM_LIST
        INT 21H
        
        CALL NEWLINE
                  
        ;MOV POINTER TO LAST CHARACTER  
        
        LEA SI, KB_DATA
        MOV AH, 00H
        MOV AL, ACT_LEN
        ADD SI, AX 
        DEC SI
        
        DISPLAYCHARS:
        
        DEC ACT_LEN
        MOV AH, 09H
        MOV AL, [SI]
        MOV BH, 0 
        MOV BL, 00001111B
        MOV CX, 1
        DEC SI
        INT 10H 
               
        CALL UPDATECURSOR 
        
        MOV AH, ACT_LEN
        CMP AH, 00H
        JE BREAK
        
        JMP DISPLAYCHARS 
        
        BREAK:
        MOV AH, 4CH
        INT 21H
           
    MAIN ENDP  
    
    UPDATECURSOR PROC NEAR
        INC CURSORLOCCOL
        MOV AH, 02H
        MOV DH, CURSORLOCROW
        MOV DL, CURSORLOCCOL
        INT 10H
    RET
    ENDP UPDATECURSOR
    
    NEWLINE PROC NEAR
        INC CURSORLOCROW
        MOV AH, 02H
        MOV DH, CURSORLOCROW
        MOV DL, 00H
        INT 10H
    RET
    ENDP NEWLINE