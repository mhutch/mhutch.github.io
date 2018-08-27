---
tags: [ mono, aspnetedit, monodevelop, jscall# ]
title: AspNetEdit now includes JSCall#
created: 1179071852
redirect_from:
- /node/126
- /journal/2007/05/13/aspnetedit_now_bundled_with_jscall
---
I just saw a post by Chris Howie on [glueless javascript calls into
Gecko#](http://www.chrishowie.com/2007/05/08/glue-free-jscall), and over a
couple of my revision breaks I modified JSCall# to use this technique. The new
completely managed code version is now in SVN, and I'll make a proper 0.0.3
release when I've written some docs.<!--break-->

The upshot of this is that it's now bundled with MonoDevelop, so Monodevelop SVN
can be built with AspNetEdit ("./configure --enable-aspnet --enable-aspnetedit")
without having to have JSCall# built and installed. This means you no longer
need a C++ compiler and the Mozilla development libraries. Thanks Chris!