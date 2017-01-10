#!/bin/bash

dl_n=hisi-linux.tgz
download_hisi_hiv400(){
    [ ! -f $dl_n ] && {
        curl -c /tmp/cookies "https://drive.google.com/uc?export=download&id=0ByYIdZcmx_I8cGxkWHdZdkxfZnc" > /tmp/intermezzo.html
        curl -L -b /tmp/cookies "https://drive.google.com$(cat /tmp/intermezzo.html | grep -Po 'uc-download-link" [^>]* href="\K[^"]*' | sed 's/\&amp;/\&/g')" > $dl_n
    }
    echo "8541b4b823b43ea5b930e0c89f1b677f  hisi-linux.tgz" > $dl_n.md5
}

chk=$(which arm-hisiv400-linux-gcc)
if [ "x$chk" == "x" ]; then
#install toolchain
    [ ! -d /opt/hisi-linux/x86-arm/arm-hisiv400-linux/target/bin ] && {
        echo "download arm-hisiv400-linux toolchan.."
        [ ! -f $dl_n ] && download_hisi_hiv400
        [ ! -f $dl_n ] && {
            echo "download file fail"
            exit 1
        }

        chk=$(md5sum -c $dl_n.md5 | grep OK)
        [ "x$chk" == "x" ] && {
            echo "$dl_n md5 check fail"
            exit 1
        }

        sudo tar -zxvf $dl_n -C /opt
        [ $? != 0 ] && {
            echo "install $dl_n fail"
            exit 1
        }
        rm $dl_n
        rm $dl_n.md5
    }
fi
