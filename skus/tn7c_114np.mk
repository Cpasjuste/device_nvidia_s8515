# NVIDIA Tegra4 "Tegranote" development system
#
# Copyright (c) 2013, NVIDIA Corporation.  All rights reserved.
# AndroidProducts.mk is included before BoardConfig.mk, variable essential at
# start of build and used in here should always be intialized in this file

## Product model
PRODUCT_MODEL := TegraNote-Premium

## Product locale setting
PRODUCT_LOCALES += en_US

## Property overrides
PRODUCT_PROPERTY_OVERRIDES += ro.com.google.clientidbase=android-nvidia

## NV_TN_PLATFORM - allowed values premium, basic
NV_TN_PLATFORM := premium

## NV_TN_WITH_GMS - allowed values true, false
NV_TN_WITH_GMS := false

## Non-GMS 3rd-party preinstalled apk for tegranote7c
$(call inherit-product-if-exists, 3rdparty/applications/prebuilt/common/tegratab_china.mk)
