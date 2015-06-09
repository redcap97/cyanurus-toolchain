INSTALL_PATH="/opt/cyanurus"

.PHONY: all setup rootfs clean

all:
	script/build-toolchain

rootfs:
	$(INSTALL_PATH)/bin/env script/build-rootfs

setup:
	sudo install -m 0755 -o $(USER) -g $(USER) -d $(INSTALL_PATH)

clean:
	rm -rf artifact/*
