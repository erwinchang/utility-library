
PWD_DIR                 := $(shell pwd)
export ROOTFS_DIR		:= $(PWD_DIR)/rootfs

all:
	@echo "make {ubuntu,hiv200}"

ubuntu:
	-mkdir -p $(ROOTFS_DIR)
	-cp -f ncurses/makefile.ubuntu ncurses/Makefile
	-cp -f readline/makefile.ubuntu readline/Makefile
	-cp -f lua/makefile.ubuntu lua/Makefile
	make -Cncurses
	make -Creadline
	make -Clua

hiv200:
	-mkdir -p $(ROOTFS_DIR)
	-cp -f ncurses/makefile.hiv200 ncurses/Makefile
	-cp -f readline/makefile.hiv200 readline/Makefile
	-cp -f lua/makefile.hiv200 lua/Makefile
	make -Cncurses
	make -Creadline
	make -Clua

clean:
	rm -rf $(ROOTFS_DIR)
	make -Cncurses clean
	make -Creadline clean
	make -Clua clean
