.model small
.stack 64
.data  
    INPUTTXT1 DB "Input 1: "
    INPUTTXT2 DB "Input 2: "
    OUTPUTTEXT DB "Sum: "
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
    TEMP2 DW DUP('0')
    
.code  
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX  
        
        MOV DX, 0
        LEA BP, INPUTTXT1
        CALL DISPTXT 
        
        LEA DX, PARA_LIST1
        CALL GETINPUT 
        
        MOV DH, 01
        MOV DL, 00
        LEA BP, INPUTTXT2 
        MOV CX, 9
        CALL DISPTXT
        
        LEA DX, PARA_LIST2
        CALL GETINPUT  
        
        MOV CX, 0
        MOV CL, ACT_LEN1   
        LEA SI, KB_DATA1
        CALL CONVERT 
        MOV TEMP1, AX 
        
        MOV CX, 0
        MOV CL, ACT_LEN2   
        LEA SI, KB_DATA2
        CALL CONVERT   
        
        ADD AX, TEMP1 
        MOV TEMP2, AX 
        
        MOV DX, 0
        MOV DH, 02          
        MOV CX, 5
        LEA BP, OUTPUTTEXT
        MOV CX, 9
        CALL DISPTXT 
        
        MOV CX, 5 
        LEA SI, SUM  
        MOV AX, TEMP2
        CALL TODEC  
        LEA BP, SUM

        
        MOV AX, 4C00H
        INT 21H
        
        
    MAIN ENDP
    
    DISPTXT PROC NEAR
        MOV AH, 13H
        MOV AL, 01
        MOV BH, 00
        MOV BL, 0FH
        INT 10H
        RET
    DISPTXT ENDP 
    
    GETINPUT PROC NEAR
        MOV AH, 0AH
        INT 21H
        RET
    GETINPUT ENDP 
    
    CONVERT PROC NEAR 
        MOV BX, 10
        MOV AX, 0
        L1:       
            MUL BX 
            MOV BL, [SI] 
            SUB BL, 30H   
            MOV BH, 0
            ADD AX, BX
            INC SI
            MOV BX, 10
        LOOP L1
        RET
    CONVERT ENDP 
    
    SETCUR PROC NEAR
        MOV AH, 02H
        MOV AL, 01
        MOV BH, 00
        MOV BL, 0FH
        INC DL
        INT 10H
        RET
    SETCUR ENDP
    
    TODEC PROC NEAR   
        MOV BX, 0
        MOV BL, 10 
        MOV DX, 0
        L2:       
            DIV BX
            ADD DL, 30H
            MOV [SI], DL
            INC SI  
            MOV DX, 00
        LOOP L2
        RET
    TODEC ENDP
          
        
         
        
        
             
        
        
        
        
        
    