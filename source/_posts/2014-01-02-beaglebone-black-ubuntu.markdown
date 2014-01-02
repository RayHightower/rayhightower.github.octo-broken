---
layout: post
title: "BeagleBone Black Running Ubuntu"
date: 2014-01-02 15:59
comments: true
categories: [ BeagleBone Black, Linux-Unix-OSX, Rails, Ruby ]
---
{% imgcap center /images/beaglebone-black-ubuntu-ruby-rails.jpg BeagleBone Black running Ubuntu, Ruby, & Rails. %}

The above screenshot shows a BeagleBone Black running Ubuntu, Ruby, and Rails. Why Ubuntu? BeagleBone Black comes with the Angstrom Linux distro pre-installed. Why not stick with Angstrom? My decision to use Ubuntu is mainly personal:

* Ubuntu has more documentation than any other Linux distro, and it's the one that I'm most familiar with. My team and I use Ubuntu in other environments, and knowledge gained in one environment becomes immediately useful in another.
* Ubuntu documentation is plentiful: Books, blogs, videos, etc. And the community is huge. When a dev runs into an Ubuntu-related snag, it's likely that another dev has encountered a similar problem, and they can collaborate on a solution.



###Materials Needed
The following items should be gathered the following before installation:

* Micro SD card of at least 8GB. It's possible to perform the installation with a 4GB card, but that won't leave much room for Ubuntu applications.
* SD card reader/writer. The Apple MacBook Pro after 2009 has an SD device built in.
* SD to Micro-SD card caddy. (RTH: include picture?)
* External 5V power adapter for the Bone. Personally, I trust the standard 5v power input more than I trust the power provided via USB. One never knows if USB can provide sufficient (and stable) amperage for a circuit board. Power fluctuations can lead to strange behavior, including video flickering.
* Ethernet cable
* A fast internet connection. How fast? That all depends on how long you want to wait for the files to download and install!


###Key Points Regarding Ubuntu
Here are a few things we need to know before installing Ubuntu on the BeagleBone Black.

* Built-in storage is not enough. The Bone comes with 2GB of flash storage on the board. This is enough to hold the Angstrom distribution of Linux that comes pre-installed on the board. But for Ubuntu, we need the additional storage provided by the micro SD card.
* Ubuntu 12 runs well on the BeagleBone Black, but Ubuntu 13 does not. The Ubuntu 13 GUI hung up immediately after login. Hopefully this will change with future updates. Or, since we're dealing in the open source world, maybe I can help?
* Ubuntu runs slower on the Bone than on a typical laptop. But it runs! This Ubuntu/BeagleBone Black combination lets us run Linux on a $45 computer. Amazing.



* Nonconclusive, but I should mention it here: My Ruby installation (with RVM) initially failed because the BBB went into power save mode during installation. On my second Ruby installation attempt, I kept the machine awake by moving the mouse. The same tactic worked with the Rails installation.
* Rails needs a JavaScript runtime in order to function. You can install NodeJS. Or you can install `therubyracer` gem. Either appears to work.

###JavaScript Runtime Required
$ sudo apt-get install nodejs





###NodeJS Dependency?




BeagleBone Black comes with the Angstrom Linux distro pre-installed.  Will the device run other Linux distros, say Ubuntu? Yes.

This article describes the challenges I faced while getting Ubuntu running on BeagleBone Black.

###Why Ubuntu?
My Ubuntu bias is due to the 

