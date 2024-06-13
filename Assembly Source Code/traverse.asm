.model small
.stack 64

.data
    arr db 1, 3, 4, 3, 4
    arr2 db 11, 12, 13, 15, 17
.code
    main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea SI, arr  
    lea DI, arr2
    ;lea
    mov CX, 5
    start:
        mov AH, [SI]
        mov BH, [SI+1] 
        mov AL, [DI]
        mov BL, [DI+1]
        inc SI  
        inc DI
        loop start
    
    mov AX, 4C00H
    int 21H  
    
    main endp