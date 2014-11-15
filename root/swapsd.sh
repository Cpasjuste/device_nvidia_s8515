#!/system/bin/sh

SWAP=`getprop config.swapsd`

if [ "$SWAP" == "true" ]; then
	mount -o remount,rw /
	rm /sdcard
	rm /mnt/sdcard
	rm /storage/sdcard0
	rm /storage/emulated/legacy
	ln -s /storage/sdcard1 /sdcard
	ln -s /storage/sdcard1 /mnt/sdcard
	ln -s /storage/sdcard1 /storage/sdcard0
	ln -s /storage/sdcard1 /storage/emulated/legacy
	mount -o remount,ro /
fi

