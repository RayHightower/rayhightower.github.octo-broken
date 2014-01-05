---
layout: post
title: "BeagleBone Black Running Ubuntu: Part2 (Plus Ruby on Rails)"
date: 2014-01-06 02:31
comments: true
categories: [ BeagleBone Black, Linux-Unix-OSX, Rails, Ruby ]
---
{% imgcap right /images/ruby-rails-ubuntu-beaglebone-black.png Ruby. Rails. Ubuntu. BeagleBone Black. %}

Part one of this series shows [how to install Ubuntu on the BeagleBone Black](/blog/2014/01/02/beaglebone-black-ubuntu-part-1/). We used a MacBook Pro to burn an Ubuntu disk image onto an SD card, and then we booted a BeagleBone Black from the image we created.

This post, part two, covers the installation of the Ubuntu GUI, Ruby, and Rails. All of the commands in this article are run on the BeagleBone Black.

[Node.js](http://nodejs.org) bonus: Rails requires a JavaScript runtime, and Node.js offered the quickest way to fulfill this requirement. Details appear within.

###Gotcha: Partition Size
At the end of part one, we successfully booted the Bone with the Ubuntu command line interface. Now it's time to add the GUI. Two things to know about the Ubuntu GUI installation:

* The partition we created on the SD card (in part one) is too small to hold the Ubuntu GUI. Solution: The SD card has some extra room, and we can re-size the partition. 
* We can install the Ubuntu GUI with a single line command. But it takes an hour for the Bone to download, compile, and install all of the GUI libraries.

If we try to install the GUI without re-sizing the partition, the installation will fail midway and we will have wasted half an hour. So it's best to re-size first. 
<!--more-->
###Re-Sizing the Partition
Why didn't the partition have the right size when we downloaded the image file? Good question.

My guess: The image file was designed to be as small as possible in order to minimize download time. That makes sense. I plan to test this theory by creating a new image with a larger partition size and a pre-installed GUI. If the test is successful, results will be posted on this blog. If the mission fails, then the secretary will disavow any knowledge...

`ll` is one of the useful aliases built into Ubuntu's `.bashrc` file.

```bash
ubuntu@ubuntu-armhf:~$ ll /dev/mmcblk*
brw-rw---- 1 root disk 179,  0 Jan  5 15:37 /dev/mmcblk0
brw-rw---- 1 root disk 179,  1 Jan  1  2000 /dev/mmcblk0p1
brw-rw---- 1 root disk 179,  2 Jan  1  2000 /dev/mmcblk0p2
brw-rw---- 1 root disk 179,  8 Jan  1  2000 /dev/mmcblk1
brw-rw---- 1 root disk 179, 16 Jan  1  2000 /dev/mmcblk1boot0
brw-rw---- 1 root disk 179, 24 Jan  1  2000 /dev/mmcblk1boot1
brw-rw---- 1 root disk 179,  9 Jan  1  2000 /dev/mmcblk1p1
brw-rw---- 1 root disk 179, 10 Jan  1  2000 /dev/mmcblk1p2
ubuntu@ubuntu-armhf:~$ 
```

`fdisk` will resize the partition we're after. `root` priviledges are required to modify the partition table, so we'll use `sudo`. (The standard warnings about apply.)

```bash
ubuntu@ubuntu-armhf:~$ sudo fdisk /dev/mmcblk0

Command (m for help): p

Disk /dev/mmcblk0: 3965 MB, 3965190144 bytes
4 heads, 16 sectors/track, 121008 cylinders, total 7744512 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x80008000

        Device Boot      Start         End      Blocks   Id  System
/dev/mmcblk0p1   *        2048        4095        1024    1  FAT12
/dev/mmcblk0p2            4096     7744511     3870208   83  Linux

Command (m for help): q

ubuntu@ubuntu-armhf:~$ ubuntu@ubuntu-armhf:~$
```


```bash
ubuntu@ubuntu-armhf:~$ sudo su
```

with the `fdisk` utility...

```bash
ubuntu@ubuntu-armhf:~$ sudo fdisk /dev/mmcblk0



```


 
```bash
Filesystem     1K-blocks    Used Available Use% Mounted on
rootfs           3778576 2731444    877276  76% /
/dev/root        3778576 2731444    877276  76% /
devtmpfs          253580       4    253576   1% /dev
none               50748     608     50140   2% /run
none                5120       0      5120   0% /run/lock
none              253728     156    253572   1% /run/shm
/dev/mmcblk0p1      1004     480       524  48% /boot/uboot
/dev/mmcblk1p1     65390    6536     58854  10% /media/boot
/dev/mmcblk1p2   1748200    2664   1655068   1% /media/rootfs

$

$

$

$

$

```



###Installing the Ubuntu GUI
After the partition on the SD card has been resized, this command will intall the GUI. Note that the process takes about an hour:

```bash
$ sudo apt-get install ubuntu-desktop
```
When installation and compilation are complete, Ubuntu will return to the command prompt. Here's how to reboot:

```bash
$ sudo reboot
```

Several minutes later, the Ubuntu 12 GUI will appear. Congratulations!  Login using the default credentials (login: ubuntu, pw: ubuntu) to get to the Ubuntu desktop.

###Gotcha: Running RVM
I prefer to use the Ruby Version Manager (RVM) for bouncing between Ruby versions. RVM misbehaved, initially. Then I learned something special about RVM's interaction with Ubuntu. From the RVM support pages…
> For RVM to work properly, you have to set the 'Run command as login shell' checkbox on the Title and Command tab inside of gnome-terminal's Settings page.

This image shows the checkbox mentioned in the quote. It's inside of the lower red rectangle.

{% imgcap /images/rvm-ubuntu-run-command_as_login-shell.jpg RVM: Run command as login shell. %}

Details are in the RVM support article [Integrating RVM with gnome-terminal](http://rvm.io/integration/gnome-terminal).

###Gotcha: Ruby Installation
Ruby installation initially failed (speculation) because the Bone went into power save mode during the installation process. Ruby installed successfully on the second try when I kept the machine awake by moving the mouse. This _power save hypothesis_ has not been thoroughly tested. 

###Gotcha: Rails Installation
{% imgcap right /images/nodejs-white.png Node.js on BeagleBone Black. %}
Rails needs a JavaScript runtime in order to function. Here are two ways to meet this requirement: 

* Install Node.js, or 
* Install `therubyracer` gem. 

Installing `therubyracer` gem did not work for me. But Node.js installed quickly, like so:

```bash
$ sudo apt-get install nodejs
```

Now that we have a JavaScript runtime, Rails runs successfully.

Side note: If you want to see what a Node.js-equipped Bone can do, check
out [OpenROV](http://openrov.com).

###Conclusion
Bottom line: Ruby, Rails, and Ubuntu can run successfully on BeagleBone Black, with Node.js as a bonus.

The BeagleBone Black is a cool option for running Ubuntu. Yes, it runs slower than a typical laptop. But it runs, and at $45 each we can build a cluster of Bones if we're concerned about performance! 

What an amazing bundle of technology.

