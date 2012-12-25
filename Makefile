TWEAK_NAME = TopographyForGoogleMaps
TopographyForGoogleMaps_FILES = Tweak.x
TopographyForGoogleMaps_FRAMEWORKS = UIKit

ADDITIONAL_CFLAGS = -std=c99

TARGET_IPHONEOS_DEPLOYMENT_VERSION := 5.1

include framework/makefiles/common.mk
include framework/makefiles/tweak.mk
