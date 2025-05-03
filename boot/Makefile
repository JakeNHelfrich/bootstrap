boot.bin: boot.elf
	riscv64-elf-objcopy -O binary boot.elf boot.bin

boot.elf: boot.o uart.o
	riscv64-elf-ld -T boot.ld -o boot.elf boot.o uart.o

boot.o: boot.s
	riscv64-elf-as -o boot.o boot.S

uart.o: uart.s
	riscv64-elf-as -o uart.o uart.S

clean:
	rm boot.bin boot.elf boot.o uart.o



