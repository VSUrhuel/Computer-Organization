.model small
.stack 64

.data
    InitArray db 13,2,3,4,5,6,7,8,9,10,11,12,20,13,15,19,16,14,18,17
    FibInit dw 20 dup (?)


.code
    main proc near
        mov AX, @data
        mov DS ,AX
        mov ES ,AX
        
        mov CX , 0
        
        loop1:
        cmp CX , 20
        jz done
        
        mov DI, CX
        mov AL, InitArray[DI]
        mov BX, 0
        mov DX, 1
        
        loop2:
        cmp AL, 0
        je str
        mov SI, DX
        add BX, DX
        mov DX, BX
        mov BX, SI 
        dec AL
        jmp loop2
        
        
        
        
        str:
        shl DI , 1
        mov FibInit[DI] , DX
        inc CX
        jmp loop1
        
        done:
        mov AX , 4C00H
        int 21H  
        main endp
        
