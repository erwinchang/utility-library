## Pakcate Source

- 使用OpenWrt 15.04 package

list | note | OpenWrt (14.07) | OpenWrt(15.04) |
:----|:--------|:---------------------------|:--------------------------|
ncuress | 5.9 | -- | -- |
readline | 6.2 | -- | -- |
lua  | [5.1.5][1] |  5.1.5 | 5.1.5 |
json-c | json-c-0.12 | json-c-0.11 | json-c-0.12 |
libubox | 2015-11-08 | 2014-08-04 | 2015-11-08 |
uci | uci-2015-08-27.1 | uci-2014-04-11.1 | uci-2015-08-27.1 |
ubus | ubus-2015-05-25 | ubus-2014-09-17 | ubus-2015-05-25 |

## Package Libary

- support binary

```
xxx/rootfs/rootfs-hiv200# ls -lh bin
total 708K
lrwxrwxrwx 1 root root    3 Aug  4 01:55 captoinfo -> tic
-rwxr-xr-x 1 root root 8.3K Aug  4 01:55 clear
-rwxr-xr-x 1 root root  56K Aug  4 01:55 infocmp
lrwxrwxrwx 1 root root    3 Aug  4 01:55 infotocap -> tic
-rwxr-xr-x 1 root root 241K Aug  4 01:56 lua
-rwxr-xr-x 1 root root 173K Aug  4 01:56 luac
-rwxr-xr-x 1 root root 5.4K Aug  4 01:55 ncurses5-config
lrwxrwxrwx 1 root root    4 Aug  4 01:55 reset -> tset
-rwxr-xr-x 1 root root  15K Aug  4 01:55 tabs
-rwxr-xr-x 1 root root  62K Aug  4 01:55 tic
-rwxr-xr-x 1 root root  15K Aug  4 01:55 toe
-rwxr-xr-x 1 root root  17K Aug  4 01:55 tput
-rwxr-xr-x 1 root root  23K Aug  4 01:55 tset
-rwxr-xr-x 1 root root  72K Aug  4 01:56 uci

xxx/rootfs/rootfs-hiv200# ls -lh usr/local/bin                                               
total 156K
-rwxr-xr-x 1 root root 61K Aug  4 01:56 jshn
-rwxr-xr-x 1 root root 90K Aug  4 01:56 ubus

xx/rootfs/rootfs-hiv200# ls -lh usr/local/sbin/
total 332K
-rwxr-xr-x 1 root root 329K Aug  4 01:56 ubusd
```

- support library

```

xxxrootfs/rootfs-hiv200# ls -lh lib/
total 3.7M
lrwxrwxrwx 1 root root   12 Aug  4 01:55 libcurses.a -> libncurses.a
lrwxrwxrwx 1 root root   17 Aug  4 01:55 libcurses.so -> libncurses.so.5.9
-rw-r--r-- 1 root root  93K Aug  4 01:55 libform.a
lrwxrwxrwx 1 root root   12 Aug  4 01:55 libform.so -> libform.so.5
lrwxrwxrwx 1 root root   14 Aug  4 01:55 libform.so.5 -> libform.so.5.9
-rwxr-xr-x 1 root root  68K Aug  4 01:55 libform.so.5.9
-rw-r--r-- 1 root root 103K Aug  4 01:56 libhistory.a
lrwxrwxrwx 1 root root   15 Aug  4 01:56 libhistory.so -> libhistory.so.6
lrwxrwxrwx 1 root root   17 Aug  4 01:56 libhistory.so.6 -> libhistory.so.6.2
-r-xr-xr-x 1 root root  78K Aug  4 01:56 libhistory.so.6.2
-rw-r--r-- 1 root root 141K Aug  4 01:56 libjson-c.a
-rwxr-xr-x 1 root root 1019 Aug  4 01:56 libjson-c.la
lrwxrwxrwx 1 root root   18 Aug  4 01:56 libjson-c.so -> libjson-c.so.2.0.1
lrwxrwxrwx 1 root root   18 Aug  4 01:56 libjson-c.so.2 -> libjson-c.so.2.0.1
-rwxr-xr-x 1 root root 137K Aug  4 01:56 libjson-c.so.2.0.1
lrwxrwxrwx 1 root root   18 Aug  4 01:56 liblua5.1.so.0 -> liblua5.1.so.0.0.0
-rw-r--r-- 1 root root 243K Aug  4 01:56 liblua5.1.so.0.0.0
-rw-r--r-- 1 root root 283K Aug  4 01:56 liblua.a
-rw-r--r-- 1 root root  51K Aug  4 01:55 libmenu.a
lrwxrwxrwx 1 root root   12 Aug  4 01:55 libmenu.so -> libmenu.so.5
lrwxrwxrwx 1 root root   14 Aug  4 01:55 libmenu.so.5 -> libmenu.so.5.9
-rwxr-xr-x 1 root root  36K Aug  4 01:55 libmenu.so.5.9
-rw-r--r-- 1 root root 446K Aug  4 01:55 libncurses.a
-rw-r--r-- 1 root root 148K Aug  4 01:55 libncurses++.a
lrwxrwxrwx 1 root root   15 Aug  4 01:55 libncurses.so -> libncurses.so.5
lrwxrwxrwx 1 root root   17 Aug  4 01:55 libncurses.so.5 -> libncurses.so.5.9
-rwxr-xr-x 1 root root 327K Aug  4 01:55 libncurses.so.5.9
-rw-r--r-- 1 root root  23K Aug  4 01:55 libpanel.a
lrwxrwxrwx 1 root root   13 Aug  4 01:55 libpanel.so -> libpanel.so.5
lrwxrwxrwx 1 root root   15 Aug  4 01:55 libpanel.so.5 -> libpanel.so.5.9
-rwxr-xr-x 1 root root  15K Aug  4 01:55 libpanel.so.5.9
-rw-r--r-- 1 root root 698K Aug  4 01:56 libreadline.a
lrwxrwxrwx 1 root root   16 Aug  4 01:56 libreadline.so -> libreadline.so.6
lrwxrwxrwx 1 root root   18 Aug  4 01:56 libreadline.so.6 -> libreadline.so.6.2
-r-xr-xr-x 1 root root 528K Aug  4 01:56 libreadline.so.6.2
-rw-r--r-- 1 root root 331K Aug  4 01:56 libuci.so
drwxr-xr-x 3 root root 4.0K Aug  4 01:56 lua
drwxr-xr-x 2 root root 4.0K Aug  4 01:56 pkgconfig
lrwxrwxrwx 1 root root   17 Aug  4 01:55 terminfo -> ../share/terminfo

xxx/rootfs/rootfs-hiv200# ls -lh usr/local/lib/
total 1.6M
-rw-r--r-- 1 root root  59K Aug  4 01:56 libblobmsg_json.so
-rw-r--r-- 1 root root  70K Aug  4 01:56 libjson_script.so
-rw-r--r-- 1 root root 569K Aug  4 01:56 libubox.a
-rw-r--r-- 1 root root 531K Aug  4 01:56 libubox.so
-rw-r--r-- 1 root root 336K Aug  4 01:56 libubus.so
drwxr-xr-x 3 root root 4.0K Aug  4 01:56 lua

```

[1]:https://www.lua.org/ftp/lua-5.1.5.tar.gz
