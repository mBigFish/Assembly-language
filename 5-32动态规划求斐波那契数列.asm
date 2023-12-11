assume ds:data, ss:stack, cs:code

data segment
	arr dw 1H,1H,100 dup (0)
data ends

stack segment
    dw 1000 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov bx, 0
        mov dx, 0
        mov cx, 12
        f1:
            mov ax, 0
            add ax, arr[bx]
            add ax, arr[bx + 2]
            mov arr[bx + 4], ax
            add bx, 2
            loop f1


    mov ax, 4c00h
    int 21H
code ends
    end start