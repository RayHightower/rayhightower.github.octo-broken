---
layout: post
title: "Gain Insight with awesome_print_motion for RubyMotion"
date: 2013-11-25 15:08
comments: true
categories: [ iOS, Ruby, RubyMotion ]
---
###The Problem
Let's say you're building a version of Atari's [Pong in RubyMotion](/blog/2013/02/26/atari-pong-rubymotion-objective-c/). You're debugging an issue with the paddles; they don't line up the way you want them to. Time to examine the playing field via the RubyMotion console.

```bash
pong-rm $ rake
```

Mouse over the playing field and Command-click to grab the object in the RubyMotion console. Confirm that you grabbed the object by typing `self` at the console prompt. And then, to see what objects are on the playing field,

```bash
> self.subviews
…

```

Difficult for the human brain to parse, eh? Now, try it with the awesome_print_motion gem.

```bash
> self.subviews
…

```

Much easier to read. The structure of the `subviews` array is clear. Each element of the array has an easy-to-read index. Debugging is a snap :-)

###How to Install awesome_print_motion
RubyMotion uses bundler. So we start by adding a reference to our gemfile.

```ruby
gem 'awesome_print_motion'
```

In the app's `Rakefile`, there are two possible ways to proceed. The preferred way is to use the following lines to tell the app to require every gem mentioned in Bundler's Gemfile:

```ruby


```

The older way is to manually add a `require` statement to the Rakefile.

```ruby

```

###How to Use awesome_print_motion
To use the new gem, start the app and explore away.

```ruby

```

###Acknowledgements
Thank you Michael Dvorkin for adding RubyMotion support to your [awesome_print](http://rubygems.org/gems/awesome_print) gem.




