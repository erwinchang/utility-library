
PWD_DIR                 := $(shell pwd)

export ROOTFS_DIR 		:= $(PWD_DIR)/rootfs/rootfs-ubuntu

ifeq ($(CROSS_COMPILE),arm-hisiv200-linux-)
export ROOTFS_DIR 		:= $(PWD_DIR)/rootfs/rootfs-hiv200
endif

ifeq ($(CROSS_COMPILE),arm-hisiv100nptl-linux-)
export ROOTFS_DIR		:= $(PWD_DIR)/rootfs/rootfs-hiv100
endif

export UNAME_M			:= `uname -m`
ifneq (,$(wildcard /etc/fedora-release))
export OS_Fedora		:= true
export ROOTFS_DIR		:= $(PWD_DIR)/rootfs/rootfs-fedora
endif




all:
	@echo "make {ubuntu,hiv200,hiv100,fedora}"
	@echo "ROOTFS_DIR:$(ROOTFS_DIR)"

fedora:
	-mkdir -p $(ROOTFS_DIR)
	make check TYPE=fedora
	make build

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
	rm -rf rootfs
	[ -f ncurses/Makefile ] && make -Cncurses clean
	[ -f readline/Makefile ] && make -Creadline clean
	[ -f lua/Makefile ] && make -Clua clean
	[ -f json-c/Makefile ] && make -Cjson-c clean
	[ -f libubox/Makefile ] && make -Clibubox clean
	[ -f ubus/Makefile ] && make -Cubus clean
	[ -f uci/Makefile ] && make -Cuci clean
	rm -f ncurses/Makefile
	rm -f readline/Makefile
	rm -f lua/Makefile
	rm -f json-c/Makefile
	rm -f libubox/Makefile
	rm -f uci/Makefile
	rm -f ubus/Makefile

check:
	-cp -f ncurses/makefile.$(TYPE) ncurses/Makefile
	-cp -f readline/makefile.$(TYPE) readline/Makefile
	-cp -f lua/makefile.$(TYPE) lua/Makefile
	-cp -f json-c/makefile.$(TYPE) json-c/Makefile
	-cp -f libubox/makefile.$(TYPE) libubox/Makefile
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
