.model small
.stack 64

.data
    var db 10
    bin db 10 dup (?)

.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, bin
    mov AX, 10
    
    mov BL, 2     
           
    start:
        cmp AL, 0
        je done
        mov AH, 00
        div BL
        mov [SI], AH
        
        inc SI
        jmp start
        
    done:
    mov AX, 4C00H
    int 21H
    
    main endp
        
        
          