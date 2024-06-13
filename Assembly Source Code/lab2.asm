.model small

.stack 64

.data
    input dw 5
    output dw 0    

.code
    main proc near  
        
    mov AX, @data
    mov DS, AX
    mov ES, AX
     
    loop:
    
    test input, 1   