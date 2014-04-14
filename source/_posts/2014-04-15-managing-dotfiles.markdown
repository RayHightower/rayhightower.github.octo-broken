---
layout: post
title: "Managing Dotfiles"
date: 2014-04-15 17:13
comments: true
categories: [ Community, Linux-Unix-OSX ]
---
Dotfiles, the configuration files used by Unix-like machines, can get disorganized over time. Entropy rules! This article describes my recent attempt to bring order to dotfile chaos. Git and GitHub are integral parts of this project.

###Why Use Git to Manage Dotfiles?
Git is a great tool for managing files that change over time. Dotfiles can change as we install new software or tweak our development environment. If we make a mistake, or if an installation script makes a mistake, we can use Git to roll back in history to a pre-mistake version of the dotfile.
<!--more-->
###Don't Make All Dotfiles Public
There are some dotfiles that you don't want to share publicly. For
example, `.bash_history` contains all of the commaands that have been executed in the shell. Do you really want the world that you sometimes `$ ssh myuserid@[embarassingdomainname].com`? Probably not. If you think that a dotfile might contain personal or confidential information, no need to broadcast it.

###.dotfiles Directory
Most of my dotfiles, like `.bash_profile`, don't contain anything private. In fact, most of what I know about dotfiles has come from other developers via books, user groups, blogs, and spelunking through GitHub. [Hashrocket's dotmatrix repo](https://github.com/hashrocket/dotmatrix) is especially good. My `~/.dotfiles` directory is available for public viewing on [GitHub](https://github.com/RayHightower/.dotfiles).


created a `~/.dotfiles` directory

$ mkdir ~/.dotfiles
$ mv ~/.gitk .
$ cd ~
$ ln -s ~/.dotfiles/.gitk

###Tweets (delete before deploy)
One way to manage dotfiles. http://rayhightower.com/blog/2014/04/15/managing-dotfiles/


