---
layout: post
title: "Building an OS X App With RubyMotion"
date: 2013-11-01 00:15
comments: true
categories: [Ruby, RubyMotion]
---
{% imgcap right /images/time-machine-backup-disks.png Redundancy rocks. %}
No matter how much we spend on our computing equipment, the data we create and use is worth much more. The best data protection employs a backup systems with several levels of redundancy.

My backup system starts with Apple's [Time Machine](http://www.apple.com/findouthow/mac/#timemachinebasics), which handles first level backups painlessly in the background. Time machine is even more effective when multiple disks are used. I like to combine that with a couple of online solutions (Crash Plan and Drop Box) with GitHub for source code and Evernote for notes. Redundancy is a good thing.

I prefer USB-attached drives with Time Machine. I found that Time Machine was inconsistent over WiFi, and when it failed, troubleshooting took too much valuable time. That was a few years ago and things have probably improved over time. I've never had to troubleshoot a USB-attached Time machine drive. They just work.

###Disconnecting USB in a Hurry
My only problem with USB-attached drives comes when I need to leave my desk in a hurry. You may have seen this message before:

{% imgcap right /images/disk-not-ejected-properly.png In a hurry to eject? %}

All three of my USB drives are attached through a single USB hub. Yanking the cable while running for a meeting is… bad! Forgetting to eject even one of the USB drives is also bad.

I solved the problem about a year ago by writing a command line tool that ejects all three drives with a single click. Yesterday I deciced to improve my command line tool with RubyMotion.

###EjectDisks From the Menu Bar
Apple's Time Machine handles backups painlessly in the background. Time machine is even more effective when multiple disks are used. I like to combine that with an online solution like Mozy or Crash Plan, mix in Drop Box, and top it off with GitHub for source code.

I am a big fan of redundant backups. 
<!--more-->

All of my Time Machine disks are connected through a USB hub. 

###Ejecting in a Hurry
{% imgcap right /images/disk-not-ejected-properly.png In a hurry to eject? %}

[RubyMotion](/blog/2012/10/29/building-ios-apps-with-ruby-motion/) added support for OS X apps earlier this year. 

`EjectDisks` is a simple OS X program written with the RubyMotion toolchain for Mac OS X. It uses the `osx-status-bar-app-template` gem created by [Elliott Draper](https://github.com/kickcode/osx-status-bar-app-template).

###Video Demo
Here's a quick video demo of the EjectDisks app.

<center><iframe name="eject-disks-osx" width="560" height="315" src="//www.youtube.com/embed/Lb9ZUESIpms" frameborder="0" allowfullscreen></iframe></center>

###The Code
The latest version of the EjectDisk code is on [GitHub](https://github.com/RayHightower/EjectDisks). The `app_delegate.rb` file appears below.

```ruby
class AppDelegate
  attr_accessor :status_menu

  def applicationDidFinishLaunching(notification)
    @app_name = NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']

    @status_menu = NSMenu.new

    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength).init
    @status_item.setMenu(@status_menu)
    @status_item.setHighlightMode(true)
    @status_item.setTitle(@app_name)

    @status_menu.addItem createMenuItem("About #{@app_name}", 'orderFrontStandardAboutPanel:')
    @status_menu.addItem createMenuItem("Custom Action", 'pressAction')
    @status_menu.addItem createMenuItem("Eject Three Disks", 'ejectThreeDisks')
    @status_menu.addItem createMenuItem("Say Something", 'sayDroid')
    @status_menu.addItem createMenuItem("Sing", 'singSomething')
    @status_menu.addItem createMenuItem("Greetings", 'greetings')
    @status_menu.addItem createMenuItem("Quit", 'terminate:')
  end

  def createMenuItem(name, action)
    NSMenuItem.alloc.initWithTitle(name, action: action, keyEquivalent: '')
  end

  def pressAction
    alert = NSAlert.alloc.init
    alert.setMessageText "Action triggered from status bar menu"
    alert.addButtonWithTitle "OK"
    alert.runModal
  end

  def sayDroid
    %x(say -v cello droid)
  end

  def singSomething
    %x(say -v cello da da da da da da da da da da da da da da da da da da da da da da da da da da)
  end

  def greetings
    %x(say -v cello Greetings to the members of Chippewa Valley Code Camp &)
    alert = NSAlert.alloc.init
    alert.setMessageText "Greetings to the members of Chippewa Valley Code Camp!"
    alert.addButtonWithTitle "OK"
    alert.runModal
  end

  def ejectThreeDisks
    alert = NSAlert.alloc.init
    response = %x(/usr/sbin/diskutil eject SiiGBlack) + "\n"
    response += %x(/usr/sbin/diskutil eject Ultra3TB) + "\n"
    response += %x(/usr/sbin/diskutil eject WDSilver) + "\n"
    alert.setMessageText response
    alert.addButtonWithTitle "OK"
    alert.runModal
  end
end
```

