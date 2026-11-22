#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from ZN137 device
$(call inherit-product, device/doogee/ZN137/device.mk)

PRODUCT_DEVICE := ZN137
PRODUCT_NAME := omni_ZN137
PRODUCT_BRAND := DOOGEE
PRODUCT_MODEL := Smini
PRODUCT_MANUFACTURER := doogee

PRODUCT_GMS_CLIENTID_BASE := android-doogee

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="ZN137-user 12 SP1A.210812.016 1774514438 release-keys"

BUILD_FINGERPRINT := DOOGEE/ZN137_EEA/ZN137:13/TP1A.220624.014/1774512366:user/release-keys
