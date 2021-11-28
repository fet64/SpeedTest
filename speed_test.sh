#!/bin/bash

#######################################
# WARNING: THIS SCRIPT WILL OVERWRITE #
# EVERYTHING ON /dev/sda,             #
# Use at own risk!                    #
#######################################

clear_ram() {
	echo "clear cache:"
	echo "sync; echo 1 > /proc/sys/vm/drop_caches"
	sync; echo 1 > /proc/sys/vm/drop_caches
	echo "sync; echo 2 > /proc/sys/vm/drop_caches"
	sync; echo 2 > /proc/sys/vm/drop_caches
	echo "sync; echo 3 > /proc/sys/vm/drop_caches"
	sync; echo 3 > /proc/sys/vm/drop_caches
}


echo "Speed test"
echo
echo "ISO file:"
echo "rw-r--r-- 1 nobody kvm 2.1G Nov 27 12:46 archlinux-gui-plasma-2021.10-b-x86_64.iso"
echo "usb-device:"
echo "NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS"
echo "sda      8:0    1 29.3G  0 disk" 
echo

clear_ram

echo "Testing cat: time cat archlinux-gui-plasma-2021.10-b-x86_64.iso > /dev/sda"
time cat archlinux-gui-plasma-2021.10-b-x86_64.iso > /dev/sda
echo "---"
sleep 1
clear_ram

echo "Testing cp: time cp archlinux-gui-plasma-2021.10-b-x86_64.iso /dev/sda"
time cp archlinux-gui-plasma-2021.10-b-x86_64.iso /dev/sda
echo "---"
sleep 1
clear_ram

echo "Testing dd: time dd if=archlinux-gui-plasma-2021.10-b-x86_64.iso of=/dev/sda bs=4M status=prgress conv=fsync oflag=direct"
time dd if=archlinux-gui-plasma-2021.10-b-x86_64.iso of=/dev/sda bs=4M status=progress conv=fsync oflag=direct
echo "---"
sleep 1
clear_ram

echo "Testing tee: time tee < archlinux-gui-plasma-2021.10-b-x86_64.iso > /dev/sda"
time tee < archlinux-gui-plasma-2021.10-b-x86_64.iso > /dev/sda
echo "---"
sleep 1
