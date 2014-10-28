#!/bin/bash
#cwd=$(pwd)
#cd /media/cpasjuste/SSD/divers/wax/nvflash/
./nvflash --bct common_bct.cfg --bl bootloader.bin --go 
./nvflash -r --download 18 ../../../../out/target/product/s8515/system.img
#cd $pwd

