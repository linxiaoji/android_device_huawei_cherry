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


LOCAL_PATH := device/huawei/cherryplus

BOARD_USES_GENERIC_AUDIO := false

TARGET_NO_BOOTLOADER := true
#TARGET_NO_RADIOIMAGE := true
#TARGET_NO_RPC := true

# Assert
TARGET_OTA_ASSERT_DEVICE := che2_l11,hwChe2-L11,Che2-L11,che2-l11,CherryPlus,cherryplus,hi6210sft

# Platform
BOARD_VENDOR := huawei
BOARD_VENDOR_PLATFORM := hi6210sft
TARGET_BOOTLOADER_BOARD_NAME := hi6210sft
TARGET_BOARD_PLATFORM := hi6210sft
TARGET_BOARD_PLATFORM_GPU := mali-450mp
TARGET_SOC := kirin620
HISI_TARGET_PRODUCT := hi6210sft

# Architecture and CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_ABI := arm64-v8a

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a15
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi

TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a

TARGET_USES_64_BIT_BINDER := true
TARGET_USES_HISI_DTIMAGE := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(LOCAL_PATH)/bluetooth/bt_vendor.conf
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
USE_CAMERA_STUB := false
USE_DEVICE_SPECIFIC_CAMERA := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
USE_OPENGL_RENDERER := true
ANDROID_ENABLE_RENDERSCRIPT := true
TARGET_HARDWARE_3D := true

# Kernel
#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/huawei/kernel
TARGET_KERNEL_CONFIG := cherryplus_defconfig
endif
TARGET_USES_UNCOMPRESSED_KERNEL := true
TARGET_KERNEL_CUSTOM_TOOLCHAIN := ../UBERTC/out/aarch64-linux-android-4.9-kernel/bin/aarch64-linux-android-
BOARD_KERNEL_CMDLINE := hisi_dma_print=0 vmalloc=384M maxcpus=8 coherent_pool=512K no_irq_affinity androidboot.selinux=permissive ate_enable=true
BOARD_KERNEL_BASE := 0x07478000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x02988000
# Libc extensions
BOARD_PROVIDES_ADDITIONAL_BIONIC_STATIC_LIBS += libc_huawei_symbols

# USB mass storage
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
BOARD_VOLD_MAX_PARTITIONS := 19

# Wi-Fi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)

WIFI_DRIVER_FW_PATH_AP    := "/vendor/firmware/fw_bcm4343s_apsta_hw.bin"
WIFI_DRIVER_FW_PATH_STA   := "/vendor/firmware/fw_bcm4343s_hw.bin"
WIFI_DRIVER_FW_PATH_P2P   := "/vendor/firmware/fw_bcm4343s_p2p_hw.bin"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_ARG    := "firmware_path=/system/vendor/firmware/fw_bcm4343s_hw.bin nvram_path=/system/vendor/firmware/nvram4343s_hw.txt"

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  WITH_DEXPREOPT := true
endif
WITH_DEXPREOPT_PIC := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

BLOCK_BASED_OTA := false

TARGET_KERNEL_HEADER_ARCH                   := arm64
TARGET_KERNEL_CONFIG                        := hisi_hi6210sft_defconfig
TARGET_USES_UNCOMPRESSED_KERNEL             := true
BOARD_KERNEL_IMAGE_NAME                     := Image
BOARD_KERNEL_PAGESIZE                       := 2048
BUILD_KERNEL_MODULES                         = true
BOARD_MKBOOTIMG_ARGS                        := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x02988000

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

