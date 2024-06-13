.model small
.stack 64
.data 
     input dw 5
     output dw ?
     

.code
    main proc near 
         mov AX,@data
         mov DS,AX
         mov ES,AX
           
         mov AX,input   
         
loop1:
         CMP AX,1
         JE done  
         
         inc BX
         test AX,1
         jnz odd

even:   
         shr AX,1
         jmp loop1
         
odd:     
         mov CX,AX
         shl AX,1
         add AX,CX
         inc AX
         jmp loop1
         
done:
         mov output,BX
         mov AX,4C00h
         int 21h

main endp