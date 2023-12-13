assume ds:data, ss:stack,  cs:code

data segment
    str db 10h, 4h, 77h, 15h, 2h, 99h, 25h,'$'
data ends

stack segment
    db 10 dup(0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov bx, 1
        mov al, ds:[0]
        s:
            cmp al,ds:[bx]
            jg brangch1
            jmp brangch2
            
            brangch1:
                mov al, ds:[bx]
                inc bx
                loop s
            brangch2:
                inc bx
                loop s

        mov al, 4cH
        int 21H
code ends
    end start