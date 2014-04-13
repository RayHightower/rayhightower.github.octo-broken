---
layout: post
title: "Managing Dotfiles"
date: 2014-04-15 17:13
comments: true
categories: [ Community, Linux-Unix-OSX ]
---
Dotfiles, the configuration files used by Unix-like machines, can get
disorganized over time. Entropy rules! This article describes my recent
attempt to bring order to Dotfile chaos.

###.dotfiles Directory

$ mkdir ~/.dotfiles
$ mv ~/.gitk .
$ cd ~
$ ln -s ~/.dotfiles/.gitk


###Why You Want to Do This
Using Git to manage dotfile history is useful because we change our dotfiles from time to time. If we make a mistake, or if an installation script makes a mistake, we can use Git to roll back in history to a pre-mistake version of the dotfile.

###What NOT to Include in .dotfiles
Don’t include any dotfiles with personal information, like `.bash_history`. That file contains every command ever executed in your shell, so be careful about that one.
