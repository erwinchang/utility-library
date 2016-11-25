
all:
	@make -Cncurses || exit 1
	@make -Cncurses install || exit 1
	@make -Creadline || exit 1
	@make -Creadline install || exit 1
	@make -Clua || exit 1
	@make -Clua install || exit 1
	@make -Cjson-c || exit 1
	@make -Cjson-c install || exit 1
	@make -Clibubox || exit 1
	@make -Clibubox install || exit 1
	@make -Cuci || exit 1
	@make -Cuci install || exit 1
	@make -Cubus || exit 1
	@make -Cubus install || exit 1

clean:
	@make -Cncurses clean || exit 1
	@make -Creadline clean || exit 1
	@make -Clua clean || exit 1
	@make -Cjson-c clean || exit 1
	@make -Clibubox clean || exit 1
	@make -Cuci clean || exit 1
	@make -Cubus clean || exit 1
	@rm -rf $(GIT_RELEASE_DIR)/rootfs-$(GIT_TARGET_ARCH)
