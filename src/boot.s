# remember kids, x0 is always zero, x1 is the call return address, x2 is the stack pointer, x3 is the global pointer and x4 is the thread pointer

.section .text
.globl _start
_start:
	la x2, stack_top # load the stack
	#la x3, __global_pointer$
	call kmain
hang:
	wfi
	j hang

#.section .sdata
#.align 4
#__global_pointer$:

.section .bss
.align 16
stack:
	.space 16384
stack_top:
