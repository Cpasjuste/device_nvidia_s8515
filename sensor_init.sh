#!/system/bin/sh

# Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

# Sensor
insmod /system/lib/modules/inv-mpu.ko
insmod /system/lib/modules/inv-ak8975.ko

chown system:system /sys/bus/iio/devices/iio:device0/als_value
chown system:system /sys/bus/iio/devices/iio:device0/als_ir_mode
chown system:system /sys/bus/iio/devices/iio:device0/proximity_value
chown system:system /sys/bus/iio/devices/iio:device0/proximity_enable
chown system:system /sys/bus/iio/devices/iio:device1/enable

chown system:system /sys/class/invensense/mpu/accl_enable
chown system:system /sys/class/invensense/mpu/accl_fifo_enable
chown system:system /sys/class/invensense/mpu/accl_delay
chown system:system /sys/class/invensense/mpu/accl_max_range
chown system:system /sys/class/invensense/mpu/enable
chown system:system /sys/class/invensense/mpu/gyro_enable
chown system:system /sys/class/invensense/mpu/gyro_fifo_enable
chown system:system /sys/class/invensense/mpu/gyro_delay
chown system:system /sys/class/invensense/mpu/gyro_max_range
chown system:system /sys/class/invensense/mpu/lpa_delay
chown system:system /sys/class/invensense/mpu/motion_enable
chown system:system /sys/class/invensense/mpu/motion_threshold
chown system:system /sys/class/invensense/mpu/power_state
chown system:system /sys/class/invensense/mpu/key
[ "$MPU_LOAD_CAL_ON_DISABLE" = "1" ] && chmod 0666 /sys/class/invensense/mpu/loadcal
chown system:system /sys/class/invensense/mpu/loadcal

chown system:system /sys/class/input/input*/akm89xx/enable
chown system:system /sys/class/input/input*/akm89xx/delay
chown system:system /sys/class/input/input*/akm89xx/max_range
chown system:system /sys/class/input/input*/akm89xx/resolution

if [ '0' -ne `getprop ro.factorytest` ]; then
    touch /mnt/factory/mpu/inv_cal_data.bin
    chown system:system /mnt/factory/mpu/inv_cal_data.bin
    chmod 0666 /mnt/factory/mpu/inv_cal_data.bin
fi
