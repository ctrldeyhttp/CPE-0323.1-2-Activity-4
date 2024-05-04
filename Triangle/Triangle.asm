TITLE Triangle.asm
.model small
.code
org 100h
start:

mov cl,1 
mov bl,0
mov ch,4

looprow:cmp ch,0
jg loopcol
jmp quit

loopcol:
cmp bl,cl
jl dsplay
jmp next

dsplay:mov ah,2h
mov dl,'*'    ;display asterisk
int 21h
inc bl
jmp loopcol

next:mov dl,0Ah
int 21h       ;next line
mov dl,0Dh
int 21h

mov bl,0
dec ch
inc cl
jmp looprow
quit:int 20h
end start
