ARCHS = arm64
include $(THEOS)/makefiles/common.mk

THEOS_DEVICE_IP = 192.168.1.8
TWEAK_NAME = KeyboardX
KeyboardX_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
