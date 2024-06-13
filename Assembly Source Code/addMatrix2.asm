.model small
.stack 64
.data
    MAT1 DB 3, 4, 5
         DB 1, 3, 4
         DB 2, 8, 9 
    MAT2 DB 4, 7, 2
         DB 3, 6, 1
         DB 1, 7, 2
         
    STR DB 9 DUP('?')   
    CTR1 DB 0
    
.code
    MAIN PROC NEAR
        MOV AX,@data
        MOV ES,AX
        MOV DS,AX   
        
        LEA DI, MAT1 
        LEA SI, MAT2
        MOV CX, 9
        L1:
            CLD
            LODSB 
            MOV AH, [DI]
            ADD AL, AH 
            CMP AL, 9
            JLE SKIP 
            
            SUB AL, 10
            ADD AL, 41H 
            JMP SKP
            SKIP: 
            ADD AL, 30H
                        
            SKP:            
            STOSB 
            
        LOOP L1 
        
        LEA SI, MAT1
        MOV DX, 0
        MOV DL, 5
        MOV DH, 0  
        L3:
            L2:  
                MOV AH, 02H
                INC DL
                INT 10H
                MOV AL, [SI]
                CALL DISPCHAR
                MOV AH, 02H
                INC DL
                INT 10H
                MOV AL, ','
                CALL DISPCHAR
                INC SI 
                INC CTR1 
                
                CMP CTR1, 3 
                
            JNE L2 
            MOV CTR1, 0    
            
            MOV DL, 5
            INC DH
            CMP DH, 3 
        JNE L3 
        
            
        
        
                
        
        MOV AX, 4C00H
        INT 21H
    MAIN ENDP  
    
    DISPCHAR PROC NEAR
        MOV AH, 0AH
        MOV BX, 0FH
        MOV CX, 1
        INT 10H
        RET
    DISPCHAR ENDP
        
        
            