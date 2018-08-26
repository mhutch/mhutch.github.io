---
tags:
- mono
- novell
- opensuse build service
- hack week
- ogre
- ogre.net
- packaging
layout: journal
title: 'Hack Week: OGRE.NET Packaging'
created: 1220547104
redirect_from: /node/159
---
Last week was my second <a href="http://www.novell.com/prblogs/?p=495">Hack Week</a> at Novell. Massi and I had been intending to hack on a <a href="http://mjhutchinson.com/journal/2008/08/05/demoing_mono_games">demo for embedding Mono in games</a>, but realised that the overhead of bootstrapping a stable working environment would most likely frustrate our efforts to get something within the week.<!--break-->

Instead, I decided to package some game libraries for Mono on the <a href="http://en.opensuse.org/Build_Service">openSUSE Build Service</a>. I planned to package <a href="http://axiomengine.sf.net">Axiom</a>, <a href="http://www.opentk.com/">OpenTK</a> and <a href="http://www.ogre3d.org/phpBB2addons/viewforum.php?f=1">OGRE.NET</a>, and write some MonoDevelop templates for them, but got rather tied up in the details of packaging OGRE.NET and its unmanaged dependencies (I now know far more about packaging SONAMEd libraries than I wanted to!). As a result, I only completed the packaging for OGRE.NET, though I <em>will</em> get around to packaging the others sometime.

You can now install my <a href="http://download.opensuse.org/repositories/home:/MJHutchinson:/mono-games/openSUSE_11.0/repodata/">OGRE.NET and OGRE packages for OpenSUSE 11</a>,  reference OgreDotNet and Math3D from MonoDevelop, and start writing code without having to worry about unmanaged libraries, etc.:

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/OgreDotNet.png"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/OgreDotNet-small.png" alt="Screenshot of a MonoDevelop running an OGRE.NET demo." style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Massi did an alternate <a href="http://primates.ximian.com/~massi/blog/archive/2008/Aug-04.html">Mono game embedding demo</a>, and investigated how we could optimise <a href="http://www.swig.org/">SWIG</a> (or some other binding generator such as <a href="http://imaginary-project.net/doxybind/">DoxyBind</a>) to generate better Mono bindings for C++ code.
