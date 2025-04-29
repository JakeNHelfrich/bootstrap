mkdir .temp
cd .temp

mkisofs -o disk.iso -G ../boot/mbr.bin ../boot

qemu-system-x86_64 -machine type=isapc disk.iso

cd ..
rm -drf .temp
