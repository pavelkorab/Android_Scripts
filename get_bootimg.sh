#!/bin/bash
###########################################################
#              Достать boot.img с Android                 #
# 1. Подключите телефон по ADB                            #
# 2. Запусите скрипт ./get_bootimg.sh                     #
###########################################################

suffix=$(adb shell getprop | grep ro.boot.slot_suffix | awk -F: '{print $2}' | sed 's/[^a-z]//g')

adb shell <<-EOF
su
dd if=/dev/block/by-name/boot_$suffix of=/sdcard/boot-from-device.img
EOF

mkdir /tmp/boot
adb pull /sdcard/boot-from-device.img /tmp/boot