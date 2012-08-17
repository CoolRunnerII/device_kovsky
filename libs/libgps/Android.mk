LOCAL_PATH:= $(call my-dir)

ifneq ($(TARGET_SIMULATOR),true)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_MODULE := gps.$(TARGET_BOOTLOADER_BOARD_NAME)

LOCAL_CFLAGS           += -DHAVE_GPS_HARDWARE

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_SHARED_LIBRARIES := libutils libcutils librpc

LOCAL_C_INCLUDES := \
    $(TARGET_OUT_HEADERS)/librpc

LOCAL_SRC_FILES := \
		gps.c \
		gps-rpc.c \
		time.cpp \

include $(BUILD_SHARED_LIBRARY)

endif # !TARGET_SIMULATOR
