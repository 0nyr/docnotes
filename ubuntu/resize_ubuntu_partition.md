# How to resize Ubuntu Partition

> Guide from [Joe Januszkuewicz](http://joejanuszk.com/)

## Increasing the Size of an Ubuntu Partition when

Dual Booted with Windows 8

Posted on

About a year and a half ago, I installed Ubuntu on my laptop so I
could dual boot with the original Windows 8 installation. At the
time, I wasn’t sure if I would stick with Ubuntu, so I was
conservative with how much disk space I allocated to the Ubuntu
partition. However, I’ve been using Ubuntu as my primary OS since
then, and I’d been starting to want more disk space.

The obvious solution was to shrink the Windows partition and
expand the Ubuntu partition. On a high level, this process consisted
of three steps:

1. Create a bootable USB stick
   containing GParted, a partitioning utility.
2. Shrink the Windows partition.
3. Expand the Ubuntu partition using GParted.

I used a combination of command line and GUI utilities. More
detail is given below.

## Step One: Create a bootable USB stick containing GParted

[GParted](http://gparted.org/index.php) is “a free
partition manager that enables you to resize, copy, and move
partitions without data loss.” After googling around a bit, this
seemed like the best option for resizing the Ubuntu partition. Since
you can’t resize the Ubuntu partition while it is running ([not
true apparently](http://askubuntu.com/a/116367), although I didn’t want to risk it), it was
necessary to create a bootable USB stick to boot GParted and perform
the resize from there. A CD/DVD would also work, but my laptop
doesn’t have a CD drive.

To do this, I did the following while running Ubuntu:

1. Found a spare 1GB USB flash drive.
   Note that 1GB is far more than necessary to create the GParted
   image, so use a small spare flash drive like this.
2. [Downloaded
   the GParted image](http://gparted.org/download.php). GParted Live comes in three different
   architectures:

   * i586
   * i686-PAE
   * amd64

   This is a spot where I was a bit
   unsure. Although my computer has an Intel i7-3537U processor, the
   accompanying description of the amd64 (64-bit, newer computer with
   UEFI instead of legacy BIOS) seemed to match my situation better
   than the i586 (32-bit, but “if in doubt, try this one first”) or
   the i686-PAE. Ultimately, I went with the **amd64**
   architecture, and it worked for me on the first try.
3. [Create
   the live USB](http://gparted.org/liveusb.php). **GNU/Linux Method D: Manual - Overwrite**
   seemed to me to be the easiest method, so I went with a variation of
   that, as follows:

   * With the USB flash drive NOT
     plugged in, open up a terminal and run `df -h`
     to see what devices are currently mounted.
   * Plug in the flash drive and run
     `df -h` again. You should see a new
     device. In my case, it was `/dev/sdb1`,
     but this will likely differ for you, so make sure to note the
     correct device for your specific case.
   * Unmount the flash drive. Ubuntu
     automatically mounted the flash drive as a storage device, so it
     was a good idea to unmount it before beginning. I did this via
     Ubuntu’s “Files” GUI, although it can also be done through
     the command line via `umount /dev/sbd1`.
     Again, replace `sdb1` to match your
     specific case.
   * Format the drive. I also did this
     via the Files GUI, by right clicking on the flash drive and
     clicking Format. You should select FAT as the file system.  **This
     will erase all contents of the flash drive** , so make there
     you haven’t left anything important on there.
   * Run `dmesg`.
     Assuming you haven’t plugged in or unplugged any devices other
     than the flash drive in the previous steps, you should see a bunch
     of stuff related to the flash drive. In my case, this was lots of
     lines containing `/dev/sdb`. Take note
     of what this is. Note that it is NOT `/dev/sbd1`,
     since that is just a particular partition, whereas we will need the
     entire disk.
   * Run `sudo dd if=`**~/Downloads/gparted-live-0.24.0-2-amd64.iso** ` of=`**/dev/sdb** ` bs=4M; sync` to create the live USB. Make sure to:

     * Replace
       **~/Downloads/gparted-live-0.24.0-2-amd64.iso** with
       the actual path to the GParted image
     * Replace **/dev/sdb**
       with the actual device you want to install GParted on.

     Be **very** careful with this step, as the `dd`
     utility could easily overwrite the wrong partition and brick your
     computer. Make sure you have not made any typos when specifying the
     device.

At this point, you should have a valid live USB containing
GParted.

Note

Creating the live USB actually didn’t go quite as smoothly for
me as described above. I didn’t format the flash drive on my first
try, and saw a bunch of weird errors when trying to mount it in the
Files GUI after running `dd`. I thought I
bricked the flash drive, so I then formatted it and tried again, only
to still see those errors. It also wouldn’t appear in Files if I
unplugged it and then plugged it back in.

However, I inspected the flash drive using the Disks GUI and
GParted appeared to have installed correctly. I suppose this process
works fine, but causes the USB to no longer be mountable as usual.

## Step Two: Shrink the Windows partition

This step was comparatively easy. The following worked for me:

1. Boot into the Windows partition.
2. Clean out any unwanted files. I
   had quite a bit of extra junk that ultimately prevented the Windows
   resize from working on the first try.
3. Open up **Control Panel >
   System and Security > Defragment** and optimize your
   drives (under  **Administrative Tools** ). Find the
   Windows partition, select it, and click  **Optimize** .
   This step is necessary to try to free up space near the end of the
   partition so you can maximize the resize.
4. Open up **Control Panel > System and Security >
   Create** and format hard disk partitions (under
   **Administrative Tools** ). Find the Windows partition,
   select it, and shrink it. Given the space the utility tells you can
   be shrunk, you may want to use the maximum amount or reduce it. I
   went for the maximum, which for me was about 12GB of about 47GB of
   unused space on the partition. Kinda sucks that I couldn’t reclaim
   more, but there’s only so much that this will let you shrink,
   since even after defragmenting there may be stuff relatively close
   to the edge of the partition that can’t be moved.

This step is also a good time to confirm that the Windows
partition and the Ubuntu partition are in fact next to each other on
disk. If you already partitioned your computer to dual-boot Windows
and Ubuntu in the first place and did it correctly, they should be
adjacent and much of this should feel very familiar. If not, you’ll
have some extra work to do in GParted.

## Step Three: Expand the Ubuntu partition

This was the most nerve-wracking step for me, since you risk
causing boot to break if something goes wrong. You should take a look
at [this step of the GParted FAQ](http://gparted.org/faq.php#faq-13) before you begin, so you know what to do in case
booting fails. You should also make sure you have backups of anything
you care about and know how to retrieve them.

To expand the Ubuntu partition:

1. Make sure the GParted live USB is
   plugged in.
2. Reboot your computer. Do not boot
   into either Ubuntu or Windows, since we are going to boot from the
   live USB. At the GRUB menu, I was able to find the USB device by
   hitting `c` to enter the command line,
   then typing `exit`. This brought me to a
   menu with a few bootable devices, including the USB. Select the USB
   and hit Enter.
3. If everything worked out, you
   should be given a series of menus for GNOME Partition Editor
   configuration. Just hit Enter each time you are presented with an
   option to select the default.
4. Eventually, this should bring you
   to a rather primitive desktop interface. The GParted utility will
   probably be open by default, but if not, try double-clicking the
   GParted desktop icon. It may take a few seconds to open.
5. In GParted, find your Ubuntu
   partition. To its left should be a block of unallocated space (the
   space you freed up when shrinking the Windows partition), and to the
   left of that should be what’s left of the Windows partition.
6. Click the Ubuntu partition, and
   click the **Shrink/Move** option. This will present you
   with a confirmation dialog, warning you that this operation can
   break boot. If you’re willing to accept this possibility, click
   OK.
7. The previous step does not
   actually begin the process, it just queues it up. To actually
   perform the expansion, click Apply and click OK in the confirmation
   that pops up.
8. At this there should be something
   akin to a progress bar and the current command that GParted is
   running. Just sit back for a while and let this finish.
9. If all went well, after a while
   GParted will let you know that it completed the operation
   successfully.
10. To exit GParted, double-click the
    Exit icon on the desktop. It may take a few seconds for the next
    dialog to pop up. Choose Reboot.
11. Confirm that you can get into your Ubuntu and Windows
    partitions.

In my case, everything worked flawlessly, and the end result was
more space on my Ubuntu partition.

* [←
  Older](http://joejanuszk.com/blog/bootstrap-button-list-group-item-chrome-focus/)
* [Newer
  →](http://joejanuszk.com/blog/slow-wifi-in-ubuntu-14-04/)

© 2015 Joe Januszkiewicz
