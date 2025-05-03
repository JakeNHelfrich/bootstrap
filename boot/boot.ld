SECTIONS {
    .text 0x80000000 : {
        *(.text*) 
    }

    .data 0x80001000: {
        *(.data*) 
    }
}
