# Command to run boot test on QEMU
nasm -f bin boot/boot.asm -o boot.bin
qemu-system-i386 -boot a -fda boot.bin