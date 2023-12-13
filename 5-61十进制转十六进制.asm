assume ds:data, ss:stack, cs:code

data segment
    str db 12345d,'$'
data ends

stack segment
    db 128 dup(0)
stack ends

;------------------------
;   for (int i = 0; i < 8; i++)
;   {
;       int a = str / 16;
;       

code segment
    start:
        mov ax, data
        mov ds, ax
        

    mov ax, 4c00h
    int 21H
code ends
    end start
