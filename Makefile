INSTALL_PATH="/opt/cyanurus"

.PHONY: all setup

all:
	tool/build

setup:
	sudo install -m 0755 -o $(USER) -g $(USER) -d $(INSTALL_PATH)
