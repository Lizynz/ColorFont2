include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ColorFont2
ColorFont2_FILES = ColorFont2RootListController.m
ColorFont2_INSTALL_PATH = /Library/PreferenceBundles
ColorFont2_FRAMEWORKS = UIKit
ColorFont2_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ColorFont2.plist$(ECHO_END)
