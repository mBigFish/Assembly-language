assume ds:data, ss:stack, cs:code

data segment
    str db 'hello world','$'
data ends

stack segment
    db 10 dup(10)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov bx, 0
        mov cx, 11
        s: 
            mov al, ds:[bx]
            sub al, 20h
            mov ds:[bx], al
            inc bx
            loop s

        mov al,4cH
        int 21H     
code ends
    end start