---
layout: post
title: "OS X and RubyMotion Finishing Up"
date: 2013-11-11 19:03
comments: true
categories: [ Linux-Unix-OSX, RubyMotion ]
---
There is something I neglected to mention in a previous blog post, [Building an OS X App With RubyMotion](/blog/2013/11/01/building-an-os-x-app-with-rubymotion/). Once you've written the OS X app in RubyMotion, where do you find the executable app, and how do you add it to the Applications folder on the Mac?

Some long-time Mac enthusiasts will readily surmise the answer. I have included the information here for completeness.

###Find, Drag, and Drop
First thing to note: A Mac app named [random-app].app is actually a directory, even though it appears to be a file when viewed in the `Applications` folder.

After compilation, RubyMotion puts all of the executables in the `/build/` directory. Using Finder, drag the file named `[your-app-name].app` into the Applications folder.

Or, if you prefer the command line…

```bash
$ cd [root directory of your RubyMotion OS X app]
$ cp build/[your-app-name].app ~/Applications
$
```

It doesn't really matter whether we copy the file or move it.  RubyMotion creates a new one with every build, when we type `rake`.

###Launch at Login
I want the EjectDisks utility to be always available, so it would be good to have it launch automatically at login. That behavior is managed in the `Users and Groups` preference pane, shown below:


Click the `+` sign, navigate to the app you want to launch at login time (in this case, EjectDisks) and select it. Done.
