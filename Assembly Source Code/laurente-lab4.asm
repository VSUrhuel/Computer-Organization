.model small
.stack 64

.data
    array db 3, 19, 63, 11, 5, 83, 32, 24, 52, 10, 13, 75, 34, 98, 44

.code   
    ;Initializes counter and offsetting registers
    mov CX, 15
    lea BX, array
    lea DI, array   
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
        
    ;Selection Sort Function
    selectionSort proc near   
        mov AH, [DI]  ;Pass by Value
        call getMin 
         
        mov AL, AH
        xchg [BX], AL 
        sub SI, BX
        xchg [BX+SI], AL 
        sub DI, CX   
        inc DI     
        inc BX
        loop selectionSort  
        
        ;Ending program
        mov AX, 4C00H
        int 21H 
        ret
    selectionSort endp
    
    
    ;Getting Min Value Function    
    getMin proc near  
        cmp DI, 15
        je endfunc       
        mov AL, [DI]
        cmp AL, AH
        jg skip
        mov AH, AL   ;Assigning Min Value
        mov SI, DI   ;Assigning Index of Min Value
        
        skip:
        inc DI
        call getMin
        
        endfunc: 
        RET
    getMin endp     