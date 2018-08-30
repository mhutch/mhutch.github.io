---
tags: [ mono, novell, opensuse build service, hack week, ogre, ogre.net, packaging ]
title: 'Hack Week: OGRE.NET Packaging'
created: 1220547104
redirect_from:
- /node/159
- /journal/2008/09/04/hack_week_ogrenet_packaging
- /journal/2008-09-04/hack_week_ogrenet_packaging
---
Last week was my second [Hack Week](http://www.novell.com/prblogs/?p=495) at
Novell. Massi and I had been intending to hack on a [demo for embedding Mono in
games](/journal/2008/08/05/demoing_mono_games), but realised that the overhead
of bootstrapping a stable working environment would most likely frustrate our
efforts to get something within the week.<!--break-->

Instead, I decided to package some game libraries for Mono on the [openSUSE
Build Service](http://en.opensuse.org/Build_Service). I planned to package
[Axiom](http://axiomengine.sf.net), [OpenTK](http://www.opentk.com) and
[OGRE.NET](http://www.ogre3d.org/phpBB2addons/viewforum.php?f=1), and write some
MonoDevelop templates for them, but got rather tied up in the details of
packaging OGRE.NET and its unmanaged dependencies (I now know far more about
packaging SONAMEd libraries than I wanted to!). As a result, I only completed
the packaging for OGRE.NET, though I _will_ get around to packaging the others
sometime.

You can now install my [OGRE.NET and OGRE packages for OpenSUSE
11](http://download.opensuse.org/repositories/home:/MJHutchinson:/mono-games/openSUSE_11.0/repodata),
reference OgreDotNet and Math3D from MonoDevelop, and start writing code without
having to worry about unmanaged libraries, etc.:

![Screenshot of a
MonoDevelop running an OGRE.NET demo](/files/images/MonoScreenshots/OgreDotNet.png)

Massi did an alternate [Mono game embedding
demo](http://primates.ximian.com/~massi/blog/archive/2008/Aug-04.html), and
investigated how we could optimise [SWIG](http://www.swig.org) (or some other
binding generator such as [DoxyBind](http://imaginary-project.net/doxybind)) to
generate better Mono bindings for C++ code.
