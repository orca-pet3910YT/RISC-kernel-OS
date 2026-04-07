#include <uart.h>

void kmain() {
	const char *m = "Hello, World!\r\n";
	//u_putc('E');
	u_puts(m);
	return;
}
