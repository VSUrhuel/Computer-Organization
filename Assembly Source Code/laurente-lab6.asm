.model small
.stack 64
.data
    OUTPUT1 DB "Source: "
    OUTPUT2 DB "Destination: "
    OUTPUT3 DB "Count: "
    OUTPUT4 DB "Try Again? [Y/N]: "
    PARA_LIST1 LABEL BYTE
        MAX_LEN1 DB 255
        ACT_LEN1 DB ?
        KB_DATA1 DB 255 DUP('?')
    PARA_LIST2 LABEL BYTE
        MAX_LEN2 DB 255
        ACT_LEN2 DB ?
        KB_DATA2 DB 255 DUP('?')
    CTR DB 0 
    TEMP DB 0 
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV DX, 0
        
        L2:  
            MOV CTR, 0
            LEA BP, OUTPUT1
            MOV CX, 8   
            MOV DX, 0
            MOV DH, TEMP 
            INC TEMP 
            CALL DISPLAY   
            
            LEA DX, PARA_LIST1
            CALL GETSTR
            
            LEA BP, OUTPUT2
            MOV CX, 13
            MOV DX, 0
            MOV DH, TEMP
            INC TEMP
            CALL DISPLAY
            
            LEA DX, PARA_LIST2
            CALL GETSTR
            
            CALL COUNTFUNC
            
            LEA BP, OUTPUT3
            MOV CX, 7
            MOV DX, 0
            MOV DH, TEMP
            INC TEMP
            CALL DISPLAY
            
            CALL DISPCHAR 
            
            LEA BP, OUTPUT4
            MOV CX, 18
            MOV DX, 0
            MOV DH, TEMP
            ADD TEMP, 2
            CALL DISPLAY
            
            L3:
                CALL GETCHR
                
                CMP AL, 59H
                JE L2 
                
                CMP AL, 4EH
                JE OUT1 
            
           JMP L3
        
        OUT1:
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP
    
    DISPLAY PROC NEAR
        MOV AH, 13H  
        MOV AL, 01H
        MOV BX, 0FH
        INT 10H
        RET
    DISPLAY ENDP 
    
    
    GETSTR PROC NEAR
        MOV AH, 0AH
        INT 21H
        RET
    GETSTR ENDP   
    
    COUNTFUNC PROC NEAR
        MOV DX, 0
        MOV CX, 0
        L1:     
            MOV CL, ACT_LEN2
            CLD
            LEA SI, KB_DATA1
            ADD SI, DX
            LEA DI, KB_DATA2
            REPE CMPSB
            JNE SKIP
            INC CTR
            SKIP:
            INC DX
            CMP DL,ACT_LEN1
        JNE L1  
        RET
    COUNTFUNC ENDP 
    
    DISPCHAR PROC NEAR  
        MOV AH, 0AH
        MOV AL, CTR 
        ADD AL, 30H
        MOV CX, 1
        INT 10H 
        RET    
    DISPCHAR ENDP  
     
    
    GETCHR PROC NEAR 
        MOV AH, 02H 
        MOV DL, 18
        INT 10H 
        MOV AH, 01H
        INT 21H
        RET
    GETCHR ENDP 
     
        
            
    