mkdir .temp
cd .temp

riscv64-elf-as -o boot.o ../boot/boot.s
riscv64-elf-ld -T ../boot/boot.ld -o boot.elf boot.o
riscv64-elf-objcopy -O binary boot.elf boot.bin

qemu-system-riscv64 \
    -nographic \
    -machine sifive_u \
    -cpu sifive-u54 \
    -bios boot.bin

cd ..
rm -drf .temp
