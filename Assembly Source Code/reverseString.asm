.model small
.stack 64

.data
    str db "ABCDEFGHIJK", 0   
    
.code    
    main proc near 
          
    mov AX, @data
    mov DS, AX
    mov ES, AX 
        
    mov CX, 0
    lea SI, str
    start:   
        mov AH, [SI]
        inc SI
        inc CX
        cmp AH, 0
        je exit
        jmp start
    
    exit:
        lea SI, str
        lea DI, str     
        
        mov BX, CX
        sub BX, 2
        sub CX, 1
        shr CX, 1
       
    rev:
        mov AH, [SI]
        mov AL, [DI+BX]
        
        mov [SI], AL
        mov [DI+BX], AH
        
        inc SI
        dec DI
        loop rev
        
    mov AX, 4C00H
    int 21H
    
    main endp
        
        
         
        
    
    