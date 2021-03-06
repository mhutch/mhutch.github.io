---
tags: [ mono, monodevelop, asp.net mvc, mac]
title: MonoDevelop ASP.NET MVC on the Mac
created: 1238817513
redirect_from:
- /node/168
- /journal/2009/04/04/monodevelop_aspnet_mvc_mac
- /journal/2009-04-04/monodevelop_aspnet_mvc_mac
---
After releasing a preview of the [ASP.NET MVC MonoDevelop
addin](/journal/2009/04/02/aspnet_mvc_monodevelop_addin_preview), I decided to
try it on the Mac.<!--break-->

Although the MonoDevelop 2.0 release on the Mac is still an alpha, it's a lot
better on the Mac than 1.0 was. Other than a couple of GTK+ redraw issues, the
major remaining problems are mostly to do with lack of Mac integration, such as
Ctrl-Click, top-level menu bar and Mac-like keyboard shortcuts. Making
MonoDevelop completely supported on the Mac is one of our targets for
MonoDevelop 2.2.

I downloaded the Mono 2.4 Mac installer and MonoDevelop 2.0 Mac installer
(*beware, alpha release*)  then followed exactly the same steps from my [earlier
Linux-based
walkthrough](/journal/2009/04/02/aspnet_mvc_monodevelop_addin_preview), and
apart from a couple of harmless warnings during installation of the addin, it
worked flawlessly!

![Running an ASP.NET MVC app in MonoDevelop on the
Mac](/files/images/MonoScreenshots/AspMvcAddin-Mac.png)

Since no-one on the MD team is familiar with Macs, contributions from Mac users
would be most welcome, including testing and feedback about how to make it feel
more Mac-like.