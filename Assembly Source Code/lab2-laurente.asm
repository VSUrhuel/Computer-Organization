.model small

.stack 64

.data
    input dw 7
    output dw ?
    
.code
    main proc near   
        
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov AX, input
        
loop1:   
    ;checks if the input is 1
    cmp AX, 1
    je done  
    
    ;increment the counter by 1 
    inc BX
    
    ;checks if it is odd
    test AX, 00000001B  
    jnz odd
    
    ;if it is even
    shr AX, 1
    jnz loop1
    
odd:
    mov DX, 3
    mul DX
    add AX, 1
    jnz loop1
 
done:   
    mov output,BX
    mov AX,4C00H
    int 21H
    
main endp