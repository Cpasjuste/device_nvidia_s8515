TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t114
TARGET_TEGRA_FAMILY := t11x

# CPU options
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
TARGET_USE_TEGRA_BIONIC_OPTIMIZATION := true
TARGET_USE_TEGRA11_MEMCPY_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

TARGET_USE_DTB := true
TARGET_KERNEL_DT_NAME := tegra114-roth
TARGET_BOOTLOADER_BOARD_NAME := P2450
BOOTLOADER_SUPPORTS_DTB := true
BOARD_BUILD_BOOTLOADER := true

ifeq ($(NO_ROOT_DEVICE),1)
  TARGET_PROVIDES_INIT_RC := true
else
  TARGET_PROVIDES_INIT_RC := false
endif

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORT_NVOICE := true
BOARD_USES_TFA := true

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 13771997184
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_FLASH_BLOCK_SIZE := 4096

USE_E2FSPROGS := true
USE_OPENGL_RENDERER := true

# OTA
TARGET_RECOVERY_UPDATER_LIBS += libnvrecoveryupdater
TARGET_RECOVERY_UPDATER_EXTRA_LIBS += libfs_mgr
TARGET_RECOVERY_UI_LIB := librecovery_ui_roth

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/roth/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

USE_CAMERA_STUB := false

# mediaplayer
BOARD_USES_HW_MEDIAPLUGINS := false
BOARD_USES_HW_MEDIASCANNER := false
BOARD_USES_HW_MEDIARECORDER := false

# ControlMapper
BOARD_HAVE_CONTROLLER_MAPPER := true

# powerhal
BOARD_USES_POWERHAL := true

# Bluetooth related defines
BOARD_HAVE_BLUETOOTH := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
# compile wpa_supplicant with WEXT and NL80211 support both
CONFIG_DRIVER_WEXT          := y
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330_b2
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/bcm43241/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"

# GPS
BOARD_HAVE_GPS_BCM := true

# Default HDMI mirror mode
# Crop (default) picks closest mode, crops to screen resolution
# Scale picks closest mode, scales to screen resolution (aspect preserved)
# Center picks a mode greater than or equal to the panel size and centers;
#     if no suitable mode is available, reverts to scale
BOARD_HDMI_MIRROR_MODE := Scale

# This should be enabled if you wish to use information from hwcomposer to enable
# or disable DIDIM during run-time.
BOARD_HAS_DIDIM := false

# This is defined if the board has local profiles
BOARD_HAS_CUSTOM_PROFILES := true

# NVDPS can be enabled when display is set to continuous mode.
BOARD_HAS_NVDPS := true

# This should be set to true for boards that support 3DVision.
BOARD_HAS_3DV_SUPPORT := false

# Allow this variable to be overridden to n for non-secure OS build
SECURE_OS_BUILD ?= y

# Double buffered display surfaces reduce memory usage, but will decrease performance.
# The default is to triple buffer the display surfaces.
# BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

BOARD_ROOT_DEVICE := emmc
#include frameworks/base/data/sounds/AudioPackage3.mk
include device/nvidia/common/BoardConfig.mk
include vendor/nvidia/build/definitions.mk

# Use CMU-style config with Nvcms
NVCMS_CMU_USE_CONFIG := true

-include 3rdparty/trustedlogic/samples/hdcp/tegra3/build/arm_android/config.mk

# BOARD_WIDEVINE_OEMCRYPTO_LEVEL
# The security level of the content protection provided by the Widevine DRM plugin depends
# on the security capabilities of the underlying hardware platform.
# There are Level 1/2/3. To run HD contents, should be Widevine level 1 security.
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Dalvik option
DALVIK_ENABLE_DYNAMIC_GC := true

# This should be false to support kernel modules
ifeq ($(TARGET_BUILD_VARIANT),user)
  TARGET_NO_KMODULES := true
else
  TARGET_NO_KMODULES := false
endif

DISABLE_DEXPREOPT := true
WITH_DEXPREOPT := false
