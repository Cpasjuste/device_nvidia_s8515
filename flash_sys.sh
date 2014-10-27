#!/bin/bash
#cwd=$(pwd)
#cd /media/cpasjuste/SSD/divers/wax/nvflash/
nvflash/nvflash --bct nvflash/common_bct.cfg --bl nvflash/bootloader.bin --go 
nvflash/nvflash -r --download 18 ../../../out/target/product/s8515/system.img
#cd $pwd

