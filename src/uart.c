#include <uart.h>

void u_putc(char c) {
	volatile char *serial = (volatile char *)0x10000000;
	while (*serial & 0x80);
	*serial = c;
	__asm__ volatile ("fence" ::: "memory");
}

void u_puts(const char *s) {
	while (*s) u_putc(*s++);
}

