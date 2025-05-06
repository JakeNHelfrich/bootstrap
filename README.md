# Bootstrap

I want to get a "complete" picture of how computers work. 
So what better way to do so than to bootstrap a compiler from [stage 0](https://en.wikipedia.org/wiki/Bootstrapping_(compilers)#Process).
As of right now C is the language of choice for the compiler.
This may change depending on how lazy I am when it comes time to writing it, I may need to choose a simpler language.

## Constraints

The only things I'll be able to utilise here are as follows:
- **QEMU** to virtualise an x86-64 machine, and
- **RISCV GCC tool chain** to produce binary files from RISCV assembly

Everything else *MUST* be implemented **from scratch**.

## Emulated System

For this project I will be emulating the SiFive FU540-C000 SoC.
The reason? This was the first board that I could find [documentation](https://www.sifive.com/document-file/freedom-u540-c000-manual) for.

This SoC is emulated by setting the following QEMU flags:

- machine   = sifive_u
- cpu       = sifive-u54 

## Goals

Get `/boot` to:
    1. Set up trap handler (SYSCALL Only)
    2. Set Privlege level to **U**
    3. Jump to pplication (TODO: Find where to put it. Memory? Block Storage? Dynamic lookup?)

Write an assembler application which will assemble code (typed in or from disk) and then execute.  
