.model small
.stack 64

.data
    arr1 db 2,5,3,13,44,4,8,9,10,12,13,16,14,17,10 
    arr2 db 15 dup(?)
    
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, arr1
    lea DI, arr2
    
    mov CX, 15
    
    start: 
        mov AH, 0
        mov AL, [SI]   
        cmp AL, 2
        je flag
        
        mov BL, 2  
        div BL
        inner:
            cmp AH, 0
            je out1 
            mov AH, 0
            mov AL, [SI]
            inc BL
            div BL 
            jmp inner 
        
        out1:
            cmp BL, [SI]
            je flag
        
        noflag:
            mov [DI], 0  
            jmp acc 
        flag:
            mov [DI], 1
           
        acc:
            inc DI
            inc SI
    loop start
             
        
        
    mov AX, 4C00H
    int 21H
    
    main endp