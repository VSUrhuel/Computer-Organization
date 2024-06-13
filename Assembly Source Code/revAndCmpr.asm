.model small
.stack 64

.data 
    
    text1 db "eu"
    text2 db "rhuelsopogi", 0
    ctr db 0
    
.code
    main proc near
    
    mov AX, @data
    mov ES, AX
    mov DS, AX     
    
    lea SI, text2
    mov CX, 0
    
    start:     
       cmp [SI], 0
       je out1
       inc CX
       inc SI
       jmp start
    
    out1:
        lea SI, text2
        lea DI, text2
        
        mov BX, CX
        sub BX, 1  
        sub CX, 1
        shr CX, 1 
        
        inner:
            mov AH, [SI]
            mov AL, [DI+BX]
            
            mov [SI], AL
            mov [DI+BX], AH
            
            dec DI
            inc SI
            
            loop inner 
    
    lea SI, text1
    lea DI, text2
    mov CX, BX
    add CX, 1
    
    start1:      
        mov AH, [SI]
        mov AL, [SI+1]
        mov BH, [DI]
        mov BL, [DI+1]
        add DI, 1
        cmp AX, BX
        jne skip
        inc ctr
        skip:
            loop start1
        
    
    mov AX, 4C00H
    int 21H
    
    main endp
    
    