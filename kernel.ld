OUTPUT_ARCH(riscv)
ENTRY(_start)
MEMORY {
	RAM (rwx) : ORIGIN = 0x80100000, LENGTH = 128M
}
SECTIONS {
	. = 0x80100000;
	.text : ALIGN(4K) {
		*(.text.init)
		*(.text*)
	} > RAM
	.rodata : {
		*(.rodata*)
	}
	.data : {
		. = ALIGN(4096);
		__global_pointer$ = . + 0x800;
		*(.sdata)
		*(.data)
	}
	.bss : {
		*(.bss*)
	} > RAM
	. = ALIGN(16);
	stack_top = ORIGIN(RAM) + LENGTH(RAM);
}
