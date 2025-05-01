.section .text
.globl _start
_start:
    csrr    t0, mhartid
    bnez    t0, end

    addi    x15, x0, 0x0D       # ASCII carriage return

init_uart:
    lui     x2, 0x10010         # UART Device base address in MMIO
    addi    x2, x2, 0x000       # TX Data offset
    
    addi    t1, x2, 0x08        # TCR Register offset

    lui     t2, 0x0             # Set TCR Register txen bit to 1 to enable the device for writing
    addi    t2, t2, 0x1
    sw      t2, 0(t1)

    addi    t3, x2, 0x0C        # RCR Register offset
    sw      t2, 0(t3)           # Set RCR Register rxen bit to 1 to enable the device for reading

    addi    x3, x2, 0x04        # RX Data offset

loop:
    jal     ra, get_char

    beq     a0, x15, end

    jal     ra, print_char
    j loop


get_char:
    lw      t1, 0(x3)           # Load RCR and check the empty bit.  
    srli    t2, t1, 31
    bnez    t2, get_char        # Keep loading until empty bit is unset which signifies a character has been placed. 

    or      a0, x0, t1
    jalr    x0, 0(ra)

print_char:
    lw      t1, 0(x2)           # Load TCR and check the full bit.
    srli    t2, t2, 31
    bnez    t2, print_char      # Keep loading until full bit is unset which signifies the transmit register is ready to write.

    sw      a0, 0(x2)
    jalr    x0, 0(ra)

end:
