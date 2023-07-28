#
# Copyright (C) 2016-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

ifneq ($(filter kanas,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
