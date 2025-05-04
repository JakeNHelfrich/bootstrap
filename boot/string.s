.section .text

.globl string_print
.type string_print, @function
string_print:
    addi    sp, sp, -8
    sd      ra, 0(sp)

    add     s0, x0, a0          # pointer to string
    li      s1, 0               # index into string
1:
    # 1. Get next Char
    add     s2, s0, s1          # Address of next char, HELLO_STRING(t0) + offset(t1)
    lbu     a0, 0(s2)           # Character at string index 

    # 2. If Char == '\0' then end
    beqz     a0, 2f

    # 3. Print char 
    call    uart_print_char

    # 4. Increment index  
    addi    s1, s1, 1
    j       1b
2:
    ld      ra, 0(sp)
    addi    sp, sp, 8
    ret
