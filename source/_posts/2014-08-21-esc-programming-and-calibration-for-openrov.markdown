---
layout: post
title: "ESC Programming and Calibration for OpenROV"
date: 2014-08-21 16:27
comments: true
categories: [ BeagleBone Black, OpenROV ]
---
{% imgcap middle /images/openrov_esc.jpg Three ESCs, one for each motor. Each ESC has a switch and a power/signal connector. %}

###ESCs: Brand New Experience
Electronic speed controllers (ESCs) were completely new to me when I first assembled my [OpenROV](/blog/2014/06/16/citizen-science-with-openrov/). This article documents my initial misunderstanding of ESCs so that future builders can move forward with fewer glitches.

The photo at the top of this page shows an OpenROV controller board, a
BeagleBone Black, and three ESCs. This article will focus on the ESCs.

###Remember This About OpenROV ESCs
Programming and calibration are two separate steps. Until all three ESCs are calibrated, the OpenROV might appear to behave erratically. For example...
<!--more-->
* The servo that moves the camera up and down will be unresponsive to keyboard commands. 
* When you turn on one ESC switch, an unrelated motor (or motors, plural) might start spinning. In my case, turning on one ESC (any of the three ESCs!) caused two motors to spin.

When the motors responded out-of-sync with the switches, I thought I had soldered something incorrectly. De-soldering and re-soldering connections would have been a ton of extra work! Fortunately, I reached out to the OpenROV forum where OpenROV engineer Brian Adams pointed me in the right direction.

The bottom line: Do the ESC programming and calibration first. If it doesn't work, re-check everything before considering other solutions.


###Success: OpenROV and Lake Michigan
Yesterday afternoon I took the OpenROV for a spin in Chicago’s Lake Michigan. Success! Here are a few things I noticed during this first voyage:

* Condensation builds up in the electronics compartment. I should add a desiccant bag to the compartment. Or pack the unit in low humidity.
* The OpenROV is a little back-heavy. I should add some weights to the front of the unit.

{% imgcap middle /images/openrov_chicago_lake_michigan.jpg OpenROV and Lake Michigan. %}
What an exciting way to learn about Node.js, BeagleBone Black, and the Maker Movement all at once!

_Photo acknowledgement: ESC photos that appear in this article were created by OpenROV and made available at http://openrov.com. Thank you OpenROV team!_

