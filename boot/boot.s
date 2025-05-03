.section .text
.equ CARRIAGE_RETURN,        0x0D

.globl _start
_start:
    csrr    t0, mhartid
    bnez    t0, end

    call    uart_init_device
    j       loop
    call    end
    
loop:
1:
    call    uart_get_char

    la      t0, CARRIAGE_RETURN
    beq     a0, t0, end

    call    uart_print_char
    j       1b

end:
