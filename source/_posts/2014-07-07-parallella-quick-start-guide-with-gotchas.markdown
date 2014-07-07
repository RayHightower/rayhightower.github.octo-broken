---
layout: post
title: "Parallella Quick Start Guide (with gotchas)"
date: 2014-07-07 13:31
comments: true
categories: [ High Performance Computing, IoT, Parallella ]
---
{% imgcap center /images/parallella_screenshot.png Parallella screenshot, 1080p. %}
Parallella is a single-board supercomputer smaller than a deck of cards. While today’s fastest laptops contain four processor cores, Parallella has _eighteen_ (2 [ARM](http://arm.com/) plus 16 [FPGA](http://en.wikipedia.org/wiki/Field-programmable_gate_array)). Demand for Parallella is strong. As of this writing the devices are sold out... again!
<!--more-->
Yes, Parallella is a $119 supercomputer. That is not a typo. [Adapteva](http://adapteva.com), maker of Parallella, is on a mission to democratize parallel computing. The company's tag line is _Supercomputing for Everyone_.

Everything in this post is based on the [official quick start guide created by the Parallella team](http://www.parallella.org/quick-start/). These instructions are tailored for a Mac running OS X Mavericks (10.9.3) and a Parallella-16 equipped with the Zynq 7010 chip. I ran into some _gotchas_ during my first Parallella experience. The snags (and solutions) are documented here.

###Tools Required
You will need the following items in order to burn an SD card for your
Parallella:

* Micro-SD card, 16GB or greater.
* Desktop or laptop computer with a micro-SD card reader, or an SD-card reader with a micro adapter.
* High-speed internet connection, for downloading Parallella's Ubuntu
image and related files.
* Micro-USB-to-USB adapter, for the keyboard and mouse. Parallella is equipped with two micro-USB ports.
* Micro-HDMI to HDMI cable or adapter. 
* Parallella (of course!)

Adapteva sells an accesssories kit containing an SD card, power adapter, micro-HDMI to HDMI cable, and USB-to-micro-USB adapter. Unless you already have these items, buying the kit may save you time.

###These Steps Could Break Your Primary Machine
Since you're experimenting with Parallella, we can assume that you are an advanced user. Your computer is already backed up, or you're running these steps on a test machine. And you know [the power and pitfalls of sudo](/sudo-disclaimer/). Technology changes rapidly, and everything you read here could change by the time you read it.

###Comparison with Raspberry Pi or Beaglebone Black
{% imgcap right /images/parallella_fan.jpg %}
How does the Parallella compare with other single-board computers, like the [Raspberry Pi](/blog/2012/12/03/ruby-on-raspberry-pi/) or [Beaglebone Black](/blog/2014/01/02/beaglebone-black-ubuntu-part-1/)? The first difference noticed at boot-time: Parallella runs hot! So hot, in fact, that the unit comes with a heat sink and the recommendation to add a fan. I’ve never needed a fan with a Pi or a ‘Bone.

Of course, the Parallella runs hotter because it has more processing power packed tightly together in limited space. Since Parallella is designed to run tasks in parallel, we can expect certain programs to perform faster than they would on the Pi or 'Bone. Future posts will cover performance comparisons. Now, let’s get started with Parallella.

###Getting the Parallella OS
Parallella runs a customized version of Ubuntu installed on a micro-SD card. Burning the SD card takes a long time, so it makes sense to start that process first.

Download the files that you will need to burn onto the SD card. I'm running Mac OS X on my primary machine, and I'm configuring a Parallella-16 with a Zynq 7010 and an HDMI display. Therefore, the files needed for this configuration are:

* [Ubuntu 14.04 for Parallella](http://downloads.parallella.org/ubuntu/dists/trusty/image/ubuntu-14.04-140611.img.gz) (released June 11, 2014)
* [Linux kernel with HDMI support](http://downloads.parallella.org/boot/linux/kernel-hdmi-default.tgz)
* [Parallella-16 Zynq 7010 with HDMI display](https://github.com/parallella/parallella-hw/blob/master/fpga/bitstreams/parallella_e16_hdmi_gpiose_7010.bit.bin?raw=true)

Unzip the files and place them in a directory that's handy. You'll need them for the next step. With Mac OS X, you can unzip the files by double-clicking them in `Finder`.

Note: You might need different files depending on the the current date (Parallella software is in a rapid state of flux) and your exact equipment. If your configuration is different, you can make the adjustments described in Parallella's offical guide.

###Burn the SD Card
Insert your SD card into your Mac's SD card reader, and use the Mac OS X `diskutil list` command to determine the designation of the SD card. If you use portable hard drives with your primary machine, the SD card designation could change from time to time, so it's important to perform this step each each time you burn a card.

```bash
$ diskutil list
/dev/disk0
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *500.3 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:                  Apple_HFS MacSSD                  499.4 GB   disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
/dev/disk1
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                       *15.9 GB     disk1
   1:               Windows_NTFS Untitled 1             15.9 GB     disk1s1

$ 
```

From this `diskutil` report, we can see that we want to burn the SD image to `/dev/disk1`. The other device is the hard drive for my primary machine. Burning the wrong device means destroying data. 

To burn the SD card, use the `dd` command as follows...

```bash
$ sudo dd if=ubuntu-14.04-140611.img of=/dev/disk1 bs=64k
Password:
```
 
The `dd` command takes a _long_ time to run, over 56 minutes on my machine.

An important note about block size: The Mac section of the official Parallella guide recommends a block size of size of 1 megabyte, while the Linux instructions recommend a 64 kilobytes (the option `bs=64k` in the `dd` command). I initially used `bs=1m` on my Mac, and I ran into problems. When I used `bs=64k`, everything worked fine. Note that I eventually traced my problem to something other than block size (details below) but since the 64k setting still works, I've left it intact. If I find out why Linux and OS X are using different block sizes, I'll post the information here.

###Checking dd Progress
{% imgcap right /images/dd_progress.png Activity Monitor %}
Waiting an hour for the `dd` command to run can be disconcerting because the machine does not give any feedback on progress. No gas guage, spinning indicator, nothing. How do we know if the write process is working?

Here's how to check progress. Run Apple's `Activity Monitor`, and look for `dd` on the list of processes (see diagram). The number of bytes written will increase slowly while `dd` burns the Ununtu image onto the SD card. With the current version of Ubuntu, roughly 7.4GB will be written to the SD. At completion, `dd` will disappear from the Activity Monitor list and you'll see the following at the command line.

```bash
$ sudo dd if=ubuntu-14.04-140611.img of=/dev/disk1 bs=64k
Password:
121280+0 records in
121280+0 records out
7948206080 bytes transferred in 3363.824531 secs (2362848 bytes/sec)

$ 

```

###Confirm Partitions
To confirm that the partitions have been created and that Ubuntu has been written to the SD card, use `diskutil list` again.

```bash
$ diskutil list
/dev/disk0
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *500.3 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:                  Apple_HFS MacSSD                  499.4 GB   disk0s2
   3:                 Apple_Boot Recovery HD             650.0 MB   disk0s3
/dev/disk1
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *15.9 GB    disk1
   1:                 DOS_FAT_32 BOOT                    134.2 MB   disk1s1
   2:                      Linux                         7.3 GB     disk1s2

$ 
```

As expected, /dev/disk0 remains unchanged. We want it that way because that's where our primary machine's operating system resides. `/dev/disk1` (your actual SD card designation may be different) is the target disk we're after. Two new partitions are on the SD card, a Fat32 partition called `BOOT` and a Linux partition.

Next we need to copy some supporting files to the new `BOOT` partition.

###Copying Additional Files to the SD Card
Now that Ubuntu resides on the SD card, it's time to add the files that support HDMI video and the FPGAs. Here's how.

The additional files will need to be copied to `/BOOT` on the SD card. While it might make sense to reach the `BOOT` partition as `/dev/disk1`, you will actually reach it via `/Volumes/BOOT`.

Before we copy over the files, let's see what's on the `Boot` partition on the SD card.

```bash
~$ cd /Volumes/BOOT/

/Volumes/BOOT$ ls -al
total 12
drwxrwxrwx@ 1 rth   staff   512 Jul  5 23:44 .
drwxrwxrwt@ 4 root  admin   136 Jul  5 23:44 ..
drwxrwxrwx  1 rth   staff   512 Jul  5 23:44 .Spotlight-V100
drwxrwxrwx@ 1 rth   staff   512 Jul  5 23:44 .Trashes
-rwxrwxrwx  1 rth   staff  4096 Jul  5 23:44 ._.Trashes
drwxrwxrwx  1 rth   staff   512 Jul  5 23:44 .fseventsd

/Volumes/BOOT$
```

###Gotcha #1: The FPGA Bitstream File
First, change into the directory where you stored the additional Parallella files, and copy the FPGA bitstream file to `/Volumes/BOOT`.

```bash

$ cp parallella_e16_hdmi_gpiose_7010.bit.bin /Volumes/BOOT/

$ mv parallella_e16_hdmi_gpiose_7010.bit.bin parallella.bit.bin

$ 

```
My initial first gotcha: I made the mistake of simply copying the `parallella_e16_hdmi_gpiose_7010.bit.bin` file without renaming it to `parallella.bit.bin`. Parallella will only boot when it sees a file with this filename on the `BOOT` partition. The original file name will probably change as the software gets updated. With each change, we will need to make sure that the file is called `parallella.bit.bin` on the Parallella.

I'm embarrased to say I spent a few hours tracking that one down! 

###Copy the Last Two Files
Next, copy the two `kernel-hdmi-default` files to `/Volumes/BOOT`.


Copy over the extra files in /Parallella/kernel…

```bash
$ cp devicetree.dtb /Volumes/BOOT/

~/Downloads/Parallella/kernel-hdmi-default$ cp uImage /Volumes/BOOT/

~/Downloads/Parallella/kernel-hdmi-default$
```

Here’s what the BOOT partition should look like when you’re done..

```bash
/Volumes/BOOT$ ls -al
total 12853
drwxrwxrwx@ 1 rth   staff     1024 Jul  6 12:14 .
drwxrwxrwt@ 4 root  admin      136 Jul  6 12:11 ..
drwxrwxrwx  1 rth   staff      512 Jul  6 12:11 .Spotlight-V100
drwxrwxrwx@ 1 rth   staff      512 Jul  6 12:11 .Trashes
-rwxrwxrwx  1 rth   staff     4096 Jul  6 12:11 ._.Trashes
-rwxrwxrwx  1 rth   staff     4096 Jul  6 12:13 ._devicetree.dtb
-rwxrwxrwx  1 rth   staff     4096 Jul  6 12:14 ._parallella_e16_hdmi_gpiose_7010.bit.bin
-rwxrwxrwx  1 rth   staff     4096 Jul  6 12:13 ._uImage
drwxrwxrwx  1 rth   staff      512 Jul  6 12:11 .fseventsd
-rwxrwxrwx@ 1 rth   staff     8607 Jul  6 12:13 devicetree.dtb
-rwxrwxrwx@ 1 rth   staff  2083744 Jul  6 12:14 parallella_e16_hdmi_gpiose_7010.bit.bin
-rwxrwxrwx@ 1 rth   staff  4468792 Jul  6 12:13 uImage

/Volumes/BOOT$ 
```

{% imgcap right /images/eject-boot.jpg Eject the SD card. %}
###Eject the SD Card, Insert in Parallella
Now you're ready to eject the SD card from the Mac and insert it in the Parallella. And that brings us to the next _gotcha_.

###Gotcha #2: Powered USB Required
After moving past the first _gotcha_, Parallella booted to a beautiful GUI, but the system was unresponsive to the keyboard and mouse. After swapping a few keyboard/mouse combinations, I finally tried a powered USB hub. The powered hub worked.

The Parallella can handle a single keyboard plugged into the micro-USB port. However, if two devices are plugged in via USB, a powered hub is required. Now the USB keyboard/trackpad combo works fine.

###Default Login Credentials
Default login credentials for Parallella are...

* username = linaro
* password = linaro

###SSH, Vim, Git, etc.
You can SSH to the Parallella from the network...

```bash
~$ ssh linaro@192.168.11.133
linaro@192.168.11.133's password:
Welcome to Linaro 14.04 (GNU/Linux 3.12.0-g0bc9c3a-dirty armv7l)

 * Documentation:  https://wiki.linaro.org/
Last login: Sun Jul  6 17:34:17 2014 from wisdomgroup-mbp13
linaro-nano:~> 
```

... and Vim works fine.

```bash
linaro-nano:~> which vim
/usr/bin/vim
linaro-nano:~> vim --version
VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Jan  2 2014 19:49:14)
linaro-nano:~> 
```

###Conclusion
After waiting a year for Parallella to arrive, I'm excited to have the device up and running. Future posts will explore the "why?" behind parallel computing. Thanks Adapteva for helping to democratize supercomputing. Awesome times are ahead!


