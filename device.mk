# Copyright (C) 2009 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

#$(call inherit-product, device/common/gps/gps_eu_supl.mk)

#DEVICE_PACKAGE_OVERLAYS := device/samsung/amazingcdma/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_amazingcdma
PRODUCT_DEVICE := amazingcdma
PRODUCT_MODEL := SCH-S738C

PRODUCT_PACKAGES += \
    camera.msm7x27a \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    gps.msm7x27a \
    lights.msm7x27a \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    libstagefrighthw

PRODUCT_PACKAGES += \
    badblocks \
    e2fsck \
    e2label \
    mke2fs \
    mke2fs.conf \
    resize2fs \
    tune2fs \
    make_ext4fs \
    setup_fs

PRODUCT_PACKAGES += \
    hciconfig \
    hcitool \
    libaudioutils

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/amazingcdma/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += \
       sec_touchscreen.kcm \
       sec_jack.kcm \
       sec_key.kcm

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/prebuilt/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/root/init.qcom.rc:root/init.qcom.rc \
    device/samsung/amazingcdma/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    device/samsung/amazingcdma/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/amazingcdma/root/lpm.rc:root/lpm.rc \
    device/samsung/amazingcdma/root/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/samsung/amazingcdma/recovery/fix_reboot.sh:recovery/root/sbin/fix_reboot.sh 

# 3d
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/egl.cfg:system/lib/egl/egl.cfg 

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/amazingcdma/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/amazingcdma/prebuilt/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf
    
# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#Media profile
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/amazingcdma/prebuilt/audio.conf:system/etc/bluetooth/audio.conf
## keymap
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/samsung/amazingcdma/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/amazingcdma/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/amazingcdma/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/amazingcdma/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/amazingcdma/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    device/samsung/amazingcdma/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl


PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.request.master=true \
    ro.qualcomm.bluetooth.ftp=true \
    ro.qualcomm.bluetooth.sap=true \
    ro.bluetooth.remote.autoconnect=true \
    ro.emmc.sdcard.partition=18 
    
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.ril_class=SamsungRIL \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.com.android.dataroaming=false \
    ro.cdma.operator.numeric=310000 \
    ro.cdma.operator.alpha=TracFone 

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 

# Dalvik
PRODUCT_TAGS += \
    dalvik.vm.checkjni=0 \
    dalvik.gc.type-precise \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-flags=v=a,o=v,m=y,u=y \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=36m \
    dalvik.vm.heapsize=64m 

PRODUCT_PROPERTY_OVERRIDES+= \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

PRODUCT_PROPERTY_OVERRIDES+= \
    persist.sys.purgeable_assets=1

PRODUCT_PROPERTY_OVERRIDES += \
    lpa.decode=false \
    tunnel.decode=true \
    lpa.use-stagefright=true

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/amazingcdma/amazing_cdma-vendor.mk)
