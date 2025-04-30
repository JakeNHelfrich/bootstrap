mkdir .temp
cd .temp

riscv64-elf-as -o boot.o ../boot/boot.s
riscv64-elf-ld -Ttext=0x80000000 -o boot.elf boot.o
riscv64-elf-objcopy -O binary boot.elf boot.bin

qemu-system-riscv64 \
    -nographic \
    -machine virt \
    -bios boot.bin \

cd ..
rm -drf .temp
