---
layout: post
title: "BeagleBone Black Running Ubuntu: Part2"
date: 2014-01-04 02:31
comments: true
categories: [ BeagleBone Black, Linux-Unix-OSX, Rails, Ruby ]
---
{% imgcap right /images/ruby-rails-ubuntu-beaglebone-black.png Ruby. Rails. Ubuntu. BeagleBone Black. %}

Episode one of this series shows [how to install Ubuntu on the BeagleBone Black](/blog/2014/01/02/beaglebone-black-ubuntu-part-1/). This post covers the installation of the Ubuntu GUI, Ruby, and Rails.

Node.js bonus: Rails requires a JavaScript runtime, and Node.js offered the quickest way to fulfill this requirement. Details appear within.

###Gotcha: Partition Size
At the end of part one, we successfully booted the Bone with the Ubuntu command line interface. Now it's time to add the GUI. Two things to know about the Ubuntu GUI installation:

* The partition created on the SD card is too small to hold the Ubuntu GUI. Solution: The SD card has some extra room, and we can re-size the partition. 
* We can install the GUI with a single line command. But it takes an hour for the Bone to download, compile, and install all of the GUI libraries.

If we try to install the GUI without re-sizing the partition, the installation will fail about halfway through and we will have wasted half an hour. So it's best to re-size first. 
<!--more-->
###Re-Sizing the Partition
Why didn't the partition have the right size when we downloaded the image file? Good question.

My guess: The image file was designed to be as small as possible in order to minimize download time. I plan to test this theory by creating a new image with a larger partition size and a pre-installed GUI. If the test is successful, results will be posted on this blog. If the mission fails, then the secretary will disavow any knowledge...

To re-size the partition, use the `fdisk` utility as follows:

```bash
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
Rails needs a JavaScript runtime in order to function. Here are two ways to meet this requirement: 

* Install NodeJS, or 
* Install `therubyracer` gem. 

Installing `therubyracer` gem did not work for me. But NodeJS installed quickly, like so:

```bash
$ sudo apt-get install nodejs
```

###Conclusion
Bottom line: Ruby, Rails, and Ubuntu can run successfully on BeagleBone Black, with Node.js as a bonus.

The BeagleBone Black is a cool option for running Ubuntu. Yes, it runs slower than a typical laptop. But it runs, and at $45 each we can build a cluster if we're concerned about performance! 

What an amazing bundle of technology.

