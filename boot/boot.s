.section .data
HELLO_STRING:
    .string "Hello World!\n"

GOODBYE_STRING:
    .string "Good Bye!\n"

.section .text
.equ    CARRIAGE_RETURN,            0x0D
.equ    LINE_FEED,                  0x0A

.globl _start
_start:
    csrr    t0, mhartid
    bnez    t0, end_program

    li      sp, 0x80040000

    call    uart_init_device

    la      a0, HELLO_STRING
    call    string_print

    call    loop

    la      a0, GOODBYE_STRING
    call    string_print

    j       end_program
    
loop:
    addi    sp, sp, -8
    sd      ra, 0(sp)
1:
    call    uart_get_char

    la      t0, CARRIAGE_RETURN
    beq     a0, t0, 2f

    call    uart_print_char
    j       1b
2:
    la      a0, LINE_FEED
    call    uart_print_char

    ld      ra, 0(sp)
    add     sp, sp, 8
    ret

end_program:
