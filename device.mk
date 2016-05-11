#
# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Defining Local Path
LOCAL_PATH := device/huawei/cherry

# Adjust the dalvik heap to be appropriate for a phone
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Copy preboot binaries
PRE_BOOT_FILES := isp.bin ons.bin
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
        $(LOCAL_PATH)/preboot/isp.bin:system/isp.bin \
        $(LOCAL_PATH)/preboot/ons.bin:system/ons.bin)

# Set custom settings
DEVICE_PACKAGE_OVERLAYS := device/huawei/cherry/overlay

# Add openssh support for remote debugging and job submission
PRODUCT_PACKAGES += ssh sftp scp sshd ssh-keygen sshd_config start-ssh uim wpa_supplicant

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

# Build BT a2dp audio HAL
PRODUCT_PACKAGES += audio.a2dp.default

# Needed to sync the system clock with the RTC clock
PRODUCT_PACKAGES += hwclock

# Include USB speed switch App
PRODUCT_PACKAGES += UsbSpeedSwitch

# Build libion for new double-buffering HDLCD driver
PRODUCT_PACKAGES += libion

# Build gatord daemon for DS-5/Streamline
PRODUCT_PACKAGES += gatord

# Build gralloc for Juno
PRODUCT_PACKAGES += gralloc.hi6210sft

# Include ION tests
PRODUCT_PACKAGES += \
        iontest \
        ion-unit-test

# Build audio libraries
PRODUCT_PACKAGES += \
	audio.primary.default \
	audio_policy.stub \
	audio.usb.default \
	audio.r_submix.default \
	sound_trigger.primary.hi6210sft \
	libaudioutils \
	libtinyalsa \
	tinyplay \
	tinycap \
	tinymix \
	tinypcminfo

# Set zygote config
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
PRODUCT_PROPERTY_OVERRIDES += \
        debug.sf.no_hw_vsync=1 \
        ro.secure=0 \
        ro.adb.secure=0
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc

# Graphics
PRODUCT_PACKAGES += libGLES_android

# WiFi and Bluetooth
PRODUCT_PACKAGES += \
        libwpa_client \
	dhcpcd.conf \
	hostapd \
	wpa_supplicant \
	wpa_supplicant.conf
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
        wifi.supplicant_scan_interval=15
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        
# Permissions 
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
        frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
        frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
        frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
        frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
        frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

# BCM4343 Wlan Modules
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4343/device-bcm.mk)

# Camera
PRODUCT_PACKAGES += camera.hi6210sft camera.default

# AAPT high-density artwork where available
PRODUCT_AAPT_CONFIG      := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
	audioril.lib=libhuawei-audio-ril.so \
	ro.telephony.ril_class=HwHisiRIL \
	ro.telephony.default_network=9,9 \
	telephony.lteOnCdmaDevice=0,0 \
	telephony.lteOnGsmDevice=0,0

# Additional packages
PRODUCT_PACKAGES += \
        Torch \
        com.android.future.usb.accessory

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        persist.sys.usb.config=mtp

# USB OTG support
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.isUsbOtgEnabled=true

# File System
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/fstab.hi6210sft:root/fstab.hi6210sft \
	$(LOCAL_PATH)/ramdisk/init.recovery.hi6210sft.rc:root/init.recovery.hi6210sft.rc \
	$(LOCAL_PATH)/ramdisk/init.hi6210sft.rc:root/init.hi6210sft.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.hi6210sft.rc:root/ueventd.hi6210sft.rc

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/sbin/emmc_partation:root/sbin/emmc_partation \
	$(LOCAL_PATH)/ramdisk/sbin/logctl_service:root/sbin/logctl_service \
	$(LOCAL_PATH)/ramdisk/sbin/oeminfo_nvm_server:root/sbin/oeminfo_nvm_server \
	$(LOCAL_PATH)/ramdisk/sbin/teecd:root/sbin/teecd

# Time Zone data
PRODUCT_COPY_FILES += \
        bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# Security Enhanced Linux
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.boot.selinux=0
ADDITIONAL_DEFAULT_PROPERTIES      += ro.boot.selinux=0

# Inherit from Non Opensource Blobs
$(call inherit-product, vendor/huawei/cherry/vendor.mk)

# Copy Audio Policies and Configurations
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Copy GPS Configurations
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/gps/gpsconfig.xml:system/etc/gpsconfig.xml

# Copy CPU and Thermal Configurations
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/cpu_thermal/normal_cpu_policy.xml:system/etc/normal_cpu_policy.xml \
	$(LOCAL_PATH)/cpu_thermal/performance_cpu_policy.xml:system/etc/performance_cpu_policy.xml \
	$(LOCAL_PATH)/cpu_thermal/powermonitor_config.xml:system/etc/powermonitor_config.xml \
	$(LOCAL_PATH)/cpu_thermal/pwrprof.xml:system/etc/pwrprof.xml \
	$(LOCAL_PATH)/cpu_thermal/thermald.xml:system/etc/thermald.xml \
	$(LOCAL_PATH)/cpu_thermal/thermald_performance.xml:system/etc/thermald_performance.xml

# Copy Media Profiles and Configurations
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# Copy Prebuilt Kernel (will be overwritten on compilation)
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilt/kernel:kernel

# Security Enhanced Linux Policy Prebuilt
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/sepolicy/file_contexts:root/file_contexts \
	$(LOCAL_PATH)/prebuilt/sepolicy/property_contexts:root/property_contexts \
	$(LOCAL_PATH)/prebuilt/sepolicy/service_contexts:root/service_contexts
