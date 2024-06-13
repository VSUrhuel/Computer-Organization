.model small
.stack 64

.data
    str db "ABCDEFGHIJK", 0
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, str
    mov CX, 00
    
    begin:
        mov AL,[SI]
        inc SI
        inc CL
        cmp AL, 0
        jne begin
    
    lea SI, str
    lea DI, str
    
    mov BX, CX
    sub BX, 2
    dec CX
    shr CX, 1
    
    beginExch:
        mov AL, [SI]
        mov AH, [DI+BX]
        mov [SI], AH
        mov [DI+BX], AL
        
        inc SI
        dec DI
        
        loop beginExch
        
    mov AX, 4C00H
    int 21H
    main endp