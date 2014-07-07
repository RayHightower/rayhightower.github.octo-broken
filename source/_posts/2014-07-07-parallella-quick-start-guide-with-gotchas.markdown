---
layout: post
title: "Parallella Quick Start Guide (with gotchas)"
date: 2014-07-07 13:31
comments: true
categories: [ High Performance Computing, IoT, Parallella ]
---
{% imgcap center /images/parallella_screenshot.png Parallella screenshot, 1080p. %}
Parallella is a single-board supercomputer smaller than a deck of cards. While today’s fastest laptops contain four processor cores, Parallella has _eighteen_ (2 [ARM](http://arm.com/) plus 16 [FPGA](http://en.wikipedia.org/wiki/Field-programmable_gate_array)). Demand for Parallella is strong. As of this writing the devices are sold out... again!

Yes, Parallella is a $119 supercomputer. That is not a typo. [Adapteva](http://adapteva.com), maker of Parallella, is on a mission to democratize parallel computing. The company's tag line is _Supercomputing for Everyone_.

Everything in this post is based on the [official quick start guide created by the Parallella team](http://www.parallella.org/quick-start/). These instructions are tailored for a Mac running OS X Mavericks (10.9.3) and a Parallella-16 equipped with the Zynq 7010 chip. I ran into some _gotchas_ during my first Parallella experience. The snags (and solutions) are documented here.
<!--more-->
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

Note: You might need different files depending on the the date (Parallella software is in a rapid state of flux) and your exact equipment. If your configuration is different, you can make the adjustments described in the Parallella's offical quick start guide.

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
 
The `dd` command takes a long time to run, over 56 minutes on my machine.

An important note about block size: The Mac section of the official Parallella guide recommends a block size of size of 1 megabyte, while the Linux instructions recommend a 64 kilobytes (the option `bs=64k` in the `dd` command). I initially used `bs=1m` on my Mac, and I ran into problems. When I used `bs=64k`, everything worked fine. Note that I eventually traced my problem to something other than block size (details below) but since the 64k setting still works, I've left it intact. If I find out why Linux and OS X are using different block sizes, I'll post the information here.

###Checking dd Progress
{% imgcap right /images/dd_progress.png Activity Monitor %}
Waiting an hour for the `dd` command to run can be disconcerting because the machine does not give any feedback on progress. No gas guage, spinning indicator, nothing. How can you find out whether the write process is moving along?

Here's how to check progress. Run Apple's `Activity Monitor`, and look for `dd` on the list of processes (see diagram). The number of bytes written will increase slowly while `dd` burns the Ununtu image on the SD card. With the current version of Ubuntu, roughly 7.4GB will be written to the SD. At completion, `dd` will disappear from the Activity Monitor list and you'll see the following at the command line.

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

As expected, /dev/disk0 remains unchanged. We want it that way because that's where our primary machine's operating system resides. `/dev/disk1` (your actual SD card designation may be different) is the target disk we're after.

###Copying Additional Files to the SD Card
Now that Ubuntu resides on the SD card, it's time to add the files that support HDMI video and the FPGAs. Here's how.

The additional files will need to be copied to `/BOOT` on the SD card.  You can reach the `/BOOT` directory via `/Volumes/BOOT` on the Mac.

Before you copy over the support files, `/Volumes/BOOT` will look
like...

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

To copy the files over...


```bash

$

$

```

And when you're done, `/Volumes/BOOT` will look like...


```bash
/Volumes/BOOT$ ls -al
total 12853
drwxrwxrwx@ 1 rth   staff     1024 Jul  5 23:58 .
drwxrwxrwt@ 4 root  admin      136 Jul  5 23:44 ..
drwxrwxrwx  1 rth   staff      512 Jul  5 23:44 .Spotlight-V100
drwxrwxrwx@ 1 rth   staff      512 Jul  5 23:44 .Trashes
-rwxrwxrwx  1 rth   staff     4096 Jul  5 23:44 ._.Trashes
-rwxrwxrwx  1 rth   staff     4096 Jul  5 23:58 ._devicetree.dtb
-rwxrwxrwx  1 rth   staff     4096 Jul  5 23:56 ._parallella_e16_hdmi_gpiose_7010.bit.bin
-rwxrwxrwx  1 rth   staff     4096 Jul  5 23:57 ._uImage
drwxrwxrwx  1 rth   staff      512 Jul  5 23:44 .fseventsd
-rwxrwxrwx@ 1 rth   staff     8607 Jul  5 23:58 devicetree.dtb
-rwxrwxrwx@ 1 rth   staff  2083744 Jul  5 23:56 parallella_e16_hdmi_gpiose_7010.bit.bin
-rwxrwxrwx@ 1 rth   staff  4468792 Jul  5 23:57 uImage

/Volumes/BOOT$

```

###Gotcha #1: The FPGA Bitstream
I spent hours trying to nail this one...



###Gotcha #2: Powered USB Required
I tried to use a combination USB keyboard/trackpad when I first booted Parallella, but the system would not respond to the keybord or the trackpad...  

Solution: Use a powered USB hub. Now the USB keyboard/trackpad combo works fine.






##Out-Takes
A brand new Parallella parallel computer arrived at WisdomGroup this weekend. The devices are in demand and supplies are short. We waited over a year for this one. As of this writing the devices are sold out again!

Why is there so much demand for a tiny parallel computer? Is it the price ($119.00), the performance, or the novelty?
{% imgcap right /images/parallella_clear_case.jpg Parallella in a clear acrylic case. %}
###What is Parallella?
Parallella is a parallel computer that fits in the palm of your hand.  [Adapteva](http://adapteva.com), the manufacturer, sells two versions:

* A 16-FPGA model with a 2-core ARM chip.
* A 64-FPGA model with a 2-core ARM chip.



18-core (16-core [FPGA](http://en.wikipedia.org/wiki/Field-programmable_gate_array) plus 2-core [ARM](http://arm.com/))
