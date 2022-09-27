# Connect gamepad to linux

### Useful links

[apparently debug there]([https://github.com/paroj/xpad](https://github.com/paroj/xpad))

[stackOverflow](https://askubuntu.com/questions/32031/how-do-i-configure-a-joystick-or-gamepad/270111#270111)

[ubuntuforums](https://ubuntuforums.org/showthread.php?t=2049391)

[GitHub for xboxdrv](https://github.com/xboxdrv/ubuntu)

[xpad linux kernel driver updated | GitHub](https://github.com/paroj/xpad)

### Stuffs used

##### addresse

`/dev/input/js0` : address of detected controllers. c'est ce qui est indiqué aud on lance par exemple `jstest-gtk`.

`/dev/input/event8` : addresse indiquée par la commande `sudo evtest`.

##### commands

`jstest-gtk` : test tool to detect if controlled is correctly detected and set up.

`sudo lsusb` : command to display detected devices over USB. It detect the gamepad as :

```shell
Bus 002 Device 021: ID 0e6f:0162 Logic3
```

`xboxdrv` : the driver to use to make the gamepad work. Replaces `xpad`, the default driver. More info on the [GitLab](https://gitlab.com/xboxdrv).

`sudo evtest` : displays all devices.

### Commands

**Example of detecting a gamepad :**

`sudo lsusb` : displays connected devices via USB.

```shell
 ❮ onyr ★  kenzae❯ ❮ input❯❯ sudo lsusb
Bus 001 Device 002: ID 8087:8001 Intel Corp. 
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 002 Device 008: ID 04f2:b466 Chicony Electronics Co., Ltd 
Bus 002 Device 007: ID 0424:2532 Standard Microsystems Corp. 
Bus 002 Device 005: ID 03f0:581d Hewlett-Packard 
Bus 002 Device 003: ID 8087:0a2a Intel Corp. 
Bus 002 Device 011: ID 0e6f:015c Logic3 
Bus 002 Device 004: ID 1532:006b Razer USA, Ltd 
Bus 002 Device 002: ID 05e3:0606 Genesys Logic, Inc. USB 2.0 Hub / D-Link DUB-H4 USB 2.0 Hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

```

Here the gamepad is there :

```shell
Bus 002 Device 011: ID 0e6f:015c Logic3
```

`sudo xboxdrv -s --device-name "PDP Xbox One Controller" --device-by-id 0e6f:0162 --type xbox` :

`xboxdrv --device-by-id 0e6f:0162 --type xbox`

```shell
 ❮ onyr ★  kenzae❯ ❮ input❯❯ sudo xboxdrv -s --device-name "Logic3" --device-by-id 0e6f:0162 --type xbox
xboxdrv 0.8.8 - http://pingus.seul.org/~grumbel/xboxdrv/ 
Copyright © 2008-2011 Ingo Ruhnke <grumbel@gmail.com> 
Licensed under GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html> 
This program comes with ABSOLUTELY NO WARRANTY. 
This is free software, and you are welcome to redistribute it under certain conditions; see the file 
COPYING for details. 

Controller:        unknown
Vendor/Product:    0e6f:0162
USB Path:          002:013
Controller Type:   Xbox Classic

-- [ ERROR ] ------------------------------------------------------
USBController::usb_find_ep(): couldn't find matching endpoint

```

`dmesg` : Display or control the kernel ring buffer.

```shell
[ 1981.830296] usb 2-2.2: new full-speed USB device number 13 using xhci_hcd
[ 1981.907697] usb 2-2.2: New USB device found, idVendor=0e6f, idProduct=0162
[ 1981.907698] usb 2-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 1981.907699] usb 2-2.2: Product: PDP Wired Controller for Xbox One
[ 1981.907700] usb 2-2.2: Manufacturer: Performance Designed Products
[ 1981.907701] usb 2-2.2: SerialNumber: 0000DDCBE85D78EA
[ 1981.908259] input: PDP Xbox One Controller as /devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2.2/2-2.2:1.0/input/input33

```

It worked by relaunching `jstest-gtk` and clicking on Refresh.

### debug session 2

```
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ sudo lsusb -v
...
Bus 002 Device 021: ID 0e6f:0162 Logic3 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass        71 
  bDeviceProtocol       208 
  bMaxPacketSize0        64
  idVendor           0x0e6f Logic3
  idProduct          0x0162 
  bcdDevice            4.60
  iManufacturer           1 Performance Designed Products
  iProduct                2 PDP Wired Controller for Xbox One
  iSerial                 3 0000DDCBE85D78EA
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           64
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass     71 
      bInterfaceProtocol    208 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass     71 
      bInterfaceProtocol    208 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass     71 
      bInterfaceProtocol    208 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x00e0  1x 224 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               1
Device Status:     0x0002
  (Bus Powered)
  Remote Wakeup Enabled

```

```shell
 ❮ onyr ★  kenzae❯ ❮ input❯❯ sudo xboxdrv --device-by-id 0e6f:0162 --type xbox --usb-debug --verbose --debug
xboxdrv 0.8.8 - http://pingus.seul.org/~grumbel/xboxdrv/ 
Copyright © 2008-2011 Ingo Ruhnke <grumbel@gmail.com> 
Licensed under GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html> 
This program comes with ABSOLUTELY NO WARRANTY. 
This is free software, and you are welcome to redistribute it under certain conditions; see the file 
COPYING for details. 

Controller:        unknown
Vendor/Product:    0e6f:0162
USB Path:          002:021
Controller Type:   Xbox Classic
[DEBUG] USBController::usb_find_ep(): Interface: 0
[DEBUG] USBController::usb_find_ep():     Endpoint: 1(IN)
[DEBUG] USBController::usb_find_ep():     Endpoint: 1(OUT)
[DEBUG] USBController::usb_find_ep(): Interface: 1
[DEBUG] USBController::usb_find_ep(): Interface: 1
[DEBUG] USBController::usb_find_ep():     Endpoint: 2(OUT)
[DEBUG] USBController::usb_find_ep():     Endpoint: 3(IN)

-- [ ERROR ] ------------------------------------------------------
USBController::usb_find_ep(): couldn't find matching endpoint

```

```shell
 ❮ onyr ★  kenzae❯ ❮ input❯❯ sudo evtest
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:	Sleep Button
...
/dev/input/event8:	PDP Xbox One Controller
/dev/input/event9:	AORUS AORUS K9 Optical Keyboard
```

résolu par un redémarrage systeme.

### session 3

A simple restart works sometimes, but not here. using `dmesg` we get :

```shell
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ dmesg
xpad: loading out-of-tree module taints kernel.
[    5.382060] xpad: module verification failed: signature and/or required key missing - tainting kernel
```

The problem is clearly linked to `xpad`. The gamepad is connected to the pc via a USB hub, but there is no reason that it is the hub that is respondible for the problem. Using the command `dmesg -w` so as to display kernel logs in real time, and trying to unplug/plug back, we get :

```
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ dmesg -w
...
[ 1454.521789] usb 2-2.2: USB disconnect, device number 6
[ 1462.117923] usb 2-2.2: new full-speed USB device number 10 using xhci_hcd
[ 1462.195726] usb 2-2.2: New USB device found, idVendor=0e6f, idProduct=0162
[ 1462.195730] usb 2-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 1462.195733] usb 2-2.2: Product: PDP Wired Controller for Xbox One
[ 1462.195735] usb 2-2.2: Manufacturer: Performance Designed Products
[ 1462.195738] usb 2-2.2: SerialNumber: 0000DDCBE85D78EA
[ 1462.196802] input: PDP Xbox One Controller as /devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2.2/2-2.2:1.0/input/input31
```

Reading more about the error mesage from `xpad` on [StackExchange]( , the problem is linked to xpad being `tainted`. With `journalctl -k | grep taint` we get :

```shell
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ journalctl -k | grep taint
déc. 15 14:02:15 kenzae kernel: CPU: 1 PID: 337 Comm: systemd-udevd Not tainted 4.15.0-128-lowlatency #131-Ubuntu
déc. 15 14:02:15 kenzae kernel: xpad: loading out-of-tree module taints kernel.
déc. 15 14:02:15 kenzae kernel: xpad: module verification failed: signature and/or required key missing - tainting kernel
```

Reading [this article](https://www.rojtberg.net/1049/state-of-the-xpad-xbox-controller-driver/) from [rojtberg](https://www.rojtberg.net/), we learn that there exist an updated version of `xpad` on GitHub.

Updating `xpad` from [GitHub](https://github.com/paroj/xpad) :

```shell
cd /usr/src/xpad-0.4
sudo git fetch
sudo git checkout origin/master
sudo dkms remove -m xpad -v 0.4 --all
sudo dkms install -m xpad -v 0.4
```

##### solution

Follow what's explained in the [README from xpad | GitHub](https://github.com/paroj/xpad).

First we determine the path of where the gamepad stream is materialised in linux. We also need to check if the gamepad is correctly connected to the pc. Use `dmesg -w` and try connecting/disconnected to see where the output of the gamepad is :

```shell
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ dmesg -w
...
[ 1454.521789] usb 2-2.2: USB disconnect, device number 6
[ 1462.117923] usb 2-2.2: new full-speed USB device number 10 using xhci_hcd
[ 1462.195726] usb 2-2.2: New USB device found, idVendor=0e6f, idProduct=0162
[ 1462.195730] usb 2-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 1462.195733] usb 2-2.2: Product: PDP Wired Controller for Xbox One
[ 1462.195735] usb 2-2.2: Manufacturer: Performance Designed Products
[ 1462.195738] usb 2-2.2: SerialNumber: 0000DDCBE85D78EA
[ 1462.196802] input: PDP Xbox One Controller as /devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2.2/2-2.2:1.0/input/input31
```

We see here that the gamepad is correclty detected, and especially that the `input` is connected to `/devices/.../input31`. This input is also visible at `/dev/input` which is what we will use.

```shell
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ cd /dev/input/
 ❮ onyr ★  kenzae❯ ❮ input❯❯ ll
total 0
drwxr-xr-x   4 root root     680 déc.  15 14:26 ./
drwxr-xr-x  23 root root    5160 déc.  15 14:02 ../
drwxr-xr-x   2 root root     240 déc.  15 14:26 by-id/
drwxr-xr-x   2 root root     300 déc.  15 14:26 by-path/
crw-rw----   1 root input 13, 64 déc.  15 14:02 event0
crw-rw----   1 root input 13, 65 déc.  15 14:02 event1
crw-rw----   1 root input 13, 74 déc.  15 14:02 event10
crw-rw----   1 root input 13, 75 déc.  15 14:02 event11
crw-rw----+  1 root input 13, 76 déc.  15 14:26 event12
crw-rw----   1 root input 13, 77 déc.  15 14:02 event13
crw-rw----   1 root input 13, 78 déc.  15 14:02 event14
crw-rw----   1 root input 13, 79 déc.  15 14:02 event15
crw-rw----   1 root input 13, 80 déc.  15 14:02 event16
crw-rw----   1 root input 13, 81 déc.  15 14:02 event17
crw-rw----   1 root input 13, 82 déc.  15 14:02 event18
crw-rw----   1 root input 13, 83 déc.  15 14:02 event19
crw-rw----   1 root input 13, 66 déc.  15 14:02 event2
crw-rw----   1 root input 13, 84 déc.  15 14:02 event20
crw-rw----   1 root input 13, 85 déc.  15 14:02 event21
crw-rw----   1 root input 13, 86 déc.  15 14:02 event22
crw-rw----   1 root input 13, 87 déc.  15 14:02 event23
crw-rw----   1 root input 13, 67 déc.  15 14:02 event3
crw-rw----   1 root input 13, 68 déc.  15 14:02 event4
crw-rw----   1 root input 13, 69 déc.  15 14:02 event5
crw-rw----   1 root input 13, 70 déc.  15 14:02 event6
crw-rw----   1 root input 13, 71 déc.  15 14:02 event7
crw-rw----   1 root input 13, 72 déc.  15 14:02 event8
crw-rw----   1 root input 13, 73 déc.  15 14:02 event9
crw-rw-r--   1 root input 13,  0 déc.  15 14:02 js0
crw-rw-r--+  1 root input 13,  1 déc.  15 14:26 js1
crw-rw----   1 root input 13, 63 déc.  15 14:02 mice
crw-rw----   1 root input 13, 32 déc.  15 14:02 mouse0
crw-rw----   1 root input 13, 33 déc.  15 14:02 mouse1
crw-rw----   1 root input 13, 34 déc.  15 14:02 mouse2

```

Here we remark the `+` symbol. This is present in `event12` and `js1`. `jsX` represent the gamepad. We know here that our gamepad stream will be at `js1`. Using `jstest /dev/input/jsX` will correclty setup `jstest` on the right steam. This solved the issue, the led of the gamepad suddenly switched on !

> **NB :** Dans le commande ls : c = character file (qui se lit caractère par caractère, comme un flux pour un périphérique)

> **NB :** Dans la commande
