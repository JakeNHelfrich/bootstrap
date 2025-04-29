# Bootstrap

I want to get a "complete" picture of how computers work. 
So what better way to do so than to bootstrap a compiler from [stage 0](https://en.wikipedia.org/wiki/Bootstrapping_(compilers)#Process).
As of right now C is the language of choice for the compiler.
This may change depending on how lazy I am when it comes time to writing it, I may need to choose a simpler language.

## Constraints

The only things I'll be able to utilise here are as follows:
- **QEMU** to virtualise an x86-64 machine, and
- **GNU xorriso** to produce ISO files to be loaded into the virtual machine.

Everything else *MUST* be implemented **from scratch**.