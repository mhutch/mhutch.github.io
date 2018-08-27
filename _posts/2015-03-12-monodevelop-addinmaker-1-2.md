---
tags: [ mono ]
layout: journal
title: MonoDevelop.AddinMaker 1.2
created: 1426140484
redirect_from:
- /node/231
- /journal/2015/03/12/monodevelopaddinmaker_12
---
I've finally released [MonoDevelop.AddinMaker](https://mhut.ch/addinmaker/1.2),
making it easier than ever before to customize and add features to Xamarin
Studio and MonoDevelop. This release has been stalled for a while due to factors
beyond my control, and I'm very happy to be able to make it available at
last.<!--break--> Thanks to [Lluis](https://twitter.com/slluis) for getting rid
of the roadblocks!

This release improves the basic user experience by introducing the concept of
"Addin References". Instead of referencing an addin's assemblies and explicitly
adding a dependency on that addin, you can add an addin reference, which will
automatically take care of both of these things for you.

However, the most important changes are below the surface. Switching to the
MSBuild engine allows you to use custom MSBuild syntax to customize your build
process, and enables command-line builds via MSBuild/xbuild. More importantly,
it provides a solid foundation on which to build future improvements.

Happy extending!
