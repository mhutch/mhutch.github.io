---
tags: [ mono ]
title: How not to break Mono installations
created: 1194545169
redirect_from:
- /node/142
- /journal/2007/11/08/how_not_break_mono
---
It's a bad idea to mess with the packaged version of Mono on your Linux distro
by installing another version of Mono on top of it or into another of your
distro's standard prefixes such as /usr/local. Your distro's developers, testers
and packagers have tested the packaged version of Mono to make sure that it
works with the various applications that depend on it, such as MonoDevelop,
Tomboy, F-Spot, Beagle and Banshee. In addition, you're likely to end up with
unusual errors due to mismatched bits and pieces interacting in unpredictable
ways.<!--break-->

If you need a more recent version in order to test new features and bugfixes,
please keep a properly separated [parallel Mono
environment](http://www.mono-project.com/Parallel_Mono_Environments). By
following these instructions you can ensure that you don't affect your stable
Mono platform while experimenting with newer versions.

This applies to platform bindings such as GTK#, GtkSourceView# and GNOME# too!