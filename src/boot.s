# remember kids, x0 is always zero, x1 is the call return address, x2 is the stack pointer, x3 is the global pointer and x4 is the thread pointer

.section .text.init
.globl _start
.globl hang
_start:
	la sp, _stack_top
	addi sp, sp, -16
	csrr a0, mhartid
	bnez a0, hang
	sd ra, 8(sp)
	call kmain
	ld ra, 8(sp)
	addi sp, sp, 16
hang:
	wfi
	j hang

.section .bss
.space 4096
stack:
	.space 16384
_stack_top:
