.model small

.stack 64

.data
    var1 db 100
    var2 dw 782
    var3 dd 85BA45FDH
    var4 db 0CH, 0BH, 0AH, 08H, 07H, 06H, 05H 
    var5 dw 321AH, 9453H, 078AH

.code
    main proc near
        mov AX, @data
        mov DS, AX
        mov ES, AX  
        
        mov AH, var1
        mov AL, var4  
        mov BX, var2
        mov CX, var5[0]   
        mov DX, AX
        
        mov var1, CH 
        mov var4, CL
        mov var2, AX
        mov var5, BX
        
        
        mov AX,4C00H
        int 21H
    main endp  
        
    
    