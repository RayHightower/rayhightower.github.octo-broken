---
layout: post
title: "Node.js Prep for OpenROV"
date: 2014-06-30 14:06
comments: true
categories: [ IoT, Node.js, OpenROV ]
---
{% imgcap right /images/nodejs-white.png %}
[OpenROV is an underwater robot](/blog/2014/06/16/citizen-science-with-openrov/) controlled through a web browser. The server-side of the web app is written in Node.js, running on a [BeagleBone Black](/blog/2013/05/22/beaglebone-black-running-ruby-on-rails/) inside the OpenROV. 

You don't need to know Node.js on order to pilot an OpenROV. And you don't need to do anything in this article to construct an OpenROV from a kit. But if you’re the kind of maker who likes to dig deep into a project, you might want to explore Node.js.
<!--more-->
###Mac OS X and Node.js
Everything written here applies to Node.js as it runs on Mac OS X. If your local machine runs Linux or Windows, you will need to consult other resources in order to get Node up and running.

###Homebrew First
Make sure you’re running [Homebrew](/blog/2014/02/12/homebrew-fundamentals/) on your Mac. Homebrew is a seamless way to manage packages on Mac OS X. To install Homebrew...

```bash
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"install

```

After installation, confirm that Homebrew is running properly...

```bash
$ brew doctor

```

###Installing Node.js
Now that Homebrew is installed and running, Node.js can be installed with a single line command.

```bash
$ brew install node

```

To confirm that Node.js is installed on your system and to check the version number...

```bash
$  which node
/usr/local/bin/node

$ node --version
v0.10.26

$ 
```

###Hello World in Node.js
You know the compter science tradition: The first program in any new
language has to say "Hello, World." Here's how to do that in Node.js.





Now that you have Node.js running successfully, you're ready to explore the [OpenROV repo on GitHub](http://github.com/openrov).

###Next Steps
Future blog posts about Node.js and OpenROV will consider questions like:

* What does Node.js do for OpenROV that other languages can’t do?

* What other languages might we use to control OpenROV? It’s all open source, so our brainstorms could one day turn into actual code running on OpenROV!

* How does Node.js on the BeagleBone Black interact with the Arduino and other OpenROV components?

Keep exploring!
