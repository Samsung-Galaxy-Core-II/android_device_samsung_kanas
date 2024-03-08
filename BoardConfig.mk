#
# Copyright (C) 2016-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from SCX35 common configs
-include device/samsung/scx35-common/BoardConfigCommon.mk

# Inherit from the proprietary version
-include vendor/samsung/kanas/BoardConfigVendor.mk

DEVICE_PATH = device/samsung/kanas

# Assert
TARGET_OTA_ASSERT_DEVICE := kanas,kanas3g,SM-G355H

# Audio
TARGET_NEEDS_VBC_EQ_SYMLINK := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := SC7735S

# Platform
TARGET_BOARD_PLATFORM_GPU := mali-400 MP
SOC_SCX35 := true

# Bluetooth
BOARD_CUSTOM_BT_CONFIG := device/samsung/kanas/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kanas/bluetooth
USE_BLUETOOTH_BCM4343 := true

# Camera
TARGET_BOARD_CAMERA_HAL_VERSION := HAL1.0
TARGET_BOARD_CAMERA_ANDROID_ZSL_MODE := false
TARGET_BOARD_BACK_CAMERA_ROTATION := false
TARGET_BOARD_FRONT_CAMERA_ROTATION := false
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := false
CAMERA_SUPPORT_SIZE := 5M
TARGET_BOARD_NO_FRONT_SENSOR := false
TARGET_BOARD_CAMERA_FLASH_CTRL := false
TARGET_BOARD_CAMERA_CAPTURE_MODE := false
TARGET_BOARD_CAMERA_FACE_DETECT := false
TARGET_BOARD_BACK_CAMERA_INTERFACE := mipi
TARGET_BOARD_FRONT_CAMERA_INTERFACE := ccir
TARGET_BOARD_CAMERA_CAF := false
TARGET_BOARD_CAMERA_IOCTL_HAS_SET_FLASH := true
TARGET_BOARD_CAMERA_IOCTL_EXTRA_PARAMS := true
TARGET_BOARD_CAMERA_IOCTL_HAS_POWER_ONOFF := true
TARGET_BOARD_CAMERA_DMA_COPY := false
TARGET_BOARD_CAMERA_HDR_CAPTURE := false
TARGET_CAMERA_OPEN_SOURCE := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_LD_SHIM_LIBS += /system/vendor/lib/hw/camera.sc8830.so|libmemoryheapion.so

# Enable privacy guard's su
WITH_SU := true

# Extra shims
TARGET_LD_SHIM_LIBS += \
       /system/vendor/bin/engpc|libengpc_shim.so \

TARGET_LD_SHIM_LIBS += \
       /system/vendor/lib/libomx_avcenc_hw_sprd.so|libvsp_shim.so \
       /system/vendor/lib/libomx_avcdec_hw_sprd.so|libvsp_shim.so \
       /system/vendor/lib/libomx_m4vh263enc_hw_sprd.so|libvsp_shim.so \
       /system/vendor/lib/libomx_m4vh263dec_hw_sprd.so|libvsp_shim.so \

TARGET_LD_SHIM_LIBS += \
       /system/vendor/bin/lpm|liblpm_shim.so \
       /sbin/charger|liblpm_shim.so \

# Graphics
TARGET_USE_3_FRAMEBUFFER := true
USE_SPRD_DITHER := false
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true
USE_OVERLAY_COMPOSER_GPU := false
TARGET_USES_HIDL_WORKAROUNDS := true

# Experimental Graphics flags

TARGET_FORCE_HWC_CONTIG := true
GSP_MAX_OSD_LAYERS := 5
TARGET_ION_OVERLAY_IS_CARVEOUT := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 androidboot.selinux=permissive androidboot.hardware=sc8830
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := kanas_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/kanas

## Common overrides
BOARD_KERNEL_SEPARATED_DT :=
BOARD_CUSTOM_BOOTIMG_MK :=
BOARD_MKBOOTIMG_ARGS :=
BOARD_RAMDISK_OFFSET :=
BOARD_KERNEL_TAGS_OFFSET :=

# Init
## Common overrides
TARGET_INIT_VENDOR_LIB :=
TARGET_UNIFIED_DEVICE :=

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 15728640
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1195376640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2415919104
BOARD_CACHEIMAGE_PARTITION_SIZE := 125829120
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USES_MKE2FS := true

# PowerHal
TARGET_POWERHAL_VARIANT := kanas

# Disable Charger since we would like having the lpm binary do it for us
BOARD_CHARGER_NO_UI := true

# Malloc
MALLOC_SVELTE := true

# Sensors
TARGET_USES_SENSORS_WRAPPER := false

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.sc8830

# WiFi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WLAN_DEVICE_REV := bcm4330
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/vendor/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/vendor/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH := "/vendor/etc/wifi/nvram_net.txt"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true
