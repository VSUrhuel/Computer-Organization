.model small
.stack 64

.data 
    arr db 1, 3, 2, 23, 4, 12, 11, 3, 18, 10
    sum db 2 dup (?)

.code 
    main proc near
    
    mov AX,@data
    mov DS, AX
    mov ES, AX
    
    lea SI, arr
    lea DI, sum
    mov CX, 10
    
    start: 
        cmp CX, 0
        je done
        test [SI], 01
        jnz odd 
        jmp even
    
    even:
        add DH, [SI]
        inc SI 
        dec CX
        jmp start
        
    
    odd:
        add DL, [SI]
        inc SI   
        jmp start 
   
    done:
        mov [DI], DH
        mov [DI+1], DL
        mov AX, 4C00H
        int 21H
    
    main endp