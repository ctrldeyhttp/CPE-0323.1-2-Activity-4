TITLE prog4_1.asm
Dosseg
.model small
.stack 0100h
.data
.code
start:
mov ax,@data
mov ds, ax
mov cx,001Eh
mov ah,02h	;request display character
mov dl,'*'	;character to display
A:	int 21h	;call interrupt service
	loop A
mov ax, 4c00h	;end
int 21h
end start
