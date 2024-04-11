TARGET := iphone:clang:latest:16.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = accel

accel_FILES = accel.m
accel_CFLAGS = -fobjc-arc
accel_CODESIGN_FLAGS = -Sentitlements.plist
# accel_INSTALL_PATH = /var/jb/usr/local/bin
accel_INSTALL_PATH = /
accel_FRAMEWORKS = CoreMotion

include $(THEOS_MAKE_PATH)/tool.mk
