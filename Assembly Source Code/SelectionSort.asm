.model small
.stack 64

.data
    array db 5,3,2,8,1,12,9,16,6,17,20,14,3,21,76
    min db 0    

.code
    main proc near
    
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    lea BX, array   
    lea DI, array
    mov CX, 15 
   
    
    selectionSort: 
        mov DX, DI
        mov AH, [DI]
        mov min, AH
        jmp getMin  
        continue:
        mov AL, min   
        
        xchg [BX], AL 
        sub SI, BX
        xchg [BX+SI], AL        
        inc BX    
        sub DI, CX
        inc DI
        loop selectionSort
        jmp done
    
    
    getMin: 
        cmp DL, 15
        je continue
        mov AH, [DI]
        cmp AH, min 
        jg skip 
        mov min, AH 
        mov SI, DX
       
    skip:
        inc DI
        inc DL
        jmp getMin 
        
    
    
    
    done:
    mov AX, 4C00H
    int 21H
    main endp
   