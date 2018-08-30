---
tags: [ mono, monodevelop, mac, preview, silverlight, moonlight ]
title: Moonlight Development on Mac using MonoDevelop
created: 1241658065
redirect_from:
- /node/170
- /journal/2009/05/07/moonlight_development_mac_using_monodevelop
- /journal/2009-05-07/moonlight_development_mac_using_monodevelop
---
Yesterday I announced much-improved [MonoDevelop preview builds for
Mac](/journal/2009/05/06/monodevelop_mac_preview_builds), which include [ASP.NET
MVC support](/journal/2009/04/04/monodevelop_aspnet_mvc_mac) out-of-the-box.
However, there was a little surprise in that build that I didn't mention &mdash;
*full support for building and running Silverlight projects* using a bundled
copy of the Moonlight SDK.

I created a screencast to show off how easy this makes it to develop Silverlight apps on the Mac:<!--break-->

[![Screencast of Moonlight on Mac](/files/screencasts/MonoDevelopMacMoonlightPreview.png)](/files/screencasts/MonoDevelopMacMoonlightPreview.swf)

Note that, as I said before, this is an alpha preview release of MonoDevelop,
but I feel that it's already very usable. After seeing the screencast, I'm sure
you'll agree. Download it from the [Mac
Preview](http://monodevelop.com/Download/Mac_Preview) page on the MonoDevelop
website.

The Moonlight support in MonoDevelop trunk is entirely functional on Linux too,
but it's not so easy to get it running since you need to build and install the
Moonlight stack from source, and I would strongly advise against doing this
unless you're comfortable with setting up a [Parallel Mono
Environment](http://www.mono-project.com/Parallel_Mono_Environments). However,
it's easy if you use a binary Moonlight SDK like the Mac package does, and
tomorrow I'll blog about how to do this with my MonoDevelop trunk packages for
openSUSE.

I wrote much of the Silverlight/Moonlight project support code in the lead-up to
the 2008 PDC, but the Moonlight 2.0 toolchain and runtime wasn't complete enough
to make it worthwhile for me to finish the build/run support, so I focussed on
other things, and we quietly dropped the addin from the [MonoDevelop
2.0](http://monodevelop.com/Download/MonoDevelop_2.0_Released) release. On
Friday, with the [first Moonlight 2.0
preview](http://tirania.org/blog/archive/2009/May-04.html) and Mac MonoDevelop
preview looming, I decided to finish it off, and did so over that afternoon and
the weekend. I spent Monday and Tuesday polishing it and making it possible to
bundle the Moonlight SDK in the MonoDevelop app.

It still needs work &mdash; the XAML completion in particular is a quick hack I
put together one evening during PDC &mdash; but I believe that it's already a
great way to build your Silverlight apps quickly and easily!
