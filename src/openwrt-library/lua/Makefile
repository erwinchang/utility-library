PKT_NAME		:= lua-5.1.5
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
SFLAG				:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon-vfpv4 -mno-unaligned-access -fno-aggressive-loop-optimizations
endif

export CC		:= $(CROSS)-gcc
export AR 		:= "$(CROSS)-ar rcu"
export RANLINB  := $(CROSS)-ranlib
export LD		:= ${CROSS}-ld
export CXX		:= ${CROSS}-g++

all:
	-mkdir -p $(STAGE_PATH)
	@echo ""
	@echo "=================================="
	@echo "= STAGE_PATH: $(STAGE_PATH)"
	@echo "= tgz: $(PKT_NAME).tar.gz"
	@echo "= PKT_DIR: $(PKT_DIR)"
	@echo "==================================="
	@echo ""
	@if [ ! -d $(PKT_DIR) ];then			   																			\
		tar -zxvf $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/lua/$(PKT_NAME).tar.gz -C $(STAGE_PATH); 		\
		make patch_file;																								\
	fi
	make build_pkt;

build_pkt:
	@echo "--------- task build pkt --------------"
	-mkdir -p $(ROOTFS_DIR)
	pushd $(PKT_DIR); make linux CC=$(CC) AR=$(AR) RANLIB=$(RANLINB) CFLAGS='$(SFLAG) -fPIC -DLUA_USE_LINUX -I$(ROOTFS_DIR)/include -L$(ROOTFS_DIR)/lib'; popd

install:
	pushd $(PKT_DIR); make install INSTALL_TOP=$(ROOTFS_DIR); popd

patch_file:
	cd $(STAGE_PATH)/$(PKT_NAME) && patch -p1 < $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/lua/lua-5.1.5-xcompile.patch

clean:
	-rm -rf $(STAGE_PATH)
