PKT_NAME		:= ubus-2015-05-25
PWD_DIR			:= $(shell pwd)
STAGE_PATH		:= $(PWD_DIR)/build_dir
PKT_DIR			:= $(STAGE_PATH)/$(PKT_NAME)

TOOLCHAIN_FILE	:= cmake_install.$(GIT_TARGET_ARCH)
export ROOTFS_DIR 	:= $(GIT_RELEASE_DIR)/rootfs-$(GIT_TARGET_ARCH)

#for install prefix
export DESTDIR  := $(ROOTFS_DIR)

all:
	-mkdir -p $(STAGE_PATH)
	@echo ""
	@echo "=================================="
	@echo "= STAGE_PATH: $(STAGE_PATH)"
	@echo "= tgz: $(PKT_NAME).tar.gz"
	@echo "= PKT_DIR: $(PKT_DIR)"
	@echo "==================================="
	@echo ""
	@if [ ! -d $(PKT_DIR) ];then			   							\
		tar -zxvf $(GIT_TOP_DIR)/src/openwrt-library/backup/package-15.04/ubus/$(PKT_NAME).tar.gz -C $(STAGE_PATH); 		\
		make patch_cmake;												\
	fi
	make build_pkt;


build_pkt:
	@echo "--------- task build --------------"
	mkdir -p $(ROOTFS_DIR)
	pushd $(STAGE_PATH)/build; make VERBOSE=1; popd

install:
	pushd $(STAGE_PATH)/build; make install; popd

patch_cmake:
	cp $(PWD_DIR)/$(TOOLCHAIN_FILE) $(STAGE_PATH)
	mkdir -p $(STAGE_PATH)/build
	cp -rf $(PWD_DIR)/patch/* $(STAGE_PATH)/$(PKT_NAME)
	cd $(STAGE_PATH)/build && cmake -DCMAKE_TOOLCHAIN_FILE=../$(TOOLCHAIN_FILE) ../$(PKT_NAME)

clean:
	-rm -rf $(STAGE_PATH)
