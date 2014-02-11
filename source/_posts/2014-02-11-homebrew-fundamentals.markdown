---
layout: post
title: "Homebrew Fundamentals"
date: 2014-02-11 14:20
comments: true
categories: [ Ruby ]
---
Spend enough time writing software on Mac OS X, and you will eventually need to install software that was written for Unix, but not specifically for OS X. For cases like that, there's [Homebrew](http://brew.sh/), written by [Max Howell](https://twitter.com/mxcl). Homebrew makes it easier to install Unix software on Mac OS X. 

Before Homebrew, developers would need to manually 
Download the source code for the utility.
Manually compile using gcc.
Resolve dependencies manually.

Homebrew handles all of these steps automatically. That way, developers can focus their attention on solving real problems.
<!--more-->
The Homebrew application and related scripts were 

###How to Install Homebrew
{% imgcap right /images/xcode-app-store.png Homebrew depends on Xcode. %}
Some parts of Homebrew depend on Xcode. Make sure you have Xcode installed on your Mac. Xcode is available for free in the Mac App Store.



###Why Homebrew?
Before installing any new software tool, it is helpful to know what to expect from the tool.


###Looking at Packages


```bash
$ brew server
```
{% imgcap center /images/brew-server.png Browsing Homebrew packages. %}




###Making Your Own Packages
Homebrew is Ruby-based, so if you know Ruby, you can create your own packages. Details can be found in the (continuously updated) [Homebrew repo on GitHub](https://github.com/Homebrew/).



