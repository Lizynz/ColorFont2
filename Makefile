#DEBUG = 0

ROOTLESS ?= 0

ifeq ($(ROOTLESS),1)
	TARGET = iphone:clang:14.2
	THEOS_LAYOUT_DIR_NAME = layout-rootless
	THEOS_PACKAGE_SCHEME = rootless
else
	TARGET = iphone:clang:14.2
endif

GO_EASY_ON_ME = 1

PACKAGE_VERSION = 11.0

export SYSROOT = $(THEOS)/sdks/iPhoneOS14.2.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ColorFont2
ColorFont2_FILES = Tweak.xm
ColorFont2_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += colorfont2
include $(THEOS_MAKE_PATH)/aggregate.mk
