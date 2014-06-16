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
[OpenROV](http://openrov.com) is an underwater robot, roughly the size of a toaster, and definitely not human-shaped. The device is controlled through a Node.js-based web app. Former NASA researcher Eric Stackpole and Make Magazine columnist David Lang are on a mission to democratize ocean exploration in the same way that Jobs, Woz, Gates, and Allen led the democratization of  computing. Eric and David pooled their talents to launch OpenROV, building on the foundation laid by Moore’s Law and the open source software movement. 

OpenROV's ingredients are an impressive mix of open source goodness...

* BeagleBone Black - an open-source single-board computer, smaller than a deck of cards, running Linux.
* Linux - specifically, the Ubuntu distribution.
* Node.js - platform for building web applications, based on the Google’s V8 JavaScript engine. Thanks to Node.js, any laptop running a web browser can control the OpenROV.
* Arduino - inexpensive micro-controller commonly used in robotics projects.
* TCP/IP - the communication protocol of the Internet. TCP/IP handles all communications (commands, video) between the OpenROV and the pilot’s laptop. 

The OpenROV team has released all of their [schematics and source code](https://github.com/openrov) to the open source community, hence the word “open” in the company name. If you think the open source aspects of OpenROV are exciting, wait until you hear about the company's main mission: Underwater exploration.
<!--more-->
Eric and David were kind enough to invite me to their lab/manufacturing facility in Berkeley, California recently. Thank you, OpenROV makers!

###Remotely Operated Vehicles 
{% imgcap right /images/controller.jpg Laptop, browser, and game controller. %}
ROV is short for remotely operated vehicle, an underwater robot. Scientists use ROVs to study marine life. Oil companies use ROVs for underwater construction and inspections. Industry-grade ROVs are priced at $30,000 on the low-end, while a [custom ROV can cost several million dollars](http://www.mbari.org/twenty/Tiburon.htm). 

The OpenROV team was convinced that they could design and build an ROV small enough to fit in a suitcase, and easy enough for a citizen scientist to assemble and maintain. Targeting the general public meant achieving a relatively low price point: under one thousand dollars ($1,000.00). Spoiler alert: They did it. The device is successful, and you can [buy an OpenROV](http://store.openrov.com/) kit today for $849.00.

###Citizen Science
Our world will always need professional scientists, people working in academia and in industry to push the frontier of knoweledge. Some scientific problems require the attention of PhD-level professionals, while other problems are better solved through crowdsourcing. Enter the [citizen scientist](http://en.wikipedia.org/wiki/Citizen_science).

Professional scientists are good at analyzing data, because that's what they have trained themselves to do. But data gathering requires less training than analysis. Citizen science and crowdsourcing work when there's an overwhelming volumen of data to gather. Or when the breakthrough is beyond the reach of current scientific knowledge.

[Orville and Wilbur Wright](http://en.wikipedia.org/wiki/Wright_brothers) were citizen scientists. Many professional scientists pursued solutions for fixed-wing flight prior to the Wright brothers' success. The flight problem defied the known science of the day. A new, unorthodox approach was required. Citizen scientists may be constrainted by money, but they tend to be unconstrained by expertise. Therefore they are likely to try solutions that experts would never consider.

Of course, citizen scientists are not immune to the constraints of expertise. For example...

>No flying machine will ever fly from New York to Paris ...[because] no known motor can run at the requisite speed for four days without stopping.
><br/>~Orville Wright

Thousands of professional and citizen scientists are now using OpenROV to explore bodies of water that have never been explored so thoroughly before. Vast portions of our planet's oceans remain unexplored. What will our citizen scientists discover?

###Open Source On-Site
{% imgcap right /images/ui-discussion-2.jpg Enthusiasts collaborate on the next UI. %}
On the day I visited the OpenROV factory, other OpenROV enthusiasts were on-site, working with company engineers on product improvements. One enthusiast, a professional ROV operator, pilots large human-sized ROVs as deep as 2,000 meters below the ocean's surface. "We're always looking at amperage", she said in a discussion with another enthusiast. A spike in amperage could indicate a ground fault, and batteries drain rapidly when that happens. You do not want to be stuck underwater when the batteries run out. 

Another member of the open source community, an engineering veteran with decades of experience at [Apple](http://apple.com) and [Oracle](http://oracle.com), translates the operator's feedback into code that might drive the next OpenROV user interface. 

That's how open source works at OpenROV. 

###Hardware Testing
I offered to leave when the engineers prepared to test some new components. I've worked in technology for decades, and I respect a company's right to protect their secrets.

"Ray, you forget that this is all open source," they told me. "We've already shared the schematics online, so there's nothing to hide. Come and watch the test." Yes, I had to be reminded about the real meaning of open source!

Four OpenROV makers gathered around a tank of water to test a new motor, controller, and propeller combination. They measured power utilization, propulsion, and temperature. Power utilization is important because we want the batteries to last a decent amount of time. Temperature matters because we don't want the OpenROV to melt underwater (or fry the fish). And propulsion matters because if the unit can't move, what's the point?

From the reaction of the team, it looks like they found some good components for the next batch of OpenROV kits.

###Advantage of Kits







###Tethering
Radio waves (like WiFi) don't travel very well underwater, so ROV communication happens through a tether, a bundle of copper wires carrying signals between the controller and the ROV unit.

A web application, built with Node.js, runs on the OpenROV. 
