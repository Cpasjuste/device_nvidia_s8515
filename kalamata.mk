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

## NV_TN_SKU
NV_TN_SKU := kalamata

## REFERENCE_DEVICE
REFERENCE_DEVICE := kalamata

## NV_TN_PLATFORM
NV_TN_PLATFORM := premium

## NV_TN_WITH_GMS - allowed values true, false
NV_TN_WITH_GMS := true

## DEV_TEGRATAB_PATH
DEV_TEGRATAB_PATH := device/nvidia/tegranote7c

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

## Thse are default settings, it gets changed as per sku manifest properties
PRODUCT_NAME := kalamata
PRODUCT_DEVICE := tegranote7c
PRODUCT_MODEL := TegraNote-Premium
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia
PRODUCT_LOCALES += en_US


## Property overrides
PRODUCT_PROPERTY_OVERRIDES += ro.com.google.clientidbase=android-nvidia

## All GMS apps for tegranote7c_gms
$(call inherit-product-if-exists, 3rdparty/google/gms-apps/products/gms.mk)

## GMS 3rd-party preinstalled apk for tegranote7c_gms
$(call inherit-product-if-exists, 3rdparty/applications/prebuilt/common/tegranote7c_gms.mk)

## SKU specific apps
## All specific apps for kalamata
$(call inherit-product-if-exists, vendor/nvidia/kalamata/kalamata_apps.mk)

## Rest of the packages
$(call inherit-product, device/nvidia/tegranote7c/device.mk)
$(call inherit-product-if-exists, device/nvidia/tegranote7c/lbh/lbh.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/secureos/nvsi/nvsi.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/tegratab/partition-data/factory-ramdisk/factory.mk)
