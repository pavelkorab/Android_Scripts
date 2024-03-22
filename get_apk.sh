#!/bin/bash
###########################################################
#              Достать apk с Android                      #
# 1. Подключите телефон по ADB                            #
# 2. Запусите скрипт ./get_apk $PACKAGENAME               #
###########################################################


PACKAGENAME="$1"
if [[ -z $PACKAGENAME ]]
then
	echo -e "Укажите имя пакета:\n\t$0 \$PACKAGENAME"
	exit 1
fi
PACKAGE_FROM_PATH="$(adb shell pm path $PACKAGENAME | awk -F: '{print $2}')"
PACKAGE_TO_PATH="$(dirname $(readlink -f $0))/$PACKAGENAME.apk"

get_apk(){
	adb pull ${PACKAGE_FROM_PATH} ${PACKAGE_TO_PATH} 
}

get_apk

