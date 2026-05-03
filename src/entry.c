#include <uart.h>

extern void hang(void);
void kmain() {
	uart_init();
	//u_putc('E');
	u_puts("Hello, World!\r\n");
	__asm__ volatile ("j hang" ::: );
	hang();
}
