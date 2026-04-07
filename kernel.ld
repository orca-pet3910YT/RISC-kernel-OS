OUTPUT_ARCH(riscv)
ENTRY(_start)
SECTIONS {
	. = 0x80200000;
	.text : ALIGN(4K) {
		*(.text*)
	}
	.rodata : {
		*(.rodata*)
	}
	.data : {
		*(.data*)
	}
	.bss : {
		*(.bss*)
		*(COMMON)
	}
}
