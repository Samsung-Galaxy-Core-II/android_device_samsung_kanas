#
# Copyright (C) 2016-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from vendor
$(call inherit-product, vendor/samsung/kanas/kanas-vendor.mk)

# Inherit from scx35-common device configuration
$(call inherit-product, device/samsung/scx35-common/common.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Audio
PRODUCT_PACKAGES += \
	audio_vbc_eq

# Camera
PRODUCT_PACKAGES += \
	Snap

# Cell Radio
PRODUCT_PACKAGES += \
	refnotify \
	nvitemd

# Extra shims
PRODUCT_PACKAGES += \
	libengpc_shim \
	libvsp_shim \
	liblpm_shim

# Keylayouts
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/keylayouts/ist30xx_ts_input.kl:system/usr/keylayout/ist30xx_ts_input.kl \
	$(LOCAL_PATH)/keylayouts/sci-keypad.kl:system/usr/keylayout/sci-keypad.kl

# Power
 PRODUCT_PACKAGES += \
	android.hardware.power@1.0-service.kanas

# Rootdir files
PRODUCT_PACKAGES += \
	fstab.sc8830

# Properties 
TARGET_SYSTEM_PROP += device/samsung/kanas/system.prop

# Prebuilt targets
MEDIA_CONFIGS := \
	$(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml

AUDIO_CONFIGS := \
	$(LOCAL_PATH)/configs/audio/audio_hw.xml \
	$(LOCAL_PATH)/configs/audio/audio_para \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf\
	$(LOCAL_PATH)/configs/audio/codec_pga.xml \
	$(LOCAL_PATH)/configs/audio/tiny_hw.xml

RAMDISK_FILES := \
	$(LOCAL_PATH)/rootdir/ueventd.sc8830.rc \
	$(LOCAL_PATH)/rootdir/init.board.rc \
	$(LOCAL_PATH)/rootdir/init.sc8830.rc

INIT_FILES := \
	$(LOCAL_PATH)/system/etc/init/rild_scx15.rc \
	$(LOCAL_PATH)/system/etc/init/kill_phone.rc \
	$(LOCAL_PATH)/system/etc/init/refnotify.rc \
	$(LOCAL_PATH)/system/etc/init/wpa_supplicant.rc

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/vendor/etc/$(notdir $(f))) \
	$(foreach f,$(AUDIO_CONFIGS),$(f):system/vendor/etc/$(notdir $(f))) \
	$(foreach f,$(RAMDISK_FILES),$(f):root/$(notdir $(f))) \
	$(foreach f,$(INIT_FILES),$(f):system/vendor/etc/init/$(notdir $(f)))
