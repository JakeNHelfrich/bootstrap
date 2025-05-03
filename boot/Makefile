boot: boot.elf
	riscv64-elf-objcopy -O binary boot.elf boot

boot.elf: boot.o
	riscv64-elf-ld -T boot.ld -o boot.elf boot.o

boot.o: boot.s
	riscv64-elf-as -o boot.o boot.s


clean:
	rm boot boot.elf boot.o



