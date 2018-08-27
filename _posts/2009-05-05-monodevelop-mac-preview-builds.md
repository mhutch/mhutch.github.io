---
tags: [ mono, monodevelop, mac, preview ]
layout: journal
title: MonoDevelop Mac Preview Builds
created: 1241574651
redirect_from:
- /node/169
- /2009/05/06/monodevelop_mac_preview_builds
---
The past few weeks I've been working on improving the MonoDevelop experience on
the Mac, making it integrate better with the Mac experience. Along with [ASP.NET
MVC support](/journal/2009/04/04/monodevelop_aspnet_mvc_mac) and other soon-to
be-announced excitement, I think this makes MonoDevelop much more interesting
for Mac users.<!--break-->

![MonoDevelop with Mac main menu support](/files/images/MonoScreenshots/MacMainMenu.png)

Among other things, I have:

* Abstracted out the main menu and reimplemented it as a native Mac global menu.
* Added handlers for Mac events, such as Quit, Dock Click, Open Files, etc.
* Added Mac-specific command accelerators.
* Made it possible to capture the Mac Command and Option keyboard modifiers for
  accelerators.
* Made accelerators display everywhere using Mac-style glyphs.
* Tweaked the text editor's caret and selection navigation to behave more like a
  Mac IDE, including Alt/Control word/subword splitting.

This has been made difficult by the native GTK+ Mac. Although the basics work
very well, there are substantial problems with some of the more advanced things
we do, such as key capturing for accelerators, and custom widgets. In the future
we will be fixing issues upstream and shipping patched GTK+ builds with Mono,
but for now I've been focussing on making everything work with the released Mono
2.4.

To do much of this, I had to build a large set of Carbon P/Invoke signatures and
wrappers, and getting these right took some time. It seems to me that this could
be the basis of a "Mac Bridge" in the style of the [Vista
Bridge](http://code.msdn.microsoft.com/VistaBridge). Having such managed
wrappers would make it easier for developers to make their apps integrate more
closely with the unique aspects of various platforms.

This work will be released in MonoDevelop 2.2. Right now it's not finished, and
is very much an alpha. However, since it's already a substantial improvement for
Mac users, I am making available a Mac preview build. This is a _trunk build_
that has undergone no QA testing. I simply update it whenever I feel that trunk
is usable and bugfixes or improvements have been made since the previous build.
*Use at your own risk*. I have already listed a number of [known
issues](http://monodevelop.com/Developers/Mac_Support#Known_Issues).

Download it from the [Mac Preview](http://monodevelop.com/Download/Mac_Preview)
page on the MonoDevelop website.

If you do run into problems that aren't on the known issues list, please [file
bug reports](http://monodevelop.com/Developers#Reporting_Bugs). And, as ever,
contributions are more than welcome.
