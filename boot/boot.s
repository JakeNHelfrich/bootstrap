.section .text
.globl _start
_start:
    lui   t0, 0x10000         # a0 = 0x10000000 (UART base address)
    lui   t1, 0x10000         # a0 = 0x10000005 (UART line status register)
    addi  t1, t1, 0x005       #

    addi  t2, x0, 0x00D       # carriage return

loop:
    jal   ra, get_char

    beq   a1, t2, end

    jal   ra, print_char

    j     loop

get_char:
    lb    a1, 0(t1)
    andi  a2, a1, 1
    beqz  a2, get_char
    
    lb    a1, 0(t0)
    jalr  x0, 0(ra)

print_char:
    sb    a1, 0(t0)
    jalr  x0, 0(ra) 

end:
