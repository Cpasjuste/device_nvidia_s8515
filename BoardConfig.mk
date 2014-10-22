TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t114
TARGET_TEGRA_FAMILY := t11x
TARGET_CPU_VARIANT := cortex-a9

# CPU options
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_USE_TEGRA_BIONIC_OPTIMIZATION := true
TARGET_USE_TEGRA11_MEMCPY_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

BOARD_BUILD_BOOTLOADER := false
BOOTLOADER_SUPPORTS_DTB := false
TARGET_USE_DTB := false
APPEND_DTB_TO_KERNEL ?= false

ifeq ($(NO_ROOT_DEVICE),1)
  TARGET_PROVIDES_INIT_RC := true
else
  TARGET_PROVIDES_INIT_RC := false
endif

#BOARD_USES_PRIV_HARDWARE_LEGACY := true

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORT_NVOICE := true
BOARD_SUPPORT_NVAUDIOFX := false

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2145386496
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_KERNEL_SOURCE := kernel/nvidia/s8515
TARGET_KERNEL_CONFIG := tegra_s8515_cpasjuste_defconfig

SET_DCP_CURRENT_LIMIT_2A := true
USE_E2FSPROGS := true
USE_OPENGL_RENDERER := true

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/s8515/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_TI_BLUETOOTH := true

USE_CAMERA_STUB := false

# mediaplayer
BOARD_USES_HW_MEDIAPLUGINS := false
BOARD_USES_HW_MEDIASCANNER := false
BOARD_USES_HW_MEDIARECORDER := false

# powerhal
BOARD_USES_POWERHAL := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
#CONFIG_DRIVER_WEXT		 := y
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
#BOARD_WLAN_DEVICE_REV		 := bcm4330_b2
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/bcm43341/fw_bcmdhd.bin"
#WIFI_DRIVER_FW_PATH_AP           := "/data/misc/wifi/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"

# Default HDMI mirror mode
# Crop (default) picks closest mode, crops to screen resolution
# Scale picks closest mode, scales to screen resolution (aspect preserved)
# Center picks a mode greater than or equal to the panel size and centers;
#     if no suitable mode is available, reverts to scale
BOARD_HDMI_MIRROR_MODE := Scale

# NVDPS can be enabled when display is set to continuous mode.
BOARD_HAS_NVDPS := true

# This should be set to true for boards that support 3DVision.
BOARD_HAS_3DV_SUPPORT := false

# Double buffered display surfaces reduce memory usage, but will decrease performance.
# The default is to triple buffer the display surfaces.
# BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

BOARD_ROOT_DEVICE := emmc
#include device/nvidia/common/BoardConfig.mk
#include vendor/nvidia/build/definitions.mk

# Use CMU-style config with Nvcms
NVCMS_CMU_USE_CONFIG := true

#-include 3rdparty/trustedlogic/samples/hdcp/tegra3/build/arm_android/config.mk

# BOARD_WIDEVINE_OEMCRYPTO_LEVEL
# The security level of the content protection provided by the Widevine DRM plugin depends
# on the security capabilities of the underlying hardware platform.
# There are Level 1/2/3. To run HD contents, should be Widevine level 1 security.
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Dalvik option
DALVIK_ENABLE_DYNAMIC_GC := true

# NCT related defines
# bootloader/kernel
TARGET_USE_NCT := true

# enable factory bundle
TARGET_BUILD_FACTORY := true

# FRD(Factory RamDisk) is used
# FRD depends on NCT feature
TARGET_USE_FACTORY_RAMDISK := true

# LBH related defines
# use LBH partition and resources in it
BOARD_HAVE_LBH_SUPPORT := true

# Factory Test related defines
BOARD_HAVE_NV_FACTORY_TEST := true

# This should be set to true for boards that have promotional media files
BOARD_HAVE_AD_MEDIA := false

# Max panel brightness in the first device boot for OOBE
# BOARD_FIRST_MAX_BRIGHTNESS_FOR_OOBE := true

# Charger disable init blank
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CMU enable forcibly from Android
BOARD_CMU_ENABLE_FROM_ANDROID_BOOT := true

# Charger show animation when key down
BOARD_CHARGER_KEYDOWN_KICK_ANIMATION := true

# Charger immediatley power down when chager unplug
BOARD_CHARGER_UNPLUGGED_SHUTDOWN_PROMPTLY := true

# Enable PRISM toggle switch in menu
BOARD_PRISM_TOGGLE_SWITCH_ENABLED := true

# board specific sepolicy
BOARD_SEPOLICY_DIRS := device/nvidia/$(TARGET_DEVICE)/sepolicy

BOARD_SEPOLICY_UNION := healthd.te \
    installd.te \
    netd.te \
    untrusted_app.te \
    vold.te \
    file_contexts \
    file.te

# Enable power hint for Auido playback with speaker
AUDIO_SPEAKER_POWER_HINT := true

# TWRP RECOVERY
TW_BOARD_CUSTOM_GRAPHICS := ../../../device/nvidia/s8515/product-files/graphics.c
DEVICE_RESOLUTION := 720x1280
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_SKIA_LCDTEXT := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_BRIGHTNESS_PATH := /sys/devices/platform/pwm-backlight/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTESS := 255
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/tegra-udc.0/gadget/lun0/file

