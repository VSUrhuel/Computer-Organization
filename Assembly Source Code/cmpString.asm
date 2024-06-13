.model small
.stack 64

.data
    scr db "ng"
    dest db "Assembly Language programming"
    ctr db 0  

.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, scr
    lea DI, dest
    mov AL, [SI]
    mov AH, [SI+1]
    mov CX, 29
    
    start1:
        mov DL, [DI]
        mov DH, [DI+1]
        inc DI
        cmp AX, DX
        je cnt_this
        jmp skip
   
    cnt_this:
        inc ctr
    skip:
        loop start1
    
    mov AX, 4C00H
    int 21H  
   
    
    main endp
        
        