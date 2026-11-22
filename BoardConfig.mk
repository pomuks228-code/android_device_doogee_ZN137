#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/doogee/ZN137

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    product \
    vbmeta_vendor \
    vendor_dlkm \
    vbmeta_system \
    system \
    boot \
    vendor \
    odm_dlkm
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := DOOGEE
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 240

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_KERNEL_TAGS_OFFSET := 0x07c88000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := ZN137_defconfig
TARGET_KERNEL_SOURCE := kernel/doogee/ZN137

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := doogee_dynamic_partitions
BOARD_DOOGEE_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product vendor_dlkm odm_dlkm
BOARD_DOOGEE_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := mt6789

# Recovery
# TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true

# Fix Display & Touch for Doogee Smini (480x1170)
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 120
TW_Y_OFFSET := 0
TW_H_OFFSET := 0
TW_LOAD_VENDOR_MODULES := "mkp.ko bootprof.ko dbgtop-drm.ko mrdump.ko mtk_disp_notify.ko aee_aed.ko aee_hangdet.ko monitor_hang.ko mtk_printk_ctrl.ko log_store.ko nvmem_mtk-devinfo.ko mtk_wdt.ko sec-rng.ko device-apc-common.ko device-apc-mt6789.ko pinctrl-mtk-v2.ko pinctrl-mt6789.ko pinctrl-mtk-common-v2_debug.ko zsmalloc.ko zram.ko clk-common.ko clk-mt6789.ko clk-mt6789-audiosys.ko clk-mt6789-cam.ko clk-mt6789-mmsys.ko clk-mt6789-img.ko clk-mt6789-i2c.ko clk-mt6789-bus.ko clk-mt6789-vcodec.ko clk-mt6789-disp_dsc.ko clk-mt6789-impen.ko clk-mt6789-mfgcfg.ko mtk-scpsys.ko mtk-scpsys-mt6789.ko mtk-scpsys-bringup.ko clk-bringup.ko pd-chk-mt6789.ko clk-fmeter-mt6789.ko mtk_dramc.ko mtk-dvfsrc.ko mtk-dvfsrc-regulator.ko mtk-emi.ko mtk-smi.ko mtk-smi-dbg.ko arm_dsu_pmu.ko mtk-icc-core.ko mtk-mmdvfs.ko mtk-mmdvfs-debug.ko mmqos-common.ko mmqos-mt6789.ko iommu_secure.ko iommu_debug.ko mtk_iommu.ko iommu_test.ko mtk_mm_heap.ko system_heap.ko mtk-cmdq-drv-ext.ko cmdq-platform-mt6789.ko cmdq_helper_inf.ko tps65132.ko mtk-mml.ko mtk_panel_ext.ko panel_jd9161z_fwvga1170_dsi_vdo_boe.ko panel_jd9161z_fwvga1170_dsi_vdo_boe_gms.ko mediatek-drm.ko aee_rs.ko mmprofile.ko mtk-uart-apdma.ko 8250_mtk.ko phy-generic.ko phy-mtk-tphy.ko musb_boost.ko musb_hdrc.ko musb_main.ko mtk-pmic-wrap.ko mt635x-auxadc.ko mt6397.ko mt63xx-debug.ko mtk-spmi-pmic.ko spmi-mtk-pmif.ko mt6358-regulator.ko regmap-spmi.ko cqhci.ko mtk-mmc-autok.ko mtk-mmc-dbg.ko mtk-mmc.ko phy-mtk-ufs.ko rpmb.ko rpmb-mtk.ko ufs-mediatek-mod.ko ufs-mediatek-dbg.ko blocktag.ko pidmap.ko mtk-pmic-keys.ko mtk-kpd.ko regulator-vibrator.ko i2c-mt65xx.ko rtc-mt6397.ko mt6789_dcm.ko mtk_dcm.ko clk-chk-mt6789.ko clk-dbg-mt6789.ko spi-mt65xx.ko mt6375.ko extdev_io_class.ko rt5133-regulator.ko clkbuf.ko teeperf.ko mcDrvModule.ko isee.ko industrialio-triggered-buffer.ko kfifo_buf.ko mt6375-adc.ko mt6375-auxadc.ko adapter_class.ko charger_class.ko mtk_charger_algorithm_class.ko upm6910_charger.ko upm6910_charger_slave.ko pd_dbg_info.ko tcpc_class.ko tcpc_rt1711h.ko mtk_chg_type_det.ko mtk_pd_adapter.ko mtk_pd_charging.ko mtk_pep.ko mtk_charger_framework.ko rt_pd_manager.ko mt6358_battery.ko pwm-mtk-disp.ko leds-mtk.ko leds-mtk-disp.ko leds-mtk-pwm.ko rt4831a_drv.ko extcon-mtk-usb.ko tcpci_late_sync.ko mt6577_auxadc.ko cache-parity.ko mtk_battery_oc_throttling.ko mtk_low_battery_throttling.ko pmic_lbat_service.ko pmic_lvsys_notify.ko mtk_dynamic_loading_throttling.ko mtk_pbm.ko mtk_mdpm.ko reboot-mode.ko syscon-reboot-mode.ko reset-ti-syscon.ko meta.ko mtk-cqdma.ko mtk_sync.ko emi.ko emi-mpu.ko cfg80211.ko mac80211.ko tinysys-scmi.ko mtk-mbox-mailbox.ko irq-dbg.ko mtk-socinfo.ko mtk_rpmsg_mbox.ko mtk-mbox.ko mtk_tinysys_ipi.ko clk-disable-unused.ko mtk-pm-domain-disable-unused.ko sec.ko uload_ind.ko load_track.ko "
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
