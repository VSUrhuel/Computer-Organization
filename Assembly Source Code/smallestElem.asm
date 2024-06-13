.model small
.stack 64

.data
    arr db 2, 4, 5, 32, 12, 9, 7, 18, 90, 13 
    sml db 0
  

.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, arr
    mov CX, 10
    mov sml, 100
    start:    
        mov AH, [SI]   
        cmp sml, AH
        jl skip
        
        mov sml, AH
    skip:            
        inc SI
        loop start
    
    
    done:
    mov AX, 4C00H
    int 21H
    
    main endp
        
        