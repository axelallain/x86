section .data
	message db "Hello, World!",10
	more db "More",10
	less db "Less",10
	victory db 0x0
	number db 0x5

section .bss
	guess resb 16

section .text
	global _start

_start:
	gameloop:
	mov eax, [victory]	
	cmp eax, 1
	jmp askguess
	jmp clue
	jmp gameloop

	askguess:
	mov eax, 3
	mov ebx, 0
	mov ecx, guess
	mov edx, 16
	int 0x80
	ret

	clue:
	mov eax, [guess]
	cmp eax, [number]
	je end
	jg less
	jl more
	ret

	msgless:
	mov eax, 4
	mov ebx, 1
	mov ecx, less
	mov edx, 5
	int 0x80
	ret

	msgmore:
	mov eax, 4
	mov ebx, 1
	mov ecx, more
	mov edx, 5
	int 0x80
	ret

	end:
	mov ebx, 0
	mov eax, 1
	int 0x80
