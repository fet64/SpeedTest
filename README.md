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

real    2m28.451s
user    0m0.014s
sys     0m1.630s
---
clear cache:
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches
Testing cp: time cp archlinux-gui-plasma-2021.10-b-x86_64.iso /dev/sda

real    3m26.234s
user    0m0.003s
sys     0m1.838s
---
clear cache:
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches
Testing dd: time dd if=archlinux-gui-plasma-2021.10-b-x86_64.iso of=/dev/sda bs=4M status=prgress conv=fsync oflag=direct
2160066560 bytes (2.2 GB, 2.0 GiB) copied, 84 s, 25.7 MB/s 
518+1 records in
518+1 records out
2173333504 bytes (2.2 GB, 2.0 GiB) copied, 84.2228 s, 25.8 MB/s

real    1m24.231s
user    0m0.021s
sys     0m2.818s
---
clear cache:
sync; echo 1 > /proc/sys/vm/drop_caches
sync; echo 2 > /proc/sys/vm/drop_caches
sync; echo 3 > /proc/sys/vm/drop_caches
Testing tee: time tee < archlinux-gui-plasma-2021.10-b-x86_64.iso > /dev/sda

real    2m59.881s
user    0m0.053s
sys     0m1.890s
---


```
