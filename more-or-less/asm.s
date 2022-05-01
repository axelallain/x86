section .data
	message db "Hello, World!",10
	more db "More",10
	less db "Less",10
	victory db 0x1
	number db 0x5

section .bss
	guess resb 16

section .text
	global _start

_start:
	_gameloop:
	mov eax, [victory]	
	cmp eax, 0x1
	je _end
	call _askguess
	call _clue
	call _gameloop

	_askguess:
	mov eax, 3
	mov ebx, 0
	mov ecx, guess
	mov edx, 16
	int 0x80
	ret

	_clue:
	mov eax, [guess]
	cmp eax, [number]
	je _end
	jl _msgmore
	jg _msgless
	ret

	_msgmore:
	mov eax, 4
	mov ebx, 1
	mov ecx, more
	mov edx, 5
	int 0x80
	ret

	_msgless:
	mov eax, 4
	mov ebx, 1
	mov ecx, less
	mov edx, 5
	int 0x80
	ret


	_end:
	mov ebx, 0
	mov eax, 1
	int 0x80
