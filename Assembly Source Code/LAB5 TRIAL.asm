.model small
.stack 64
.data
    INPUTTXT1 DB "Input 1: "
    INPUTTXT2 DB "Input 2: "
    OUTPUTTXT DB "Sum: "
    PARA_LIST1 LABEL BYTE
        MAX_LEN1 DB 5
        ACT_LEN1 DB ?
        KB_DATA1 DB 5
    PARA_LIST2 LABEL BYTE
        MAX_LEN2 DB 5
        ACT_LEN2 DB ?
        KB_DATA2 DB 5
    SUM DB 5 DUP('0')
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV CX, 9
        LEA BP, INPUTTXT1
        CALL DISP 
        
        LEA DX, PARA_LIST1
        CALL RECEIVE  
        
        MOV CX, 9
        LEA BP, INPUTTXT2
        CALL DISP  
        
        LEA DX, PARA_LIST2
        CALL RECEIVE
        
        CALL SUMFUNC
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    DISP PROC NEAR
        MOV AH, 13H
        MOV AL, 01
        MOV BH, 00
        MOV BL, 0FH
        MOV DX, 0
        INT 10H    
        RET
    DISP ENDP  
    
    RECEIVE PROC NEAR
        MOV AH, 0AH
        INT 21H
        RET
    RECEIVE ENDP
    
    SUMFUNC PROC NEAR
        LEA SI, KB_DATA1
        LEA DI, KB_DATA2
        LEA DX, SUM
        MOV AX, 0     
        
        MOV CX, 5
        L1:
            MOV AL, [SI] 
            SUB AL, 30H
            MOV AH, [DI]
            SUB AH, 30H
            ADD AL, AH  
            ADD AL. [DX]
            
            CMP AL, 9
            JG CARRY  
            ADD AL, 30H
            MOV [DX], AL
            
            CARRY: 
                 
                
                
            