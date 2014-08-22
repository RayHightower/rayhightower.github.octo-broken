---
layout: post
title: "ESC Programming and Calibration for OpenROV"
date: 2014-08-21 16:27
comments: true
categories: [ BeagleBone Black, OpenROV ]
---
{% imgcap middle /images/openrov_esc.jpg Three ESCs, one for each motor. Each ESC has a switch and a power/signal connector. %}

###ESCs: Brand New Experience
Electronic speed controllers (ESCs) were completely new to me when I first assembled my [OpenROV](/blog/2014/06/16/citizen-science-with-openrov/). This article documents my initial misunderstanding (and eventual understanding) of ESCs so that future builders can move forward with fewer glitches.
<!--more-->
The photo at the top of this page shows an OpenROV controller board, a
BeagleBone Black, and three ESCs. This article will focus on the ESCs.

###Remember This About OpenROV ESCs
ESC programming and ESC calibration are two separate steps. Until all three ESCs are programmed _and_ calibrated, the OpenROV might appear to behave erratically. For example...

* The servo that moves the camera up and down will not respond to keyboard commands. 
* When you turn on one ESC switch, an unrelated motor (or motors, plural) might start spinning. In my case, turning on one ESC (any of the three ESCs!) caused two motors to spin.

In my case, the programming was correct, but I [dropped the ball on calibration](/blog/2014/08/19/openrov-assembly-challenges/). And when the motors responded out-of-sync with the switches, I thought I had soldered some connections incorrectly. De-soldering and re-soldering connections would have been a ton of extra work! Fortunately, I reached out to the OpenROV forum where OpenROV engineer Brian Adams pointed me in the right direction. Brian's diplomatic response to my query was RTFM :-)

The bottom line: Do the ESC programming and calibration first. If the OpenROV misbehaves, re-check programming and calibration before considering other solutions.

###How to Re-Check ESC Programming
{% imgcap right /images/esc_program_card.jpg ESC Program Card %}
Those of you with ESC experience already know about ESC program cards. I first learned about the cards while researching this problem. Amazing devices! Yes, it is possible to program ESCs using the series of button pushes and beeps in the OpenROV instructions. That's what I did, and it works. But a program card is faster. Amazon sells ESC program cards for less than fifteen dollars each. Well worth the investment, especially if you're programming ESCs for several OpenROVs.


###Why Use ESCs?
Since ESCs require so many steps (programming and calibration) we might logically ask: _Why use ESCs at all?_ Why not use simple analog motors without controllers and call it a day?

We use ESCs because the benefits outweigh the work required to configure them.




_Photo acknowledgement: ESC and circuit board photos that appear in this article were created by OpenROV and made available at [http://openrov.com](http://openrov.com). Thank you OpenROV team!_

