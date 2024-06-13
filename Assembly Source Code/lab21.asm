; Input: rax = starting number
; Output: rbx = number of steps

.model small
.stack 64
.data  
    ;decleration of variables from the memory map
    input dw 5
    output dw 3
    rem dw 3
    
.code  

    main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX

    loop1:              
        ;Check if n is equal to 1
        cmp input, 1
        je done
    
        ;Check if n is even   
        MOV rem, MOD 7
        cmp rem, 0 
        test input, 1
        jz even
    
        ;Odd case: n = 3n + 1
        mov input, 3
        mul input
        add input, 1
        jmp loop1
    
    even:
        ;Even case: n = n / 2
        shr input, 1
        jmp loop1

    done:
        # Store step count in rbx
        ret
