;------------------------
;帮我用8086汇编编写完整程序实现文本加密,即将从键盘输入的字符串在字母表中后移3位后再输出。如输入“ABCD’则输出“DEFG’,输入XYz’则输出“ABC’
;------------------------

DATA SEGMENT 
    INPUT_STR DB 10 DUP('$')
    OUTPUT_STR DB 10 DUP('$')
    MESS db 'input:', '$'
    MESS1 db 'output:', '$'
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA, CS:CODE 
    START:
        MOV AX, DATA
        MOV DS, AX

        ;提示输入字符串
        xor bx,bx;将bx清零
        xor cx,cx;将cx清零
        LEA dx,MESS;调用中断程序输出提示信息MESS
        mov ah,09H
        INT 21H

        ;从键盘获取用户输入的字符串
        mov DX, OFFSET INPUT_STR
        MOV AH, 0AH
        INT 21H

        ;获取输入字符串长度
        MOV BX, OFFSET INPUT_STR
        INC BX
        MOV CL, [BX]
        INC BX

        ;加密
        MOV SI, OFFSET OUTPUT_STR
        F1:
            MOV AL, [BX]
            ADD AL, 3H
            MOV [SI], al
            INC SI
            INC BX
            LOOP F1

        ;输出
        LEA DX, MESS1
        MOV AH, 09H
        INT 21H

        LEA DX, OUTPUT_STR
        MOV AH, 09H
        INT 21H

    MOV AX, 4C00H
    INT 21H

CODE ENDS
    END START