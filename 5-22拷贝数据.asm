assume ds:data, ss:stack, cs:code

data segment
    arr db 1,2,3,4,10,20,30,40
	res db 8 dup (0)
data ends

stack segment
    db 128 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov bx, 0
        mov cx, 8
        f:
            mov al, arr[bx]
            mov res[bx], al
            inc bx
            loop f
    mov ax, 4c00h
    int 21H
code ends
    end start