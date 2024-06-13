.stack 64
.data 
    ctr db 8
    curPosCol db 1
    str db "ABCDEFG",'$' 
    
    PARA_LIST LABEL BYTE; Start a parameter list
        MAX_LEN DB 20 ; Maximum number input characters
        ACT_LEN DB ? ; Actual number of input characters
        KB_DATA DB 21 DUP('$');Characters entered in Kb 
.code

main proc near 
    mov AX,@data
    mov ES,AX
    mov DS,AX
    
    
    
    call setVideo  
  ;  mov DX, 0C1EH
  ;  
    lea SI,str
     
    L1:
        mov AL,[SI]
        call dispChars  
        mov DH,00 
        mov DL,curPosCol
        call setCursor
         
        inc SI
        inc curPosCol
        dec ctr 
        mov AL,ctr
        
        cmp AL,0 
    jne L1
    
        
        
        
        
    MOV AH,0AH ; Request keyboard input
    LEA DX, PARA_LIST ; Load address of parameter list
    INT 21H ; Call interrupt service
    
       
       
    lea DX, KB_DATA
    mov AH,09H
    int 21H
    
    
    MOV AX, 0607H ; Request scroll up 7 lines
    MOV BH, 61H ; Brown BG, blue FG
    MOV CX, 0C19H ; From 12:25 through
    MOV DX, 1236H ; 18:54
    INT 10H ; Call interrupt service
main endp  

setVideo proc near  
    MOV AH, 00H ; Request Set Mode
    MOV AL, 03H ; Standard color text
    INT 10H ; Call Interrupt Service   
     ret
setVideo endp    

setCursor proc near
    MOV AH, 02H ; Request set cursor
    MOV BH, 00 ; Page Number 0 (Normal)
    int 10H
    ret
    
setCursor endp
        

dispChars proc near
    MOV AH,09H ; Request Display
    ;MOV AL,'A' ; Happy Face for Display
    MOV BH, 00 ; Page Number 0
    MOV BL, 16H ; Blue BG, Black FG
    MOV CX, 1 ; No. repeated characters
    INT 10H ; Call Interrupt service
    ret
    
    
dispChars endp