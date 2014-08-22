---
layout: post
title: "ESC Programming and Calibration for OpenROV"
date: 2014-08-21 16:27
comments: true
categories: [ BeagleBone Black, OpenROV ]
---
{% imgcap middle /images/openrov_esc.jpg Three ESCs, one for each motor. Each ESC has a switch and a power/signal connector. %}

###ESCs: New Experience for Me
Electronic speed controllers (ESCs) were completely new to me when I first assembled my [OpenROV](/blog/2014/06/16/citizen-science-with-openrov/). This article documents my initial misunderstanding (and eventual understanding) of ESCs so that future builders can move forward with fewer glitches.
<!--more-->
The photo at the top of this page shows an OpenROV controller board, a
BeagleBone Black, and three ESCs. This article will focus on the ESCs.

###Remember This About ESCs
ESC programming and ESC calibration are two separate steps. Until all three ESCs are programmed _and_ calibrated, the OpenROV might behave erratically. For example...

* The servo that moves the camera up and down will not respond to keyboard commands. 
* When you turn one ESC switch on, an unrelated motor (or motors, plural) might start spinning. In my case, turning on one ESC (any of the three ESCs!) caused two motors to spin.

In my case, the programming was correct, but I [dropped the ball on calibration](/blog/2014/08/19/openrov-assembly-challenges/). And when the motors responded out-of-sync with the switches, I thought I had soldered some connections incorrectly. De-soldering and re-soldering connections would have been a ton of extra work! Fortunately, I reached out to the [forum](http://openrov.com/forum) where OpenROV engineer Brian Adams pointed me in the right direction. Brian's diplomatic response to my query was _RTFM_. And it worked!

The bottom line: Do the ESC programming and calibration first. If the OpenROV misbehaves, re-check programming and calibration before considering other solutions.

###Why Use ESCs?
Since ESCs require so many steps (programming and calibration) we might logically ask: _Why use ESCs at all?_ Why not use simple analog motors without controllers and call it a day?

We use ESCs because the benefits outweigh the work required to configure them. It's all about control. By using an ESC to control each motor, we can use software to specify the _exact_ number of RPMs and direction for each motor. We can make any motor (or combination or motors) start, stop, or change direction on a dime. Even better: When we move a lever on our controller of choice (keyboard, game controller, etc.) the Node.js software on the OpenROV controller board decides the exact number of RPMs for each motor at that instant. OpenROV pilots don't need to think about this process while it happens. It just works.

The pilot's finger moves a controller lever. The lever position gets sent to software on the OpenROV's controller board, and controller board tells each ESC what its corresponding motor should do.

In summary, we use ESCs so that OpenROV pilots can have greater control over the movement of the device.

###How to Re-Check ESC Programming
{% imgcap right /images/esc_program_card.jpg ESC Program Card %}
Those of you with ESC experience already know about ESC program cards. I first learned about the cards while researching this problem. Amazing devices! Yes, it is possible to program ESCs using the series of button pushes and beeps in the OpenROV instructions. That's what I did, and it works. But a program card is faster. Amazon sells ESC program cards for less than fifteen dollars each. Well worth the investment, especially if you're programming ESCs for several OpenROVs.

###ESC Calibration Gotcha
ESC programming was pretty straight forward. But ESC calibration was
tricky for me because turning on any of the three ESC switches started
two of my motors to spin: vertical and port. Further, since my
electonics chassis was (mostly) assembled by the time I got to the
calibration step, it wasn't easy for me to trace each power switch to
its corresponding ESC.

So here's what I had to do. 

{% imgcap right /images/openrov_esc_switch_labels.jpg ESC switch labels. %}
* First, I took everything apart, while keeping the electronic leads (those which had already been soldered) intact.
* Next, I labeled each ESC switch with its corresponding ESC number. I did not want to go through the disassembly step again! The Brother P-Touch label maker was perfect for this step.





_Photo acknowledgement: ESC and circuit board photos that appear in this article were created by OpenROV and made available at [http://openrov.com](http://openrov.com). Thank you OpenROV team!_

