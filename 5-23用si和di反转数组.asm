assume ds:data, ss:stack, cs:code

data segment
    arr1 db 1h,2h,3h,4h,10h,20h,30h,40h
    arr2 db 8 dup(0)
data ends

stack segment
    db 128 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov bx, 0
        mov si, 0
        mov di, 7
        mov cx, 8
        f:
            mov bl, arr1[di]
            mov arr2[si], bl
            inc si
            dec di
            loop f

    mov ax, 4c00h
    int 21H
code ends
    end start