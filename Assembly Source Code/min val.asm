.model small
.stack 64

.data
    var db 10, 9, 8, 3, 6, 1, 9
    min db 2 dup(?)

.code
    main proc near
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    lea SI, var
    mov CX, 7
    mov min, 100
    getMin: 
        mov AH, [SI]
        cmp min, AH
        jg swap       
        jmp loop_begin
    
    swap:           
        mov min, AH
         
    
    loop_begin:
        inc SI
        loop getMin
    