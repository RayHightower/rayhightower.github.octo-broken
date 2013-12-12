---
layout: post
title: "High Performance Computing at ACM"
date: 2013-12-12 22:22
comments: true
categories: [ Education ]
---
{% imgcap right /images/cray-sonexion.png Cray Sonexion Storage Appliance %}
>Anyone can build a fast CPU. The trick is to build a fast system. 
>&nbsp;<br/>
>~ Seymour Cray

The Chicago chapter of the Association for Computing Machinery (ACM) hosted a lecture titled _Supercomputing and You_ yesterday evening. The talk was delivered by [Sharan Kalwani](http://www.linkedin.com/in/sharankalwani) of Fermilab. Kalwani's background blends mechanical engineering and computer science with decades of experience with high performance computers. 

###10x => High Performance Computing
Kawani began his talk by drawing a distinction between _supercomputing_ and _high performance computing (HPC)_. Supercomputing is the buzzword that everybody knows, but the word implies that the designers are focused only on improving the performance of the CPU. Such narrow focus leads to new problems. If we focus on improving CPU performance alone, applications that are CPU-bound will quickly encounter I/O bottlenecks. High performance computing takes the entire system into account, therby producing computers tailored for the applications they are expected to run.
<!--more-->
Computers that perform at least ten times faster than the current state-of-the art are considered to be high performance. The definition is therefore a moving target. The processor in today's smartphone would have been considered high performance a decade ago.

###The First Supercomputer
[Seymour Cray](http://www.cray.com/) is considered to be the father of the supercomputer. Cray cobbled together the first supercomputer using off-the-shelf components of the day and his unique ideas about computer architecture. 

For example, Cray observed that the speed of an electrical signal was one bottleneck in computer performance. Electrical signals travel at the speed of light. Light can travel roughly four feet in one nanosecond.  Therefore, Cray decided that all internal cables in his new system would be less than four feet in length. No input would need to wait more than a nanosecond for a signal.

The 1972-era Cray supercomputer ran at a clock speed of 80MHz. The standard word was 64-bits in size. 
 
###Supercomputers... So What?
Why do we need to spend time and money on high performance computers? What are they used for?

Members of the HPC indsutry use their tools and talent to solve problems that elude typical computers. For example:

* *Auto safety testing*. Kawani spent several years using HPC to run simulated crash tests for General Motors. A physical crash test, one in which the car is destroyed, costs $500k per car. The same test can be run in a simulator for $5k, a 99% cost savings. The business advantage of simulated tests is clear.
* *Nuclear testing*. It is very expensive (measured both in dollars and in human lives) to test a nuclear power plant. Fortunately, scientists know enough about nuclear behavior to create realistic simulations. Testing via simulation helps to manage costs and reduce accidents.
* *Weather forecasting*. The first supercomputers needed three days to predict the weather for _tomorrow_. What good is a 2-day-old weather forecast? A good forecast can save lives by telling people to evacute before a life-threatening natural disaster. Supercomputers can produce accurate weather forecasts while the reader still has time to take action.
* *Bioinformatics*. When scientists can reliably simulate drug behavior before humans begin taking the drug, medical treatments can be improved and lives can be saved.
* *Energy exploration*. As long as people are depending on fossil fuels, we need locate new sources in a timely and cost-effective way.  Supercomputers can process seismic data quickly and with sufficient granualrity to tell fuel prospectors where to drill.

The bottom line: High performance computers deliver a return on investment that far outweighs their cost.

###Who Has the Fastest Supercomputer?
[Top500.org](http://top500.org/) lists the fastest supercomputers on the
planet, ordered by number of floating point operations per second
(FLOPS). As of this writing, the fastest computer is located at the 

There are those who believe that the Top500.org list is missing a few names. Maybe some governments or companies don't want to make their strengths public. 

###Other Top Lists
High performance computers gulp power. Rule of thumb: 1 megawatt of electricity used over the course of one year costs $1 million. The owners of the #1 on the Top 500 list spend $17 million dollars per year just on electricity _for one computer_.

Another group of supercomputing professionals maintains [The Green
500](http://green500.org) list to recognize the most energy efficient
supercomputers in the world. 

###Beyond Moore's Law



