$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/d1lkt/d1lkt-vendor.mk)


LOCAL_PATH := device/lge/d1lkt
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_d1lkt
PRODUCT_DEVICE := d1lkt

# common msm8960 configs
$(call inherit-product, device/lge/msm8960-common/msm8960.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/d1lkt/overlay

# Qualcomm scripts
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/configs/init.lge_dut.bt.sh:/system/etc/init.lge_dut.bt.sh \
    device/lge/d1lkt/configs/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
    device/lge/d1lkt/configs/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh \
    device/lge/d1lkt/configs/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh \
    device/lge/d1lkt/configs/init.qcom.ftm_module.sh:/system/etc/init.qcom.ftm_module.sh \
    device/lge/d1lkt/configs/init.qcom.ftm_module_out.sh:/system/etc/init.qcom.ftm_module_out.sh \
    device/lge/d1lkt/configs/init.qcom.mdm_links.sh:/system/etc/init.qcom.mdm_links.sh \
    device/lge/d1lkt/configs/init.qcom.modem_links.sh:/system/etc/init.qcom.modem_links.sh \
    device/lge/d1lkt/configs/init.qcom.post_boot.sh:/system/etc/init.qcom.post_boot.sh \
    device/lge/d1lkt/configs/init.qcom.sdio.sh:/system/etc/init.qcom.sdio.sh \
    device/lge/d1lkt/configs/init.qcom.wifi.sh:/system/etc/init.qcom.wifi.sh \
    device/lge/d1lkt/configs/init.wlan-on-off.sh:/system/etc/init.wlan-on-off.sh

# MSM8960 firmware
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/firmware/cyttsp_8960_cdp.hex:/system/etc/firmware/cyttsp_8960_cdp.hex \
    device/lge/d1lkt/firmware/vidc_1080p.fw:/system/etc/firmware/vidc_1080p.fw

# GPS config
PRODUCT_COPY_FILES += device/common/gps/gps.conf_AS:system/etc/gps.conf

# Media config
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/configs/media_profiles.xml:system/etc/media_profiles.xml

# vold config
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/configs/vold.fstab:system/etc/vold.fstab

# thermald config
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/configs/thermald.conf:/system/etc/thermald.conf
