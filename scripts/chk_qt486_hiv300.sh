#!/bin/bash

qt_n=Qt4.8.6-hisiv300.tgz

download_hisi_qt486_hisiv300(){
    [ ! -f $qt_n ]  && curl -L -b /tmp/cookies "https://drive.google.com/uc?export=download&confirm=IMZq&id=0ByYIdZcmx_I8b3RKbHNDZzNlOVU" > $qt_n
    echo "b26c8192054da0fe3d18b96f550ecadb  Qt4.8.6-hisiv300.tgz" > $qt_n.md5
}

#check qt library
if [ ! -d  /usr/local/Trolltech/Qt4.8.6-hisiv300 ]; then
    echo "download $qt_n"
    [ ! -f $qt_n ] && download_hisi_qt486_hisiv300
    [ ! -f $qt_n ] && {
        echo "download file fail"
        exit 1
    }

    chk=$(md5sum -c $qt_n.md5 | grep OK)
    [ "x$chk" == "x" ] && {
        echo "$qt_n md5 check fail"
    }

    sudo mkdir -p /usr/local/Trolltech
    sudo tar -zxvf $qt_n -C /usr/local/Trolltech
    [ $? != 0 ] && {
        echo "install $qt_n fail"
        exit 1
    }
    rm $qt_n
    rm $qt_n.md5
fi