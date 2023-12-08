assume ds:data, ss:stack, cs:code

data segment
    str db 'HELLO WORLD', '$'
data ends

stack segment
    db 10 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov bx, 0
        mov cx, 11
;--------------------------
;a -> 61h -> 0110 0001 
;A -> 41h -> 0100 0001
; 0100 0001
; 0010 0000 or
; 0110 0001
;--------------------------

        s:
            mov al, [bx]
            or al, 00100000B
            mov [bx], al
            inc bx
            loop s

        mov al, 4cH
        int 21H
code ends
    end start
