# NVIDIA Tegra4 "Tegratab" development system
#
# Copyright (c) 2013-2014 NVIDIA Corporation.  All rights reserved.

$(call inherit-product-if-exists, vendor/nvidia/tegra/core/nvidia-tegra-vendor.mk)
$(call inherit-product-if-exists, frameworks/base/data/videos/VideoPackage2.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage3.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/apps/tfc/tfc.mk)
$(call inherit-product, build/target/product/languages_full.mk)

PRODUCT_LOCALES += mdpi hdpi xhdpi

ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/customers/nvidia-partner/tegranote7c
else
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/odm/tegranote7c
endif

PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/P1640_Micron_1GB_MT41K128M16-125_408Mhz_v9_0_Hynix_1GB_H5TC2G63FFR-PBA_408Mhz_v2_0.cfg:bct.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/P1640_Micron_1GB_MT41K128M16-125_408Mhz_v9_0_Hynix_1GB_H5TC2G63FFR-PBA_408Mhz_v2_0.bct:flash.bct \
    $(NVFLASH_FILES_PATH)/nvflash/P1640_Micron_1GB_MT41K128M16-125_408Mhz_v9_0_Hynix_1GB_H5TC2G63FFR-PBA_408Mhz_v2_0.cfg:flash_tegranote7c_p1640.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/P1640_Micron_1GB_MT41K128M16-125_408Mhz_v9_0_Hynix_1GB_H5TC2G63FFR-PBA_408Mhz_v2_0.bct:flash_tegranote7c_p1640.bct \
    $(NVFLASH_FILES_PATH)/nvflash/P1988_512MBx2_MT41K128M16JT-125_408Mhz_4.1.7.bct:flash_tegranote7c_p1988.bct \
    $(NVFLASH_FILES_PATH)/nvflash/P1988_512MBx2_MT41K128M16JT-125_408Mhz_4.1.7.cfg:flash_tegranote7c_p1988.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1569_Micron_1GB_MT41K128M16-125_408Mhz.cfg:flash_tegranote7c_e1569.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1569_Micron_1GB_MT41K128M16-125_408Mhz.bct:flash_tegranote7c_e1569.bct \
    $(NVFLASH_FILES_PATH)/nvflash/eks_nokey.dat:eks.dat \
    $(NVFLASH_FILES_PATH)/partition_data/config/nvcamera.conf:system/etc/nvcamera.conf \
    $(NVFLASH_FILES_PATH)/nvflash/lowbat.bmp:lowbat.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/charging.bmp:charging.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/fuse_write.txt:fuse_write.txt \
    $(NVFLASH_FILES_PATH)/nvflash/nct_gb.txt:nct_gb.txt \
    $(NVFLASH_FILES_PATH)/nvflash/nct_gp.txt:nct_gp.txt \
    $(NVFLASH_FILES_PATH)/nvflash/nct_nb.txt:nct_nb.txt \
    $(NVFLASH_FILES_PATH)/nvflash/nct_np.txt:nct_np.txt

ifeq ($(TARGET_PRODUCT),kalamata)
    ifneq ($(wildcard vendor/nvidia/kalamata/media/hpLogo.bmp),)
        PRODUCT_COPY_FILES += vendor/nvidia/kalamata/media/hpLogo.bmp:nvidia.bmp
    else
        PRODUCT_COPY_FILES += $(NVFLASH_FILES_PATH)/nvflash/nvidia.bmp:nvidia.bmp
    endif
else
    PRODUCT_COPY_FILES += $(NVFLASH_FILES_PATH)/nvflash/nvidia.bmp:nvidia.bmp
endif

ifeq ($(APPEND_DTB_TO_KERNEL), true)
PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_emmc_full.cfg:flash.cfg
else
NVFLASH_CFG_BASE_FILE := $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_dtb_emmc_full_noxusb_nosif.cfg
endif

NVFLASH_FILES_PATH :=

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

ifneq (,$(filter $(BOARD_INCLUDES_TEGRA_JNI),display))
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/hal/frameworks/Display/com.nvidia.display.xml:system/etc/permissions/com.nvidia.display.xml
endif

