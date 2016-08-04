
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
	-cp -f ncurses/makefile.ubuntu ncurses/Makefile
	-cp -f readline/makefile.ubuntu readline/Makefile
	-cp -f lua/makefile.ubuntu lua/Makefile
	-cp -f json-c/makefile.ubuntu json-c/Makefile
	-cp -f libubox/makefile.ubuntu libubox/Makefile
	-cp -f uci/makefile.ubuntu uci/Makefile
	-cp -f ubus/makefile.ubuntu ubus/Makefile
	make -Cncurses
	make -Creadline
	make -Clua
	make -Cjson-c
#	for libubox create blob_msg library
	make -Clibubox
	make -Cuci
	make -Cubus

hiv200:
	-mkdir -p $(ROOTFS_DIR)
	-cp -f ncurses/makefile.hiv200 ncurses/Makefile
	-cp -f readline/makefile.hiv200 readline/Makefile
	-cp -f lua/makefile.hiv200 lua/Makefile
	-cp -f libubox/makefile.hiv200 libubox/Makefile
	-cp -f json-c/makefile.hiv200 json-c/Makefile
	-cp -f uci/makefile.hiv200 uci/Makefile
	-cp -f ubus/makefile.hiv200 ubus/Makefile
	make -Cncurses
	make -Creadline
	make -Clua
	make -Cjson-c
#	for libubox create blob_msg library
	make -Clibubox
	make -Cuci
	make -Cubus

hiv100:
	-mkdir -p $(ROOTFS_DIR)
	-cp -f ncurses/makefile.hiv100 ncurses/Makefile
	-cp -f readline/makefile.hiv100 readline/Makefile
	-cp -f lua/makefile.hiv100 lua/Makefile
	-cp -f libubox/makefile.hiv100 libubox/Makefile
	-cp -f json-c/makefile.hiv100 json-c/Makefile
	-cp -f uci/makefile.hiv100 uci/Makefile
	-cp -f ubus/makefile.hiv100 ubus/Makefile
	make -Cncurses
	make -Creadline
	make -Clua
	make -Cjson-c
#	for libubox create blob_msg library
	make -Clibubox
	make -Cuci
	make -Cubus

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
