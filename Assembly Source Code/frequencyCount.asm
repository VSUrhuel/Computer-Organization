.model small
.stack 64

.data
    arr1 db 2, 4, 2, 32, 12, 9, 7, 32, 90, 2 
    arr2 db 10 dup(?)   
    ctr db 0

.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, arr1  
    mov CX, 10
    
    start:            
        mov ctr, 0 
        mov DI, 0
        inner:          
            cmp DI, 10
            je d1        
            
            mov AL, arr1[DI]  
            inc DI
            cmp [SI], AL
            jne skip
            
            add ctr, 1
            
            skip:
                jmp inner    
    d1:
        mov BH, ctr
        mov arr2[SI], BH
     
        inc SI
    
    loop start   
            
                 
    
    done:
    mov AX, 4C00H
    int 21H
    
    main endp
        
        