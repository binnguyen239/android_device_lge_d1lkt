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
	
# snd_soc_msm
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/dsp/snd_soc_msm/DL_REC:/system/etc/snd_soc_msm/DL_REC \
    device/lge/d1lkt/dsp/snd_soc_msm/DL_REC_2x:/system/etc/snd_soc_msm/DL_REC_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/FM_A2DP_REC:/system/etc/snd_soc_msm/FM_A2DP_REC \
    device/lge/d1lkt/dsp/snd_soc_msm/FM_A2DP_REC_2x:/system/etc/snd_soc_msm/FM_A2DP_REC_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/FM_Digital_Radio:/system/etc/snd_soc_msm/FM_Digital_Radio \
    device/lge/d1lkt/dsp/snd_soc_msm/FM_Digital_Radio_2x:/system/etc/snd_soc_msm/FM_Digital_Radio_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/FM_REC:/system/etc/snd_soc_msm/FM_REC \
    device/lge/d1lkt/dsp/snd_soc_msm/FM_REC_2x:/system/etc/snd_soc_msm/FM_REC_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/HiFi:/system/etc/snd_soc_msm/HiFi \
    device/lge/d1lkt/dsp/snd_soc_msm/HiFi_2x:/system/etc/snd_soc_msm/HiFi_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/HiFi_Low_Power:/system/etc/snd_soc_msm/HiFi_Low_Power \
    device/lge/d1lkt/dsp/snd_soc_msm/HiFi_Low_Power_2x:/system/etc/snd_soc_msm/HiFi_Low_Power_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/HiFi_Rec:/system/etc/snd_soc_msm/HiFi_Rec \
    device/lge/d1lkt/dsp/snd_soc_msm/HiFi_Rec_2x:/system/etc/snd_soc_msm/HiFi_Rec_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/snd_soc_msm:/system/etc/snd_soc_msm/snd_soc_msm \
    device/lge/d1lkt/dsp/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/UL_DL_REC:/system/etc/snd_soc_msm/UL_DL_REC \
    device/lge/d1lkt/dsp/snd_soc_msm/UL_DL_REC_2x:/system/etc/snd_soc_msm/UL_DL_REC_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/Voice_Call:/system/etc/snd_soc_msm/Voice_Call \
    device/lge/d1lkt/dsp/snd_soc_msm/Voice_Call_2x:/system/etc/snd_soc_msm/Voice_Call_2x \
    device/lge/d1lkt/dsp/snd_soc_msm/Voice_Call_IP:/system/etc/snd_soc_msm/Voice_Call_IP \
    device/lge/d1lkt/dsp/snd_soc_msm/Voice_Call_IP_2x:/system/etc/snd_soc_msm/Voice_Call_IP_2x

# Sound effects
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/configs/audio_effects.conf:system/etc/audio_effects.conf

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/keylayout/MHLRCP.kl:system/usr/keylayout/MHLRCP.kl \
    device/lge/d1lkt/keylayout/d1lkt-keypad.kl:system/usr/keylayout/d1lkt-keypad.kl \
    device/lge/d1lkt/keylayout/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    device/lge/d1lkt/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \

# Input device config
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/idc/keypad-8960.idc:system/usr/idc/keypad-8960.idc \
    device/lge/d1lkt/idc/melfas-ts.idc:system/usr/idc/melfas-ts.idc \
    device/lge/d1lkt/idc/osp-input.idc:system/usr/idc/osp-input.idc 
	
# Wifi firmware
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/firmware/WCNSS_cfg.dat:/system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/lge/d1lkt/firmware/WCNSS_qcom_cfg.ini:/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    device/lge/d1lkt/firmware/WCNSS_qcom_wlan_nv.bin:/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Wifi config
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/configs/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf

# Video (Temp)
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/prebuilt/libOmxVdec.so:/obj/lib/libOmxVdec.so \
    device/lge/d1lkt/prebuilt/libOmxVdec.so:/system/lib/libOmxVdec.so
	
# NFCEE access control
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/configs/nfcee_access.xml:system/etc/nfcee_access.xml

# Camera
PRODUCT_PACKAGES += \
    libcameraservice

# GPS
#PRODUCT_PACKAGES += \
#    gps.d1lkt \

# Torch
PRODUCT_PACKAGES += \
    Torch

# hostapd
PRODUCT_PACKAGES += \
    hostapd

# Kernel modules
PRODUCT_COPY_FILES += \
    device/lge/d1lkt/modules/wlan.ko:/system/lib/modules/wlan.ko \
	
# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_LOCALES += ko_KR xhdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/lge/d1lkt/d1lkt-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
	

	

