#define UART_BASE 0x3f8                     // Registers specified by 
#define UART_THR (UART_BASE + 0)            // the device
#define UART_RBR (UART_BASE + 0)
#define UART_LSR (UART_BASE + 5)

void serial_putc(char c) {
    while( (inb(UART_LSR) & 0x20)== 0);     // Wait until FIFO can hold more chars
    outb(UART_THR, c);                      // Write character to FIFO
}

char serial_getc() {
    while( (inb(UART_LSR) & 0x01) == 0);    // Wait until there is a char to read
    return inb(UART_RBR);                   // Read from the receive FIFO
}