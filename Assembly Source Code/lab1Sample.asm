.model small
.stack 64
.data
    var1 db 164     ;db is byte - 1 byte - 2 HEX
    var2 dw "8h"    ;dw is word - 8 bytes - 16 HEX                 
    var3 dd "hello" ;dd is double word - 16 bytes - 32 HEX
    var4 db 23, 8, 2, 13, 5, 13, 14
    var5 dw 32H, 1AH, 94H, 53H, 07H, 8AH
    var6 dd 85BA45FDH
    var7 dd 9034
    
.code
    main proc near
        mov AX, @data
        mov DS, AX
        mov ES, AX
        
        mov AH, var1
        mov AL, var4
        mov BX, var2
        mov CX, var5   
        mov DX, AX
        
        mov AX,4C00H
        int 21H
    main endp
       
        
        