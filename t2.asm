assume cs:codesg,ds:data,ss:stack
data segmeNT
	str db 'hello world','$'
data ends
stack segment
	db 10 dup (0) 
stack ends
codesg SEgment
	start:	
		mov ax,data
		mov ds,ax
		lea dx,str		
		mov ah,9
