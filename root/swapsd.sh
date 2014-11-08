#!/system/bin/sh

SWAP=`getprop config.swapsd`

if [ "$SWAP" == "true" ]; then
	mount -o remount,rw /
	rm /sdcard
	rm /mnt/sdcard
	ln -s /storage/sdcard1 /sdcard
	ln -s /storage/sdcard1 /mnt/sdcard
	mount -o remount,ro /
fi

