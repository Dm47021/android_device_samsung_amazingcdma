# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# config.mk
#
# Product-specific compile-time definitions.
#

LOCAL_PATH:= $(call my-dir)

TARGET_SPECIFIC_HEADER_PATH := device/samsung/amazingcdma/include

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# Camera
USE_CAMERA_STUB:= false
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -DSAMSUNG_CAMERA_HARDWARE

# Misc
TARGET_BOOTLOADER_BOARD_NAME := amazingcdma
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Arch
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT_FPU := vfpv3
# Bionic Optimization
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Graphics
BOARD_EGL_CFG := device/samsung/amazingcdma/egl.cfg
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_NO_HW_VSYNC := true
TARGET_USES_HWCOMPOSER := true
USE_OPENGL_RENDERER := true
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_USES_GENLOCK := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true 
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60

# assert
TARGET_OTA_ASSERT_DEVICE := amazing_cdma,SCH-S738C

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Fm
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := bcm2049

#GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
BOARD_WLAN_DEVICE           := ar6000
WIFI_DRIVER_MODULE_PATH     := /system/lib/modules/ath.ko
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := ath

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true
DYNAMIC_SHARED_LIBV8SO := false
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
WEBCORE_INPAGE_VIDEO := true
WEBCORE_ACCELERATED_SCROLLING := true
ENABLE_WTF_USE_ACCELERATED_COMPOSITING := true

## RIL
BOARD_USES_LEGACY_RIL := true
BOARD_MOBILEDATA_INTERFACE_NAME:= "pdp0"

# Kernel
TARGET_PROVIDES_INIT_RC := true
TARGET_PREBUILT_KERNEL := device/samsung/amazingcdma/zImage
TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/amazingcdma/recovery_kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_NAND_PAGE_SIZE := 4096
BOARD_PAGE_SIZE := 0x00001000
BOARD_FORCE_RAMDISK_ADDRESS := 0X01300000

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE :=12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 979369984
BOARD_FLASH_BLOCK_SIZE := 4096

## Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

# Qcom
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_PMEM := true
BOARD_USES_QCOM_LIBS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ICS_DECODERS

# Legacy touchscreen support
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Usb
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

# Storage
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p23
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1p1
BOARD_HAS_NO_MISC_PARTITON := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_SDCARD_INTERNAL := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USES_MMCUTILS := true

# TWRP / Cwm
DEVICE_RESOLUTION := 320x480
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"

BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_LDPI_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/samsung/amazingcdma/recovery/recovery_keys.c

# Insecure boot
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1

# Create Odex Files
WITH_DEXPREOPT := true

# Releasetools
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/samsung/amazingcdma/releasetools/amazingcdma_ota_from_target_files

