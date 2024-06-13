.model small
.stack 64

.data 
    arr db 2, 1, 4, 8, 9, 7
    ans db 6 dup(?) 

.code
    main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
      
    lea SI, arr 
    lea DI, ans
    mov CX, 06 
    start:  
        mov AL, [SI]
        test AL, 01
        jnz skip
        
        mov [DI], AL
        inc DI 
         
    skip: 
        inc SI 
        loop start
    
    done:
    mov AX, 4C00H
    int 21H
    
    main endp 