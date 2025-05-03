cd boot

make

qemu-system-riscv64 \
    -nographic \
    -machine sifive_u \
    -cpu sifive-u54 \
    -bios boot.bin

make clean

cd ..
