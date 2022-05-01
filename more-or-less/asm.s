section .data
	message db "Hello, World!",10

section .text
	global _start

_start:
	mov ebx, 1
	shl ebx, 1 
	int 0x80

	mov ebx, 0
	mov eax, 1
	int 0x80
