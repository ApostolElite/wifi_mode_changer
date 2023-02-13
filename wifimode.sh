#!/bin/bash

clear

echo "Wifi mode changer credits Apostol"
echo 
echo "Выберите параметр для запуска:"
echo "1) Перевод адаптера в режим монитора"
echo "2) Перевод в нормальный режим"
echo "3) Отключить wifi"
echo "4) Выход"

read doing
case $doing in
1)
su -c "ip link set wlan0 down; echo 4 > /sys/module/wlan/parameters/con_mode;ip link set wlan0 up"
;;
2)
su -c "ip link set wlan0 down; echo 0 > /sys/module/wlan/parameters/con_mode;ip link set wlan0 up; svc wifi enable"
;;
3)
su -c "ip link set wlan0 down; echo 0 > /sys/module/wlan/parameters/con_mode;svc wifi disable"
;;
4)
clear
exit 0
;;
*) 
echo "Введено неправильное действие"

esac
