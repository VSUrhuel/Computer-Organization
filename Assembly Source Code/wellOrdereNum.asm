.model small
.stack 64

.data
    arr1 db 112, 109, 79, 21
    arr2 db 4 dup(?)
    
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, arr1
    lea DI, arr2
    
    mov CX, 4 
    mov DL, 10
    
    start:
        mov BL, 10  
        mov AH, 0
        mov AL, [SI]
        mov BH, 10
        div BH
        mov BH, AH
        inner:
            cmp BL, BH
            jl noflag 
            cmp AL, 0
            je out1  
            mov AH, 0
            div DL
            xchg BL, BH
            mov BH, AH 
            jmp inner
        out1:      
            mov [DI], 1
            jmp acc
        noflag:
            mov [DI], 0
        acc:
            inc DI
            inc SI
    loop start
    
    
    mov AX, 4C00H
    int 21H
    
    main endp