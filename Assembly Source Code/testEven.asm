.model small
.stack 64

.data
    var db 1, 4, 7, 8

.code
    main proc near
        mov AX, @data
        mov DS, AX
        mov ES, AX
        
        mov CX, 4
        lea SI, var
        
        start:
            mov BH, [SI]
            ;shr AH, 1  
            ;jnc even
            
            ;test AH, 01
            ;jz even
            mov BL, 3
            div BL
            cmp AH, 0
            je even 
            jmp odd
        even:           
            mov BH, [SI]
        odd:
            mov DH, [SI] 
        inc SI
        loop start