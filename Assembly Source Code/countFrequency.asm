.model small
.stack 64

.data
    src db "visayasstateuniversity", 0
    arr db 22 dup(?)
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, src
    mov CX, 0
    
    start:     
       cmp [SI], 0
       je out1
       inc CX
       inc SI
       jmp start
    
    out1:  
        lea SI, src
        lea DI, arr
        mov BX, 0 
        loop1:   
            cmp BX, 22 
            je done
            mov AH, [SI]
            inc BX
            mov DL, 0 
            mov CL, 22
            lea SI, src
            loop2:     
                cmp AH, [SI]
                jne skip 
                inc DL
                skip:
                    inc SI
                    loop loop2
  
            mov [DI], DL 
            lea SI, src
            add SI, BX
            
            inc DI              
  
            jmp loop1
        
    done:    
    mov AX, 4C00H
    int 21H
    
    main endp