.model small
.stack 64

.data
    x db 5
    y db 11 
    arr dw 7 dup(?)

.code
    main proc near
        
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, arr
    mov BH, x
    mov BL, y
    
    start: 
        cmp BH, BL
        jg done
        mov CL, 2 
        mov AL, BH
        mov AH, 0
        inner:    
            mul BH
        loop inner
    mov [SI], AX  
    add SI, 2
    inc BH
    jmp start
    
    done:  
    mov AX, 4C00H
    int 21H
    
    main endp