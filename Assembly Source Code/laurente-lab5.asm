.model small
.stack 64
.data
    PARA_LIST1 LABEL BYTE
        MAX_LEN1 DB 5
        ACT_LEN1 DB ?
        KB_DATA1 DB 5 DUP('?')
    PARA_LIST2 LABEL BYTE 
        MAX_LEN2 DB 5
        ACT_LEN2 DB ?
        KB_DATA2 DB 5 DUP('0')
    SUM DB 5 DUP(' ')
    TEMP1 DW 0
    TEMP2 DW 0     
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX
        
        MOV AH, 0AH
        LEA DX, PARA_LIST1
        LEA SI, KB_DATA1
        INT 21H 
        CALL CHECK 
        
        MOV AH, 0AH
        LEA DX, PARA_LIST2
        INT 21H         
        LEA SI, KB_DATA2
        CALL CHECK
        
        LEA SI, KB_DATA1
        MOV CX, 00
        MOV CL, ACT_LEN1
        
        MOV BL, 10
        MOV AX, 00
        MOV BH, 00
        
        CALL CONVERT 
        MOV TEMP1, AX
        
        LEA SI, KB_DATA2
        MOV CX, 00
        MOV CL, ACT_LEN2
        
        MOV BL, 10
        MOV AX, 00
        MOV BH, 00
        
        CALL CONVERT
        MOV TEMP2, AX 
        
        MOV AX, TEMP1
        ADD AX, TEMP2 

        MOV BX, 0
        MOV BL, 10
        MOV DX, 0
        MOV CX, 5
        
        LEA SI, SUM
        MOV DX, 4
        ADD SI, DX
       
        MOV DX, 0
        CALL TOSTR
        
        CALL DISPLAY
                         
        STOP:
            MOV AX, 4C00H
            INT 21H
    MAIN ENDP
    
    CHECK PROC NEAR 
        MOV CX, 0
        MOV CL, ACT_LEN1
        
        J1:
            MOV AH, [SI]
            CMP AH, 30H
            JL STOP
            CMP AH, 39H
            JG STOP    
            INC SI
        LOOP J1   
        RET
    CHECK ENDP     
    
    CONVERT PROC NEAR    
        MOV DX, 00
        MOV DL, 10
        L2:       
            MOV BH, 00
            MOV BL, [SI]
            MUL DX
            SUB BL, 30H
            ADD AX, BX
            INC SI 
            MOV DL, 10
        LOOP L2
        RET
    CONVERT ENDP   
    
    TOSTR PROC NEAR
        L3:    
            DIV BX
            ADD DX, 30H
            MOV [SI], DL
            MOV DL, 0
            DEC SI
        LOOP L3  
        RET
    TOSTR ENDP     
    
    DISPLAY PROC NEAR  
        LEA DI, SUM   
        MOV DX, 0
        
        L4:  
            CMP DL, 5
            JE OUT1   
            CALL SETCURSORPOS
            MOV AH, 0AH
            MOV AL, [DI]
            MOV DH, 0
            MOV BH, 00
            MOV BL, 1EH
            LEA BP, SUM
            MOV CX, 1
            INT 10H  
            INC DI
            INC DL
        JMP L4
        OUT1:
        RET
    DISPLAY ENDP
    
     SETCURSORPOS PROC NEAR
        MOV AH, 02H
        MOV AL, 00
        MOV BH, 00
        INT 10H
        RET
    SETCURSORPOS ENDP 
        
        
        
            
        