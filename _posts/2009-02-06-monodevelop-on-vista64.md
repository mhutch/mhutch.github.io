---
tags:
- mono
- monodevelop
- vista
- 64-bit
layout: journal
title: MonoDevelop on Vista64
created: 1233966025
redirect_from: /node/165
---
Last night I got MonoDevelop working (to some extent) on Windows Vista x64 using the Linux binaries, <a href="http://twitter.com/mjhutchinson">tweeting my progress along the way</a>.

_UPDATE: In another 5am hacking run this evening, I've managed to build MonoDevelop fully in Visual Studio 2008, and debug at all the way to the Welcome Page, using 32-bit debugging on Vista 64. However, I'm going to have to tidy the project file fixes a lot before I commit them._<!--break-->

My starting point was <a href="http://jpobst.blogspot.com/">Jonathan Pobst</a>'s zip file for MonoDevelop on Windows as a starting point for the dependencies, except GTK# which I installed using the Novell <a href="http://www.go-mono.com/mono-downloads/download.html">GTK# 2.12.8 installer for .NET</a>.

I then downloaded the openSUSE 11.0 MonoDevelop trunk binaries from <a href="http://download.opensuse.org/repositories/home:/MJHutchinson/openSUSE_11.0/repodata/">my openSUSE Build Service repository</a>, since openSUSE 11.0 has GTK# 2.12, which matches the version available on Windows. I then used <a href="http://www.7-zip.org/">7-Zip</a> to extract the binaries from the RPM, added the dependencies. Also, since some of MonoDevelop links against Mono.Posix 1.0, whereas 2.0 was in the MD directory, I downloaded the mono-core RPM, extracted the Mono.Posix 1.0 dll, and put it in the GAC.

No luck. MonoDevelop failed to run. GTK# doesn't have a 64-bit version, so it failed to locate its glue libraries. Fortunately, <a href="http://msdn.microsoft.com/en-us/library/ms164699(VS.80).aspx">Corflags.exe</a> can be used to flag that a PE image needs to be run in 32-bit mode, so after installing the .NET SDK to get hold of this, I marked MonoDevelop.exe as a 32-bit binary and ran it. It worked!

<a href="/files/images/MonoScreenshots/PreliminaryMonoDevelopOnVista64.png"><img src="/files/images/MonoScreenshots/PreliminaryMonoDevelopOnVista64-thumb.png" alt="Screenshot of MonoDevelop 1.9.2 on Windows Vista 64" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

I ran into <a href="http://lists.ximian.com/pipermail/monodevelop-devel-list/2009-February/000103.html">many bugs</a>, some of which Jonathan had already filed. Some are due to our assumptions about the host OS, but there are also a few subtle bugs and runtime behaviours that MD depends on, and finding these helps us to improve Mono itself.

On the whole, it was pretty successful. On my 32-bit machine I can create HTML files in MD on .NET with fully working code completion, and the code completion window even <a href="/journal/2008/04/11/shiny_feature_day">goes transparent</a>. I'm looking forward to the day that we can offer MonoDevelop as a stable IDE and platform on Windows and MacOSX.