ifneq (,$(filter $(BOARD_INCLUDES_TEGRA_JNI),cursor))
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/hal/frameworks/Graphics/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml
endif

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/ueventd.tegranote7c.rc:root/ueventd.tegranote7c.rc \
  $(LOCAL_PATH)/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
  $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
  $(LOCAL_PATH)/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
  $(LOCAL_PATH)/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
  $(LOCAL_PATH)/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
  $(LOCAL_PATH)/../common/add_p2p_iface.sh:system/bin/add_p2p_iface.sh \
  $(LOCAL_PATH)/touch_fusion.idc:system/usr/idc/touch_fusion.idc \
  $(LOCAL_PATH)/../common/ussr_setup.sh:system/bin/ussr_setup.sh \
  $(LOCAL_PATH)/../common/input_cfboost_init.sh:system/bin/input_cfboost_init.sh \
  $(LOCAL_PATH)/../common/set_hwui_params.sh:system/bin/set_hwui_params.sh

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/sensor_init.sh:system/bin/sensor_init.sh

ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS),TRUE)
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
  $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
  $(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf
else
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/media_profiles_noenhance.xml:system/etc/media_profiles.xml \
  $(LOCAL_PATH)/media_codecs_noenhance.xml:system/etc/media_codecs.xml \
  $(LOCAL_PATH)/audio_policy_noenhance.conf:system/etc/audio_policy.conf
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power.tegranote7c.rc:system/etc/power.tegranote7c.rc \
    $(LOCAL_PATH)/init.tegranote7c.rc:root/init.tegranote7c.rc \
    $(LOCAL_PATH)/init.icera.rc:root/init.icera.rc \
    $(LOCAL_PATH)/init.icera.rc:factory_ramdisk/init.icera.rc \
    $(LOCAL_PATH)/fstab.tegranote7c:root/fstab.tegranote7c \
    $(LOCAL_PATH)/init.tegranote7c.usb.rc:root/init.tegranote7c.usb.rc

ifeq ($(NO_ROOT_DEVICE),1)
  PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init_no_root_device.rc:root/init.rc
endif

# Face detection model
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/core/include/ft/model_frontalface.xml:system/etc/model_frontal.xml

# Icera modem integration
$(call inherit-product-if-exists, vendor/nvidia/tegra/icera/ril/modules/icera-modules.mk)

# Icera modem files
SYSTEM_ICERA_FW_PATH=system/vendor/firmware/icera
LOCAL_ICERA_EU_FW_PATH_ROOT=vendor/nvidia/tegra/icera/firmware/binaries/binaries_nvidia-e1729-tn7c
LOCAL_ICERA_NALA_FW_PATH_ROOT=vendor/nvidia/tegra/icera/firmware/binaries/binaries_nvidia-e1729-tn7c-nala

#EU firmware path
ifneq ($(wildcard $(LOCAL_ICERA_EU_FW_PATH_ROOT)/dev),)
LOCAL_ICERA_EU_FW_PATH_DEV=$(LOCAL_ICERA_EU_FW_PATH_ROOT)/dev
else
LOCAL_ICERA_EU_FW_PATH_DEV=$(LOCAL_ICERA_EU_FW_PATH_ROOT)
endif

ifneq ($(wildcard $(LOCAL_ICERA_EU_FW_PATH_ROOT)/prod),)
LOCAL_ICERA_EU_FW_PATH_PROD=$(LOCAL_ICERA_EU_FW_PATH_ROOT)/prod
else
LOCAL_ICERA_EU_FW_PATH_PROD=$(LOCAL_ICERA_EU_FW_PATH_ROOT)
endif

#NALA firmware path
ifneq ($(wildcard $(LOCAL_ICERA_NALA_FW_PATH_ROOT)/dev),)
LOCAL_ICERA_NALA_FW_PATH_DEV=$(LOCAL_ICERA_NALA_FW_PATH_ROOT)/dev
else
LOCAL_ICERA_NALA_FW_PATH_DEV=$(LOCAL_ICERA_NALA_FW_PATH_ROOT)
endif

ifneq ($(wildcard $(LOCAL_ICERA_NALA_FW_PATH_ROOT)/prod),)
LOCAL_ICERA_NALA_FW_PATH_PROD=$(LOCAL_ICERA_NALA_FW_PATH_ROOT)/prod
else
LOCAL_ICERA_NALA_FW_PATH_PROD=$(LOCAL_ICERA_NALA_FW_PATH_ROOT)
endif

#Check if it's user release build, point to prod folder if it is
ifeq ($(TARGET_BUILD_TYPE)-$(TARGET_BUILD_VARIANT),release-user)
LOCAL_ICERA_EU_FW_PATH=$(LOCAL_ICERA_EU_FW_PATH_PROD)
LOCAL_ICERA_NALA_FW_PATH=$(LOCAL_ICERA_NALA_FW_PATH_PROD)
else
LOCAL_ICERA_EU_FW_PATH=$(LOCAL_ICERA_EU_FW_PATH_DEV)
LOCAL_ICERA_NALA_FW_PATH=$(LOCAL_ICERA_NALA_FW_PATH_DEV)
endif

# copy relevant config/common files
ifneq ($(filter $(NV_TN_SKU),tn7c_114gp_do tn7c_114np_do),)
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/secondary_boot.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729/secondary_boot.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/loader.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729/loader.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/modem.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729/modem.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/productConfigXml_icera_e1729_tn7c.bin:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729/productConfig.bin)

PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/secondary_boot.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-nala/secondary_boot.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/loader.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-nala/loader.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/modem.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-nala/modem.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/productConfigXml_icera_e1729_tn7c_nala.bin:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-nala/productConfig.bin)

else
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/secondary_boot.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice/secondary_boot.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/loader.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice/loader.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/modem.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice/modem.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/audioConfig.bin:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice/audioConfig.bin) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_EU_FW_PATH)/productConfigXml_icera_e1729_tn7c_voice.bin:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice/productConfig.bin)

ifneq ($(wildcard $(LOCAL_ICERA_NALA_FW_PATH)/productConfigXml_icera_e1729_tn7c_voice_nala.bin),)
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/productConfigXml_icera_e1729_tn7c_voice_nala.bin:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice-nala/productConfig.bin) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/secondary_boot.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice-nala/secondary_boot.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/loader.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice-nala/loader.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/modem.wrapped:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice-nala/modem.wrapped) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_ICERA_NALA_FW_PATH)/audioConfig.bin:$(SYSTEM_ICERA_FW_PATH)/nvidia-e1729-voice-nala/audioConfig.bin)
endif
endif

# Test files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../common/cluster:system/bin/cluster \
    $(LOCAL_PATH)/../common/cluster_get.sh:system/bin/cluster_get.sh \
    $(LOCAL_PATH)/../common/cluster_set.sh:system/bin/cluster_set.sh \
    $(LOCAL_PATH)/../common/dcc:system/bin/dcc \
    $(LOCAL_PATH)/../common/hotplug:system/bin/hotplug \
    $(LOCAL_PATH)/../common/mount_debugfs.sh:system/bin/mount_debugfs.sh

# Logging Service
PRODUCT_COPY_FILES += \
	device/nvidia/tegranote7c/log/nv_log.sh:system/bin/nv_log.sh

PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/graphics-partner/android/build/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
    device/nvidia/tegranote7c/nvcms/device.cfg:system/lib/nvcms/device.cfg

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
	external/alsa-lib/src/conf/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
	device/nvidia/tegranote7c/asound.conf:system/etc/asound.conf \
	device/nvidia/tegranote7c/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
	device/nvidia/tegranote7c/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS),TRUE)
# Configuration files for WiiMote support
PRODUCT_COPY_FILES += \
	vendor/nvidia/tegra/3rdparty/cwiid/wminput/configs/acc_ptr:system/etc/acc_ptr \
	vendor/nvidia/tegra/3rdparty/cwiid/wminput/configs/nunchuk_acc_ptr:system/etc/nunchuk_acc_ptr \
	vendor/nvidia/tegra/3rdparty/cwiid/wminput/configs/acc_led:system/etc/acc_led \
	vendor/nvidia/tegra/3rdparty/cwiid/wminput/configs/neverball:system/etc/neverball \
	vendor/nvidia/tegra/3rdparty/cwiid/wminput/configs/ir_ptr:system/etc/ir_ptr \
	vendor/nvidia/tegra/3rdparty/cwiid/wminput/configs/gamepad:system/etc/gamepad \
	vendor/nvidia/tegra/3rdparty/cwiid/wminput/configs/buttons:system/etc/buttons \
	vendor/nvidia/tegra/3rdparty/cwiid/wminput/configs/nunchuk_stick2btn:system/etc/nunchuk_stick2btn
