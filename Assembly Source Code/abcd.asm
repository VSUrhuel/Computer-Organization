.model small
.stack 64
.data
    ascii db 10 dup (?)
    
    PARA_LIST LABEL BYTE
        max_len db 21
        act_len db ?
        kb_data db 10 dup (?)
        
.code
main proc near
    mov AX, @data
    mov ES, AX
    mov DS, AX
    
    mov AX, 0
    int 10H
    
    inp:
    mov AH, 0AH
    lea DX, PARA_LIST
    int 21H
    
    lea SI, kb_data
    mov CX, 0
    mov CL, act_len
    shr CX, 1 
    
    lea DI, ascii
    
    L0:
    mov AH, [SI]
    inc SI
    mov AL, [SI]
    inc SI
    
    cmpFrst:
    cmp AH, 30H
    jl inp
    cmp AH, 3AH
    jl numFirst
    cmp AH, 46H
    jg inp
    cmp AH, 41H
    jl inp
    
    AlpFirst:
    sub AH, 37H
    jmp cmpSec 
    
    numFirst:
    sub AH, 30H
    jmp cmpSec
    
    
    cmpSec:
    cmp AL, 30H
    jl inp
    cmp AL, 3AH
    jl numSec
    cmp AL, 46H
    jg inp
    cmp AL, 41H
    jl inp
    
    AlpSec:
    sub AL, 37H
    jmp getAsc 
    
    numSec:
    sub AL, 30H
    jmp getAsc
    
    getAsc:
    shl AH, 4
    add AH, AL
    
    mov [DI], AH
    inc DI
    loop L0
    
    display:
    mov AH, 13H
    mov AL, 01H
    mov BX, 001EH
    mov CH, 0
    mov CL, act_len
    shr CX, 1
    lea BP, ascii
    mov DX, 0
    int 10H
    
    mov AX, 4C00H
    int 21H
main endp