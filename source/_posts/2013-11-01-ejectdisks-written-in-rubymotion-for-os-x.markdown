---
layout: post
title: "EjectDisks - Written in RubyMotion for OS X"
date: 2013-11-01 00:15
comments: true
categories: [Ruby, RubyMotion]
---
{% imgcap right /images/time-machine-backup-disks.png Redundancy rocks. %}
Disaster recovery has come a long way from the days of the tape drive.  Apple's Time Machine handles backups painlessly in the background.  Combine that with an online solution like Mozy or Crash Plan, mix in Drop Box, and top it off with GitHub for source code.

I am a big fan of redundant backups. 

###Ejecting in a Hurry
{% imgcap right /images/disk-not-ejected-properly.png In a hurry to eject? %}

[RubyMotion](/blog/2012/10/29/building-ios-apps-with-ruby-motion/) added support for OS X apps earlier this year. 

`EjectDisks` is a simple OS X program written with the RubyMotion toolchain for Mac OS X. It uses the `osx-status-bar-app-template` gem created by [Elliott Draper](https://github.com/kickcode/osx-status-bar-app-template).

<!--more-->
###Video Demo
Here's a quick video demo of the EjectDisks app.

<center><iframe name="eject-disks-osx" width="560" height="315" src="//www.youtube.com/embed/Lb9ZUESIpms" frameborder="0" allowfullscreen></iframe></center>

