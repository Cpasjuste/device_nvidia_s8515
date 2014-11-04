# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Release name
PRODUCT_RELEASE_NAME := s8515

# Inherit ?!
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# This device has NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/nvidia/s8515/s8515.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := s8515
PRODUCT_NAME := cm_s8515
PRODUCT_BRAND := nvidia
PRODUCT_MODEL := WAX CM11
PRODUCT_MANUFACTURER := NVIDIA

# Enable Torch
PRODUCT_PACKAGES += Torch

