---
layout: post
title: "Parallella Quick Start Guide (with gotchas)"
date: 2014-07-07 13:31
comments: true
categories: [ High Performance Computing, IoT, Parallella ]
---
{% imgcap center /images/parallella_screenshot.png Parallella screenshot, 1080p. %}
Today’s fastest laptops have four processors working together to power through applications. Parallella has _eighteen_ processors (2 [ARM](http://arm.com/) plus 16 [FPGA](http://en.wikipedia.org/wiki/Field-programmable_gate_array)).  Parallella is a single-board parallel computer roughly the size of a deck of cards, like a [Raspberry Pi](/blog/2012/12/03/ruby-on-raspberry-pi/) or [Beaglebone Black](/blog/2014/01/02/beaglebone-black-ubuntu-part-1/). Demand for Parallella devices is strong. As of this writing the devices are sold out... again!

Everything in this post is based on the [official quick start guide created by the Parallella team](http://www.parallella.org/quick-start/). I ran into some _gotchas_ during my first Parallella experience. The snags (and solutions) are documented here.
<!--more-->
###Comparison with Raspberry Pi or Beaglebone Black
The most obvious difference: Parallella runs hot! So hot, in fact, that the unit comes with a heat sink and the recommendation to add a fan. I’ve never needed a fan with a Pi or a ‘Bone.

Of course, the Parallella runs hotter because it has more processing power packed tightly together in limited space. Future posts will cover performance comparisons. Now, let’s get started with Parallella.

###Start With the SD Card
Burning the SD card takes a long time, so it makes sense to start that
process first.


###Out-Takes
A brand new Parallella parallel computer arrived at WisdomGroup this weekend. The devices are in demand and supplies are short. We waited over a year for this one. As of this writing the devices are sold out again!

Why is there so much demand for a tiny parallel computer? Is it the price ($119.00), the performance, or the novelty?
{% imgcap right /images/parallella_clear_case.jpg Parallella in a clear acrylic case. %}
###What is Parallella?
Parallella is a parallel computer that fits in the palm of your hand.  [Adapteva](http://adapteva.com), the manufacturer, sells two versions:

* A 16-FPGA model with a 2-core ARM chip.
* A 64-FPGA model with a 2-core ARM chip.



18-core (16-core [FPGA](http://en.wikipedia.org/wiki/Field-programmable_gate_array) plus 2-core [ARM](http://arm.com/))
