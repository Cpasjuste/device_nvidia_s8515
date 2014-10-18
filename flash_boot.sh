#!/bin/bash
cwd=$(pwd)
cd /media/cpasjuste/SSD/divers/wax/nvflash/
./nvflash --bct common_bct.cfg --bl bootloader.bin --go 
./nvflash -r --download 17 ~/android-nvidia/out/target/product/tegranote7c/boot.img
cd $pwd

