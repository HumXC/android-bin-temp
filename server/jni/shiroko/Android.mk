LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE    := shiroko
LOCAL_LDLIBS    := -llog
LOCAL_SRC_FILES := \
	native-lib.cpp \
	global.h	   \
	main.h	  	   \
	main.cpp

include $(BUILD_SHARED_LIBRARY)
