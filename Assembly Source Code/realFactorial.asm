.model small
.stack 64

.data
    num db 5
    
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
                 
             
    mov CL, num 
    mov AL, num
    mov AH, 0
    sub CL, 1 
    mov CH, 0 
    
    
    start:  
        mul CL
    loop start
    
    