DATA SEGMENT
    num DW 1234h   ; 16位数
    a DB 0, 0, 0, 0 ; 用于存放分组后的结果
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
START:
    MOV AX, DATA
    MOV DS, AX
    LEA SI, a
    MOV AX, num      ; 将16位数加载到AX寄存器
    MOV CX, 4        ; 循环4次，每次处理4位

    ; 循环将AX寄存器中的数分组放入AL、BL、CL、DL
    GROUP_LOOP:
        MOV DX, CX
        MOV CL, 4
        ROL AX, CL    ; 将AX寄存器左循环移位4位，相当于将高4位移到低4位
        MOV BL, AL   ; 复制AX寄存器的值到BX寄存器
        AND BL, 0FH
        MOV CX, DX
        ;AND BL, 000Fh; 与操作，保留最低4位

        MOV [SI], BL ; 将结果存入相应的位置
        INC SI
        LOOP GROUP_LOOP

    MOV AL, a[0]
    MOV BL, A[1]
MOV AX, 4C00H
INT 21H
CODE ENDS
    END START
