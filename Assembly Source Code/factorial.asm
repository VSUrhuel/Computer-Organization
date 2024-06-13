.model small
.stack 64

.data
    num dw 8
    sum dw 0
    isPerfect db 0
    isAbundant db 0
    isDefecient db 0

.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov CX, num
    
    start:
        mov DX, 0
        mov AX, num
        mov BX, CX
        div BX
        
        cmp DX, 00
        je acc
        jmp skip
        
        acc:
            add sum, AX
        
        skip:
            loop start
            
  
            
    mov AX, num
    sub sum, AX
    cmp sum, AX
    jg abundant 
    je perfect
    jl defecient  
    jmp done
    
    abundant:
        inc isAbundant
        jmp done
    
    defecient:
        inc isDefecient
        jmp done
        
    perfect:
        inc isPerfect
        jmp done
        
    done:
        mov AX, 4C00H
        int 21H
    main endp