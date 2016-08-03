# cross-commpileer package

## ubuntu 

```
make ubuntu
```

## hiv200 (hisi glibc)

```
make hiv200
```

## package source

list | note | OpenWrt (14.07) | OpenWrt(15.04) |
:----|:--------|:---------------------------|:--------------------------|
ncuress | 5.9 | -- | -- |
readline | 6.2 | -- | -- |
lua  | [5.1.5][1] |  5.1.5 | 5.1.5 |
json-c | json-c-0.11 | json-c-0.11 | json-c-0.12 |
libubox | 2014-08-04 | 2014-08-04 | 2015-11-08 |
uci | uci-2014-04-11.1 | uci-2015-08-27.1 |
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


[1]:https://www.lua.org/ftp/lua-5.1.5.tar.gz