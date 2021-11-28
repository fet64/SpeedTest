# SpeedTest
Testing 4 different ways of moving data from iso-file to usb-device. If you use this: make sure you want to overwrite <b>/dev/sda</b>

Link to iso: https://archlinuxgui.in/download.html

## Result
```
[root@arch Downloads]# ./speed_test.sh 
Speed test

ISO file:
rw-r--r-- 1 nobody kvm 2.1G Nov 27 12:46 archlinux-gui-plasma-2021.10-b-x86_64.iso
usb-device:
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda      8:0    1 29.3G  0 disk

clear cache:
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches
Testing cat: time cat archlinux-gui-plasma-2021.10-b-x86_64.iso > /dev/sda

real    1m52.955s
user    0m0.000s
sys     0m1.778s
---
clear cache:
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches
Testing cp: time cp archlinux-gui-plasma-2021.10-b-x86_64.iso /dev/sda

real    2m47.249s
user    0m0.000s
sys     0m1.890s
---
clear cache:
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches
Testing dd: time dd if=archlinux-gui-plasma-2021.10-b-x86_64.iso of=/dev/sda bs=4M status=prgress conv=fsync oflag=direct
2155872256 bytes (2.2 GB, 2.0 GiB) copied, 83 s, 25.9 MB/s 
518+1 records in
518+1 records out
2173333504 bytes (2.2 GB, 2.0 GiB) copied, 83.6068 s, 26.0 MB/s

real    1m23.613s
user    0m0.013s
sys     0m2.635s
---
clear cache:
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches
Testing tee: time tee < archlinux-gui-plasma-2021.10-b-x86_64.iso > /dev/sda

real    3m14.098s
user    0m0.047s
sys     0m2.040s
---
[root@arch Downloads]# 

```
