LOCAL_PATH:= $(call my-dir)
# HAL module implemenation, not prelinked and stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.board.platform>.so
include $(CLEAR_VARS)

LOCAL_SRC_FILES := lights.c

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_SHARED_LIBRARIES := liblog libcutils

LOCAL_MODULE := lights.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -DLIGHT_BUTTONS_AUTO_POWEROFF

include $(BUILD_SHARED_LIBRARY)
