# NVIDIA Tegra4 "Tegratab" development system
#
# Copyright (c) 2012-2013, NVIDIA Corporation.  All rights reserved.
# AndroidProducts.mk is included before BoardConfig.mk, variable essential at
# start of build and used in here should always be intialized in this file

# SECURE_OS_BUILD, NV_TN_SKU and NV_TN_PLATFORM can be set from environment
# because of ?= intialization

# SECURE_OS_BUILD - allowed values y,n
# default: y
SECURE_OS_BUILD ?= n

## REFERENCE_DEVICE
REFERENCE_DEVICE := tegranote7c

# DEV_TEGRATAB_PATH
DEV_TEGRATAB_PATH := device/nvidia/s8515

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

# Thse are default settings, it gets changed as per sku manifest properties
PRODUCT_NAME := s8515
PRODUCT_DEVICE := s8515
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia

PRODUCT_MODEL := WAOSP v06
PRODUCT_LOCALES += en_US
PRODUCT_PROPERTY_OVERRIDES += ro.com.google.clientidbase=android-enspert
#ro.com.google.clientidbase=android-nvidia

## NV_TN_PLATFORM - allowed values premium, basic
NV_TN_PLATFORM := premium

## NV_TN_WITH_GMS - allowed values true, false
NV_TN_WITH_GMS := true

# Rest of the packages
$(call inherit-product, device/nvidia/s8515/device.mk)

