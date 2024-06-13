.model small
.stack 64
.data    
    PARA_LIST LABEL BYTE
        MAX_LEN DB 3
        ACT_LEN DB ?
        KB_DATA DB 3 DUP('?')
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
    TEMP DB 0
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        LEA BP, OUTPUT1
        MOV CX, 7
        MOV DX, 0
        CALL DISPLAY
        
        MOV AH, 0AH
        LEA DX, PARA_LIST
        INT 21H
        
        LEA BP, OUTPUT2 
        MOV CX, 8
        MOV DX, 0
        MOV DH, 1  
        CALL DISPLAY
        
        CALL CONVERT
        MOV AH, 0  
        
        MOV AH, 0
        MOV BL, 9H
        MUL BL  
        
        LEA BP, MONTH_TBL
        ADD BP, AX
        MOV CX, 8
        MOV DL, 9
        MOV DH, 1
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
    
    CONVERT PROC NEAR
        LEA SI, KB_DATA
        MOV CX, 0  
        MOV CL, ACT_LEN 
        DEC CL
        MOV AX, 0
        L1:
            MOV AL, [SI]  
            SUB AL, 30H
            MOV BL, 10H
            MUL BL 
            INC SI   
            MOV BH, [SI] 
            SUB BH, 30H
            ADD AL, BH
        LOOP L1
        RET
   CONVERT ENDP
            