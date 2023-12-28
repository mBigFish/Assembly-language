DATAS SEGMENT
buf db 50
	db ?  ;不指明初值
	db 50 dup(0)
DATAS ENDS
CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS
START:
    MOV AX,DATAS
    MOV DS,AX
    mov dx,offset buf   ;放缓冲区首地址到dx中
    mov ah,10
    int 21h
    
    mov dl,10   ;换行符号的ascll码是10
    mov ah,02
    int 21h   ;输出一个换行
    
    mov bx,offset buf
    inc bx  ;实际存入的字符个数
    mov cl,[bx]    ;读取实际字符个数到cx中
    mov ch,0
    inc bx

s0:mov dl,[bx]
   mov ah,02
   int 21h
   inc bx
   loop s0
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
