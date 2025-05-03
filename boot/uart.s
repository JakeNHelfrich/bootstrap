.section .text
.equ UART_BASE,             0x10010000

.equ UART_TCR_OFFSET,       0x08
.equ UART_TCR_ADDR,         UART_BASE + UART_TCR_OFFSET

.equ UART_TX_OFFSET,        0x00
.equ UART_TX_ADDR,          UART_BASE + UART_TX_OFFSET

.equ UART_RCR_OFFSET,       0x0C
.equ UART_RCR_ADDR,         UART_BASE + UART_RCR_OFFSET

.equ UART_RX_OFFSET,        0x04
.equ UART_RX_ADDR,          UART_BASE + UART_RX_OFFSET

.globl uart_init_device
.type uart_init_device, @function
uart_init_device:
1:
    # Load TCR register and set txen bit to 1
    la      t0, UART_TCR_ADDR
    li      t1, 0x1
    sw      t1, 0(t0)

    # Load RCR register and set txen bit to 1
    la      t0, UART_RCR_ADDR
    sw      t1, 0(t0)

    ret

.globl uart_get_char
.type uart_get_char, @function
uart_get_char:
1:
    # Load RX register  
    la      t0, UART_RX_ADDR
    lw      t1, 0(t0)  
    # Load empty bit (bit 31)
    srli    t2, t1, 31

    # If empty bit is 0 it means a byte has been placed in register. Else loop.
    bnez    t2, 1b              

    # Load byte from RX register
    or      a0, x0, t1
    ret

.globl uart_print_char
.type uart_print_char, @function
uart_print_char:
1:
    # Load TX register
    la      t0, UART_TX_ADDR
    lw      t1, 0(t0) 
    # Load full bit (bit 31)
    srli    t2, t1, 31
    
    # If full bit is 0 it means the register is empty and ready for writing. Else loop.
    bnez    t2, 1b      

    # Load character into TX register 
    sw      a0, 0(t0)
    ret
