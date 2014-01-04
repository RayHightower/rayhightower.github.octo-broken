---
layout: post
title: "BeagleBone Black Running Ubuntu: Part2"
date: 2014-01-04 02:31
comments: true
categories: [ BeagleBone Black, Linux-Unix-OSX, Rails, Ruby ]
---
{% imgcap right /images/ruby-rails-ubuntu-beaglebone-black.png Ruby. Rails. Ubuntu. BeagleBone Black. %}

[Part 1](/blog/2014/01/02/beaglebone-black-ubuntu-part-1/) of this series shows how to install Ubuntu on the BeagleBone Black. This episode covers the installation of the Ubuntu GUI, Ruby, and Rails.

Side note: Rails requires a JavaScript runtime, and NodeJS offered the quickest way to fulfill this requirement. Details appear within.

###Gotcha: Resize the SD Card
Two things to know about GUI installation:

* Before installing the GUI, we will need to re-size one of the partitions on the SD card.
* GUI installation only takes a single line command, but it takes an hour to download, compile, and install all of the GUI libraries.
<!--more-->
###Installing the Ubuntu GUI
After the partition on the SD card has been resized, this single command will intall the GUI. Note that the process takes about an hour:

```bash
$ sudo apt-get install ubuntu-desktop
```
When installation and compilation are complete, Ubuntu will return to the command prompt. Here's how to reboot:

```bash
$ sudo reboot
```

Several minutes later, the Ubuntu 12 GUI will appear. Congratulations!


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
