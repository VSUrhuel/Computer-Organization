.model small
.stack 64
.data
    INPUTTXT1 DB "INPUT 1: "
    INPUTTXT2 DB "INPUT 2: "
    OUTPUTTXT DB "SUM: "
    PARA_LIST1 LABEL BYTE
        MAX_LEN1 DB 5
        ACT_LEN1 DB ?
        KB_DATA1 DB 5 DUP('0')
    PARA_LIST2 LABEL BYTE
        MAX_LEN2 DB 5
        ACT_LEN2 DB ?
        KB_DATA2 DB 5 DUP('0')
    SUM DB 5 DUP('0')
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV CX, 9
        LEA BP, INPUTTXT1   
        MOV DX, 0
        CALL DISP      
        
        LEA DX, PARA_LIST1
        CALL GETSTR 
        
        MOV CX, 9
        LEA BP, INPUTTXT2
        MOV DX, 0
        MOV DH, 1
        CALL DISP
        
        LEA DX, PARA_LIST2
        CALL GETSTR
        
        CALL SUMFUNC    
        
        MOV CX, 5
        LEA BP, OUTPUTTXT    
        MOV DX, 0
        MOV DH, 2
        CALL DISP
        
        MOV CX, 5
        MOV DH, 2
        MOV DL, 5
        LEA BP, SUM
        CALL DISP
        
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    DISP PROC NEAR
        MOV AH, 13H
        MOV AL, 01
        MOV BX, 0FH 
        INT 10H  
        RET
    DISP ENDP    
    
    GETSTR PROC NEAR
        MOV AH, 0AH
        INT 21H 
        RET
    GETSTR ENDP 
    
    SUMFUNC PROC NEAR
        MOV CX, 4    
        LEA SI, KB_DATA1      
        MOV BX, 0
        MOV BL, ACT_LEN1  
        SUB BL, 1
        ADD SI, BX
        LEA DI, KB_DATA2 
        MOV BL, ACT_LEN2
        SUB BL, 1
        ADD DI, BX
        LEA BX, SUM   
        ADD BX, 4
        
        L1:      
            MOV DH, [SI]
            SUB DH, 30H
            MOV DL, [DI]
            SUB DL, 30H
            ADD DL, DH 
            SUB [BX], 30H
            ADD DL, [BX]
            
            CMP DL, 9
            JG CARRY
                ADD DL, 30H
                MOV [BX], DL
                JMP SKIP
            CARRY:
                MOV DH, 10
                MOV AX, 0
                MOV AL, DL
                DIV DH
                ADD AH, 30H
                MOV [BX], AH
                DEC BX  
                ADD AL, 30H
                MOV [BX], AL
                INC BX
            SKIP:
                DEC SI
                DEC DI
                DEC BX
        LOOP L1
        RET
    SUMFUNC ENDP
                  
            
            
        
        