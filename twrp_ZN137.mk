# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from ZN137 device
$(call inherit-product, device/doogee/ZN137/device.mk)

PRODUCT_DEVICE := ZN137
PRODUCT_NAME := twrp_ZN137
PRODUCT_BRAND := DOOGEE
PRODUCT_MODEL := Smini
PRODUCT_MANUFACTURER := DOOGEE
