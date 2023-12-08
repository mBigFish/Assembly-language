assume ds:data, ss:stack, ds:data

data segment
	str db 'hello world', '$'
data ends

stack segment
	db 10 dup(0) 
stack ends

code segment
	start:	
	mov ax, data
	mov ds, ax
	mov bx, 0
	mov cx, 11

;-----------------------------
;a -> 61h -> 0110 0001 
;A -> 41h -> 0100 0001
;0110 0001
;1101 1111
;and
;0100 0001
;-----------------------------
	s:
		mov al, ds:[bx]
		and al, 11011111b
		mov ds:[bx], al
		inc bx
		loop s

	lea dx,str		
	mov ah,9
	int 21H

	mov al, 4cH
	int 21h
code ends
end start