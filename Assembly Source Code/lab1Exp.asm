.model small
.stack 64
.data  
    ;decleration of variables from the memory map
    var1 db 164
    var2 dw 84FBH
    var3 dd 85BA45FDH
    arr1 db 05H, 06H, 07H, 08H, 0AH, 0BH, 0CH
    arr2 dw 078AH, 9453H, 321AH
.code  

    main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    ;assembly code    
    mov AH, var1
    mov AL, arr1
    mov BX, var2
    mov CX, arr2
    mov DX, AX  
    add DX, CX 
                
    
    mov var1, CH
    mov arr1, CL
    mov var2, AX
    mov arr2, BX  
     
    mov AX, 4C00H
    int 21H
    
    main endp