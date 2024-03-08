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

# Ramdisk
PRODUCT_PACKAGES += \
	fstab.sc8830

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_hw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_hw.xml \
	$(LOCAL_PATH)/configs/audio/audio_para:$(TARGET_COPY_OUT_VENDOR)/etc/audio_para \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
	$(LOCAL_PATH)/configs/audio/codec_pga.xml:$(TARGET_COPY_OUT_VENDOR)/etc/codec_pga.xml \
	$(LOCAL_PATH)/configs/audio/tiny_hw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/tiny_hw.xml

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

# Media
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Memtrack
PRODUCT_PACKAGES += \
	memtrack.sc8830

# Power
PRODUCT_PACKAGES += \
	android.hardware.power@1.0-service.kanas

# Sensors
PRODUCT_PACKAGES += \
	sensors.sc8830

# Graphics
PRODUCT_PACKAGES += \
	sprd_gsp.sc8830 \
	hwcomposer.sc8830

# Codecs
PRODUCT_PACKAGES += \
	libstagefright_sprd_soft_mpeg4dec \
	libstagefright_sprd_soft_h264dec

# Camera
PRODUCT_PACKAGES += \
	camera.sc8830 \
	camera2.sc8830

# Properties 
TARGET_SYSTEM_PROP += device/samsung/kanas/system.prop

RAMDISK_FILES := \
	device/samsung/kanas/rootdir/ueventd.sc8830.rc \
	device/samsung/kanas/rootdir/init.board.rc \
	device/samsung/kanas/rootdir/init.sc8830.rc

INIT_FILES := \
	device/samsung/kanas/system/etc/init/rild_scx15.rc \
	device/samsung/kanas/system/etc/init/kill_phone.rc \
	device/samsung/kanas/system/etc/init/refnotify.rc \
	device/samsung/kanas/system/etc/init/wpa_supplicant.rc
	
PRODUCT_COPY_FILES += \
	$(foreach f,$(RAMDISK_FILES),$(f):root/$(notdir $(f))) \
	$(foreach f,$(INIT_FILES),$(f):system/vendor/etc/init/$(notdir $(f)))
