.stack 64

.data 
    var1 db 87
    var2 dw 546
    var3 dd 87BCH
    set1 db "ABCD"
    set2 dw 1232, 2231, 651
    ser3 dd 645AH, 00132H, 0B75CH
    
.code  

    main proc near
        mov AX, @data
        mov ES, AX
        mov DS, AX
        
        mov AL, var1
        mov BX, var2
        mov CX, set2
        mov DH, set1
        mov DL, AH
        
        mov DX, 04C00H
        
        mov AX, DX
        int 21H
        
    main endp