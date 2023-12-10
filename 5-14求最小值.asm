assume ds:data, ss:stack, cs:code

data segment
    da db 14h, 9h, 19h, 6h, 33h, 4h, 7h, 90h
data ends

stack segment
    db 100 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov al, da[0]
        mov bx, 1
        mov cx, 7
        f:

            cmp al,[bx]
            jna  f1
            mov al, [bx]
            f1:
                inc bx
                loop f

    mov al, 4cH
    int 21H
code ends
    end start