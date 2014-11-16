# NVIDIA Tegra4 "Roth" development system
#
# Copyright (c) 2012 NVIDIA Corporation.  All rights reserved.

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
ifeq ($(wildcard 3rdparty/google/gms-apps/products/gms_simple.mk),3rdparty/google/gms-apps/products/gms_simple.mk)
$(call inherit-product, 3rdparty/google/gms-apps/products/gms_simple.mk)
endif
else
ifeq ($(wildcard 3rdparty/google/gms-apps/products/gms.mk),3rdparty/google/gms-apps/products/gms.mk)
$(call inherit-product, 3rdparty/google/gms-apps/products/gms.mk)
endif
endif

ifeq ($(wildcard 3rdparty/applications/prebuilt/common/products/roth.mk),3rdparty/applications/prebuilt/common/products/roth.mk)
$(call inherit-product, 3rdparty/applications/prebuilt/common/products/roth.mk)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.thor.rc:root/init.thor.rc

PRODUCT_NAME := thor_hk
PRODUCT_DEVICE := roth
PRODUCT_MODEL := SHIELD
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-nvidia

# required for market filtering
NVSI_PRODUCT_CLASS := shield

$(call inherit-product-if-exists, vendor/nvidia/tegra/secureos/nvsi/nvsi.mk)

$(call inherit-product, device/nvidia/roth/device.mk)
PRODUCT_LOCALES := zh_TW en_US in_ID ca_ES cs_CZ da_DK de_DE en_GB es_ES es_US tl_PH fr_FR hr_HR it_IT lv_LV lt_LT hu_HU nl_NL nb_NO pl_PL pt_BR pt_PT ro_RO sk_SK sl_SI fi_FI sv_SE vi_VN tr_TR el_GR bg_BG ru_RU sr_RS uk_UA iw_IL ar_EG fa_IR th_TH ko_KR zh_CN ja_JP
