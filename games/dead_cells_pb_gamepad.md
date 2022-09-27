# Debugging DeadCells's gamepad problem

**Xbox
one controller **

debugged driver there : [https://github.com/paroj/xpad](https://github.com/paroj/xpad)

# some commands

onyr@kenzae:~$
dmesg	//access specificities of the controller

[  496.367399] usb 2-2:
USB disconnect, device number 10

[  535.812815] usb 2-2:
new full-speed USB device number 11 using xhci_hcd

[  535.962141] usb 2-2:
New USB device found, idVendor=0e6f, idProduct=0162

[  535.962148] usb 2-2:
New USB device strings: Mfr=1, Product=2, SerialNumber=3

[  535.962153] usb 2-2:
Product: PDP Wired Controller for Xbox One

[  535.962157] usb 2-2:
Manufacturer: Performance Designed Products

[  535.962160] usb 2-2:
SerialNumber: 0000DDCBE85D78EA

[  535.963177] input: PDP
Xbox One Controller as
/devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2:1.0/input/input29

[  544.255475] usbcore:
deregistering interface driver xpad

[  560.766395] input: PDP
Xbox One Controller as
/devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2:1.0/input/input30

[  560.766546] usbcore:
registered new interface driver xpad

# Solution to the problem :

RawSteelUT: *Manjaro
user here. I was able to get my controller working by deleting the
libSDL2-2.0.so.0 file in the game's directory [/user/.GOG Games/Dead
Cells/game for me]. From what I gather, that one was made with Ubuntu
in mind, so deleting it will force the game to use the system's
version.*

# Useful commands

*Remap
the controller*

*onyr@kenzae:~$
sudo apt install jstest-gtk	//**download
jstest*

*onyr@kenzae:~$
jstest-gtk				//**launch
jstest*
