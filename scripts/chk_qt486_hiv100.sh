#!/bin/bash

qt_n=Qt4.8.6-hisiv100.tgz
download_hisi_qt486_hiv100(){
    [ ! -f Qt4.8.6-hisiv100.tgz ]  && curl -L -b /tmp/cookies "https://drive.google.com/uc?export=download&confirm=IMZq&id=0ByYIdZcmx_I8SzZRMEJMaGRVUVk" > $qt_n
    echo "d61430c010cb76c9782155ffaa07a143  $qt_n" > $qt_n.md5
}
#check qt library
if [ ! -d  /usr/local/Trolltech/Qt4.8.6-hisiv100 ]; then
    echo "download $qt_n"
    [ ! -f $qt_n ] && download_hisi_qt486_hiv100
    [ ! -f $qt_n ] && {
        echo "download file fail"
        exit 1
    }

    chk=$(md5sum -c $qt_n.md5 | grep OK)
    [ "x$chk" == "x" ] && {
        echo "$qt_n md5 check fail"
    }

    sudo mkdir -p /usr/local/Trolltech
    sudo tar -zxvf Qt4.8.6-hisiv100.tgz -C /usr/local/Trolltech
    [ $? != 0 ] && {
        echo "install $qt_n fail"
        exit 1
    }
    rm $qt_n
    rm $qt_n.md5
fi
