.model small
.stack 64

.data
    arr1 db 1, 3, 2, 23, 4, 12, 11, 3, 18, 10
    arr2 db 10 dup(?)
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, arr1
    lea DI, arr2
    mov CX, 10
    mov BL, 2
    
    start:    
        mov AH, 00
        mov AL, [SI]
        div BL
        
        mov [DI], AH
        inc DI
        inc SI
        
        loop start
    
    
    
    mov AX, 4C00H
    int 21H
    
    main endp