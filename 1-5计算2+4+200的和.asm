DATA SEGMENT
    S DW 0  ; 用于存放和
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA, CS:CODE
START:
    MOV AX, DATA  ; 初始化数据段寄存器
    MOV DS, AX

    MOV AX, 0     ; 清零寄存器AX，用于存放和
    MOV CX, 100   ; 循环次数

    MOV BX, 2     ; 初始值为2
SUM_LOOP:
    ADD AX, BX    ; 将BX的值加到AX中
    ADD BX, 2     ; BX每次加2
    LOOP SUM_LOOP ; 循环

    ; 输出结果
    MOV S, AX

    ; 将结果转换为十进制并输出
    MOV AX, S
    MOV CX, 10
    CALL DECIMAL

    ; 程序结束
    MOV AH, 4CH
    INT 21H

DECIMAL PROC
    ; 将AX中的数转换为十进制并输出
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV CX, 10
    XOR DX, DX

    DIV CX         ; AX / 10，结果在AX中，余数在DX中
    ADD DX, '0'    ; 将余数转换为字符
    MOV AH, 02
    INT 21H        ; 输出余数

    POP DX
    MOV DL, AH     ; 将商存入DL
    ADD DL, '0'    ; 将商转换为字符
    MOV AH, 02
    INT 21H        ; 输出商

    POP CX
    POP BX
    POP AX

    RET
DECIMAL ENDP

CODE ENDS
    END START
