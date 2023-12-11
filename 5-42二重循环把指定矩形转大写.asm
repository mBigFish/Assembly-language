assume ds:data, ss:stack, cs:code

data segment
	str db 'aaaaabbbbbccccc '
	    db 'aaaaabbbbbccccc '
	    db 'aaaaabbbbbccccc '
	    db 'aaaaabbbbbccccc ','$'
data ends

stack segment
    db 100 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov ax, stack
        mov ss, ax
        mov sp, 10
        mov bx, 0
        mov si, 0
        mov cx, 4
        f1:
            push cx
            mov cx, 15
            mov si, 0
            f2:
                mov al, str[si + bx]
                and al, 10111111b
                mov str[si + bx], al
                inc si
                loop f2
            pop cx
            add bx, 16
            loop f1
    mov ax, 4c00h
    int 21H
code ends
    end start