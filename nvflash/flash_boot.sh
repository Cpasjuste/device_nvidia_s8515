#!/bin/bash
./nvflash --bct nvflash/common_bct.cfg --bl bootloader.bin --go 
./nvflash -r --download 17 ../../../../out/target/product/s8515/boot.img


