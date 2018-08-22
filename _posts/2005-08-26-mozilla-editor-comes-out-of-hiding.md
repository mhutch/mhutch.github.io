---
tags:
- mono
- aspnetedit
- gecko
layout: journal
title: Mozilla editor comes out of hiding
created: 1125092474
---
Okay, I admit it, so far I've been "cheating", rendering the page to a temp file every time something changes. No longer! I present to you the all-singing, all-dancing Mozilla editor version. You can select controls on the surface, type text straight into the page, resize controls, and drag-n-drop! This is the first you'll have seen of my co-conspirator <a href="http://www.dachev.com/blog/">Blago</a>'s work, but trust me, it's been worth the wait.

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/AspNetEdit3.png"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspNetEdit3-t.png"/></a>

In other news, saving and loading are temporarily broken. We also haven't exposed many of the Mozilla editor's features, the main ones being cut/copy/paste, undo/redo, styling, and table editing. However, at this point it's mainly just a matter of hooking them up to toolbar buttons.

Oh, and those <em>are</em> new control icons. They haven't been released yet, as they're too embarassing, but if some SVG genius would like to improve them, the source files are available on request.
<!--break-->
