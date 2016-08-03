# Utility Library

## openwrt utilities

- [openwrt project][1]

目前使用到的共用library

- libubox
 C utility functions for OpenWrt

- uci
 OpenWrt Unified Configuration Interface

- libubus
 OpenWrt system message/RPC bus 

## [OpenWrt source repository downloads][2]

- 15.05 branch (Chaos Calmer)

```
git clone git://git.openwrt.org/15.05/openwrt.git
```

- 14.07 branch (Barrier Breaker)

```
git clone git://git.openwrt.org/14.07/openwrt.git
```

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
