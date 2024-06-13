.model small
.stack 64

.data
    s db 22
    e db 54
    f db 2
    sum dw 0
    arr db 8 dup(?)
    
.code
    main proc near
    
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, arr
    mov AX, 0
    mov AL, s
    
    start:
        cmp AL, e
        je done
        mov BH, AL
        mov CL, 2
        mov BL, 2
        inner:
            div CL  
            inc CL
            cmp AH, 0
            je out1
            inc BL  
           
            skip1:  
                mov AL, BH
                mov AH, 0
                jmp inner
        
        out1:  
            mov AL, BH      
            cmp BL, AL
            jne skip
        
        
            add sum, AX
            mov [SI], AL
            inc SI
        
        skip:
        inc AL
        jmp start
       
    done:
    mov AX, 4C00H
    int 21H
    
    main endp    