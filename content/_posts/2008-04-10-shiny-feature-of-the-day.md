---
tags: [ mono, monodevelop, compositing ]
title: Shiny Feature of the Day
created: 1207882195
redirect_from:
- /node/151
- /journal/2008/04/11/shiny_feature_day
---
Today I implemented an oft-requested feature for MonoDevelop: making the code
completion and info tooltips transparent when the Control key is held down. This
enables you to take a look at the code that the window's obscuring, without
dismissing the popup.<!--break-->

![Screenshot of a semi-transparent code completion
window](/files/images/MonoScreenshots/SemiTransparentCompletionWindow.png)

This feature's in MonoDevelop trunk, and can be tried out right away. You'll
need GTK+ 2.12 or above (GTK# only needs to be 2.8 or above) and Compiz or any
other compositing window manager. It's also available in my [MonoDevelop trunk
builds](/journal/2007/11/07/monodevelop_trunk_builds) on the openSUSE build
service.

This behaviour is encapsulated in [a
class](http://anonsvn.mono-project.com/viewcvs/trunk/monodevelop/main/src/core/MonoDevelop.Projects.Gui/MonoDevelop.Projects.Gui.Completion/WindowTransparencyDecorator.cs?view=markup)
that can be attached to any Gtk.Window, and handles a couple of nasty hacks and
workarounds.