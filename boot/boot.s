.section .text
.globl _start
_start:
    lui   t0, 0x10000         # a0 = 0x10000000 (UART base address)
    lui   t1, 0x10000         # a0 = 0x10000005 (UART line status register)
    addi  t1, t1, 0x005       #

loop:
    jal   ra, get_user_input
    jal   ra, print_char
    j     loop

print_char:
    sb    a1, 0(t0)
    j     go_back

get_user_input:
    lb    a1, 0(t1)
    andi  a2, a1, 1
    beqz  a2, get_user_input
    
    lb    a1, 0(t0)
    j     go_back

go_back:
    jalr  x0, 0(ra)

end:
