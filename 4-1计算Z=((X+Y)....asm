;-------------------------------------------
; 试编制一程序(不考虑以上情况)，求出下列公式中的Z值，并存放在
; RESULT单元中：
; • Z=((X+Y)*8-X)/2。
; • 其中X,Y的值分别存放在VARX,VARY单元中
;-------------------------------------------

assume ds:data, ss:stack, cs:code

data segment
    varx db 6
    vary db 7
    result db ?
data ends

stack segment
    db 128 dup (0)
stack ends

code segment
    start:
        mov ax, data
        mov ds, ax
        mov dx, 0
        mov al, varx
        mov ah, vary
        add al, ah
        mov bl, 8
        mul bl
        mov dl, varx
        sub ax, dx
        mov bl, 2
        div bl
        mov result, al


    mov ax, 4c00h
    int 21h
code ends
    end start