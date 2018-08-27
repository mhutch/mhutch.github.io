---
tags: [ photography, monodevelop, preview, moonlight ]
layout: journal
title: Moonlight Development on Linux with MonoDevelop
created: 1241758162
redirect_from:
- /node/171
- /journal/2009/05/08/moonlight_development_linux_monodevelop
---
Yesterday I made a screencast demonstrating [Moonlight Development on Mac using
MonoDevelop](/journal/2009/05/07/moonlight_development_mac_using_monodevelop).
Today, I bring you the same thing on Linux.
<!--break-->

[![Screencast of Moonlight development of
Mac](http://mjhutchinson.com/files/screencasts/MDMoonDemo.png)](http://www.go-mono.com/media/MDMoonDemo.ogv)

Unfortunately, getting this running isn't quite as simple as the Mac installer.
However, if you're on openSUSE/SLED, it's _almost_ as easy, using [my trunk
MonoDevelop
packages](http://download.opensuse.org/repositories/home:/MJHutchinson) from the
openSUSE build service ([1-click install for openSUSE
11.1](http://software.opensuse.org/ymp/home:MJHutchinson/openSUSE_11.1/monodevelop.ymp)).

You just have to download and extract my [Moonlight
SDK](/files/temp/MoonSDK-Preview-2009-05-05.zip), extract it somewhere, then
tell MonoDevelop where it using the `MOONLIGHT_2_SDK_PATH` environment variable:

```bash
export MOONLIGHT_2_SDK_PATH=/full/path/to/MoonSDK
monodevelop
```

If you don't have openSUSE/SLED, you'll have to use the [Mono 2.4 VMWare
image](http://www.go-mono.com/mono-downloads/download.html) or build MonoDevelop
from trunk. If you build MonoDevelop from trunk, I suggest not installing it,
and instead using "make run". If you don't even have Mono 2.4, you'll need to
build that too, and please use a [parallel
environment](http://www.mono-project.com/Parallel_Mono_Environments) if you
don't want to risk messing your system up with hard-to-diagnose problems.
