
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
	rm -rf rootfs ncurses readline lua
	@if [ -f json-c/Makefile ]; then make -Cjson-c clean; fi
	@if [ -f libubox/Makefile ]; then make -Clibubox clean; fi
	@if [ -f ubus/Makefile ]; then make -Cubus clean; fi
	@if [ -f uci/Makefile ]; then make -Cuci clean; fi
	rm -f json-c/Makefile
	rm -f libubox/Makefile
	rm -f uci/Makefile
	rm -f ubus/Makefile

check:
	@if [ ! -d ./ncurses ]; then cp -rf ../package-14.07/ncurses  .; fi
	@if [ ! -d ./readline ]; then cp -rf ../package-14.07/readline  .; fi
	@if [ ! -d ./lua ]; then cp -rf ../package-14.07/lua  .; fi
	-cp -f ncurses/makefile.$(TYPE) ncurses/Makefile
	-cp -f readline/makefile.$(TYPE) readline/Makefile
	-cp -f lua/makefile.$(TYPE) lua/Makefile
	-cp -f libubox/makefile.$(TYPE) libubox/Makefile
	-cp -f json-c/makefile.$(TYPE) json-c/Makefile
	-cp -f uci/makefile.$(TYPE) uci/Makefile
	-cp -f ubus/makefile.$(TYPE) ubus/Makefile

build:
	make -Cncurses
	make -Creadline
	make -Clua
	make -Cjson-c
#	for libubox create blob_msg library
	make -Clibubox
	make -Cuci
	make -Cubus

