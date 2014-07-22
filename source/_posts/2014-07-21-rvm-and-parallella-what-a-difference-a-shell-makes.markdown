---
layout: post
title: "RVM and Parallella: What a Difference a Shell Makes"
date: 2014-07-21 21:46
comments: true
categories: [ Linux-Unix-OSX, Parallella ]
---
[RVM](/blog/2013/05/16/upgrading-ruby-with-rvm/) is an effective way to manage Ruby versions on a Linux or OS X system. RVM was working well on my Ubuntu-based Parallella, until one day it stopped:

```bash
linaro-nano:~> rvm list
rvm: Command not found.
linaro-nano:~>

```
`RVM not found.` Fortunately, [Zach Briggs](https://twitter.com/theotherzach) and I were pairing at a recent OpenHack ChicagoRuby event when I encountered the problem. What an ideal pairing partner! Time to investigate.
<!--more-->

After a few experiments, I discovered that I could run RVM if I explicitly specified the path to the executable:

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

Therefore, it appeared that the Ubuntu/Linux `$PATH` varaible was being ignored.

I was pairing with Zach Briggs Or was it?

```bash
linaro-nano:~> vi .profile
linaro-nano:~>

```




