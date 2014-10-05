.PHONY: all

all:
	tool/build

setup:
	sudo install -m 0755 -o $(USER) -g $(USER) -d /opt/cyanurus
	tool/setup/ubuntu
