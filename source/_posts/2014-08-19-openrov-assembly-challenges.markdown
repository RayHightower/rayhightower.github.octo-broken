---
layout: post
title: "OpenROV Assembly Challenges"
date: 2014-08-19 16:44
comments: true
categories: [ BeagleBone Black, Community, IoT, Linux, Node ]
---
{% imgcap right /images/openrov_rth.jpg OpenROV fully assembled. %}
I know this problem can be solved. I just haven’t figured it out yet, and I need help from the [OpenROV](/blog/2014/06/16/citizen-science-with-openrov/) community to do so.

###Parts That Work
Image updates on the Beaglebone Black work flawlessly thanks to scripts written by [Brian Adams](https://github.com/BrianAdams) and [Dominick Fretz](https://github.com/BrianAdams). I can view images via the cockpit software and the camera, the LED lights are super-bright, and the lasers hold steady at 10cm apart. My fully assembled OpenROV passes the water submersion test. Yes, it’s waterproof, thanks to O-rings and silicon-based lubricant!

What about the motors? The motors work, almost...
<!--more-->
###Problem Summary
With the cockpit software running:
If I turn on any of the three ESCs, two of my motors (vertical and port) start running at full blast. 
The port motor responds to the cockpit slider controls as expected: +1 is full blast on one direction, -1 is full blast in the other direction, and 0 stops the motor completely.


###Using a Power Supply Instead of Batteries
{% imgcap /images/power_supply_openrov.jpg Applying power. %}




###Double-Checking the ESC Settings
{% imgcap /images/esc_program_card.jpg ESC Program Card %}
Setting the electronic speed controllers (ESCs) with the beep-and-button-push method was time consuming. And I was concerned that I may have made a mistake in the settings. To double-check the 
