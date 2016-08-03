
PWD_DIR                 := $(shell pwd)
export ROOTFS_DIR		:= /opt/rootfs

all:
	@echo "make {ubuntu,hiv200}"

ubuntu:
	-mkdir -p $(ROOTFS_DIR)
	-cp -f ncurses/makefile.ubuntu ncurses/Makefile
	-cp -f readline/makefile.ubuntu readline/Makefile
	-cp -f lua/makefile.ubuntu lua/Makefile
	-cp -f libubox/makefile.ubuntu libubox/Makefile
	-cp -f json-c/makefile.ubuntu json-c/Makefile
	-cp -f ubus/makefile.ubuntu ubus/Makefile
	make -Cncurses
	make -Creadline
	make -Clua
	make -Cjson-c
#	for libubox create blob_msg library
	make -Clibubox
	make -Cubus

hiv200:
	-mkdir -p $(ROOTFS_DIR)
	-cp -f ncurses/makefile.hiv200 ncurses/Makefile
	-cp -f readline/makefile.hiv200 readline/Makefile
	-cp -f lua/makefile.hiv200 lua/Makefile
	-cp -f libubox/makefile.hiv200 libubox/Makefile
	-cp -f json-c/makefile.hiv200 json-c/Makefile
	-cp -f ubus/makefile.hiv200 ubus/Makefile
	make -Cncurses
	make -Creadline
	make -Clua
	make -Cjson-c
#	for libubox create blob_msg library
	make -Clibubox
	make -Cubus

clean:
	rm -rf $(ROOTFS_DIR)
	[ -f ncurses/Makefile ] && make -Cncurses clean
	[ -f readline/Makefile ] && make -Creadline clean
	[ -f lua/Makefile ] && make -Clua clean
	[ -f json-c/Makefile ] && make -Cjson-c clean
	[ -f libubox/Makefile ] && make -Clibubox clean
	[ -f ubus/Makefile ] && make -Cubus clean
