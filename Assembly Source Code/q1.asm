.model small
.stack 64
.data
    STR1 db "COMPUTER ORGANIZATION", '$'
    PARA_LIST LABEL BYTE
        MAX_LEN db 20
        ACT_LEN db ?
        KB_DATA db 20 dup('B'), '$'    
.code
    mov AX, @data
    mov DS, AX
    mov ES, AX    
    
    
    mov AH, 0AH
    LEA DX, PARA_LIST
    INT 21H
    
    LO:
        LEA BX, KB_DATA
        LEA SI, STR1
        MOV CH, 00
        MOV CL, ACT_LEN
    
    L1:
        MOV AL, [BX]
        CMP [SI], AL
        JE CONT
        JNE STOP
    CONT:
        INC SI
        INC BX
    
    LOOP L1
        LEA DX, STR1
        MOV AH, 09H
        INT 21H
        JMP EXIT
        
    STOP:
        LEA DX, KB_DATA
        MOV AH, 09H
        INT 21H
    EXIT:
        MOV AX, 4C00H
        INT 21H          
        
        
        MOV AH, 0AH
        MOV AL, CHAR
        MOV BH, PAGE
        MOV BL, VALUE PIX
        MOV CX, REPEATE
        INT 10H
        
        MOV AH, 13H
        MOV AL, 01
        MOV BH, 00
        MOV BL, 1EH
        LEA BP, ADDRESS
        MOV CX, LEN
        MOV DH, 0
        MOV DL, 0
        INT 10H
        
        PARA_LIST LABEL BYTE
            MAX_LEN DB 5
            ACT_LEN DB ?
            KB_DATA DB 20 DUP('?')
        MOV AH, 0AH
        LEA DX, PARA_LIST
        INT 21H
        
        MOV AH, 01H
        INT 21H
        
        MOV AH, 02H
        MOV BH, 00
        MOV DH, DEPENDS
        MOV DL, DEPENDS
        INT 10H
      
        
        
      
