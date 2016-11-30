PKT_NAME		:= ncurses-5.9
PWD_DIR			:= $(shell pwd)
STAGE_PATH		:= $(PWD_DIR)/build_dir
PKT_DIR			:= $(STAGE_PATH)/$(PKT_NAME)

export ARCH			:= arm
export ROOTFS_DIR   := $(GIT_RELEASE_DIR)/rootfs-$(GIT_TARGET_ARCH)


ifeq (hiv100,$(GIT_TARGET_ARCH))
export CROSS 		:= arm-hisiv100nptl-linux
SFLAG				:= -march=armv7-a -mcpu=cortex-a9
endif

ifeq (hiv300,$(GIT_TARGET_ARCH))
export CROSS 		:= arm-hisiv300-linux
SFLAG 				:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon-vfpv4 -mno-unaligned-access -fno-aggressive-loop-optimizations
endif

export TARGETMACH   := $(CROSS)
export CC			:= $(CROSS)-gcc
export LD			:= $(CROSS)-ld
export AS			:= $(CROSS)-as
export CXX			:= $(CROSS)-g++

all:
	-mkdir -p $(STAGE_PATH)
	@echo ""
	@echo "=================================="
	@echo "= STAGE_PATH: $(STAGE_PATH)"
	@echo "= tgz: $(PKT_NAME).tgz"
	@echo "= PKT_DIR: $(PKT_DIR)"
	@echo "==================================="
	@echo ""
	@if [ ! -d $(PKT_DIR) ];then			   																				\
		tar -zxvf $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/ncurses/$(PKT_NAME).tar.gz -C $(STAGE_PATH); 		\
	fi
	make build_pkt;


build_pkt:
	@echo "--------- task build pkt --------------"
	mkdir -p $(ROOTFS_DIR)
	pushd $(STAGE_PATH)/$(PKT_NAME); ./configure CFLAGS='$(SFLAG)' CPPFLAGS='$(SFLAG)' --host=$(TARGETMACH) --prefix=$(ROOTFS_DIR) --with-shared --without-debug --without-ada --enable-overwrite; popd
	pushd $(PKT_DIR); make; popd

install:
	pushd $(PKT_DIR); make install; popd

clean:
	-rm -rf $(STAGE_PATH)
