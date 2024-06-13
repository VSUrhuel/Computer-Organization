.model small
.stack 64

.data
    InitArray db 8, 2, 6, 3, 7, 18, 1, 14, 12, 11, 9, 10, 4, 5, 13, 16, 5, 19, 12, 10 
    FibInt dw 20 dup (?)
                     
.code
    main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX  
    mov CX, 0    
             
L120:   ;outer loop, for accessing array elements
    cmp CX, 20
    jz done 
    mov DI, CX   
    mov AH, InitArray[DI]
    mov BX, 0 
    mov DX, 1

L121:   ;inner loop, for finding the nth fib number based on array element
    cmp AH, 0 
    jz store
    mov SI, DX
    add BX, DX
    mov DX, BX
    mov BX, SI
    DEC AH
    jmp L121

store:  ;for storing the fib number to FibInt  
    shl DI, 1
    mov FibInt[DI], DX
    INC CX 
    jmp L120
             
done:   ;for ending the program
    mov AX,4C00H
    int 21H
    main endp