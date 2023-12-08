assume cs:code,ds:data,ss:stack

data segment
    str db 'hello world'
data ends

stack segment
    db 10 dup(0)
stack ends

code segment
    start:
    mov ax, data
    mov ds, ax
    lea ax, str
    mov ah, 9
    int 21h

    mov ah, 4ch
    int 21h
code ends
end start