assume ds:data, ss:stack, cs:code

data segment
    arr dw 1111H,2222H,3333H,4444H,5555H,6666H,7777H,8888H
	res dw 8 dup (0)
data ends

stack segment
    dw 128 dup(0)
    ;db 128 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov ax, stack
        mov ss, ax
        mov sp, 100
        mov bx, 0
        mov cx, 8
        f:
            push arr[bx]
            add bx, 2
            loop f

        mov bx, 0
        mov cx, 8
        f1: 
            pop res[bx]
            add bx, 2
            loop f1

    mov ax, 4c00h  
    int 21H
code ends
    end start