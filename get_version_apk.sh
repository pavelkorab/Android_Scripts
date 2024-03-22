#!/bin/bash
###########################################################
#                 Узнать версию apk                       #
# 1. Подключите телефон по ADB                            #
# 2. Запусите скрипт ./get_version_apk.sh $PACKAGENAME    #
###########################################################


PACKAGENAME="$1"
if [[ -z $PACKAGENAME ]]
then
        echo -e "Укажите имя пакета:\n\t$0 \$PACKAGENAME"
        exit 1
fi
PACKAGE_FROM_PATH="$(adb shell pm path $PACKAGENAME | awk -F: '{print $2}')"
PACKAGE_TO_PATH="$(dirname $(readlink -f $0))/$PACKAGENAME.apk"

get_apk_version(){
        adb shell dumpsys package ${PACKAGENAME} | grep versionName | awk -F= '{print $2}'
}

get_apk_version