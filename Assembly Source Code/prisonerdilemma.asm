.model small
.stack 64
.data
    OUTPUT1 DB "Prisoner A: "
    OUTPUT2 DB "Prisoner B: "   
    OUTPUT3 DB "Try Again? [Y/N]: "
    RESULT1 DB "Each serve 2 years"
    RESULT2 DB "Prisoner A: 10 years Prisoner B: Goes free"
    RESULT3 DB "Prisoner A: goes free Prisoner B: 10 years" 
    RESULT4 DB "Each serve 5 years"     
    ANS1 DB 0
    ANS2 DB 0  
    CTR DB 0
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        MOV AL, 59H
        
        L2:
            CMP AL, 59H
            JNE EXIT1  
            
            LEA BP, OUTPUT1
            MOV CX, 12  
            MOV DL, 00
            MOV DH, CTR
            INC CTR
            CALL DISP  
           
            CALL RECCHAR   
            MOV AH, 00
            MOV ANS1, AL
            
            LEA BP, OUTPUT2
            MOV CX, 12
            MOV DX, 00
            MOV DH, CTR
            INC CTR
            CALL DISP   
            
            CALL RECCHAR 
            MOV AH, 00
            MOV ANS2, AL  
            
            MOV DX, 00
            MOV DH, CTR 
            INC CTR
            MOV BH, ANS1
            MOV BL, ANS2
            CMP BH, BL
            JE EQUAL     
            CMP ANS1, 43H
            JE RES2  
                LEA BP, RESULT3
                MOV CX, 42
                CALL DISP
                JMP OUT1
            
            RES2:
                LEA BP, RESULT2
                MOV CX, 42
                CALL DISP
            
            
            JMP OUT1
            EQUAL:
                CMP ANS1, 43H
                JE RES1
                    LEA BP, RESULT4
                    MOV CX, 18
                    CALL DISP
                    JMP OUT1  
                RES1:
                LEA BP, RESULT1
                MOV CX, 18  
                CALL DISP     
            OUT1:    
                LEA BP, OUTPUT3
                MOV CX, 18
                MOV DX, 00
                MOV DH, CTR
                INC CTR 
                INC CTR
                
                CALL DISP 
                
                MOV DL, 18
                CALL SETCUR 
                
                CALL GETCHAR
        JMP L2
        
        EXIT1:
        MOV AX, 4C00H
        INT 21H
     MAIN ENDP 
     
     DISP PROC NEAR
        MOV AH, 13H
        MOV AL, 00
        MOV BX, 0FH
        INT 10H
        RET
     DISP ENDP  
     
     GETCHAR PROC NEAR 
         
        MOV AH, 01H
        INT 21H
        RET
     GETCHAR ENDP  
        
     RECCHAR PROC NEAR
        L1:   
            MOV DL, 12       
            CALL SETCUR
            CALL GETCHAR
            CMP AL, 43H
            JE EXIT
            CMP AL, 44H
            JE EXIT
        JMP L1
        EXIT: 
            RET
    RECCHAR ENDP  
     
    SETCUR PROC NEAR
        MOV AH, 02H
        MOV BX, 00
        INT 10H
        RET
    SETCUR ENDP
            