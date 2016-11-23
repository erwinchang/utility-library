PKT_NAME		:= readline-6.2
PWD_DIR			:= $(shell pwd)
STAGE_PATH		:= $(PWD_DIR)/build_dir
PKT_DIR			:= $(STAGE_PATH)/$(PKT_NAME)

export ARCH			:= arm
export ROOTFS_DIR   := $(GIT_RELEASE_DIR)/rootfs-$(GIT_TARGET_ARCH)

export TARGETMACH 	:= arm-hisiv100nptl-linux
export CROSS		:= arm-hisiv100nptl-linux
export CC			:= ${CROSS}-gcc
export LD			:= ${CROSS}-ld
export AS			:= ${CROSS}-as
export AR			:= ${CROSS}-ar
export CXX			:= ${CROSS}-g++

all:
	-mkdir -p $(STAGE_PATH)
	@echo ""
	@echo "=================================="
	@echo "= STAGE_PATH: $(STAGE_PATH)"
	@echo "= tgz: $(PKT_NAME).tar.gz"
	@echo "= PKT_DIR: $(PKT_DIR)"
	@echo "==================================="
	@echo ""
	@if [ ! -d $(PKT_DIR) ];then			   																					\
		tar -zxvf $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/readline/$(PKT_NAME).tar.gz -C $(STAGE_PATH); 		\
		make patch_file;																										\
	fi
	make build_pkt;


build_pkt:
	@echo "--------- task build $(PKT_NAME) --------------"
	mkdir -p $(ROOTFS_DIR)
	pushd $(PKT_DIR); ./configure --prefix=$(ROOTFS_DIR) --host=$(TARGETMACH) LDFLAGS=-L$(ROOTFS_DIR)/lib; popd
	pushd $(PKT_DIR); make SHLIB_LIBS=-lncurses; popd

install:
	pushd $(PKT_DIR); make install; popd

patch_file:
	cd $(STAGE_PATH)/$(PKT_NAME) && patch -p0 < $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/readline/patch/readline62-001
	cd $(STAGE_PATH)/$(PKT_NAME) && patch -p0 < $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/readline/patch/readline62-002
	cd $(STAGE_PATH)/$(PKT_NAME) && patch -p0 < $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/readline/patch/readline62-003
	cd $(STAGE_PATH)/$(PKT_NAME) && patch -p0 < $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/readline/patch/readline62-004
	cd $(STAGE_PATH)/$(PKT_NAME) && patch -p0 < $(GIT_TOP_DIR)/src/openwrt-library/backup/package-14.07/readline/patch/readline62-005

clean:
	-rm -rf $(STAGE_PATH)
