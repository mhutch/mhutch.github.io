---
tags:
- mono
- monodevelop
- asp.net
- opensuse build service
layout: journal
title: ASP.NET Completion and MonoDevelop Debugger Packages
created: 1224229907
redirect_from: /node/161
---
All the basic ASP.NET code completion features I wanted to get into MonoDevelop are now essentially complete and working with the new code completion database subsystem that Mike Kruger has written to replace our old one. It handles controls, directives and HTML, all of their attributes, and some attribute values, including some <a href="http://mjhutchinson.com/journal/2008/07/24/colour_completion">colourful</a> and <a href="http://mjhutchinson.com/journal/2008/04/08/an_apologetic_sneak_peek">time-saving</a> examples.   I've been migrating code "downwards" into HTML and XML completion editor extension, and I'll write another day about how this works and how it'll make good XAML and XML completion easier in the future. 

I couldn't wait to get these features out to users (so you can start giving me bug reports!), and I think that the C# code completion has stabilised sufficiently after Mike's changes, so I started updating my <a href="http://mjhutchinson.com/journal/2007/11/07/monodevelop_trunk_builds">MonoDevelop trunk builds</a> again. You'll also be able to try out the text editor and C# completion improvements, your MSBuild project files will be more compatible with VS, and you can play with my <a href="http://mjhutchinson.com/journal/2008/10/14/vi_modes_monodevelop">vi modes</a>.

The biggest news is that the Mono debugger is officially supported with the recent Mono 2.0 release, so I added <a href="http://software.opensuse.org/search?baseproject=openSUSE%3A11.0&p=1&q=monodevelop-debugger-mdb">MonoDevelop debugger packages</a> for MDB and also for <a href="http://software.opensuse.org/search?baseproject=openSUSE%3A11.0&p=1&q=monodevelop-debugger-gdb">GDB</a>, so you can try the fruits of <a href = "http://foodformonkeys.blogspot.com/2008/07/debugger-screenshotting.html">Lluis' fantastic debugger work</a>. As a bonus, I also created <a href="http://software.opensuse.org/search?baseproject=openSUSE%3A11.0&p=1&q=monodevelop-python">monodevelop-python packages</a> for Christian Hergert's <a href="http://audidude.com/blog/?p=49">Python addin</a>, and <a href="http://software.opensuse.org/search?baseproject=openSUSE%3A11.0&p=1&q=monodevelop-vala">monodevelop-vala packages</a> for the Vala binding that Levi Bard contributed.

I'm taking a short break this weekend to see the fall leaves, and after that I'll be attacking the bug queue and taking a look either at per-project text editor settings, or maybe bringing the <a href="http://www.mono-project.com/Moonlight">Moonlight</a> support in MD back up to speed.

