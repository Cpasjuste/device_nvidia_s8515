# NVIDIA Tegra4 "Tegratab" development system
#
# Copyright (c) 2012-2013, NVIDIA Corporation.  All rights reserved.
# AndroidProducts.mk is included before BoardConfig.mk, variable essential at
# start of build and used in here should always be intialized in this file

# SECURE_OS_BUILD, NV_TN_SKU and NV_TN_PLATFORM can be set from environment
# because of ?= intialization

# SECURE_OS_BUILD - allowed values y,n
# default: y
SECURE_OS_BUILD ?= y

# NV_TN_SKU - allowed values tn7c_114gp, tn7c_114np
# Default: tn7c_114gp (GMS + PREMIUM)
NV_TN_SKU ?= tn7c_114gp

## REFERENCE_DEVICE
REFERENCE_DEVICE := tegranote7c

# DEV_TEGRATAB_PATH
DEV_TEGRATAB_PATH := device/nvidia/tegranote7c

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

# Thse are default settings, it gets changed as per sku manifest properties
PRODUCT_NAME := tegranote7c
PRODUCT_DEVICE := tegranote7c
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia

# SKU specific packages, variables resides in sku specific device makefile
$(call inherit-product, device/nvidia/tegranote7c/skus/$(NV_TN_SKU).mk)

# Rest of the packages
$(call inherit-product, device/nvidia/tegranote7c/device.mk)
$(call inherit-product-if-exists, device/nvidia/tegranote7c/lbh/lbh.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/secureos/nvsi/nvsi.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/tegratab/partition-data/factory-ramdisk/factory_tegranote7c.mk)
