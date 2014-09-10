---
layout: post
title: "Solar Powered Parallella"
date: 2014-09-09 09:18
comments: true
categories: [ High Performance Computing, Parallella ]
---
This article covers a simple hardware hack: Making the Parallella run on solar energy. 

Motivation: The fastest computers in the world gulp electricity at an alarming rate. For example, [Tianhe-2](http://www.top500.org/system/177999) at the National Super Computer Center in Guangzhou, China uses 17.8 megawatts of energy per year. In dollars, that’s roughly $17 million spent on electricity spent each year, depending on how the electricity is sourced.

Scientists at [Sandia National Laboratories](http://www.sandia.gov/) estimate that the earth's surface absorbs enough solar energy in ninety minutes to power every electrical device on the planet for a full year. A year's worth of energy in ninety minutes! Surely we can use some of that energy to power our supercomputers.
<!--more-->
###Observations

Parallella is only needs five watts of power, five volts at 1 ampere.
Maybe the device spikes at startup or during heavy calculations, but not
by much.

USB provides electrical power at five volts, typically less than 2
amperes. 
Off-the-shelf solar devices can be used to charge cell phones and
tablets. Could one of these be hacked to power Parallella? Yes! Here's
how.

First, get an off-the-shelf solar device capable of providing 5 volts at 2 amperes. Many cell phone solar chargers will do this, but some will only provide 1 ampere of current. Make sure you get at least 2 amperes.  As of this writing, Amazon sells solar cell phone chargers for about $35.00.

Cut open a USB cable to expose power (red), ground (black), and signal cables (green and white).

Find an old AC adapter cable that fits the Parallella power connection.  Cut it open to expose the power and ground wires. 

Solder USB power to the old adapter power wire, and USB ground to the adapter's ground.

Cover everything with heat shrink tubing or electrical tape. Heat shrink
is preferred since it will last longer.

You're done!






###Simple Photovoltaic Cell



###It works!
It probably doesn’t make sense to call this a project. It's more of a proof of concept. Scaling up will cost money and time. But the solar ROI is certainly worth it.

