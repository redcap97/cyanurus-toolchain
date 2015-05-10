INSTALL_PATH="/opt/cyanurus"

.PHONY: all setup rootfs clean

all:
	tool/build

setup:
	sudo install -m 0755 -o $(USER) -g $(USER) -d $(INSTALL_PATH)

rootfs:
	$(INSTALL_PATH)/bin/env rootfs/build

clean:
	rm -rf rootfs/rootfs.img
