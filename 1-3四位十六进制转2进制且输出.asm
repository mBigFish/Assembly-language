CRLF    MACRO
        MOV    DL,0DH
        MOV    Ah,02H
        INT    21H
        MOV    DL,0AH
        MOV    AH,02H
        INT    21H
ENDM ;定义宏功能用于换行

data segment;定义输出的提示信息
MESS db 'input a hexadecimal number:',0DH,0AH,'$'
MESS1 db 'input error!',0DH,0AH,'$'
data ends
;定义栈段
stack segment stack 'stack'
STA db 128 dup(?)
TOP EQU LENGTH STA
stack ends

code segment
ASSUME cs:code,ds:data,ss:stack
START:;初始化相关寄存器
        mov ax,data
        mov ds,ax
        mov ax,stack
        mov ss,ax
        mov sp,TOP

        ;屏幕显示输入
        xor bx,bx;将bx清零
        xor cx,cx;将cx清零
        LEA dx,MESS;调用中断程序输出提示信息MESS
        mov ah,09H
        int 21H

        call GETNUM;GETNUM调用GETNUM接收数据
        CRLF;调用宏功能输出换行符
        mov cx,10h;循环16次
L2:     rol bx,1;循环左移，将每次输出数据放到bx最低位
        mov dl,bl
        and dl,0001h;屏蔽高七位
        add dl,30h;转化为ASCII码
        mov ah,02H;调用中断程序输出结果
        int 21H
        loop L2
        ;退出程序
        mov ax,4C00H
        int 21H
;============================
;定义GETNUM子程序，结果存于bx中
GETNUM PROC near
L1:
        push cx;保存cx,即已输入字符个数
        mov cl,4;移位次数
        shl bx,cl
        mov ah,01h;调用中断程序接收单个字符
        int 21H
        cmp al,'f'
        ja ERROR;输入数据范围有误,跳至错误处理部分
        cmp al,'a'
        jae change;尝试改为大写继续判断
        jmp CMP3;不是大写16进制数
change:
        sub al,20h
CMP3:
        cmp al,'F'
        ja ERROR;输入数据范围有误,跳至错误处理部分
        cmp al,'A'
        jb CMP1;跳至数字判断
        sub al,07h;转化为16进制
        jmp CMP2
CMP1:
        cmp al,'9'
        ja ERROR;输入数据范围有误,跳至错误处理部分
CMP2:;转化为16进制
        cmp al,'0'
        jb ERROR
        sub al,30h
        mov ah,0
        add bx,ax
        pop cx
        inc cx
        cmp cx,4
        je return
        jmp L1
ERROR:;输入数据有误，退出程序
        CRLF
        LEA dx,MESS1
        mov ah,09H
        int 21H
        mov ax,4C00H
        int 21H
return:
        ret
GETNUM ENDP
;============================
code ends
end START
