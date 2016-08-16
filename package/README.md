# Package Utility Library

## LuaSocket

- 出處：[Network support for the Lua language][3]

LuaSocket is a Lua extension library that is composed by two parts: a C core that provides support for the TCP and UDP transport layers, and a set of Lua modules that add support for functionality commonly needed by applications that deal with the Internet. 

- 產生檔案

```   
└── usr
    └── local
        ├── lib
        │   └── lua
        │       └── 5.1
        │           ├── mime
        │           │   └── core.so
        │           └── socket
        │               └── core.so
        └── share
            └── lua
                └── 5.1
                    ├── ltn12.lua
                    ├── mime.lua
                    ├── socket
                    │   ├── ftp.lua
                    │   ├── headers.lua
                    │   ├── http.lua
                    │   ├── smtp.lua
                    │   ├── tp.lua
                    │   └── url.lua
                    └── socket.lua
 

```
- file size

```
-rwxr-xr-x 1 root root 68K Aug 16 10:58 core.so
-rwxr-xr-x 1 root root 876K Aug 16 10:58 core.so
```

- 參考來源

- [github luasocket][1]
- [LuaSocket 初探][2]

[1]:https://github.com/diegonehab/luasocket
[2]:https://www.photoneray.com/luasocket/
[3]:w3.impa.br/~diego/software/luasocket/
