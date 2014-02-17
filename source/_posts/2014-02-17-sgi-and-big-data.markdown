---
layout: post
title: "SGI & Big Data"
date: 2014-02-17 14:46
comments: true
categories: [ Community ]
---
{% imgcap right /images/sgi-logo-1990s.png SGI's logo from the 1990s. %}
[Silicon Graphics International Corporation (SGI)](http://sgi.com) computers rendered the special effects for the original [Jurassic Park](http://en.wikipedia.org/wiki/Jurassic_Park) movie. Computer enthusiasts coveted SGI machines throughout the 1990s. 

But success in the computer industry is fleeting. A few years after Jurassic Park, a convergence of tech advances (Moore's Law, x86 architecture, and Linux) made it possible for commodity PCs to perform as well as SGI's premium workstations. Wall Street traders and other power users abandoned workstations in favor of Linux-based PCs. High-end makers like SGI fell on hard times.

Today, SGI is fighting back. The company is blending x86, Linux, and (buzzword alert) Big Data to attack the high performance computing market. The vision was presented at this month's [Chicago ACM](http://www.meetup.com/chicagoacm/) meeting by Brian Freed, VP of Strategy for SGI.
<!--more-->
###What is Big Data?
Freed shared a definition of Big Data from [Edd Dumbill's O'Reilly Radar article](http://strata.oreilly.com/2012/01/what-is-big-data.html). Big Data is characterized by volume (lots of it), variety (it's unstructured), and velocity (the data changes quickly).

In the words of the O'Reilly author...

>Big data is data that exceeds the processing capacity of conventional database systems. The data is too big, moves too fast, or doesn’t fit the strictures of your database architectures. To gain value from this data, you must choose an alternative way to process it.
>
> ~Edd Dumbill

Most companies could not afford to reap the benefits of Big Data in the early days because of two huge barriers: Cost and computing power.

###Example: Fraud Detection with Big Data
Consider the challenge faced by credit card companies. When a credit card is presented for an online purchase, how does the authorizing body know if the charge is legitimate? Can legitimacy be determined in a timely fashion, before an impatient buyer abandons a slow seller for a quicker seller?  

Sellers who decide too quickly will suffer fraud. Sellers who decide too slowly will lose customers. The problem is amplified because millions of shoppers are clicking the "buy now" button simultaneously, and they all expect an answer _right now_.  

Big Data helps credit card companies to make better authorization decisions in less time. Traditional fraud detection systems could measure two potential fraud vectors at most within the allowed time window. However, [Hadoop](http://hadoop.apache.org/) clusters running on SGI hardware are able to examine the problem deeper, and render a yes/no decision faster. Buyers are happier because they can complete a purchase faster. Companies are happier because fraud is reduced.

###Pitfalls of Big Data
From what I gathered from Freed's presentation, the biggest pitfall is trying to use this _hammer_ for every _nail_ in sight, whether the solution fits the problem or not. It's the same hazard we face with any new technology. We run the risk of using a sledgehammer when a fly swatter would do. 

A few ways to avoid the pitfalls: Start small. Have goals.

###Success Through Iteration
Freed summed up the successful path as follows: Successful implementation of big data is not an event. It is an iterative process where we continuously learn over time.

###About Chicago ACM
[The Chicago Chapter of the Association for Computing Machinery (Chicago ACM)](http://www.meetup.com/chicagoacm/) is on fire. December's meeting featured a supercomputing presentation by [Sharan Kalwani of Fermilab](/blog/2013/12/12/high-performance-computing-at-acm/). The February The February meeting was all about SGI's push into Big Data, and next month will focus on the Internet of Things (IoT). What an exciting combination. Looking forward to more!
