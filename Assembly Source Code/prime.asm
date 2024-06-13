.model small
.stack 64

.data
    isPrime db 0 
    var dw 4213

.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov DX, 0
    mov AX, var
    mov BX, 2
    div BX
    start:
        cmp AX, 0
        je out1
        cmp DX, 0
        je out1
        mov DX, 0
        mov AX, var
        inc BX
        div BX
        jmp start
    
    out1:
        cmp BX, var
        jne stop
        inc isPrime
    stop:
        mov AX, 4C00h
        int 21H
    main endp