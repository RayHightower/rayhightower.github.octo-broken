---
layout: post
title: "Installing Rubinius Using RVM"
date: 2014-02-06 18:17
comments: true
categories: [ Ruby ]
---
{% right /images/rubinius.png %}
[Rubinius](http://rubini.us/) is an implementation of the Ruby language designed for concurrency. The lead developer of Rubinius, [Brian Shirai](http://twitter.com/brixen), will present Rubinius at ChicagoRuby on 3/4/2014 followed by a hack night on 3/12/2014. Details are on the [ChicagoRuby meetup site](http://meetup.com/chicagoruby).

To prepare for the Rubinius presentation and hack night coming up in March, I decided to install Rubinius on my machine. Once again, RVM rides in to make the process smooth.
<!--more-->
###RVM Recap
[Ruby Version Manager (RVM)](http://rayhightower.com/blog/2013/05/16/upgrading-ruby-with-rvm/) is one of my favorite tools because it allows developers to install multiple versions of Ruby on one system, to bounce between the different versions, and to do all of that with minimal headaches. Similar tools exist, but RVM is the one that has always worked for me.

If you don't have RVM installed, detailed installation instructions can be found at [http://rvm.io](http://rvm.io).

###Installing Rubinius
First, make sure you're running the latest version of RVM.

```bash
$ rvm get head
Downloading https://get.rvm.io
Downloading https://github.com/wayneeseguin/rvm/archive/master.tar.gz

Upgrading the RVM installation in /Users/rth/.rvm/
    RVM PATH line found in /Users/rth/.bashrc /Users/rth/.zshrc.
    RVM sourcing line found in /Users/rth/.bash_profile /Users/rth/.zprofile.
    Migrating environment ruby-1.9.2-p290 to use with 'gem-wrappers' gem.

     …

     Installing gem-wrappers gem in 3 gemsets.
Upgrade of RVM in /Users/rth/.rvm/ is complete.

     …

In case of problems: http://rvm.io/help and https://twitter.com/rvm_io

RVM reloaded!

$
```

###Next, Install Rubinius
As of this writing, Rubinius can operate with a 1.8 language mode or a 1.9 language mode. The default mode is 1.8. Since I chose to install the 1.9 mode, I needed an additional command line flag, `--1.9`.

```bash
$ rvm install rbx --1.9


```

###Testing the Rubinius Installation
First, let's make sure that RVM shows the new Rubinius (rbx) installation.

```bash
$ rvm list

rvm rubies

=> rbx-2.2.4 [ x86_64 ]
   ruby-1.9.2-p290 [ x86_64 ]
 * ruby-1.9.3-p484 [ x86_64 ]
   ruby-2.0.0-p353 [ x86_64 ]

# => - current
# =* - current && default
#  * - default


$
```

Hmm…. Is there any other way to check this?


```bash
$ ruby --version
rubinius 2.0.0.n37 (1.9.3 6d611c7a 2014-02-06 JI) [x86_64-darwin12.5.0]

$
```

And now, let's do a quick "Hello World" test drive.



```bash

$ irb
rbx-2.2.4 :001 > p 'Hello World, from Rubinius'
"Hello World, from Rubinius"
 => "Hello World, from Rubinius"
rbx-2.2.4 :002 > quit

$
```

###Post Installation Notes
The installation script found that I had two outdated Homebrew-installed packages: `automake` and `openssl`. If I had to perform this installation again, I would upgrade Homebrew and related packages _before_ installing Rubinius.

Why install Rubinius? Why do we care about concurrency? These are two questions I expect to explore through my new Rubinius installation. 

###Come Hack With Rubinius
If you plan to be in the Chicago area in March 2014, drop by [ChicagoRuby]() for some back-to-back Rubinius action. See [http://meetup.com/chicagoruby](http://meetup.com/chicagoruby) for details. 
