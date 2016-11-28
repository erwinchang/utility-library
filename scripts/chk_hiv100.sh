#!/bin/bash

dl_n=hisi-linux-nptl.tgz
download_hisi_hiv100(){
    [ ! -f hisi-linux-nptl.tgz ] && {
        curl -c /tmp/cookies "https://drive.google.com/uc?export=download&id=0ByYIdZcmx_I8ZU94bWNSMXRiakE" > /tmp/intermezzo.html
        curl -L -b /tmp/cookies "https://drive.google.com$(cat /tmp/intermezzo.html | grep -Po 'uc-download-link" [^>]* href="\K[^"]*' | sed 's/\&amp;/\&/g')" > $dl_n
    }
    echo "4213351a92eb247f8bb59540882cd11c  hisi-linux-nptl.tgz" > $dl_n.md5
}

chk=$(which arm-hisiv100nptl-linux-gcc)
if [ "x$chk" == "x" ]; then
#install toolchain
    [ ! -d /opt/hisi-linux-nptl/arm-hisiv100-linux/target/bin ] && {
        echo "download arm-hisiv100-linux toolchan.."
        [ ! -f $dl_n ] && download_hisi_hiv100
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
