#include <uart.h>
#define addr8(addr) (*(volatile unsigned char *)(addr))

 

__attribute__((always_inline))
static inline void u_putc(char c) {
	//volatile char *serial = (volatile char *)0x10000000;
	while (*(volatile char *)0x10000005 & 0x20);
	*(volatile char *)0x10000000 = c;
}

void u_puts(const char *s) {
	while (*s) {
		u_putc(*s++);
	}
}

