###############################################################################
#
# Copyright (c) 2010-2014, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.
#
###############################################################################

SD_LOGDIR=/sdcard/logs
LOGS_DIR=log
LAST_LOGS_DIR=log_`date +20%y_%m_%d-%H-%M`

if [ -d $SD_LOGDIR ]; then
    echo "$SD_LOGDIR already exists"
else
    mkdir $SD_LOGDIR
fi

cd $SD_LOGDIR
if [ -d $LOGS_DIR ]; then
    echo "$SD_LOGDIR/log already exists"
    mv $LOGS_DIR $LAST_LOGS_DIR
fi

mkdir $LOGS_DIR
mkdir $LOGS_DIR/kernel
mkdir $LOGS_DIR/logcat
cd $LOGS_DIR
cp /data/var/last_kmsg last_kmsg.log

stop logcat_main
stop logcat_radio
stop logcat_system
stop logcat_events
stop log_kmsg

start logcat_main
start logcat_radio
start logcat_system
start logcat_events
start log_kmsg

