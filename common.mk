#
# Copyright (C) 2013 The CyanogenMod Project
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

COMMON_PATH := device/samsung/lt01-common

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# No flashlight, no Torch app
TARGET_HAS_CAM_FLASH := false

# Init files
PRODUCT_COPY_FILES := \
    $(COMMON_PATH)/rootdir/init.smdk4x12.rc:root/init.smdk4x12.rc \
    $(COMMON_PATH)/rootdir/init.smdk4x12.usb.rc:root/init.smdk4x12.usb.rc \
    $(COMMON_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(COMMON_PATH)/rootdir/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    $(COMMON_PATH)/rootdir/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc

# Recovery files
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/root/res/misc/bootmenu.zip:recovery/root/res/misc/bootmenu.zip \
    $(COMMON_PATH)/recovery/root/res/misc/tool.zip:recovery/root/res/misc/tool.zip \
    $(COMMON_PATH)/recovery/root/res/misc/mount:recovery/root/res/misc/mount \
    $(COMMON_PATH)/recovery/root/res/misc/mount.2:recovery/root/res/misc/mount.2 \
    $(COMMON_PATH)/recovery/root/res/misc/umount:recovery/root/res/misc/umount \
    $(COMMON_PATH)/recovery/root/res/misc/umount.2:recovery/root/res/misc/umount.2 \
    $(COMMON_PATH)/recovery/root/res/misc/recovery.fstab.2:recovery/root/res/misc/recovery.fstab.2 \
    $(COMMON_PATH)/recovery/root/res/misc/virtual_keys.2.png:recovery/root/res/misc/virtual_keys.2.png \
    $(COMMON_PATH)/recovery/root/sbin/aroma:recovery/root/sbin/aroma \
    $(COMMON_PATH)/recovery/root/sbin/bootmenu.sh:recovery/root/sbin/bootmenu.sh

# Camera
PRODUCT_PACKAGES += \
    camera.smdk4x12

# IRDA
PRODUCT_PACKAGES += \
    consumerir.exynos4

# Lights
PRODUCT_PACKAGES += \
    lights.exynos4

# Sensors
PRODUCT_PACKAGES += \
    sensors.smdk4x12

# Packages
PRODUCT_PACKAGES += \
    tinyplay

# F2FS filesystem
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    f2fstat

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cm.hardware.cabc=/sys/class/mdnie/mdnie/cabc \
    ro.hwui.disable_scissor_opt=true \
    ro.switch_code.sw_lid=0x15 \
    ro.switch_code.sw_lid_invert=true

# Media profiles
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml

PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Include non-opensource parts
$(call inherit-product, vendor/samsung/lt01-common/common-vendor.mk)

$(call inherit-product, device/samsung/smdk4412-common/common.mk)
