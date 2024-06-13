.model small
.stack 64

.data
    var db 3, 1, 4, 2
    largest db ?
 
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, var
    lea DI, var+1
    
    mov CX, 3
    mov BH, var[0]
    start:
    cmp CX, 0
    je done
    cmp var[DI],BH 
    jg swap  
    
    inc DI
    dec CX 
    jmp start
    
    swap:
    xchg var[DI], BH
    jmp start
    
    done:   
    mov largest, BH
    mov AX, 4C00H
    int 21H
    
    main endp