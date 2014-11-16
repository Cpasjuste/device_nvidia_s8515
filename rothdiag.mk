# Copyright (c) 2013 NVIDIA Corporation.  All rights reserved.

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/apps/diagsuite/bin/stress_test.sh:root/bin/stress_test.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/CPU_script/power_utils.sh:data/mfgtest/CPU_script/power_utils.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/CPU_script/roth_dvfs.sh:data/mfgtest/CPU_script/roth_dvfs.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/CPU_stress/cpu_screen0:data/mfgtest/CPU_stress/cpu_screen0 \
    vendor/nvidia/tegra/apps/diagsuite/bin/CPU_stress/equake.in:data/mfgtest/CPU_stress/equake.in \
    vendor/nvidia/tegra/apps/diagsuite/bin/CPU_stress/mcf.in:data/mfgtest/CPU_stress/mcf.in \
    vendor/nvidia/tegra/apps/diagsuite/bin/thermal/burnCortexA15_linux:data/mfgtest/thermal/burnCortexA15_linux \
    vendor/nvidia/tegra/apps/diagsuite/bin/thermal/EDPVirus_linux:data/mfgtest/thermal/EDPVirus_linux \
    vendor/nvidia/tegra/apps/diagsuite/bin/thermal/run.sh:data/mfgtest/thermal/run.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/thermal/thermal_test.py:data/mfgtest/thermal/thermal_test.py \
    vendor/nvidia/tegra/apps/diagsuite/bin/GPU/crc.txt:data/apic/egypthd/crc.txt \
    vendor/nvidia/tegra/apps/diagsuite/bin/GPU/rawMemInit.bin:data/apic/egypthd/rawMemInit.bin \
    vendor/nvidia/tegra/apps/diagsuite/bin/GPU/rawMemUpdate.bin:data/apic/egypthd/rawMemUpdate.bin \
    vendor/nvidia/tegra/apps/diagsuite/bin/GPU/busybox:root/bin/busybox \
    vendor/nvidia/tegra/apps/diagsuite/bin/thorMon/thorMon.py:system/bin/thorMon.py \
    vendor/nvidia/tegra/apps/diagsuite/bin/thorMon/runThorMon.sh:system/bin/runThorMon.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/tesseract/busybox:system/bin/busybox \
    vendor/nvidia/tegra/apps/diagsuite/bin/tesseract/tlog.sh:system/bin/tlog.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/tesseract/config.sh:data/media/tesseract/config.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/tesseract/start.wav:data/tesseract/start.wav \
    vendor/nvidia/tegra/apps/diagsuite/bin/tesseract/detected.wav:data/tesseract/detected.wav \
    vendor/nvidia/tegra/apps/diagsuite/bin/tesseract/finish.wav:data/tesseract/finish.wav \
    vendor/nvidia/tegra/apps/diagsuite/bin/tesseract/tesseract.sh:tesseract.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/js_calibration/joytuner:root/bin/joytuner \
    vendor/nvidia/tegra/apps/diagsuite/bin/flash/loki_mac_writer.sh:loki_mac_writer.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/flash/main.sh:main.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/flash/pullLogFiles.sh:pullLogFiles.sh \
    vendor/nvidia/tegra/apps/diagsuite/bin/flash/flash.sh:flash.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rothdiag.rc:root/init.rothdiag.rc

ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/customers/nvidia-partner/roth
else
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/odm/roth
endif

PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_dtb_emmc_full_diag.cfg:flash_diag.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_dtb_emmc_full_diag_mfg.cfg:flash_diag_mfg.cfg

NVFLASH_FILES_PATH :=

PRODUCT_PACKAGES += \
    oemcrypto_api_test \
    GPU_STRESS \
    native_gamepad \
    thorMon \
    mfgkeytest \
    MfgTest3 \
    JS_TUNE_APP \
    BlakeTest

PRODUCT_NAME := rothdiag
PRODUCT_DEVICE := roth
PRODUCT_MODEL := Roth Diagnostics
PRODUCT_BRAND := NVIDIA
PRODUCT_MANUFACTURER := NVIDIA

PRODUCT_LOCALES += en_US
PRODUCT_PROPERTY_OVERRIDES += \
ro.com.google.clientidbase=android-nvidia

# required for market filtering
NVSI_PRODUCT_CLASS := shield

$(call inherit-product-if-exists, vendor/nvidia/tegra/secureos/nvsi/nvsi.mk)

$(call inherit-product, device/nvidia/roth/device.mk)
