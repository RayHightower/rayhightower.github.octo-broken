---
layout: post
title: "Citizen Science With OpenROV"
date: 2014-06-10 17:46
comments: true
categories: [ Community ]
---
>With regard to robots, in the early days of robots people said, 'Oh, let's build a robot' and what's the first thought? You make a robot look like a human and do human things. That's so 1950s. We are so past that. 
><br/>~Neil deGrasse Tyson


[OpenROV](http://openrov.com) is an underwater robot, definitely not human-shaped. Company founders Eric Stackpole and David Lang are on a mission to democratize ocean exploration in the same way that Jobs, Woz, Gates, and Allen helped to democratize computing. Even better: OpenROV stands firmly on the shoulders of Moore’s Law and the open source software movement. Take a look at this list of OpenROV ingredients:

* BeagleBone Black - An open-source single-board computer, smaller than a deck of cards, running Linux.
* Linux - specifically, the Ubuntu distribution.
* Node.js - platform for building web applications, based on the Google’s V8 JavaScript engine. Thanks to Node.js, any laptop running a web browser can control the OpenROV.
* Arduino - amazing, inexpensive micro-controller
* TCP/IP - the communication protocol of the Internet. All communications (commands, video) between the OpenROV and the pilot’s laptop happens over TCP/IP.

The OpenROV team has released all of their [schematics and source code](https://github.com/openrov) to the open source community, hence the word “open” in the company name.

The open source 
<!--more-->
###Remotely Operated Vehicles 

ROV is short for remotely operated vehicle, an underwater robot. Scientists use ROVs to study marine life. Oil companies use ROVs for underwater construction and inspections. Industry-grade ROVs are priced at $30,000 on the low-end, while a [custom ROV can cost several million dollars](http://www.mbari.org/twenty/Tiburon.htm). 

In the face of all the evidence, the OpenROV team was convinced that they could design and build an ROV small enough to fit in a suitcase with a sales price under one thousand dollars ($1,000.00).

###Tethering
Radio waves don't travel very well underwater, so ROV communication happens through a tether, a line of copper wire that carries signals between the controller and the ROV unit.

