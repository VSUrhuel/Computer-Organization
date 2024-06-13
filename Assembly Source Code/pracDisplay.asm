.model small
.stack 64
.data
    PARA_LIST1 LABEL BYTE
        MAX_LEN1 DB 255
        ACT_LEN1 DB ?
        KB_DATA1 DB 255 DUP('?')
    OUTPUT1 DB "Name: "
    OUTPUT2 DB "Hi, "
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV AH, 13H
        MOV AL, 01H
        LEA BP, OUTPUT1
        MOV BX, 0FH
        MOV DX, 0  
        MOV CX, 6
        INT 10H
        
        MOV AH, 0AH
        LEA DX, PARA_LIST1
        INT 21H
        
        MOV AH, 13H
        MOV AL, 01H
        LEA BP, OUTPUT2
        MOV BX, 0FH
        MOV DX, 0
        MOV DH, 1
        MOV CX, 3
        INT 10H    
        
        MOV AH, 13H
        MOV AL, 01H
        LEA BP, KB_DATA1 
        MOV BX, 0FH
        MOV CL, ACT_LEN1
        MOV Dl, 4
        INT 10H
        
        
        