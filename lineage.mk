#
# Copyright (C) 2016-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Set shipping API level
$(call inherit-product, build/target/product/product_launched_with_k.mk)

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Device identifier
PRODUCT_DEVICE := kanas
PRODUCT_NAME := lineage_kanas
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G355H
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone

PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=kanas3gxx \
	TARGET_DEVICE=kanas3g \
	PRIVATE_BUILD_DESC="kanas3gxx-user 4.4.2 KOT49H G355HXXS0AQA1 release-keys"

BUILD_FINGERPRINT := "samsung/kanas3gxx/kanas:4.4.2/KOT49H/G355HXXS0AQA1:user/release-keys"
