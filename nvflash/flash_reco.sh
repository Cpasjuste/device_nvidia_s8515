#!/bin/bash
#cwd=$(pwd)
#cd /media/cpasjuste/SSD/divers/wax/nvflash/
./nvflash --bct common_bct.cfg --bl bootloader.bin --go 
./nvflash -r --download 15 ../../../../out/target/product/s8515/recovery.img
#cd $pwd

