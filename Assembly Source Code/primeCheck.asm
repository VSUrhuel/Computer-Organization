.model small
.stack 64

.data 
    var db 8
    ans db 1 dup (?)
    ctr db 0

.code
    main proc near
    
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov ctr, 2    
    mov AL, var
    start:     
        cmp ctr, 8
        je done
        
        mov BL, ctr
        mov AH, 0   
        mov AL, var
        div BL
        
        cmp AH, 0
        jne skip
        inc CH
   
    skip: 
        inc ctr 
        loop start
    
    done:
        cmp CH, 1
        je assign
        mov ans, 0  
        jmp done2
   
    assign:
        mov ans, 1  
        
    done2:
        mov AX, 4C00H
        int 21H
        
    main endp
        
        