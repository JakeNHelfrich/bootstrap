boot.bin: boot.elf
	riscv64-elf-objcopy -O binary boot.elf boot.bin

boot.elf: boot.o uart.o string.o
	riscv64-elf-ld -T boot.ld -o boot.elf boot.o uart.o string.o

boot.o: boot.s
	riscv64-elf-as -o boot.o boot.s

uart.o: uart.s
	riscv64-elf-as -o uart.o uart.s

string.o: string.s
	riscv64-elf-as -o string.o string.s

clean:
	rm boot.bin boot.elf boot.o uart.o string.o



