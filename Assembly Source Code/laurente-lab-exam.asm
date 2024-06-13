.model small
.stack 64
.data
    
    OUTPUT1 DB "Input: "              
    OUTPUT2 DB "Matrix: "
    OUTPUT3 DB "Transposed Matrix: "
    PARA_LIST LABEL BYTE
        MAX_LEN DB 13
        ACT_LEN DB 13
        KB_DATA DB 13 DUP('?') 
    CTR DB 0        
    TEMP DB 12 DUP('?')
    NXT DB 13, 10, '$'  
    ROW DB 3
    COL DB 4
    
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV DX, 0
        MOV CX, 7   
        LEA BP, OUTPUT1
        CALL DISPLAY  
        
        MOV AH, 0AH
        LEA DX, PARA_LIST
        INT 21H       
        
        MOV DX, 0
        MOV DH, 1
        MOV CX, 8
        LEA BP, OUTPUT2
        CALL DISPLAY
        
        CALL DISPMAT
        
        MOV DX, 0  
        MOV DH, 5
        MOV CX, 19
        LEA BP, OUTPUT3
        CALL DISPLAY 
        
        CALL TRANSPOSE
        MOV COL, 3
        CALL DISPMAT
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP 
    
    TRANSPOSE PROC NEAR
        LEA SI, KB_DATA
        LEA DI, TEMP
        MOV AX, 0
        L2:  
            MOV CX, 3
            L3:   
                MOV AH, [SI]
                MOV [DI], AH
                INC DI
                ADD SI, 4
            LOOP L3    
                     
            INC AL  
            LEA SI, KB_DATA
            MOV AH, 0 
            ADD SI, AX
            CMP AL, 4
        JNE L2
        CALL ASSIGN
        RET
    TRANSPOSE ENDP 
        
    
    ASSIGN PROC NEAR
        LEA SI, TEMP
        LEA DI, KB_DATA  
        MOV CX, 12 
        REPE MOVSB 
        RET
    ASSIGN ENDP
                
                
    DISPMAT PROC NEAR 
        MOV CTR, 0
        CALL NEWLINE        
        LEA SI, KB_DATA 
        LOOP1:  
            MOV AL, [SI]
            MOV DL, AL
            MOV AH, 02H
            INT 21H    
            MOV AL, 2CH
            MOV DL, AL
            MOV AH, 02H  
            INT 21H
            INC SI
            INC BL
            CMP BL, COL
            JNE SKIP 
            CALL NEWLINE  
            SKIP:   
                INC CTR   
                CMP CTR,12  
        JNE LOOP1  
        RET
    DISPMAT ENDP   
    
    DISPLAY PROC NEAR  
        MOV AH, 13H
        MOV AL, 01
        MOV BX, 0FH
        INT 10H   
        RET
    DISPLAY ENDP
    
    SETCUR PROC NEAR
        MOV AH, 02H 
        MOV BX, 4C00H  
        
        MOV DL, CTR
        INT 10H
        RET
    SETCUR ENDP  
    
    NEWLINE PROC NEAR
        LEA DX, NXT
        MOV AH, 09H
        INT 21H
        MOV BX, 0  
        RET
    NEWLINE ENDP 
      