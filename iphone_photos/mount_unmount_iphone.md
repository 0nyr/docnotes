# useful links
how to mount iphone to linux -> https://www.maketecheasier.com/easily-mount-your-iphone-as-an-external-drive-in-ubuntu/
how to unmount disk in linux -> https://www.poftut.com/unmount-disk-in-linux-ubuntu-centos-with-umount-command/
cp command overwrite options -> https://www.rapidtables.com/code/linux/cp/cp-overwrite.html

# install tools - libimobiledevice - ifuse and create mount point
$ sudo apt install libimobiledevice6 libimobiledevice-utils
$ sudo apt install ifuse
$ sudo mkdir /media/iphone

# mount process
$ idevicepair pair
($ usbmuxd -f -v)
$ ifuse /media/iphone

# unmount process
$ mount --- see all mounted drives
$ sudo umount /media/iphone --- unmount specifie

# copy command
cp test.c bak # regular cp usage
cp -r directory1 directory2 # copy directory structure
cp -v ... # verbose option
cp -n # copy without overwritting
cp -vn /media/iphone/DCIM/108APPLE/* /home/onyr/Documents/images/iphone_2020_08_12/DCIM/108APPLE

# mount and unmount once the system is in place (what to do now)
 ❮ onyr ★  kenzae❯ ❮ media❯❯ idevicepair pair
ERROR: Could not validate with device 379020e09c038d525297b4ae57a40f2f2f720f91 because a passcode is set. Please enter the passcode on the device and retry.
 ❮ onyr ★  kenzae❯ ❮ media❯❯ idevicepair pair
SUCCESS: Paired with device 379020e09c038d525297b4ae57a40f2f2f720f91
 ❮ onyr ★  kenzae❯ ❮ media❯❯ ifuse /media/iphone
 ❮ onyr ★  kenzae❯ ❮ media❯❯ sudo umount /media/iphone
[sudo] password for onyr: 

# mount success example
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ idevicepair pair
SUCCESS: Paired with device 379020e09c038d525297b4ae57a40f2f2f720f91
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ usbmuxd -f -v
[14:24:42.145][3] usbmuxd v1.1.0 starting up
[14:24:42.145][0] Could not open lockfile
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ ifuse /media/iphone
fusermount: user has no write access to mountpoint /media/iphone
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ ls -alt /media
total 16
drwxr-xr-x   4 root root 4096 août  11 14:29 .
drwxr-xr-x   2 root root 4096 août  11 14:29 iphone
drwxr-xr-x  25 root root 4096 juil. 24 10:49 ..
drwxr-x---+  2 root root 4096 juin  29 15:08 onyr
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ cd /media
 ❮ onyr ★  kenzae❯ ❮ media❯❯ sudo chmod 777 iphone
 ❮ onyr ★  kenzae❯ ❮ media❯❯ ls -alt
total 16
drwxr-xr-x   4 root root 4096 août  11 14:29 .
drwxrwxrwx   2 root root 4096 août  11 14:29 iphone
drwxr-xr-x  25 root root 4096 juil. 24 10:49 ..
drwxr-x---+  2 root root 4096 juin  29 15:08 onyr
 ❮ onyr ★  kenzae❯ ❮ media❯❯ ifuse /media/iphone

# unmount problem we have had
 ❮ onyr ★  kenzae❯ ❮ media❯❯ sudo su
root@kenzae:/media# ls -alt
ls: cannot access 'iphone': Permission denied
total 12
drwxrwxrwx   4 root root 4096 août  11 14:29 .
drwxr-xr-x  25 root root 4096 juil. 24 10:49 ..
drwxrwxrwx+  2 root root 4096 juin  29 15:08 onyr
d??????????  ? ?    ?       ?              ? iphone
NB - this is probably due to the fact that the drive was on usage. 
WARN - make sure no to use the drive by any software when trying to unmount it

# unmount sucess example
WARN - the "lsblk" command doesn't show the iphone as mounted ?!?!
 ❮ onyr ★  kenzae❯ ❮ media❯❯ mount
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
udev on /dev type devtmpfs (rw,nosuid,relatime,size=3755912k,nr_inodes=938978,mode=755)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /run type tmpfs (rw,nosuid,noexec,relatime,size=755668k,mode=755)
/dev/sda5 on / type ext4 (rw,relatime,errors=remount-ro,data=ordered)
securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
tmpfs on /run/lock type tmpfs (rw,nosuid,nodev,noexec,relatime,size=5120k)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,mode=755)
cgroup on /sys/fs/cgroup/unified type cgroup2 (rw,nosuid,nodev,noexec,relatime,nsdelegate)
cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,relatime,xattr,name=systemd)
pstore on /sys/fs/pstore type pstore (rw,nosuid,nodev,noexec,relatime)
cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relatime,cpuset)
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (rw,nosuid,nodev,noexec,relatime,cpu,cpuacct)
cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relatime,memory)
cgroup on /sys/fs/cgroup/hugetlb type cgroup (rw,nosuid,nodev,noexec,relatime,hugetlb)
cgroup on /sys/fs/cgroup/perf_event type cgroup (rw,nosuid,nodev,noexec,relatime,perf_event)
cgroup on /sys/fs/cgroup/pids type cgroup (rw,nosuid,nodev,noexec,relatime,pids)
cgroup on /sys/fs/cgroup/freezer type cgroup (rw,nosuid,nodev,noexec,relatime,freezer)
cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup (rw,nosuid,nodev,noexec,relatime,net_cls,net_prio)
cgroup on /sys/fs/cgroup/rdma type cgroup (rw,nosuid,nodev,noexec,relatime,rdma)
cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,relatime,devices)
cgroup on /sys/fs/cgroup/blkio type cgroup (rw,nosuid,nodev,noexec,relatime,blkio)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
mqueue on /dev/mqueue type mqueue (rw,relatime)
systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=34,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=14627)
hugetlbfs on /dev/hugepages type hugetlbfs (rw,relatime,pagesize=2M)
configfs on /sys/kernel/config type configfs (rw,relatime)
fusectl on /sys/fs/fuse/connections type fusectl (rw,relatime)
/var/lib/snapd/snaps/core_9436.snap on /snap/core/9436 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/shotcut_68.snap on /snap/shotcut/68 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-characters_550.snap on /snap/gnome-characters/550 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gtk-common-themes_1506.snap on /snap/gtk-common-themes/1506 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-logs_100.snap on /snap/gnome-logs/100 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/standard-notes_10.snap on /snap/standard-notes/10 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-characters_539.snap on /snap/gnome-characters/539 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/core_9665.snap on /snap/core/9665 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-3-26-1604_100.snap on /snap/gnome-3-26-1604/100 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/inkscape_7627.snap on /snap/inkscape/7627 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-calculator_730.snap on /snap/gnome-calculator/730 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gtk2-common-themes_9.snap on /snap/gtk2-common-themes/9 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-3-26-1604_98.snap on /snap/gnome-3-26-1604/98 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/discord_108.snap on /snap/discord/108 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gtk2-common-themes_13.snap on /snap/gtk2-common-themes/13 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/core18_1880.snap on /snap/core18/1880 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-system-monitor_145.snap on /snap/gnome-system-monitor/145 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/audacity_666.snap on /snap/audacity/666 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/inkscape_7601.snap on /snap/inkscape/7601 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gtk-common-themes_1502.snap on /snap/gtk-common-themes/1502 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/discord_109.snap on /snap/discord/109 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-calculator_748.snap on /snap/gnome-calculator/748 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-3-34-1804_33.snap on /snap/gnome-3-34-1804/33 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-logs_93.snap on /snap/gnome-logs/93 type squashfs (ro,nodev,relatime,x-gdu.hide)
binfmt_misc on /proc/sys/fs/binfmt_misc type binfmt_misc (rw,relatime)
/var/lib/snapd/snaps/libxml2_69.snap on /snap/libxml2/69 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/shotcut_67.snap on /snap/shotcut/67 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/core18_1754.snap on /snap/core18/1754 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/postman_119.snap on /snap/postman/119 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-system-monitor_148.snap on /snap/gnome-system-monitor/148 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-3-34-1804_36.snap on /snap/gnome-3-34-1804/36 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-3-28-1804_128.snap on /snap/gnome-3-28-1804/128 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/shattered-pixel-dungeon_237.snap on /snap/shattered-pixel-dungeon/237 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/shattered-pixel-dungeon_249.snap on /snap/shattered-pixel-dungeon/249 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/gnome-3-28-1804_116.snap on /snap/gnome-3-28-1804/116 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/postman_118.snap on /snap/postman/118 type squashfs (ro,nodev,relatime,x-gdu.hide)
/var/lib/snapd/snaps/audacity_675.snap on /snap/audacity/675 type squashfs (ro,nodev,relatime,x-gdu.hide)
tmpfs on /run/user/121 type tmpfs (rw,nosuid,nodev,relatime,size=755668k,mode=700,uid=121,gid=125)
tmpfs on /run/user/1000 type tmpfs (rw,nosuid,nodev,relatime,size=755668k,mode=700,uid=1000,gid=1000)
gvfsd-fuse on /run/user/1000/gvfs type fuse.gvfsd-fuse (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
ifuse on /media/iphone type fuse.ifuse (rw,nosuid,nodev,relatime,user_id=1000,group_id=1000)
tmpfs on /run/user/0 type tmpfs (rw,nosuid,nodev,relatime,size=755668k,mode=700)
 ❮ onyr ★  kenzae❯ ❮ media❯❯ sudo umount /media/iphone 



