---
layout: post
title: "BeagleBone Black Running Ubuntu"
date: 2014-01-02 15:59
comments: true
categories: [ BeagleBone Black, Linux-Unix-OSX, Rails, Ruby ]
---
{% imgcap center /images/beaglebone-black-ubuntu-ruby-rails.jpg BeagleBone Black running Ubuntu, Ruby, & Rails. %}

The above screenshot shows a BeagleBone Black running Ubuntu, Ruby, and Rails. Why Ubuntu? The Bone comes pre-installed with [Ångström](http://www.angstrom-distribution.org/). Why not stick with Ångström? 

My opinion: The factory standard is fine, but it's always good to have options. Here's why I decided to try Ubuntu on the BeagleBone Black:

* Ubuntu documentation is plentiful. Books, blogs, and videos are readily available. 
* The Ubuntu community is huge. When a dev runs into an Ubuntu-related snag, it's likely that another dev has encountered a similar problem, and they can collaborate on a solution.
* Ubuntu is the distro that I'm most familiar with. [WisdomGroup](http://wisdomgroup.com) uses Ubuntu for multiple projects. With a common OS, knowledge gained in one environment is immediately useful in another.
* Prepping for [Parallella](/blog/2013/06/22/preparing-for-parallella-64-cores-installing-go-on-mac-os-x/), the 64-core single-board computer that will cost about two hundred bucks. The Parallella is currently in short supply. When it becomes available, it will run Ubuntu. Experience with other single-board computers, especially those running Ubuntu, will prove useful.

This article will show how to install Ubuntu on the BeagleBone Black.  _Gotchas_ will be pointed out along the way. Where possible, I will explain the reasons behind my decisions so that you can make different choices if you like.
<!--more-->
###Sudo Disclaimer: You Could Destroy Everything
Procedures described here will ask you to use the `sudo` command. [sudo endows users with great power](http://xkcd.com/149/). You could destroy all of the data on your computer by using `sudo` incorrectly. Further, since technology changes rapidly, everything you see here could be out of date by the time you read this. Please be careful, and double-check these steps through your own sources.  

###First Gotcha: Ubuntu 13 on the Bone
As of this writing, Ubuntu 12 runs well on the BeagleBone Black, but Ubuntu 13 does not. My Ubuntu 13 installation appeared to be successful, but the Ubuntu 13 GUI hung up immediately after login. The Ubuntu 13 command line interface worked fine. 

A quick search on Google reveals that others encountered similar roadblocks with version 13. One successful Bone/13 installation was used via SSH, not interactively via keyboard and GUI. Hopefully this will change with future updates. Or, since we're dealing in the open source world, maybe I can pitch in and help.

Due to the issues encountered with version 13, everything in this article will focus on Ubuntu 12.

###Materials Needed
In addition to the BeagleBone Black, the following items should be gathered before installation:

* Micro SD card of at least 8GB. It's possible to perform the installation with a 4GB card, but that won't leave much room for Ubuntu applications.
* SD card reader/writer. Recent versions of Apple's MacBook Pro come with an SD reader/writer built in.
* SD to Micro-SD card adapter. The Bone is designed for micro SD, and the MacBook Pro is designed for full-sized SD. Some micro SD packages come with the adapter. 
* A monitor that accepts HDMI input.
* Micro HDMI to HDMI adapter. The Bone uses micro HDMI for video output, but your monitor probably uses full-sized HDMI.
* External 5V power adapter for the Bone. Personally, I trust the standard 5v power input more than I trust the power provided via USB. One never knows if USB can provide sufficient (and stable) amperage for a circuit board. Power fluctuations can lead to strange behavior, including video flickering.
* Ethernet cable with RJ-45 ends.
* A fast internet connection. How fast? That all depends on how long you want to wait for the files to download and install.

###Test the BeagleBone Black First
Before you do anything, power up your BeagleBone Black and make sure it runs with the built-in Ångström Linux installation. One great thing about the Bone is that it will [boot to the Ångström GUI](/blog/2013/05/22/beaglebone-black-running-ruby-on-rails/) straight out of the box, with no prior configuration.

If the GUI boots, then you're in good shape.

If the GUI doesn't boot, it may have been damaged in a prior experiement. Embarassing note: I started looking for a way to install Ubuntu on the Bone because I broke my Ångström installation. What can I say... I learn more from destructive experiments. Faced with a non-booting Bone, I had two choices.

1. Re-build Ångström.
2. Try something different, like Ubuntu.

Option two worked well!

###Grab and Burn the Ubuntu Disk Image
Here is how to obtain and install an Ubuntu image on a MicroSD card:

* Download the Ubuntu 12.04 image from [http://armhf.com](http://s3.armhf.com/debian/precise/bone/ubuntu-precise-12.04.3-armhf-3.8.13-bone30.img.xz).
* Extract the image using the `xz` utility.
```bash
$ xz ubuntu-precise-12.04.3-armhf-3.8.13-bone30.img.xz
```
* The extracted image will end with `.img`. Use the `dd` utility to burn the disk image to your SD card.
```bash
$ xz ubuntu-precise-12.04.3-armhf-3.8.13-bone30.img.xz
```

Detailed instructions for all of the above are at [http://armhf.com](http://www.armhf.com/index.php/boards/beaglebone-black/#precise).

###The xz Extraction Utility
The `xz` utility is available via [Homebrew](http://brew.sh/). Homebrew rocks for package management. If you already have Homebrew installed,

```bash
$ brew install xz
```
will install `xz` for you.



###Checking Progress at the Command Line
One drawback of using the command line is that there is no gauge to tell you how much progress the utility is making. Fortunately, I stumbled upon a way to measure progress at [eLinux.org](http://elinux.org). While the command line utility is running, and while that window has focus, type `control-T`. A few seconds later, the terminal window will show a brief activity report.

```bash
Password:

Here's the report from the first time I struck `Control-T` ...

```bash
load: 2.03  cmd: dd 75608 uninterruptible 0.00u 0.54s
40+0 records in
39+0 records out
```

Strike `Control-T` again...

```bash
40894464 bytes transferred in 549.916772 secs (74365 bytes/sec)
load: 1.55  cmd: dd 75608 uninterruptible 0.00u 0.71s
52+0 records in
51+0 records out
53477376 bytes transferred in 722.963135 secs (73970 bytes/sec)
```



###Gotcha: Running RVM
RVM didn't want to behave, initially. Then I learned, from the RVM site, that…
> For RVM to work properly, you have to set the 'Run command as login shell' checkbox on the Title and Command tab inside of gnome-terminal's Settings page.

Here's the checkbox mentioned in the quote, highlighted with a red rectangle:

{% imgcap /images/rvm-ubuntu-run-command_as_login-shell.jpg RVM: Run command as login shell. %}

Details are in the brief article [Integrating RVM with gnome-terminal](http://rvm.io/integration/gnome-terminal).


###Gotcha: Ruby Installation
Nonconclusive, but I should mention it here: My Ruby installation (with RVM) initially failed because the BBB went into power save mode during installation. On my second Ruby installation attempt, I kept the machine awake by moving the mouse. The same tactic worked with the Rails installation.

###Gotcha: Rails Installation
Rails needs a JavaScript runtime in order to function. There are two ways to meet this requirement: 

* Install NodeJS, or 
* Install `therubyracer` gem. 

Installing `therubyracer` gem did not work for me. But NodeJS installed quickly, like so:

```bash
$ sudo apt-get install nodejs
```


###JavaScript Runtime Required for Rails 4.0

$ sudo apt-get install nodejs





###NodeJS Dependency?


###Conclusion
The BeagleBone Black is a cool option for running Ubuntu. Yes, it runs slower than a typical laptop. But how many laptops can be purchased for $45? This Ubuntu/BeagleBone Black combination lets us run Linux on a $45 computer. Amazing.
