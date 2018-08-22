---
excerpt: "Yesterday I announced much-improved <a href=\"http://mjhutchinson.com/journal/2009/05/06/monodevelop_mac_preview_builds\">MonoDevelop
  preview builds for Mac</a>, which include <a href=\"http://mjhutchinson.com/journal/2009/04/04/monodevelop_aspnet_mvc_mac\">ASP.NET
  MVC support</a> out-of-the-box. However, there was a little surprise in that build
  that I didn't mention &mdash; <strong>full support for building and running Silverlight
  projects</strong> using a bundled copy of the Moonlight SDK.\r\n\r\nI created a
  screencast to show off how easy this makes it to develop Silverlight apps on the
  Mac:\r\n\r"
tags:
- mono
- monodevelop
- mac
- preview
- silverlight
- moonlight
layout: journal
title: Moonlight Development on Mac using MonoDevelop
created: 1241658065
redirect_from: /node/170
---
Yesterday I announced much-improved <a href="http://mjhutchinson.com/journal/2009/05/06/monodevelop_mac_preview_builds">MonoDevelop preview builds for Mac</a>, which include <a href="http://mjhutchinson.com/journal/2009/04/04/monodevelop_aspnet_mvc_mac">ASP.NET MVC support</a> out-of-the-box. However, there was a little surprise in that build that I didn't mention &mdash; <strong>full support for building and running Silverlight projects</strong> using a bundled copy of the Moonlight SDK.

I created a screencast to show off how easy this makes it to develop Silverlight apps on the Mac:

<a href="http://www.go-mono.com/media/MonoDevelopMacMoonlightPreview.swf"><img src="http://mjhutchinson.com/files/screencasts/MonoDevelopMacMoonlightPreview.png" alt="Screencast" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Note that, as I said before, this is an alpha preview release of MonoDevelop, but I feel that it's already very usable. After seeing the screencast, I'm sure you'll agree. Download it from the <a href="http://monodevelop.com/Download/Mac_Preview">Mac Preview</a> page on the MonoDevelop website.

The Moonlight support in MonoDevelop trunk is entirely functional on Linux too, but it's not so easy to get it running since you need to build and install the Moonlight stack from source, and I would strongly advise against doing this unless you're comfortable with setting up a <a href="http://www.mono-project.com/Parallel_Mono_Environments">Parallel Mono Environment</a>. However, it's easy if you use a binary Moonlight SDK like the Mac package does, and tomorrow I'll blog about how to do this with my MonoDevelop trunk packages for openSUSE.

I wrote much of the Silverlight/Moonlight project support code in the lead-up to the 2008 PDC, but the Moonlight 2.0 toolchain and runtime wasn't complete enough to make it worthwhile for me to finish the build/run support, so I focussed on other things, and we quietly dropped the addin from the <a href="http://monodevelop.com/Download/MonoDevelop_2.0_Released">MonoDevelop 2.0</a> release. On Friday, with the <a href="http://tirania.org/blog/archive/2009/May-04.html">first Moonlight 2.0 preview</a> and Mac MonoDevelop preview looming, I decided to finish it off, and did so over that afternoon and the weekend. I spent Monday and Tuesday polishing it and making it possible to bundle the Moonlight SDK in the MonoDevelop app.

It still needs work &mdash; the XAML completion in particular is a quick hack I put together one evening during PDC &mdash; but I believe that it's already a great way to build your Silverlight apps quickly and easily!
