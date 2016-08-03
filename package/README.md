# cross-commpileer package

## ubuntu 

- build docker:  erwinchang/ubuntu-12.04-32bit-build

```
make ubuntu
```

## hiv200 (hisi glibc)

- build docker: erwinchang/build-hiv200

```
make hiv200
```

## hiv100 (hisi uclibc)

- build docker: erwinchang/build-hiv100

```
make hiv100
```

## package source

list | note | OpenWrt (14.07) | OpenWrt(15.04) |
:----|:--------|:---------------------------|:--------------------------|
ncuress | 5.9 | -- | -- |
readline | 6.2 | -- | -- |
lua  | [5.1.5][1] |  5.1.5 | 5.1.5 |
json-c | json-c-0.11 | json-c-0.11 | json-c-0.12 |
libubox | 2014-08-04 | 2014-08-04 | 2015-11-08 |
uci | uci-2014-04-11.1 | uci-2014-04-11.1 | uci-2015-08-27.1 |
ubus | ubus-2014-09-17 | ubus-2014-09-17 | ubus-2015-05-25 |

- json-c
 - libjson-c.so   
 由 arraylist.c debug.c json_c_version.c json_object.c json_object_iterator.c json_tokener.c json_util.c linkhash.c printbuf.c 產生

 - libjson.so  
 由 libjson.c 產生

- libubox 產生下例檔案
 - libubx.so
 - libblobmsg_json.so
 - jshn
 - libjson_script.so
 - for lua: uloop.so

- ubus 產生下例檔案
 -  libusbus.so
 - bin: ubus, ubusd
 - example: client, server

## package libary

- support binary

```
xx/rootfs/rootfs-hiv200# ls -lh bin
lrwxrwxrwx 1 root root    3 Aug  3 08:02 captoinfo -> tic
-rwxr-xr-x 1 root root 8.3K Aug  3 08:02 clear
-rwxr-xr-x 1 root root  56K Aug  3 08:02 infocmp
lrwxrwxrwx 1 root root    3 Aug  3 08:02 infotocap -> tic
-rwxr-xr-x 1 root root 241K Aug  3 08:03 lua
-rwxr-xr-x 1 root root 173K Aug  3 08:03 luac
-rwxr-xr-x 1 root root 5.4K Aug  3 08:02 ncurses5-config
lrwxrwxrwx 1 root root    4 Aug  3 08:02 reset -> tset
-rwxr-xr-x 1 root root  15K Aug  3 08:02 tabs
-rwxr-xr-x 1 root root  62K Aug  3 08:02 tic
-rwxr-xr-x 1 root root  15K Aug  3 08:02 toe
-rwxr-xr-x 1 root root  17K Aug  3 08:02 tput
-rwxr-xr-x 1 root root  23K Aug  3 08:02 tset
-rwxr-xr-x 1 root root  67K Aug  3 08:03 uci

xxx/rootfs-hiv200# ls -lh usr/local/bin
-rwxr-xr-x 1 root root 61K Aug  3 08:03 jshn
-rwxr-xr-x 1 root root 90K Aug  3 08:03 ubus
```
- support library

```
xx/rootfs/rootfs-hiv200# ls -lh usr/local/lib/*.so                                                
-rw-r--r-- 1 root root  59K Aug  3 08:03 usr/local/lib/libblobmsg_json.so
-rw-r--r-- 1 root root  69K Aug  3 08:03 usr/local/lib/libjson_script.so
-rw-r--r-- 1 root root 541K Aug  3 08:03 usr/local/lib/libubox.so
-rw-r--r-- 1 root root 335K Aug  3 08:03 usr/local/lib/libubus.so

xx/rootfs/rootfs-hiv200# ls -lh lib/*.so*
xx
-r-xr-xr-x 1 root root 528K Aug  3 08:03 lib/libreadline.so.6.2
-rw-r--r-- 1 root root 328K Aug  3 08:03 lib/libuci.so
```

[1]:https://www.lua.org/ftp/lua-5.1.5.tar.gz