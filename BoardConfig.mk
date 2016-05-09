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

# 64-bit
ANDROID_64=true
TARGET_USES_64_BIT_BINDER                   := true
TARGET_SUPPORTS_32_BIT_APPS                 := true
TARGET_SUPPORTS_64_BIT_APPS                 := true

# Primary Arch
TARGET_ARCH                                 := arm64
TARGET_ARCH_VARIANT                         := armv8-a
TARGET_CPU_VARIANT                          := cortex-a53
TARGET_CPU_ABI                              := arm64-v8a
TARGET_CPU_SMP                              := true

# Secondary Arch
TARGET_2ND_ARCH                             := arm
TARGET_2ND_ARCH_VARIANT                     := armv7-a-neon
TARGET_2ND_CPU_VARIANT                      := cortex-a7
TARGET_2ND_CPU_ABI                          := armeabi-v7a
TARGET_2ND_CPU_ABI2                         := armeabi

# Audio
BOARD_USES_GENERIC_AUDIO                    := false
BOARD_USES_ALSA_AUDIO                       := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT                     := true

# Libc extensions
BOARD_PROVIDES_ADDITIONAL_BIONIC_STATIC_LIBS += libc_huawei_symbols

# Board
BOARD_HAS_LARGE_FILESYSTEM                  := true
BOARD_HAS_NO_SELECT_BUTTON                  := true
BOARD_VENDOR                                := huawei
BOARD_VENDOR_PLATFORM                       := hi6210sft
HISI_TARGET_PRODUCT                         := hi6210sft
TARGET_NO_BOOTLOADER                        := true
TARGET_NO_KERNEL                            := false
TARGET_NO_RECOVERY                          := false
TARGET_BOARD_PLATFORM                       := hi6210sft
TARGET_BOOTLOADER_BOARD_NAME                := hi6210sft
TARGET_SOC                                  := kirin620
TARGET_USES_HISI_DTIMAGE                    := true

# Graphics and Hardware Acceleration
ANDROID_ENABLE_RENDERSCRIPT                 := true
BOARD_EGL_CFG                               := device/huawei/cherry/egl.cfg
TARGET_HARDWARE_3D                          := true
USE_OPENGL_RENDERER                         := true

# Generic Broadcom Wifi and Hostapd
BOARD_WLAN_DEVICE                           := bcmdhd
BOARD_WLAN_DEVICE_REV                       := bcm4343
WPA_SUPPLICANT_VERSION                      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER                 := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB            := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER                        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB                   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM                   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA                     := "/system/vendor/firmware/fw_bcm4343s_hw.bin"
WIFI_DRIVER_FW_PATH_AP                      := "/system/vendor/firmware/fw_bcm4343s_apsta_hw.bin"
WIFI_DRIVER_FW_PATH_P2P                     := "/system/vendor/firmware/fw_bcm4343s_p2p_hw.bin"
WIFI_BAND                                   := 802_11_ABG

# Bluetooth
BOARD_BLUEDROID_VENDOR_CONF                 := device/huawei/cherry/bluetooth/vnd_h60.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/cherry/bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_BCM                    := true

# Kernel
BOARD_KERNEL_CMDLINE                        := console=ttyAMA3,115200 androidboot.console=ttyAMA3 firmware_class.path=/system/vendor/firmware hisi_dma_print=0 vmalloc=384M maxcpus=8 coherent_pool=512K no_irq_affinity loglevel=7 androidboot.selinux=permissive enforcing=0 ate_enable=true
BOARD_KERNEL_BASE                           := 0x07478000
TARGET_KERNEL_SOURCE                        := kernel/
TARGET_KERNEL_ARCH                          := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX          := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH                   := arm64
TARGET_KERNEL_CONFIG                        := cyanogenmod_hi6210sft_defconfig
TARGET_USES_UNCOMPRESSED_KERNEL             := true
BOARD_KERNEL_IMAGE_NAME                     := Image
BOARD_KERNEL_PAGESIZE                       := 2048
BOARD_RAMDISK_OFFSET                        := 0x07b88000
BOARD_KERNEL_OFFSET                         := 0x00008000
BOARD_TAGS_OFFSET                           := 0x02988000
BUILD_KERNEL_MODULES                         = true

# Kernel (Fallback): Uncomment the line if the sources are not present or a prebuilt kernel is to be used.
TARGET_KERNEL_PREBUILT := device/huawei/cherry/prebuilt/kernel

# Camera
USE_CAMERA_STUB                             := true
BOARD_CAMERA_HAVE_ISO                       := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE              := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE          := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE            := 2550136832
BOARD_USERDATAIMAGE_PARTITION_SIZE          := 4064280576
BOARD_FLASH_BLOCK_SIZE                      := 131072
TARGET_USERIMAGES_USE_EXT4                  := true

# Display
TARGET_USE_PAN_DISPLAY                      := true
DEVICE_SCREEN_HEIGHT                        := 1280
DEVICE_SCREEN_WIDTH                         := 720

# TeamWin Recovery Project
#RECOVERY_VARIANT                            := twrp
#TW_THEME                                    := portrait_hdpi
#TW_BRIGHTNESS_PATH                          := "/sys/class/leds/lcd_backlight0/brightness"
#TW_CUSTOM_BATTERY_PATH                      := "/sys/devices/battery.0/power_supply/Battery"
#TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID      := true
#TW_MAX_BRIGHTNESS                           := 255
RECOVERY_GRAPHICS_USE_LINELENGTH            := true
RECOVERY_SDCARD_ON_DATA                     := true
BOARD_HAS_LARGE_FILESYSTEM                  := true
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY        := true

# Board RIL
BOARD_RIL_CLASS                             := ../../../device/huawei/cherry/ril

# Boot animation
TARGET_BOOTANIMATION_PRELOAD                := true
TARGET_BOOTANIMATION_TEXTURE_CACHE          := true

# Healthd
BOARD_HAL_STATIC_LIBRARIES += libhealthd.hi6210sft

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# CPUSETS Feature
ENABLE_CPUSETS                              := true

