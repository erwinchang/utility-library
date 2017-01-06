# Utility Library

## list

- src
 - library
 simclist
 
 - openwrt-library

## cross-commpileer package

### 如何建立build code的環境

- 安裝docker
請參考:[Install Docker on Ubuntu][4]
```
$ docker -v
Docker version 1.12.1, build 23cf638
```

- 下載執行環境
```
git clone git@github.com:erwinchang/docker.git
```

- 進入docker( image: erwinchang/ubuntu-12.04-32bit-build)
```
cd docker/build-env/build
./run.sh
```

## hiv100 build 
建入docker後，souce hiv100_env即可
```
source hiv100_env
cd openwrt-library
make
```

## hiv300 build 
建入docker後，souce hiv100_env即可
```
source hiv300_env
cd openwrt-library
make
```

### [OpenWrt source repository downloads][2]

- 15.05 branch (Chaos Calmer)

```
git clone git://git.openwrt.org/15.05/openwrt.git
```

- 14.07 branch (Barrier Breaker)

```
git clone git://git.openwrt.org/14.07/openwrt.git
```

## OpenWrt  Note

- 15.04

```
$ git log
commit 42f9f6244af96bae52acbf5854b82df23bb0f2d3
Author: rmilecki <rmilecki@3c298f89-4303-0410-b956-a3cf2f4a3e73>
Date:   Tue Apr 5 06:47:11 2016 +0000

    bcm53xx: fixup 14e4:d612 device class to bridge as well
    
    14e4:d612 was found in D-Link DIR-885L and Netgear R8500. It's most
    likely a bridge used by all 14e4:4365 BCM4366 devices.
    
    Without this fixup device wasn't treated as a bridge:
    [    2.849895] pci 0000:00:00.0: ignoring class 0x020000 (doesn't match header type 01)
    and didn't get its resources assigned. This resulted in child devices
    not being able to get any resources (due to the parrent missing them):
    [    3.375428] pci 0000:01:00.0: BAR 2: no space for [mem size 0x00400000 64bit]
    [    3.387949] pci 0000:01:00.0: BAR 2: failed to assign [mem size 0x00400000 64bit]
    [    3.725797] pci 0000:01:00.0: BAR 0: no space for [mem size 0x00008000 64bit]
    [    3.738314] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x00008000 64bit]
    
    Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
    
    git-svn-id: svn://svn.openwrt.org/openwrt/branches/chaos_calmer@49118 3c298f89-4303-0410-b956-a3cf2f4a3e73
```

- 14.07 

```
$ git log
commit b763ba211deeab857ef7c2e5275e92c15dd5e249
Author: jow <jow@3c298f89-4303-0410-b956-a3cf2f4a3e73>
Date:   Fri Jan 29 13:25:24 2016 +0000

    BB: openssl: update to 1.0.2f (fixes CVE-2016-0701, CVE-2015-3197)
    
    Signed-off-by: Felix Fietkau <nbd@openwrt.org>
    Signed-off-by: Jo-Philipp Wich <jow@openwrt.org>
    
    Backport of r48531.
    
    git-svn-id: svn://svn.openwrt.org/openwrt/branches/barrier_breaker@48549 3c298f89-4303-0410-b956-a3cf2f4a3e73
```

### openwrt-library

- [openwrt project package list ][1]

目前使用到的共用library

- libubox
 C utility functions for OpenWrt

- uci
 OpenWrt Unified Configuration Interface

- libubus
 OpenWrt system message/RPC bus 

## Package Source

list | OpenWrt (14.07) | OpenWrt(15.04) |
:----|:---------------------------|:--------------------------|
ncuress (5.9) | -- | -- |
readline (6.2) | -- | -- |
lua  |  [5.1.5][3] | 5.1.5 |
json-c | json-c-0.11 | json-c-0.12 |
libubox |  2014-08-04 | 2015-11-08 |
uci |  uci-2014-04-11.1 | uci-2015-08-27.1 |
ubus |  ubus-2014-09-17 | ubus-2015-05-25 |

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

## Git 設定

- 請先把 autocrlf 關閉

```
it config --global core.autocrlf false
```

- 關閉顯示 Modified (File Mode) 的檔案

```
git config core.filemode false
```

[1]:http://git.openwrt.org/?a=project_list;pf=project
[2]:https://dev.openwrt.org/wiki/GetSource
[3]:https://www.lua.org/ftp/lua-5.1.5.tar.gz
[4]:https://docs.docker.com/engine/installation/linux/ubuntulinux/
