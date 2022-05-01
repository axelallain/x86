```sh
nasm -f elf32 -o asm.o asm.s && ld -m elf_i386 asm.o -o asm && ./asm
```

```sh
nasm -f elf32 -g -F dwarf -o asm.o asm.s && ld -m elf_i386 asm.o -o asm && gdb asm
```

http://faculty.nps.edu/cseagle/assembly/sys_call.html
