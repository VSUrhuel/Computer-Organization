.model small
.stack 64

.data
    set1 db 2, 3, 4, 5, 6, 7, 8, "$"
    set2 db 4, 5, 6, 9, 10, 11, 12, "$"
    result db 07 DUP(?), "$"  

.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, set1
    lea DI, set2
    lea BX, result
    mov CX, 07
    
    begin:
        mov AL, [SI]
        mov DL, AL
        mov AH, [DI]
        mov DH, AH
        shr AL, 01
        jnc t2
        jmp loop_this
            t2:
                shr AH, 01
                jc loop_this
                add DH, DL
                mov [BX], DH
            loop_this:
                inc SI
                inc DI
                inc BX
    loop begin
    
    mov AX, 4C00H
    int 21H  
   
    
    main endp
        
        