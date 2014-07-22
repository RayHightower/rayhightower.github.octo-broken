---
layout: post
title: "RVM and Parallella: What a Difference a Shell Makes"
date: 2014-07-21 21:46
comments: true
categories: [ Linux-Unix-OSX, Parallella ]
---
[RVM](/blog/2013/05/16/upgrading-ruby-with-rvm/) is an effective way to manage Ruby versions on a Linux or OS X system. RVM was working well on my Ubuntu-based [Parallella](/blog/2014/07/07/parallella-quick-start-guide-with-gotchas/), until one day it stopped:

```bash
linaro-nano:~> rvm list
rvm: Command not found.
linaro-nano:~>

```
`RVM not found.` Fortunately, [Zach Briggs](https://twitter.com/theotherzach) and I were pairing at a recent OpenHack ChicagoRuby event when the problem occurred. Zach is an ideal pairing partner; troubleshooting was smooth because he was there. Time to investigate.
<!--more-->
After a few experiments, we discovered that we could run RVM by explicitly specifying the path to the executable:

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

Therefore, it appeared that the Ubuntu/Linux `$PATH` varaible was being ignored. Google led us to consider the shell in use on the Parallella.


```bash
linaro-nano:~> echo $SHELL
/bin/tcsh
linaro-nano:~>

```
Very interesting. `tcsh` was our current Parallella shell. I'm more accustomed to `bash`. Could RVM prefer `bash` too? We changed one line of ~/.profile to tell the Parallella to start with `bash` instead of `tcsh`, and rebooted the Parallella.

```bash
linaro-nano:~> echo $SHELL
/bin/bash
linaro-nano:~>

```
...and now RVM works normally.


```bash
linaro-nano:~> rvm list

rvm rubies

   ruby-2.0.0-p481 [ armv7l ]

# Default ruby not set. Try 'rvm alias create default <ruby>'.

# => - current
# =* - current && default
#  * - default

linaro-nano:~>

```

###On to Fish?
Accordig to [Twitter](https://twitter.com/TheOtherZach/status/490333914863763457), Zach has moved on to a shell called [fish](http://fishshell.com/). Sounds like a subject for a future blog post.

###Original Plan: Rubinius
Did I mention that we originally planned to install [Rubinius](/blog/2014/02/06/installing-rubinius-using-rvm/) on the Parallella? Where there are goals, there are yaks waiting to be shaved!

