.model smal
.stack 64
.data
     rev db 20 dup (?)

    PARA_LIST LABEL BYTE
    MAX_LEN db 20
    ACT_LEN db ?
    KB_DATA db 20 dup ('') 
    
   
.code
main proc near
    MOV AX,@data
    MOV DS,AX
    MOV ES,AX     
    
    MOV AX,0003H
    INT 10H  
    
    
    
    MOV AH,0AH
    LEA DX,PARA_LIST
    INT 21H
    
     LEA SI,KB_DATA 
    LEA DI,rev
    
    MOV BL,ACT_LEN
    ADD SI,BX
    MOV CX,BX
    DEC SI
    
    
    
    L1: MOV AL,[SI]
        MOV [DI],AL
        INC DI
        DEC SI
    LOOP L1
    
    MOV AH,13H
    MOV AL,01
    MOV BH,00
    MOV BL,00001111B
    LEA BP,rev
    MOV CX,BX
    MOV DX,0100H
    INT 10H  
    
    MOV AX,04C00H
    INT 21H
    
    main endp
    