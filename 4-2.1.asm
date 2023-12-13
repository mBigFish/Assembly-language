CODE SEGMENT USE16
    ASSUME CS:CODE
BEG:  
    MOV BX, 5678H   ;BX中为将要处理的16位二进制数
    MOV CX, 16      ;每次移出1位、循环16次
LAST:   
    MOV DL, '0'
    RCL BX, 1        ;BX循环左移一位
    JNC NEXT        ;若进位标志为0则转，显示0
    MOV DL, '1'     ;为1时，则显示1
NEXT: 
    MOV AH, 2
    INT 21H
    LOOP LAST
    MOV AH, 4CH
    INT 21H
CODE ENDS
    END BEG