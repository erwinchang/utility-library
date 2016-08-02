
PWD_DIR                 := $(shell pwd)
export ROOTFS_DIR		:= $(PWD_DIR)/rootfs

all:
	@echo "make {ubuntu,hiv200}"

ubuntu:
	-mkdir -p $(ROOTFS_DIR)
	-cp -f ncurses/makefile.ubuntu ncurses/Makefile
	-cp -f readline/makefile.ubuntu readline/Makefile
	-cp -f lua/makefile.ubuntu lua/Makefile
	-cp -f libubox/makefile.ubuntu libubox/Makefile
	-cp -f ubus/makefile.ubuntu ubus/Makefile
	make -Cncurses
	make -Creadline
	make -Clua
	make -Clibubox
	make -Cjson-c
#	make -Cubus

hiv200:
	-mkdir -p $(ROOTFS_DIR)
	-cp -f ncurses/makefile.hiv200 ncurses/Makefile
	-cp -f readline/makefile.hiv200 readline/Makefile
	-cp -f lua/makefile.hiv200 lua/Makefile
	-cp -f libubox/makefile.hiv200 libubox/Makefile
	make -Cncurses
	make -Creadline
	make -Clua
	make -Clibubox

clean:
	rm -rf $(ROOTFS_DIR)
	make -Cncurses clean
	make -Creadline clean
	make -Clua clean
	make -Clibubox clean
