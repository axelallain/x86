section .data
	message db "Hello, World!",0xa

section .text
	global _start

_start:
	mov edx, 14
	mov ecx, message
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov ebx, 0
	mov eax, 1
	int 0x80