---
layout: post
title: "ESC Programming and Calibration for OpenROV"
date: 2014-08-21 16:27
comments: true
categories: [ BeagleBone Black, OpenROV ]
---
{% imgcap middle /images/openrov_esc.jpg Three ESCs, one for each motor. Each has a switch and a power/signal line. %}

###ESCs: Brand New Experience
Electronic speed controllers (ESCs) were completely new to me when I first assembled my OpenROV. This article documents my initial misunderstanding of ESCs so that future builders can move forward with fewer glitches.

###First Thing To Remember About ESCs
Until all three ESCs are calibrated, parts of the OpenROV that seem unrelated might not work. For example...

* The servo that moves the camera up and down will be unresponsive to keyboard commands. 
* Turning on the switch for one ESC may cause an “unrelated” motor (or motors, plural) to power on. In my case, turning on one ESC caused two motors to spin.

When the motors responded out-of-sync with the switches, I thought I had soldered something incorrectly. De-soldering and re-soldering connections would have been a ton of work! Fortunately, I reached out to the OpenROV forum where an OpenROV engineer pointed me in the right direction.

When I experienced the weird behavior, I 
In short, it's like strolling through a parallel universe where a different set of physical laws applies.

The bottom line: Do the ESC programming and calibration first. If it doesn't work, re-check everything before considering other solutions.
<!--more-->


###Success: OpenROV and Lake Michigan
Yesterday afternoon I took the OpenROV for a spin in Chicago’s Lake Michigan. Success! Here are a few things I noticed during this first voyage:

* Condensation builds up in the electronics compartment. I should add a desiccant bag to the compartment. Or pack the unit in low humidity.
* The OpenROV is a little back-heavy. I should add some weights to the front of the unit.

{% imgcap middle /images/openrov_chicago_lake_michigan.jpg OpenROV and Lake Michigan. %}
What an exciting way to learn about Node.js, BeagleBone Black, and the Maker Movement all at once!

_Photo acknowledgement: ESC photos that appear in this article were created by OpenROV and made available at http://openrov.com. Thank you OpenROV team!_

