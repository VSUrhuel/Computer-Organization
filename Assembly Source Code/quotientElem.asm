.model small
.stack 64

.data
    arr1 db 2, 4, 2, 32, 12, 9, 7, 32, 90, 2 
    arr2 db 9 dup(?)   

.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, arr1   
    lea DI, arr2
    mov CX, 9
    
    start:            
        mov BL, [SI+1]
        mov AH, 00
        mov AL, [SI]
        
        div BL
        
        mov [DI], AL 
        inc DI
        inc SI
     loop start 
            
                 
    
    done:
    mov AX, 4C00H
    int 21H
    
    main endp
        
        