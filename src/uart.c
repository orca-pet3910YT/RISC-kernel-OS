#include <uart.h>
#define addr8(addr) (volatile unsigned char *)(addr)

void uart_init() {
	/*__asm__ volatile (
		"li t0, 0x00\n"
		"sb t0, 1(a0)\n"
		"li t0, 0x80\n"
		"sb t0, 3(a0)\n"
		"li t0, 0x01\n"
		"sb t0, 0(a0)\n"
		"li t0, 0x00\n"
		"sb t0, 1(a0)\n"
		"li t0, 0x03\n"
		"sb t0, 3(a0)\n"
		"li t0, 0xC7\n"
		"sb t0, 2(a0)\n"
		:
		: "r"(base)
		: "t0", "memory"
	);*/
	volatile unsigned char *uart = addr8(0x10000000);
	*(uart+1) = 0;
	*(uart+3) = 0x80;
	*uart = 1;
	*(uart+1) = 0;
	*(uart+3) = 3;
	*(uart+2) = 0xC7;
}

__attribute__((always_inline))
static inline void u_putc(char c) {
	//volatile char *serial = (volatile char *)0x10000000;
	while (!*(volatile char *)0x10000005 & 0x20);
	*(volatile char *)0x10000000 = c;
}

void u_puts(const char *s) {
	while (*s) {
		u_putc(*s++);
	}
}

