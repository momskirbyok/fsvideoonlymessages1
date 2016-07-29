ARCHS = arm64 armv7

TARGET = iphone:clang:9.2:9.2



#put these in ~/.theosrc
#export THEOS_DEVICE_IP=192.168.1.11
#export THEOS_DEVICE_PORT=22

GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FSVideoOnlyMessages
FSVideoOnlyMessages_FILES = Tweak.xm
FSVideoOnlyMessages_PRIVATE_FRAMEWORKS = ChatKit
FSVideoOnlyMessages_FRAMEWORKS = UIKit


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
