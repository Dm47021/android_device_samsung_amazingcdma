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

DEVICE_PACKAGE_OVERLAYS := device/samsung/amazingcdma/overlay

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, vendor/cm/config/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Dalvik
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)


# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default \
    audio_policy.conf \
    libaudioutils

# Bluetooth
PRODUCT_PACKAGES += \
    hciconfig \
    hcitool

# Camera
#PRODUCT_PACKAGES += \
#    camera.msm7x27a

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27a \

# Lights
PRODUCT_PACKAGES += \
    lights.msm7x27a \

# Misc
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    com.android.future.usb.accessory

# Omx
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

# Power 
PRODUCT_PACKAGES += \
    power.msm7x27a

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    librs_jni 


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/prebuilt/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/root/sbin/adbd:root/sbin/adbd \
    device/samsung/amazingcdma/root/fstab.qcom:root/fstab.qcom \
    device/samsung/amazingcdma/root/init.qcom.rc:root/init.qcom.rc \
    device/samsung/amazingcdma/root/init.qcom.sh:root/init.qcom.sh \
    device/samsung/amazingcdma/root/lpm.rc:root/lpm.rc \
    device/samsung/amazingcdma/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/amazingcdma/root/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/samsung/amazingcdma/root/ueventd.qcom.rc:root/ueventd.qcom.rc

# Recovery Init
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/recovery/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    device/samsung/amazingcdma/recovery/fix_reboot.sh:recovery/root/sbin/fix_reboot.sh 

# Adreno
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/amazingcdma/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/samsung/amazingcdma/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/amazingcdma/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/amazingcdma/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/amazingcdma/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/samsung/amazingcdma/prebuilt/lib/egl/libgsl.so:system/lib/libgsl.so \
    device/samsung/amazingcdma/prebuilt/lib/egl/libOpenVG.so:system/lib/libOpenVG.so \
    device/samsung/amazingcdma/prebuilt/lib/egl/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/samsung/amazingcdma/prebuilt/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/samsung/amazingcdma/prebuilt/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/amazingcdma/prebuilt/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/amazingcdma/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv
   
# Bluez
PRODUCT_COPY_FILES += \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf \
    system/bluetooth/data/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    system/bluetooth/data/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    system/bluetooth/data/input.conf:system/etc/bluetooth/input.conf \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
    system/bluetooth/data/network.conf:system/etc/bluetooth/network.conf

# keymap
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/samsung/amazingcdma/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/amazingcdma/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/amazingcdma/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/amazingcdma/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/amazingcdma/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    device/samsung/amazingcdma/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Media 
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/amazingcdma/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml

# Sensors
PRODUCT_COPY_FILES += \
    device/samsung/amazingcdma/prebuilt/etc/calib.dat:system/etc/calib.dat \
    device/samsung/amazingcdma/prebuilt/etc/param.dat:system/etc/param.dat \
    device/samsung/amazingcdma/prebuilt/etc/sensors.dat:system/etc/sensors.dat


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
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.com.android.dataroaming=false \
    ro.cdma.operator.numeric=310000 \
    ro.cdma.operator.alpha=TracFone 

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 

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
    persist.sys.purgeable_assets=1 \
    sys.mem.max_hidden_apps=3

PRODUCT_PROPERTY_OVERRIDES += \
    lpa.decode=false \
    tunnel.decode=true \
    lpa.use-stagefright=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    persist.service.adb.enable=1 \
    ro.vold.switchablepair=/storage/sdcard0,/storage/sdcard1 \
    ro.vold.umsdirtyratio=50 \

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

ADDITIONAL_DEFAULT_PROPERTIES += mtp,adb
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1

# Vendor Blobs
$(call inherit-product-if-exists, vendor/samsung/amazingcdma/amazingcdma-vendor.mk)

# This is an MDPI device
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

# Other
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=2
PRODUCT_TAGS += dalvik.gc.type-precise


# Discard inherited values and use our own instead.
PRODUCT_NAME := full_amazingcdma
PRODUCT_DEVICE := amazingcdma
PRODUCT_MODEL := SCH-S738C
