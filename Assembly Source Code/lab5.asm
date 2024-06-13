.model small
.stack 64
.data
    PARA_LIST LABEL BYTE  
        MAX_LEN DB 5
        ACT_LEN DB ?
        KB_DATA DB 5 DUP(' ')    
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AH, 0AH
    lea DX, PARA_LIST
    int 21H
    lea SI, KB_DATA
    mov CX, 4 
    mov AX, 0
    m:
        add BL, [SI]    
        inc SI
        loop m
                 
   
    mov AH, 0AH
    lea DX, PARA_LIST
    int 21H
    lea SI, KB_DATA
    mov CX, 4 
    mov AX, 0
    mc:
        add BH, [SI]    
        
        inc SI
        loop mc 
    
    add AL, BH
    add AL, BL
                 