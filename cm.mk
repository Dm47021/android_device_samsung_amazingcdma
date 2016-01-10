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
# build for crespo hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)
$(call inherit-product, device/samsung/amazingcdma/full_amazingcdma.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_RELEASE_NAME := amazing_cdma

# Discard inherited values and use our own instead.
PRODUCT_NAME := cm_amazingcdma
PRODUCT_DEVICE := amazingcdma
PRODUCT_MODEL := SCH-S738C
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
