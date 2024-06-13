.model small
.stack 64

.data
    arr db 1, 3, 2, 23, 4, 12, 11, 3, 18, 10
    sum db 0

.code
    main proc near
        
    mov AX, @data
    mov DS, AX
    mov Es, AX
    
    lea SI, arr
    mov CX, 10
    
    start:
        mov AH, [SI]
        shr AH, 1
        jnc skip
                    
        add DH, [SI]
        
    skip:
        inc SI
        loop start
    
    mov sum, DH
    mov AX, 4C00H
    int 21H
    
    main endp
     
    
        