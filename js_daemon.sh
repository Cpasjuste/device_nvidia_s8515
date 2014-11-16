#!/bin/sh

# Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

# js_daemon.sh -- Check and recovery Shield joystick
#
# This script checks if joystick is disconnected. If so, do a reset on the
# USB driver as well as joystick firmware

JS_NODE="/dev/input/js0"
ISSP_NODE_USB="/sys/devices/platform/issp.0/issp_usbreset"
ISSP_NODE="/sys/devices/platform/issp.0/issp_reset"

sleep 60

while true;
do
	if [ -e $JS_NODE ];
	then
		sleep 10
	else
		echo 1 > $ISSP_NODE
		sleep 10
		if [ -e $JS_NODE];
		then
			sleep 10
		else
			echo 1 > $ISSP_NODE_USB
			sleep 10
		fi
	fi
done
