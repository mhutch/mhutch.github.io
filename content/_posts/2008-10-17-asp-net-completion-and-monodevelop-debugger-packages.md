---
tags: [ mono, monodevelop, asp.net, opensuse build service ]
title: ASP.NET Completion and MonoDevelop Debugger Packages
created: 1224229907
redirect_from:
- /node/161
- /journal/2008/10/17/aspnet_completion_monodevelop_debugger_packages
- /journal/2008-10-17/aspnet_completion_monodevelop_debugger_packages
---
All the basic ASP.NET code completion features I wanted to get into MonoDevelop
are now essentially complete and working with the new code completion database
subsystem that Mike Kruger has written to replace our old one. <!--break--> It
handles controls, directives and HTML, all of their attributes, and some
attribute values, including some
[colourful](/journal/2008/07/24/colour_completion) and
[time-saving](/journal/2008/04/08/an_apologetic_sneak_peek) examples.  I've been
migrating code "downwards" into HTML and XML completion editor extension, and
I'll write another day about how this works and how it'll make good XAML and
XML completion easier in the future.

I couldn't wait to get these features out to users (so you can start giving me
bug reports!), and I think that the C# code completion has stabilised
sufficiently after Mike's changes, so I started updating my [MonoDevelop trunk
builds](/journal/2007/11/07/monodevelop_trunk_builds) again. You'll also be able
to try out the text editor and C# completion improvements, your MSBuild project
files will be more compatible with VS, and you can play with my [vi
modes](/journal/2008/10/14/vi_modes_monodevelop).

The biggest news is that the Mono debugger is officially supported with the
recent Mono 2.0 release, so I added [MonoDevelop debugger
packages](http://software.opensuse.org/search?baseproject=openSUSE%3A11.0&p=1&q=monodevelop-debugger-mdb)
for MDB and also for
[GDB](http://software.opensuse.org/search?baseproject=openSUSE%3A11.0&p=1&q=monodevelop-debugger-gdb),
so you can try the fruits of [Lluis' fantastic debugger
work](http://foodformonkeys.blogspot.com/2008/07/debugger-screenshotting.html).
As a bonus, I also created [monodevelop-python
packages](http://software.opensuse.org/search?baseproject=openSUSE%3A11.0&p=1&q=monodevelop-python)
for Christian Hergert's [Python addin](http://audidude.com/blog/?p=49), and
[monodevelop-vala
packages](http://software.opensuse.org/search?baseproject=openSUSE%3A11.0&p=1&q=monodevelop-vala)
for the Vala binding that Levi Bard contributed.

I'm taking a short break this weekend to see the fall leaves, and after that
I'll be attacking the bug queue and taking a look either at per-project text
editor settings, or maybe bringing the
[Moonlight](http://www.mono-project.com/Moonlight) support in MD back up to
speed.