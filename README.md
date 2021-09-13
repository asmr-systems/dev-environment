# Development Environment

## Getting Started
First, make sure that you have the following prerequisites installed:
* [Vagrant](https://www.vagrantup.com/downloads)
* [VirtualBox 5.X](https://www.virtualbox.org/wiki/Downloads)
* VirtualBox Extension Pack

On Linux,
``` shell
sudo usermod -a -G vboxusers $USER  # grant VM access to USB devices
# log out and log back in for change to take affect
```

Now, you can start it up and log in
``` shell
vagrant up   # could take 10 minutes while VM is built, you can eat a snack or something
vagrant ssh  # log into the VM
```

### JTAG + Devboard Setup
* make sure that the board itself is powered (plugged into wall wart or powered usb)! must have enough current (otherwise LEDs won't light)
* J-Link Mini can be plugged into the powered USB port, but also needs enough current (otherwise its LED will blink rapidly)

### JLinkExe (L-Link Commander)
To connect to the SAMD21 via J-Link Commander,
``` shell
vagrant ssh
> JLinkExe
JLink> connect
device> ATSAMD21G18  # this is the name of our cpu.
TIF> S               # select 'S' (SWD) as the target interface.
Speed>               # default (4000kHz) seems fine.
```

## Ideas
* use `OpenOCD` instead of `jlink` for flashing (open source and configurable [see this](https://hackaday.io/project/160187-samd-v2-fusee-payload-injector/log/150781-openocd-flash-script))
* use `UF2` bootloader (supports Mass Storage Bootloader (for end-users who want to update firmware) AND BOSSA Bootloader for programmatically flashing)
* use `BOSSA` for updating firmware in development mode. (see [this](https://learn.adafruit.com/adafruit-feather-m0-express-designed-for-circuit-python-circuitpython/uf2-bootloader-details#using-the-bossa-bootloader-2929760-21))
* for final product, have a button which when double-tapped, puts the device in BOOTLOADER mode (see [AdaFruit UF2 SAMD bootloader](https://github.com/adafruit/uf2-samdx1/blob/530fedf5dab77a54e272f0ea1ad3ac0453241f8f/inc/uf2.h#L244) and [Winterbloom's same thing](https://github.com/wntrblm/libwinter/blob/main/src/samd/wntr_bootloader.c#L23))

## BreadCrumbs [WIP]
* [turning off protection](https://roamingthings.de/posts/use-j-link-to-change-the-boot-loader-protection-of-a-sam-d21/)
* [programming SAMD via JLink](https://hackaday.io/page/5997-programming-a-samd-bootloader-using-jlink-linux)
* [openocd flash script](https://hackaday.io/project/160187-samd-v2-fusee-payload-injector/log/150781-openocd-flash-script)

## Next Steps
1. research OpenOCD + CMSIS
2. write tools/process for:
   a. bootloading (writing a blank or possibly bricked device with a bootloader (UF2))
   b. development programming (using BOSSA against UF2 bootloader)
   c. end-user firmware update via doubletapped button and usb.

## Overview
Development Hardware:
  * [SAMD21 Dev Board (SparkFun RedBoard Turbo)](https://www.sparkfun.com/products/14812)
    * `ATSAMD21G18` cpu (ARM Cortex M0+, 32-bit, 48MHz)
    * pre-flashed with UF2 (USB Flashing Format) Bootloader
    * additional 4MB external Flash
Hardware debugger:
  * [SEGGER JLink](https://www.segger.com/products/debug-probes/j-link/models/j-link-base/)
Toolchain:
  * [GNU ARM Embedded]()
  * [J-Link Software Pack](https://wiki.segger.com/UM08001_J-Link_/_J-Trace_User_Guide#J-Link_Software_and_Documentation_Pack) - Suite of tools for using the J-Link. [Download Link](https://www.segger.com/downloads/jlink#J-LinkSoftwareAndDocumentationPack)
    * [J-Link Commander (JLinkExe)](https://wiki.segger.com/J-Link_Commander) - J-Link firmware update and basic utility for verifying/analysing the target system via J-Link.
    * [J-Link GDB Server](https://wiki.segger.com/J-Link_GDB_Server) - "a remote server for GDB making it possible for GDB to connect to and communicate with the target device via J-Link."
    * [J-Flash](https://wiki.segger.com/UM08003_JFlash) - stand-alone utility for programming flash devices.
    * [J-Run](https://wiki.segger.com/J-Run) - cli tool for running automated tests.

## FAQ
* "why not use openOCD?" - technically, you can use a J-Link with `openOCD`but [according to this wiki page](https://wiki.segger.com/OpenOCD) it is much slower than using the proprietary SEGGER J-LINK GDB Server.
* "what is the device name when connecting via J-Link?" - `ATSAMD21G18` (generally, search for names on [here](https://www.segger.com/downloads/supported-devices.php?m=Microchip))

## Inspiration & Acknowledgement
This development environment draws heavily on previous work by
[Mutable Instruments](https://github.com/pichenettes/mutable-dev-environment)
and [Adafruit](https://github.com/adafruit/ARM-toolchain-vagrant)!
