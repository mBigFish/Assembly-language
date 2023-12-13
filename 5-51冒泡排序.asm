assume ds:data, ss:stack, cs:code

data segment
	arr db 0A2H,24H,07H,3AH,1BH,0F1H,3BH,25H,81H
data ends

stack segment
    db 128 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov cx, 8
        f1:
            mov dx, cx
            ;sub cx, 1
            mov bx, 0
            f2:
                mov al, arr[bx]
                mov ah, arr[bx + 1]
                cmp ah, al
                jnb s1
                mov arr[bx], ah
                mov arr[bx + 1], al
                s1:
                    inc bx
                    loop f2
            mov cx, dx
            loop f1
            

    mov ax, 4c00h
    int 21H
code ends
    end start