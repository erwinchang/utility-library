PKT_NAME		:= json-c-0.12
PWD_DIR			:= $(shell pwd)
STAGE_PATH		:= $(PWD_DIR)/build_dir
PKT_DIR			:= $(STAGE_PATH)/$(PKT_NAME)

export ROOTFS_DIR   := $(GIT_RELEASE_DIR)/rootfs-$(GIT_TARGET_ARCH)

ifeq (hiv100,$(GIT_TARGET_ARCH))
export CROSS 		:= arm-hisiv100nptl-linux
SFLAG				:= -march=armv7-a -mcpu=cortex-a9
endif

ifeq (hiv300,$(GIT_TARGET_ARCH))
export CROSS 		:= arm-hisiv300-linux
SFLAG				:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon-vfpv4 -mno-unaligned-access -fno-aggressive-loop-optimizations
endif

ifeq (hiv400,$(GIT_TARGET_ARCH))
export CROSS 		:= arm-hisiv400-linux
SFLAG				:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon-vfpv4 -mno-unaligned-access -fno-aggressive-loop-optimizations
endif

export ac_cv_func_malloc_0_nonnull=yes
export ac_cv_func_realloc_0_nonnull=yes

export TARGETMACH	:= $(CROSS)
export CC  			:= $(CROSS)-gcc

all:
	-mkdir -p $(STAGE_PATH)
	@echo ""
	@echo "=================================="
	@echo "= STAGE_PATH: $(STAGE_PATH)"
	@echo "= tgz: $(PKT_NAME).tgz"
	@echo "= PKT_DIR: $(PKT_DIR)"
	@echo "==================================="
	@echo ""
	@if [ ! -d $(PKT_DIR) ];then			   							\
		tar -zxvf $(GIT_TOP_DIR)/src/openwrt-library/backup/package-15.04/json-c/$(PKT_NAME).tar.gz -C $(STAGE_PATH); 		\
	fi
	make build_pkt;


build_pkt:
	@echo "--------- task build --------------"
	-mkdir -p $(ROOTFS_DIR)
	pushd $(PKT_DIR); ./configure CC=$(CC) CFLAGS='$(SFLAG)' CPPFLAGS='$(SFLAG)' --prefix=$(ROOTFS_DIR) --host=$(TARGETMACH); popd
	cp -rf $(GIT_TOP_DIR)/src/openwrt-library/backup/package-15.04/json-c/patch/* $(PKT_DIR)
	pushd $(PKT_DIR); make; popd

install:
	pushd $(PKT_DIR); make install; popd

clean:
	-rm -rf $(STAGE_PATH)
