ARCHS = arm64 armv7

TARGET = iphone:clang:9.2:9.2




export THEOS_DEVICE_IP=192.168.11

export THEOS_DEVICE_PORT=2222



include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FSVideoOnlyMessages
FSVideoOnlyMessages_FILES = Tweak.xm
FSVideoOnlyMessages_PRIVATE_FRAMEWORKS = ChatKit
FSVideoOnlyMessages_FRAMEWORKS = MediaPlayer

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
