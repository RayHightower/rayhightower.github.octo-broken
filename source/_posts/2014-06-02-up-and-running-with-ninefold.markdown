---
layout: post
title: "Up &amp; Running With Ninefold"
date: 2014-06-02 18:47
comments: true
categories: [ Rails, Ruby ]
---
{% img right /images/ninefold-logo.png %}
[Ninefold](https://ninefold.com/) is a Rails hosting platform based in Australia. The company is backed by [Maquarie Telcom](http://www.macquarietelecom.com/).

I first met the Ninefold team at RailsConf 2014 in Chicago. I'm in San Francisco this week for RubyMotion #Inspect and related events, so I took the time to stop by their San Francisco office. Now it's time to take the service for a spin.
<!--more-->
These experiments were conducted with Ruby 2.1.1 and Rails 4.0.4. Destructive testing has always been my best instructor, so I used [RVM](/blog/2013/05/16/upgrading-ruby-with-rvm/) to create a special gemset for Ninefold experiments.

```bash

$ rvm current
ruby-2.1.1@ninefold

$ 

```

The sandbox is ready. Let the games begin.

###Installing the Ninefold CLI
The Ninefold command line interface (CLI) installs as a Ruby gem.

```bash
$ gem install ninefold
Fetching: netrc-0.7.7.gem (100%)
Successfully installed netrc-0.7.7
Fetching: multipart-post-2.0.0.gem (100%)
Successfully installed multipart-post-2.0.0
Fetching: faraday-0.9.0.gem (100%)
Successfully installed faraday-0.9.0
Fetching: ninefold-1.6.0.gem (100%)
Building native extensions.  This could take a while...
Successfully installed ninefold-1.6.0
Parsing documentation for faraday-0.9.0
Installing ri documentation for faraday-0.9.0
invalid options: -SHN
(invalid options are ignored)
Parsing documentation for multipart-post-2.0.0
Installing ri documentation for multipart-post-2.0.0
Parsing documentation for netrc-0.7.7
Installing ri documentation for netrc-0.7.7
Parsing documentation for ninefold-1.6.0
Installing ri documentation for ninefold-1.6.0
Done installing documentation for faraday, multipart-post, netrc, ninefold after 1 seconds
4 gems installed

$ 

```

Alternatively, you can include the `ninefold` gem as part of the application's gemfile.

```ruby
gem ninefold

```




