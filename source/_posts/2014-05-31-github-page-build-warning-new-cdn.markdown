---
layout: post
title: "GitHub Page Build Warning - New CDN"
date: 2014-05-31 13:44
comments: true
categories: [ Git ]
---
This blog is based on [Octopress](http://octopress.org/) and hosted on [GitHub Pages](https://pages.github.com/). Recently, after I deployed a site update, GitHub sent me an email with a `Page build warning` message. Since this was _just a warning_, I ignored it while I attacked more pressing tasks (not always a good idea).

Today I finally took the time to research the topic so I could figure out what to do next. This article is the result of that research.
<!--more-->
##What the Message Means
Here are the important points of the of the `Page build warning` message:

* GitHub introduced a [content delivery network (CDN)](http://en.wikipedia.org/wiki/Content_delivery_network) to make pages load faster.
* If you do nothing to your GitHub Pages site, your pages will continue to load the old way. People who visit your site won’t see anything different.
* If you want GitHub to serve your site faster, follow the instructions given in the blog articles.

###The Original Message
Here’s the original message. If you’re satisfied with the above translation, you can skip this section.

>The page build completed successfully, but returned the following warning:

>GitHub Pages recently underwent some improvements (https://github.com/blog/1715-faster-more-awesome-github-pages) to make your site faster and more awesome, but we've noticed that rayhightower.com isn't properly configured to take advantage of these new features. While your site will continue to work just fine, updating your domain's configuration offers some additional speed and performance benefits. Instructions on updating your site's IP address can be found at https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages#step-2-configure-dns-records, and of course, you can always get in touch with a human at support@github.com. For the more technical minded folks who want to skip the help docs: your site's DNS records are pointed to a deprecated IP address.

>For information on troubleshooting Jekyll see:

>  https://help.github.com/articles/using-jekyll-with-pages#troubleshooting

>If you have any questions please contact us at https://github.com/contact.

###What to Do Next
The domain is registered with [DNSimple](http://dnsimple.com), so here’s what needed to be done.

1 Point a CNAME record to [GitHub-user-name].github.io. In this case,  rayhightower.github.io.
1 WHat will appear on this line?
1 How about this line?


