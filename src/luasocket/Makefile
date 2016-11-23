
PWD_DIR                 := $(shell pwd)

export ROOTFS_DIR 		:= $(PWD_DIR)/rootfs/rootfs-ubuntu

ifeq ($(CROSS_COMPILE),arm-hisiv200-linux-)
export ROOTFS_DIR 		:= $(PWD_DIR)/rootfs/rootfs-hiv200
endif

ifeq ($(CROSS_COMPILE),arm-hisiv100nptl-linux-)
export ROOTFS_DIR		:= $(PWD_DIR)/rootfs/rootfs-hiv100
endif


all:
	@echo "make {ubuntu,hiv200,hiv100}"

ubuntu:
	-mkdir -p $(ROOTFS_DIR)
	make check TYPE=ubuntu
	make build

hiv200:
	-mkdir -p $(ROOTFS_DIR)
	make check TYPE=hiv200
	make build

hiv100:
	-mkdir -p $(ROOTFS_DIR)
	make check TYPE=hiv100
	make build

clean:
	make -Cluasocket  clean
	rm -f luasocket/Makefile

check:
	-cp -f luasocket/makefile.$(TYPE) luasocket/Makefile

build:
	make -Cluasocket
