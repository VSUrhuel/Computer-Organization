.model small
.stack 64

.data
    PARA_LIST1 LABEL BYTE
        MAX_LEN1 DB 255
        ACT_LEN1 DB ?
        KB_DATA1 DB 255 DUP('?')     
    PARA_LIST2 LABEL BYTE
        MAX_LEN2 DB 255
        ACT_LEN2 DB ?
        KB_DATA2 DB 255 DUP('?')
    OUTPUT1 DB "Source: "
    OUTPUT2 DB "Destination: "
    OUTPUT3 DB "Count: "
    OUTPUT4 DB "Try Again? [Y/N]: " 
    COUNT DB 0    
    CTR DB 0

.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV AX, 'Y'    
        
        L3:    
            MOV COUNT, 0
            CMP AL, 59H
            JNE EXIT
            
                
            MOV CX, 8
            LEA BP, OUTPUT1  
            MOV DX, 0
            MOV DH, CTR
            INC CTR
            CALL DISP 
            
            LEA DX, PARA_LIST1
            CALL GETINPUT
            
            MOV CX, 13
            LEA BP, OUTPUT2
            MOV DX, 0
            MOV DH, CTR
            INC CTR
            CALL DISP
            
            LEA DX, PARA_LIST2
            CALL GETINPUT  
            
            
            CALL COMPARESTR  
            
            MOV CX, 7
            LEA BP, OUTPUT3
            MOV DX, 0
            MOV DH, CTR
            INC CTR
            CALL DISP 
            
             CALL DISPANS
            
            
            MOV CX, 18
            LEA BP, OUTPUT4
            MOV DX, 0
            MOV DH, CTR
            INC CTR
            CALL DISP  
            
            INC CTR
            
            MOV AH, 01H
            INT 21H 
            
            JMP L3     
        EXIT:
            MOV AX, 4C00H
            INT 21H
    MAIN ENDP
    
    DISP PROC NEAR
        MOV AH, 13H
        MOV AL, 01H
        MOV BX, 0FH
        INT 10H
        RET                                                             
    DISP ENDP          
    
    GETINPUT PROC NEAR
        MOV AH, 0AH
        INT 21H
        RET
    GETINPUT ENDP      
   
    
    COMPARESTR PROC NEAR
        MOV AX, 0
        MOV CX, 0      
        L1: 
            CMP AL, ACT_LEN1
            JE OUT1
            CLD
            MOV CL, ACT_LEN2 
            LEA DI, KB_DATA1
            LEA SI, KB_DATA2
            ADD DI, AX 
            REPE CMPSB  
            JNE SKIP
                INC COUNT
            SKIP:  
            INC AL
        JMP L1  
        OUT1:
            RET
    COMPARESTR ENDP
                     
    DISPANS PROC NEAR  
        MOV AH, 0AH
        MOV AL, COUNT  
        ADD AL, 30H
        MOV BX, 0FH
        MOV CX, 1
        MOV DL, 9
        INT 10H  
        RET
    DISPANS ENDP
        
        
   
            
            
                        