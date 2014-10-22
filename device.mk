# NVIDIA Tegra4 "Tegratab" development system
#
# Copyright (c) 2013-2014 NVIDIA Corporation.  All rights reserved.

#$(call inherit-product-if-exists, frameworks/base/data/videos/VideoPackage2.mk)
#$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage3.mk)
$(call inherit-product, build/target/product/languages_full.mk)

PRODUCT_LOCALES += mdpi hdpi xhdpi

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/product-files/sensor_init.sh:system/bin/sensor_init.sh \
	$(LOCAL_PATH)/product-files/mountsd:system/xbin/mountsd \
	$(LOCAL_PATH)/product-files/remountsys:system/xbin/remountsys

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/product-files/power.ceres.rc:system/etc/power.ceres.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/product-files/rootfs/fstab.ceres:root/fstab.ceres \
	$(LOCAL_PATH)/product-files/rootfs/factory_init.rc:root/factory_init.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.ceres.factory.rc:root/init.ceres.factory.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.recovery.ceres.rc:root/init.recovery.ceres.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.recovery.icera_ceres.rc:root/init.recovery.icera_ceres.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.environ.rc:root/init.environ.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.rc:root/init.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.ceres.rc:root/init.ceres.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.icera_ceres.rc:root/init.icera_ceres.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.icera.common.rc:root/init.icera.common.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.modem_icera.rc:root/init.modem_icera.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.icera.phone.rc:root/init.icera.phone.rc \
	$(LOCAL_PATH)/product-files/rootfs/ueventd.rc:root/ueventd.rc \
	$(LOCAL_PATH)/product-files/rootfs/ueventd.ceres.rc:root/ueventd.ceres.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.nv_dev_board.usb.rc:root/init.nv_dev_board.usb.rc \
	$(LOCAL_PATH)/product-files/rootfs/init_charging.rc:root/init_charging.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.trace.rc:root/init.trace.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.usb.rc:root/init.usb.rc \
	$(LOCAL_PATH)/product-files/rootfs/init.hdcp.rc:root/init.hdcp.rc \
	$(LOCAL_PATH)/product-files/rootfs/property_contexts:root/property_contexts \
	$(LOCAL_PATH)/product-files/rootfs/seapp_contexts:root/seapp_contexts \
	$(LOCAL_PATH)/product-files/rootfs/sepolicy:root/sepolicy

PRODUCT_COPY_FILES += \
	external/alsa-lib/src/conf/alsa.conf:system/usr/share/alsa/alsa.conf \
	external/alsa-lib/src/conf/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
	external/alsa-lib/src/conf/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
	external/alsa-lib/src/conf/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
	external/alsa-lib/src/conf/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
	external/alsa-lib/src/conf/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
	external/alsa-lib/src/conf/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
	external/alsa-lib/src/conf/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
	external/alsa-lib/src/conf/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
	external/alsa-lib/src/conf/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
	external/alsa-lib/src/conf/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
	external/alsa-lib/src/conf/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
	external/alsa-lib/src/conf/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
	external/alsa-lib/src/conf/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
	external/alsa-lib/src/conf/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
	external/alsa-lib/src/conf/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
	external/alsa-lib/src/conf/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf

#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true
PRODUCT_PACKAGES += \
	com.google.widevine.software.drm.xml \
	com.google.widevine.software.drm \
	libdrmwvmplugin \
	libwvm \
	libWVStreamControlAPI_L1 \
	libwvdrm_L1

# Live Wallpapers
PRODUCT_PACKAGES += \
	LiveWallpapers \
	LiveWallpapersPicker \
	HoloSpiralWallpaper \
	MagicSmokeWallpapers \
	NoiseField \
	Galaxy4 \
	VisualizationWallpapers \
	PhaseBeam \
	librs_jni

PRODUCT_PACKAGES += \
	setup_fs \
	drmserver \
	Gallery2 \
	libdrmframework_jni \
	e2fsck \
        NVSS 
#	audio.a2dp.default \
#	audio.usb.default \
#	audio.r_submix.default\
# 	lights.ceres \
#	power.ceres \
#	sensors.ceres \
#	nvidiafeedback \
#	audio_policy.tegra \
#	audio.primary.tegra \

PRODUCT_PACKAGES += \
	charger\
	charger_res_images\

PRODUCT_PACKAGES += nvaudio_test

#WiFi
PRODUCT_PACKAGES += \
		dhcpd.conf \
		dhcpcd.conf \
		hostapd.conf \
		wpa_supplicant.conf \
		p2p_supplicant.conf \
		p2p_disabled.conf \
		crda \
		regulatory.bin \
		iw \
		ibss_supplicant.conf

#GPS
PRODUCT_PACKAGES += \
		agnss_connect \
		client_app \
		client_hwd \
		Connect_Config.txt \
		devproxy \
		dproxy.conf \
		dproxy.patch \
		hwd \
		libagnss.so \
		libassist.so \
		libclientlogger.so \
		libdevproxy.so \
		libgnssutils.so \
		Log_MD \
		log_MD.txt \
		logs.txt \
		nvs.txt \
		ser2soc \
		test_server
#		gps.tegra.so 

# CPU volt cap daemon
PRODUCT_PACKAGES += \
	nvcpuvoltcapd

# HDCP SRM Support
PRODUCT_PACKAGES += \
                hdcp1x.srm \
                hdcp2x.srm \
                hdcp2xtest.srm

# OV5693 bayer sensor calibration manager
# PRODUCT_PACKAGES += otp-ov5693
PRODUCT_PACKAGES += ControllerMapper

#include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk
include frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk

#include $(LOCAL_PATH)/touchscreen/maxim/maxim.mk
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := phone
PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay-phone

# override runtimes to dvm only(removing android runtime)
OVERRIDE_RUNTIMES := runtime_libdvm_default

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Set DPI
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=312

# Enable secure USB debugging in user release build
#ifeq ($(TARGET_BUILD_TYPE),release)
#ifeq ($(TARGET_BUILD_VARIANT),user)
#"PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#    ro.adb.secure=1
#endif
#endif

#ifeq ($(TARGET_BUILD_TYPE),release)
#ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0
#endif
#endif

# Include ShieldTech
ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS),TRUE)
SHIELDTECH_FEATURE_NVGALLERY := false
SHIELDTECH_FEATURE_KEYBOARD := false
SHIELDTECH_FEATURE_CONSOLE_MODE := false
SHIELDTECH_FEATURE_BLAKE := false
endif

-include vendor/nvidia/s8515/BoardConfigVendor.mk

# twrp
PRODUCT_COPY_FILES += $(LOCAL_PATH)/product-files/twrp.fstab:recovery/root/etc/twrp.fstab

