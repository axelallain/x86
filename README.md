```sh
nasm -f elf32 -o asm.o asm.s && ld -m elf_i386 asm.o -o asm && ./asm
```
