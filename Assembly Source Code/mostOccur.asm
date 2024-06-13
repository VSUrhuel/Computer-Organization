.model small
.stack 64
.data
    ARR DB 4, 5, 4, 7, 7, 3, 3, 1, 3, 3
    NUM DB 0
    CTR DB 0
.code
    MAIN PROC NEAR
        MOV AX, @DATA
        MOV ES, AX
        MOV DS, AX
        
        
          
        MOV DX, 0
        L1:     
            LEA BX, ARR 
            ADD BX, DX
            MOV AH, 0   
            MOV AL, [BX]  
             MOV CX, 10 
            L2:
                CMP AL, [BX]
                JNE SKIP
                INC AH
                SKIP:
                INC BX  
            LOOP L2   
            
            CMP CTR, AH
            JG SKIP1
            MOV CTR, AH
            MOV NUM, AL
            SKIP1:
            
            INC DX
            CMP DL, 10
        JNE L1
                       
                
                
            