.model small
.stack 64

.data
    x db 40
    sum1 db 0
    sum2 db 0 
    arr1 db 2 dup(?)
    
.code
    main proc near
    
    mov AX, @data
    mov DS, AX
    mov ES, AX
    
    mov CL, 12 
    lea SI, arr1
    start:   
        mov DX, 0
        mov sum1, 0
        mov sum2, 0        
        mov AX, 0
        cmp CL, x
        je out1
        mov AL, x
        sub AL, CL
        mov DL, AL
        mov BL, 1
        
        
        inner1: 
            div BL  
            cmp AL, 0
            je out3
            cmp AH, 0
            jne skip
            
            add sum1, AL
            skip:   
                mov AH, 0
                mov AL, DL 
                inc BL
                jmp inner1
        
        out3: 
            sub sum1, DL   
            cmp sum1, DL
            jle skip3  
           
            mov DL, 1  
            
            skip3:
                mov AH, 0                                                                                                                                                  
                mov AL, CL
                mov BX, 0
                mov BL, 1 
            
        inner2:
            div BL 
            cmp AL, 0
            je out4
            cmp AH, 0
            jne skip2
            add sum2, AL
            skip2:   
                mov AH, 0
                mov AL, CL
                inc BL
                jmp inner2 
        
        out4: 
            sub sum2, CL
            cmp sum2, CL
            jle skip4
            mov DH, 1
                
        
         
        skip4:   
            cmp DL, DH
            je out2
            
            inc CL
            jmp start
        
        out2:         
            mov AL, x
            sub AL, CL
            mov [SI], AL
            mov [SI+1], CL
            
        out1:
            mov AX, 4C00H    
    