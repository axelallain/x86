section .data
	more db "More",10
	less db "Less",10
	victoryboolean db 0x0

section .bss
	guess resb 4

section .text
	global _start

_start:
	_gameloop:
	mov eax, [victoryboolean]	
	cmp eax, 0x1
	je _end
	call _askguess
	call _clue
	jmp _gameloop

	_askguess:
	mov eax, 3
	mov ebx, 0
	mov ecx, guess
	mov edx, 16
	int 0x80
	ret

	_clue:
	mov eax, [guess]
	cmp eax, 0x5
	je _victory
	jl _msgmore
	jg _msgless
	ret

	_victory:
	mov eax, [victoryboolean]
	inc eax
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
