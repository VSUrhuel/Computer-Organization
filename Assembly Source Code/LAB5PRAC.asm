.model small
.stack 64
.data   
    INPUTTXT1 DB "Input 1: "
    INPUTTXT2 DB "Input 2: "
    OUTPUTTXT DB "Sum : "
    PARA_LIST1 LABEL BYTE
        MAX_LEN1 DB 5
        ACT_LEN1 DB ?
        KB_DATA1 DB 5 DUP('0')
    PARA_LIST2 LABEL BYTE
        MAX_LEN2 DB 5
        ACT_LEN2 DB ?
        KB_DATA2 DB 5 DUP('0')
    SUM DB 5 DUP('0')
    TEMP1 DW DUP('0')
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
        CALL RECEIVE   
        
        MOV CX, 0
        MOV CL, ACT_LEN1 
        LEA SI, KB_DATA1
        CALL TOHEX  
        MOV TEMP1, AX     
        
        MOV CX, 9
        LEA BP, INPUTTXT2
        MOV DX, 0
        MOV DH, 1
        CALL DISP
        
        LEA DX, PARA_LIST2
        CALL RECEIVE
        
        MOV CX, 0
        MOV CL, ACT_LEN2
        LEA SI, KB_DATA2
        CALL TOHEX
        ADD AX, TEMP1
       
        LEA SI, SUM
        MOV CX, 5
        CALL TOHEX2
        
        MOV CX, 5
        LEA BP, OUTPUTTXT
        MOV DX, 0
        MOV DH, 2
        CALL DISP  
        
        LEA SI, SUM  
        ADD SI, 4
        MOV DH, 2
        MOV DL, 5
        CALL DISPANS    
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    DISP PROC NEAR
        MOV AH, 13H
        MOV AL, 01
        MOV BH, 00
        MOV BL, 0FH
        INT 10H
        RET
    DISP ENDP
    
    RECEIVE PROC NEAR
        MOV AH, 0AH
        INT 21H
        RET
    RECEIVE ENDP 
    
    TOHEX PROC NEAR  
        MOV BX, 10 
        MOV AX, 0
        L1:
            MUL BX 
            MOV BL, [SI]
            SUB BL, 30H
            MOV BH, 0
            ADD AX, BX
            MOV BX, 10
            INC SI
        LOOP L1
        RET
    TOHEX ENDP 
    
    TOHEX2 PROC NEAR
        MOV BX, 10
        L2:
            DIV BX
            ADD DX, 30H
            MOV [SI], DL
            MOV DX, 0 
            INC SI
        LOOP L2 
        RET  
    TOHEX2 ENDP
    
    SETCUR PROC NEAR
        MOV AH, 02H
        MOV BH, 00
        INT 10H 
        RET
    SETCUR ENDP
                  
    DISPANS PROC NEAR 
        L3:
            CMP DL, 10
            JE EXIT     
            CALL SETCUR
            MOV AH, 0AH
            MOV AL, [SI]
            MOV BX, 0FH
            MOV CX, 1  
            INT 10H  
            DEC SI
            INC DL
        JMP L3   
        EXIT:
            RET
    DISPANS ENDP
            
        
        