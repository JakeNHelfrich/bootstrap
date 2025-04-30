.section .text
.globl _start
_start:
    lui   a0, 0x10000         # a0 = 0x10000000 (UART base address)
    addi  a1, x0, 72          # a1 = 'H' (ASCII 72)
    sb    a1, 0(a0)           # store byte to UART

    addi  a1, x0, 105         # a1 = 'i' (ASCII 105)
    sb    a1, 0(a0)           # store byte to UART

loop:
    jal   x0, loop            # unconditional jump (jal x0, offset)

