---
layout: post
title: "Parallella Quick Start Guide (with gotchas)"
date: 2014-07-07 13:31
comments: true
categories: [ High Performance Computing, IoT, Parallella ]
---
{% imgcap center /images/parallella_screenshot.png Parallella screenshot, 1080p. %}
Today’s fastest laptops contain four processors working together to power through applications. Parallella has _eighteen_ processors (2 [ARM](http://arm.com/) plus 16 [FPGA](http://en.wikipedia.org/wiki/Field-programmable_gate_array)). Parallella is a single-board supercomputer roughly the size of a deck of cards. Demand for the $119 Parallella is strong. As of this writing the devices are sold out... again!

Yes, Parallella is a $119 supercomputer. That is not a typo.

Everything in this post is based on the [official quick start guide created by the Parallella team](http://www.parallella.org/quick-start/). I ran into some _gotchas_ during my first Parallella experience. The snags (and solutions) are documented here.
<!--more-->
###Comparison with Raspberry Pi or Beaglebone Black
{% imgcap right /images/parallella_fan.jpg %}
How does the Parallella compare with other single-board computers, like the [Raspberry Pi](/blog/2012/12/03/ruby-on-raspberry-pi/) or [Beaglebone Black](/blog/2014/01/02/beaglebone-black-ubuntu-part-1/)? The first difference noticed at boot-time: Parallella runs hot! So hot, in fact, that the unit comes with a heat sink and the recommendation to add a fan. I’ve never needed a fan with a Pi or a ‘Bone.

Of course, the Parallella runs hotter because it has more processing power packed tightly together in limited space. Future posts will cover performance comparisons. Now, let’s get started with Parallella.

###Get the Parallella Kit
[Adapteva](http://adapteva.com), maker of Parallella, sells an accesssories kit containing an SD card, power adapter, and USB-to-micro-USB adapter. Unless you already have these items, it may save you time to buy the kit.

###Start With the SD Card
Burning the SD card takes a long time, so it makes sense to start that process first.

Download the files that you will need to burn onto the SD card. I'm running Mac OS X on my primary machine, and I'm configuring a Parallella-16 with a Zynq 7010 and an HDMI display. Therefore, the files needed for this configuration are:

* [Ubuntu 14.04 for Parallella](http://downloads.parallella.org/ubuntu/dists/trusty/image/ubuntu-14.04-140611.img.gz) (released June 11, 2014)
* [Linux kernel with HDMI support](http://downloads.parallella.org/boot/linux/kernel-hdmi-default.tgz)
* [Parallella-16 Zynq 7010 with HDMI display](https://github.com/parallella/parallella-hw/blob/master/fpga/bitstreams/parallella_e16_hdmi_gpiose_7010.bit.bin?raw=true)

Note: The files you need may differ depending on the the date (software always gets better over time, right?) and your exact equipment. If your configuration is different, you can make the adjustments described in the Parallella's offical quick start guide.

###Back Everything Up
While you're waiting for the files to download, it may make sense to [backup your machine](/sudo-disclaimer/). Technology changes rapidly, and everything you read here could change by the time you read it.

###Burn the SD Card
Make sure you're using an SD card of 16GB or larger. 

Insert your SD card into your primary machine's SD card reader, and use the Mac OS X `diskutil` command to determine the designation of the SD card. If you sometimes use portable hard drives with your primary machine, the SD card designation could change from time to time, so it's important to perform this step each each time you burn a card.

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

From this `diskutil` report, we can see that we want to burn the SD image to `dev/disk1`. The other device is the hard drive for my primary machine.  Burning the wrong device means destroying data. Please double-check everything, especially target devices for disk write operations.






###Out-Takes
A brand new Parallella parallel computer arrived at WisdomGroup this weekend. The devices are in demand and supplies are short. We waited over a year for this one. As of this writing the devices are sold out again!

Why is there so much demand for a tiny parallel computer? Is it the price ($119.00), the performance, or the novelty?
{% imgcap right /images/parallella_clear_case.jpg Parallella in a clear acrylic case. %}
###What is Parallella?
Parallella is a parallel computer that fits in the palm of your hand.  [Adapteva](http://adapteva.com), the manufacturer, sells two versions:

* A 16-FPGA model with a 2-core ARM chip.
* A 64-FPGA model with a 2-core ARM chip.



18-core (16-core [FPGA](http://en.wikipedia.org/wiki/Field-programmable_gate_array) plus 2-core [ARM](http://arm.com/))
