#!/system/bin/sh

# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

# factory_install_apk.sh -- install factory apk
#
# This script checks external sdcard and installs the factory apk

SD_PATH=/storage/sdcard1
LIST_FILE=/data/factory_install.list
ODM_PRODUCTION=/sys/devices/platform/tegra-fuse/odm_production_mode

bInstall=0
while [ 1 ]
do
    if [ -e "$ODM_PRODUCTION" ]; then
        chmod 444 $ODM_PRODUCTION
    fi

    if [ ! -e "$LIST_FILE" ]; then
        touch $LIST_FILE
    fi

    if grep -qa $SD_PATH /proc/mounts; then
        installed_apks=`cat $LIST_FILE`
        for new_apk in `ls $SD_PATH/`
        do
            new_apk_filename="$SD_PATH/$new_apk"
            if [ -f "$new_apk_filename" ]; then
                if [ "${new_apk_filename##*.}" = "apk" ]; then
                    bInstall=1
                    for installed_apk in $installed_apks
                    do
                        if [ $installed_apk = $new_apk ]; then
                            bInstall=0
                        fi
                    done

                    if [ $bInstall = 1 ]; then
                        Ret=`pm install -r $new_apk_filename`
                        if [ "$Ret" = "Success" ]; then
                            echo "[Success] install $new_apk_filename"
                            echo $new_apk >> $LIST_FILE
                        else
                            echo "[Failure] install $new_apk_filename"
                        fi
                    fi
                fi
            fi
        done
    fi

    sleep 2
    bInstall=0
done
