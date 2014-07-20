---
layout: post
title: "Shell Choices With Parallella and Ubuntu"
date: 2014-07-21 21:46
comments: true
categories: [ Linux-Unix-OSX, Parallella ]
---
[RVM](/blog/2013/05/16/upgrading-ruby-with-rvm/) is an effective way to manage Ruby versions on a Linux or OS X system. RVM was working well on my Ubuntu-based Parallella, until one day it stopped.

```bash
linaro-nano:~> rvm list
rvm: Command not found.
linaro-nano:~>

```
What happened?
<!--more-->

```bash
linaro-nano:~> ~/.rvm/bin/rvm list

rvm rubies

   ruby-2.0.0-p481 [ armv7l ]

# Default ruby not set. Try 'rvm alias create default <ruby>'.

# => - current
# =* - current && default
#  * - default

linaro-nano:~>

```
Apparently, the Ubuntu/Linux `$PATH` varaible was being ignored. Or was
it?


```fish
linaro-nano:~> vi .profile
linaro-nano:~>

```




