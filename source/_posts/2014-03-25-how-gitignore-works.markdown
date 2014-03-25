---
layout: post
title: "How .gitignore Works"
date: 2014-03-25 18:20
comments: true
categories: [ Education, Linux-Unix-OSX ]
---
Earlier today I ran into a Git issue within a RubyMotion project. I added a directory to the project's `.gitignore` file, but Git seemed to ignore my ignore. Expressed more clearly, Git continued to track a directory that I explicitly told it to ignore.

What?

Either there was a bug in Git, or my understanding of `.gitignore` was incomplete. It was time for me to dig in and learn more about `.gitignore`.
<!--more-->
Testing.

