---
layout: post
title: "Homebrew Fundamentals"
date: 2014-02-11 14:20
comments: true
categories: [ Ruby ]
---
Spend enough time developing software on Mac OS X, and you will eventually need to install tools that were written for Unix, but not specifically for OS X. Fortunately we have the [Homebrew](http://brew.sh/) package manager, which makes it easier to install Unix software on Mac OS X. 

Homebrew is a package manager, like [Fink](http://www.finkproject.org/) and [MacPorts](http://www.macports.org/). Before package managers, developers who needed a particular tool would have to:

* Manually download source code for the tool.
* Manually compile using `gcc` or another compiler.
* Resolve dependencies manually.

Manually, manually, manually... The old way was long and error-prone. [Max Howell](https://twitter.com/mxcl) created Homebrew to download, compile, and resolve dependencies automatically. Now developers can focus more attention on solving problems that are directly related to their work.
<!--more-->
###How to Install Homebrew
{% imgcap right /images/xcode-app-store.png Homebrew depends on Xcode. %}
Some parts of Homebrew require Xcode. Make sure you have Xcode installed on your Mac. Xcode is available for free in the Mac App Store.



###Why Homebrew?
Before installing any new software tool, it is helpful to know what to expect from the tool.


###Looking at Packages
There are several ways to view the packages that have been installed on
a system via Homebrew. 

```bash
$ brew server
```
{% imgcap center /images/brew-server.png Browsing packages with Homebrew's built-in web server. %}




###Making Your Own Packages
Homebrew is Ruby-based, so Rubyists can create their own packages.  Details can be found in the (continuously updated) [Homebrew repo on GitHub](https://github.com/Homebrew/).
