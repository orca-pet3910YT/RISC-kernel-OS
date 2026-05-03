#include <uart.h>

extern void hang(void);
void kmain() {
	const char *m = "Hello, World!\r\n";
	//u_putc('E');
	u_puts("Hello, World!\r\n");
	__asm__ volatile ("j hang" ::: );
	hang();
}