endif

PRODUCT_COPY_FILES += \
	device/nvidia/tegranote7c/enctune.conf:system/etc/enctune.conf

# nvcpud specific cpu frequencies config
PRODUCT_COPY_FILES += \
        device/nvidia/tegranote7c/nvcpud.conf:system/etc/nvcpud.conf

# modem test executable
ifeq ($(wildcard vendor/nvidia/tegra/icera/tools/at_tool/atcmd-itf-arm),vendor/nvidia/tegra/icera/tools/at_tool/atcmd-itf-arm)
PRODUCT_COPY_FILES += \
	vendor/nvidia/tegra/icera/tools/at_tool/atcmd-itf-arm:system/bin/atcmd-itf-arm
endif

# Stereo API permissions file has different locations in private and customer builds
ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/stereo/api/com.nvidia.nvstereoutils.xml:system/etc/permissions/com.nvidia.nvstereoutils.xml
else
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/prebuilt/$(REFERENCE_DEVICE)/stereo/api/com.nvidia.nvstereoutils.xml:system/etc/permissions/com.nvidia.nvstereoutils.xml
endif

# Enable following APKs only for internal engineering build
ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
PRODUCT_PACKAGES += \
    NvwfdServiceTest
endif

# Nvidia Miracast
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../common/miracast/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml

# NvBlit JNI library
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/graphics-partner/android/frameworks/Graphics/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml

# NCT ID help file
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/core/include/nvnct.h:README.nct_id

# EULA
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/eula.html:system/etc/eula.html

# Promotional content
ifneq ($(TARGET_PRODUCT),kalamata)
ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media_ad/Movies/TEGRA_NOTE_TapToTrack.mp4),)
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/tegratab/partition-data/media_ad/Movies/TEGRA_NOTE_TapToTrack.mp4:data/media/Movies/TEGRA_NOTE_TapToTrack.mp4
endif
endif

# User Manual
ifneq ($(TARGET_PRODUCT),kalamata)
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/user_guide.sh:system/bin/user_guide.sh
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide.pdf:system/media/TegraNOTE7LTEUserGuide.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-de.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-de.pdf:system/media/TegraNOTE7LTEUserGuide-de.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-es.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-es.pdf:system/media/TegraNOTE7LTEUserGuide-es.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-fr.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-fr.pdf:system/media/TegraNOTE7LTEUserGuide-fr.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-it.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-it.pdf:system/media/TegraNOTE7LTEUserGuide-it.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-ja.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-ja.pdf:system/media/TegraNOTE7LTEUserGuide-ja.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-ko.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-ko.pdf:system/media/TegraNOTE7LTEUserGuide-ko.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-pt.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-pt.pdf:system/media/TegraNOTE7LTEUserGuide-pt.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-ru.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-ru.pdf:system/media/TegraNOTE7LTEUserGuide-ru.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-zh.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-zh.pdf:system/media/TegraNOTE7LTEUserGuide-zh.pdf
    endif
    ifneq ($(wildcard vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-zt.pdf),)
        PRODUCT_COPY_FILES += vendor/nvidia/tegra/tegratab/partition-data/media/TegraNOTE7LTEUserGuide-zt.pdf:system/media/TegraNOTE7LTEUserGuide-zt.pdf
    endif
endif

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
	sensors.tegranote7c \
	lights.tegranote7c \
	audio.primary.tegra \
	audio.a2dp.default \
	audio.usb.default \
	audio_policy.tegra \
	audio.r_submix.default\
	power.tegranote7c \
	setup_fs \
	drmserver \
	Gallery2 \
	libdrmframework_jni \
	e2fsck \
	nvidiafeedback \
        NVSS

PRODUCT_PACKAGES += \
	charger\
	charger_res_images\

PRODUCT_PACKAGES += nvaudio_test

