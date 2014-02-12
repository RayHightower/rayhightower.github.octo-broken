---
layout: post
title: "Homebrew Fundamentals"
date: 2014-02-11 14:20
comments: true
categories: [ Ruby ]
---
Spend enough time developing software on Mac OS X, and you will eventually need to install tools that were written for Unix, but not specifically for OS X. Fortunately we have [Homebrew](http://brew.sh/), which makes it easier to install Unix software on the Mac. 

Homebrew is a package manager. It differes from earlier package managers like [Fink](http://www.finkproject.org/) and [MacPorts](http://www.macports.org/) because it is written in Ruby and based on Git, modern weapons in the web developers arsenal. Before package managers, developers who needed a particular tool would have to:

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
There are several ways to view the packages that have been installed on a system via Homebrew. Use `brew list` at the command prompt to get a quick view of what Homebrew has installed on the system.

Even better: `brew server` will launch a local Sinatra app, and then you can point your browser to `http://localhost:4567` for a web-enabled view of the installed packages.

```bash
$ brew server
View our tasting menu at http://localhost:4567/
Use "Control-C" to exit.

[2014-02-12 16:33:18] INFO  WEBrick 1.3.1
[2014-02-12 16:33:18] INFO  ruby 1.8.7 (2012-02-08) [universal-darwin12.0]
== Sinatra/1.3.3 has taken the stage on 4567 for development with backup from WEBrick
[2014-02-12 16:33:18] INFO  WEBrick::HTTPServer#start: pid=96694 port=4567
```

{% imgcap center /images/brew-server.png Browsing locally-installed Homebrew packages. %}

###Making Your Own Packages
Homebrew is Ruby-based, so Rubyists can create their own packages.  Details can be found in the (continuously updated) [Homebrew repo on GitHub](https://github.com/Homebrew/).
