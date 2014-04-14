---
layout: post
title: "Managing Dotfiles"
date: 2014-04-15 17:13
comments: true
categories: [ Community, Linux-Unix-OSX ]
---
Dotfiles, the configuration files used by Unix-like machines, can get disorganized over time. Entropy rules! This article describes my recent attempt to bring order to dotfile chaos. Git and GitHub are integral parts of this project.

Dotfiles are normally hidden when you try to view them in the Mac OS X Finder. To view them from the command prompt, use `$ ls -al`.

```bash
~/.dotfiles[master]$ ls -al
total 40
drwxr-xr-x   8 rth  staff   272 Apr 14 01:44 .
drwxr-xr-x+ 71 rth  staff  2414 Apr 14 02:12 ..
-rwxr-xr-x   1 rth  staff  3455 Apr 13 16:01 .bash_profile
drwxr-xr-x  14 rth  staff   476 Apr 14 02:25 .git
-rw-r--r--   1 rth  staff  1649 Apr 13 16:44 .gitk
-rw-r--r--   1 rth  staff  1760 Apr 13 16:10 .irbrc
-rw-r--r--   1 rth  staff   118 Aug 22  2013 .zprofile
-rw-r--r--   1 rth  staff   375 Apr 14 01:44 README.mdown

~/.dotfiles[master]$
```

###Why Use Git to Manage Dotfiles?
As a version control system, Git is a great tool for managing files that change over time. Dotfiles can change as we install new software or tweak our development environment. If we make a mistake, or if an installation script makes a mistake, we can use Git to roll back in history to a pre-mistake version of the dotfile.
<!--more-->
###Don't Make All Dotfiles Public
There are some dotfiles that you don't want to share publicly. For
example, `.bash_history` contains all of the commaands that have been executed in the shell. Do you really want the world that you sometimes `$ ssh myuserid@[embarassingdomainname].com`? Probably not. If you think that a dotfile might contain personal or confidential information, no need to broadcast it.

###.dotfiles Directory
Most of my dotfiles, like `.bash_profile`, don't contain anything private. In fact, most of what I know about dotfiles has come from other developers via books, user groups, blogs, and spelunking through GitHub. Dotfile collections by [Hashrocket](https://github.com/hashrocket/dotmatrix) and [Thoughtbot](https://github.com/thoughtbot/dotfiles) are  especially good. My `~/.dotfiles` directory is available for public viewing on [GitHub](https://github.com/RayHightower/.dotfiles).


created a `~/.dotfiles` directory

$ mkdir ~/.dotfiles
$ mv ~/.gitk .
$ cd ~
$ ln -s ~/.dotfiles/.gitk

###Tweets (delete before deploy)
One way to manage dotfiles. http://rayhightower.com/blog/2014/04/15/managing-dotfiles/


