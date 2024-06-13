.model small
.stack 64

.data
    var dw 28
    sum dw 0 
    isPerfect db 0
    
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
             
    mov CX, var
    
    start:
    mov DX, 00
    mov AX, var
    mov BX, CX
    div BX
    
    cmp DX, 00
    je acc
    jmp skip  
    
    acc:
    add sum, AX  
    
    skip:
    loop start
    
    mov AX, var
    sub sum, AX
    cmp AX, sum
    je flag
    jmp noflag
    
    flag:
    mov isPerfect, 1
    jmp done
    
    
    noFlag:
    mov isPerfect, 0
    jmp done
    
    done:
    mov AX, 4C00H
    int 21H
    
    main endp