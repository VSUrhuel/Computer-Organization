.model small
.stack 64

.data
    arr db 2, 1, 3, 2, 4, 6, 11
    sum db dup(?) 1

.code
    main proc near
        
    mov AX, @data
    mov DS, AX
    mov ES, AX
    mov AH, 00
    lea SI, arr
    mov CX, 7
    start:   
        test [SI], 01
        jnz skip
        add AH, [SI] 
        
    skip:
        inc SI
        loop start
        
    
    
    mov AX, 4C00H
    int 21H
    
    main endp