.model small
.stack 64
.data     
    PARA_LIST LABEL BYTE; Start a parameter list
     MAX_LEN DB 20 ; Maximum number input characters
     ACT_LEN DB ? ; Actual number of input characters
     KB_DATA DB 20 DUP(‘ ‘);Characters entered in Kb

   

.code

    main proc near
        mov AX,@data
        mov ES,AX
        mov DS,AX
         
       MOV AH,0AH ; Request keyboard input
       LEA DX, PARA_LIST ; Load address of parameter list
       INT 21H ; Call interrupt service            
       MOV CL, ACT_LEN
                           
                           
       MOV AH, O1H
       LEA DX, PARA_LIST
       INT 21H
       
       MOV AH, 01H
       INT 21H
    main endp  
  