# WiiMote support
PRODUCT_PACKAGES += \
	libcwiid \
	wminput \
	acc \
	ir_ptr \
	led \
	nunchuk_acc \
	nunchuk_stick2btn

# Application to connect WiiMote with Tegra device
PRODUCT_PACKAGES += \
	WiiMote

#WiFi
PRODUCT_PACKAGES += \
		TQS_S_2.6.ini \
		iw \
		wl18xx-conf-default.bin \
		wl18xx-conf-us.bin \
		wl18xx-conf-eu.bin \
		crda \
		regulatory.bin \
		wpa_supplicant.conf \
		p2p_supplicant.conf \
		p2p_disabled.conf \
		hostapd.conf \
		ibss_supplicant.conf \
		dhcpd.conf \
		dhcpcd.conf

#Wifi firmwares
PRODUCT_PACKAGES += \
		wl1271-nvs_default.bin \
		wl128x-fw-4-sr.bin \
		wl128x-fw-4-mr.bin \
		wl128x-fw-4-plt.bin \
		wl18xx-fw-mc.bin \
		wl18xx-fw-mc_pg22.bin \
		wl18xx-fw-2.bin \
		wl1271-nvs_wl8.bin

#BT & FM packages
PRODUCT_PACKAGES += \
		uim-sysfs \
		TIInit_10.6.15.bts \
		TIInit_11.8.32.bts \
		TIInit_12.8.32.bts

#GPS
PRODUCT_PACKAGES += \
		agnss_connect \
		client_app \
		client_hwd \
		Connect_Config.txt \
		devproxy \
		dproxy.conf \
		dproxy.patch \
		gps.tegra.so \
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
# CPU volt cap daemon
PRODUCT_PACKAGES += \
	nvcpuvoltcapd

# promotional contents
PRODUCT_PACKAGES += \
	media_ad

# Factory test packages
PRODUCT_PACKAGES += \
	nvbdktestbl \
        pcba_testcases.xml \
        postassembly_testcases.xml \
        preassembly_testcases.xml \
        audio_testcases.xml \
        usbhostumsread \
	tdc \
	tmc \
	tst \
	camera_existence \
	factory_adbd \
	oemcrypto_api_test

PRODUCT_PACKAGES += \
    nvflash_cfg_populator \
    lbh_images

# Markers app (renamed to Tegra Draw)
PRODUCT_PACKAGES += \
        TegraDraw

# Stylus apps
PRODUCT_PACKAGES += \
        NvLauncher \
        nvlasso

# HDCP SRM Support
PRODUCT_PACKAGES += \
                hdcp1x.srm \
                hdcp2x.srm \
                hdcp2xtest.srm

# OV5693 bayer sensor calibration manager
PRODUCT_PACKAGES += otp-ov5693

PRODUCT_PACKAGES += ControllerMapper

ifeq ($(TARGET_PRODUCT),kalamata)
PRODUCT_PACKAGES += gen_tegranote_fuseblob
endif

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk
include $(LOCAL_PATH)/touchscreen/maxim/maxim.mk
# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

ifeq ($(TARGET_PRODUCT),kalamata)
    PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/../../../vendor/nvidia/kalamata/overlay
else
    PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay-phone
endif
ifeq ($(NV_TN_SKU),tn7c_114gp)
    PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay-phone
endif
ifeq ($(NV_TN_SKU),tn7c_114np)
    PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay-phone
endif
ifeq ($(NV_TN_SKU),tn7c_114gp_do)
    PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
endif
ifeq ($(NV_TN_SKU),tn7c_114np_do)
    PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
endif

# override runtimes to dvm only(removing android runtime)
OVERRIDE_RUNTIMES := runtime_libdvm_default

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Set DPI
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=213

# Enable secure USB debugging in user release build
ifeq ($(TARGET_BUILD_TYPE),release)
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1
endif
endif

# Include ShieldTech
ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS),TRUE)
SHIELDTECH_FEATURE_NVGALLERY := false
SHIELDTECH_FEATURE_KEYBOARD := false
SHIELDTECH_FEATURE_CONSOLE_MODE := false
SHIELDTECH_FEATURE_BLAKE := false

$(call inherit-product-if-exists, vendor/nvidia/shieldtech/common/shieldtech.mk)
endif

