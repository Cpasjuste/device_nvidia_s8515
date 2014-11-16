#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, vendor/nvidia/s8515/s8515-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# This device is xhdpi
PRODUCT_AAPT_CONFIG += normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

LOCAL_PATH := device/nvidia/s8515

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/fstab.ceres:root/fstab.ceres \
	$(LOCAL_PATH)/root/init.ceres.rc:root/init.ceres.rc \
	$(LOCAL_PATH)/root/init.nv_dev_board.usb.rc:root/init.nv_dev_board.usb.rc \
	$(LOCAL_PATH)/root/init.icera_ceres.rc:root/init.icera_ceres.rc \
	$(LOCAL_PATH)/root/init.icera.common.rc:root/init.icera.common.rc \
	$(LOCAL_PATH)/root/init.modem_icera.rc:root/init.modem_icera.rc \
	$(LOCAL_PATH)/root/init.icera.phone.rc:root/init.icera.phone.rc \
	$(LOCAL_PATH)/root/ueventd.ceres.rc:root/ueventd.ceres.rc \
	$(LOCAL_PATH)/root/init.hdcp.rc:root/init.hdcp.rc \
	$(LOCAL_PATH)/root/init_charging.rc:root/init_charging.rc \
	$(LOCAL_PATH)/root/swapsd.sh:root/swapsd.sh
# TWRP
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/audio/conf/alsa.conf:system/usr/share/alsa/alsa.conf \
	$(LOCAL_PATH)/audio/conf/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
	$(LOCAL_PATH)/audio/conf/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
	$(LOCAL_PATH)/audio/conf/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
	$(LOCAL_PATH)/audio/conf/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
	$(LOCAL_PATH)/audio/conf/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
	$(LOCAL_PATH)/audio/conf/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
	$(LOCAL_PATH)/audio/conf/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
	$(LOCAL_PATH)/audio/conf/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
	$(LOCAL_PATH)/audio/conf/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
	$(LOCAL_PATH)/audio/conf/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
	$(LOCAL_PATH)/audio/conf/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
	$(LOCAL_PATH)/audio/conf/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
	$(LOCAL_PATH)/audio/conf/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
	$(LOCAL_PATH)/audio/conf/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
	$(LOCAL_PATH)/audio/conf/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
	$(LOCAL_PATH)/audio/conf/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf

# Proprietary blobs
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/blobs/bin/powerservice:system/bin/powerservice \
	$(LOCAL_PATH)/blobs/etc/power.ceres.rc:system/etc/power.ceres.rc \
	$(LOCAL_PATH)/blobs/lib/hw/audio_policy.tegra.so:system/lib/hw/audio_policy.tegra.so \
	$(LOCAL_PATH)/blobs/lib/hw/camera.tegra.so:system/lib/hw/camera.tegra.so \
	$(LOCAL_PATH)/blobs/vendor/lib/hw/power.ceres.so:system/vendor/lib/hw/power.ceres.so

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# NFC packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

PRODUCT_PACKAGES += \
    libnetcmdiface

# Enable Widevine drmcd .
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

# Light
PRODUCT_PACKAGES += \
	lights.ceres

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_s8515
PRODUCT_DEVICE := s8515
PRODUCT_MODEL := WAX CM11
PRODUCT_MANUFACTURER := NVIDIA
