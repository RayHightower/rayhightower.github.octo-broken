---
layout: post
title: "Citizen Science With OpenROV"
date: 2014-06-10 17:46
comments: true
categories: [ Arduino, BeagleBone Black, Community, Linux ]
---
>With regard to robots, in the early days of robots people said, 'Oh, let's build a robot' and what's the first thought? You make a robot look like a human and do human things. That's so 1950s. We are so past that. 
><br/>~Neil deGrasse Tyson

{% imgcap right /images/openrov-uw.jpg OpenROV: Underwater robot running Node.js. %}
[OpenROV](http://openrov.com) is an underwater robot, roughly the size of a toaster, and definitely not human-shaped. Company founders Eric Stackpole and David Lang are on a mission to democratize ocean exploration in the same way that Jobs, Woz, Gates, and Allen helped to democratize computing. OpenROV builds on the solid foundation laid by Moore’s Law and the open source software movement. Take a look at this list of OpenROV ingredients:

* BeagleBone Black - an open-source single-board computer, smaller than a deck of cards, running Linux.
* Linux - specifically, the Ubuntu distribution.
* Node.js - platform for building web applications, based on the Google’s V8 JavaScript engine. Thanks to Node.js, any laptop running a web browser can control the OpenROV.
* Arduino - inexpensive micro-controller commonly used in robotics projects.
* TCP/IP - the communication protocol of the Internet. TCP/IP handles all communications (commands, video) between the OpenROV and the pilot’s laptop. Radio waves (like WiFi) don't travel very well underwater, so ROV communication happens through a tether, a line of copper wire that carries the TCP/IP packets. 

The OpenROV team has released all of their [schematics and source code](https://github.com/openrov) to the open source community, hence the word “open” in the company name. If you think the open source aspects of OpenROV are exciting, wait until you hear about the company's main mission: Underwater exploration.
<!--more-->
###Remotely Operated Vehicles 
ROV is short for remotely operated vehicle, an underwater robot. Scientists use ROVs to study marine life. Oil companies use ROVs for underwater construction and inspections. Industry-grade ROVs are priced at $30,000 on the low-end, while a [custom ROV can cost several million dollars](http://www.mbari.org/twenty/Tiburon.htm). 

The OpenROV team was convinced that they could design and build an ROV small enough to fit in a suitcase, and easy enough for a citizen scientist to assemble and maintain. Targeting the general public meant achieving a relatively low price point: under one thousand dollars ($1,000.00).

###Citizen Science
We will always have a need for professional-level scientists, people working in academia and in industry to push the frontier of knoweledge.  At the same time, some problems are too big for our current population of scientists to tackle; we just don't have enough scientists. Enter the citizen scientist.

Orville and Wilbur Wright were citizen scientists. Many professional scientists pursued solutions for fixed-wing flight prior to the Wright brothers' success. The flight problem defied the known science of the time; a new approach was required. Citizen scientists may be constrainted by money, but they tend to be unconstrained by expertise. Therefore they are likely to try solutions that experts would never consider.

Citizen scientists do not always achieve breakthroughs, but that's not why they do it. For many, the journey is the reward.

Thousands of professional and citizen scientists are now using OpenROV to explore bodies of water that have never been explored so thoroughly before. What are they likely to discover?

###Tethering
Radio waves don't travel very well underwater, so ROV communication happens through a tether, a line of copper wire that carries signals between the controller and the ROV unit.

