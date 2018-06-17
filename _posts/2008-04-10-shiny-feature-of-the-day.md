---
categories:
- mono
- monodevelop
- compositing
layout: journal
title: Shiny Feature of the Day
created: 1207882195
---
Today I implemented an oft-requested feature for MonoDevelop: making the code completion and info tooltips transparent when the Control key is held down. This enables you to take a look at the code that the window's obscuring, without dismissing the popup:

<img src="http://mjhutchinson.com/files/images/MonoScreenshots/SemiTransparentCompletionWindow.png" alt="Screenshot of a semi-transparent code completion window." style="max-width:98%" />

This feature's in MonoDevelop trunk, and can be tried out right away. You'll need GTK+ 2.12 or above (GTK# only needs to be 2.8 or above) and Compiz or any other compositing window manager. It's also available in my <a href="http://mjhutchinson.com/journal/2007/11/07/monodevelop_trunk_builds">MonoDevelop trunk builds</a> on the openSUSE build service. 

This behaviour is encapsulated in <a href="http://anonsvn.mono-project.com/viewcvs/trunk/monodevelop/main/src/core/MonoDevelop.Projects.Gui/MonoDevelop.Projects.Gui.Completion/WindowTransparencyDecorator.cs?view=markup">a class</a> that can be attached to any Gtk.Window, and handles a couple of nasty hacks and workarounds.
<!--break-->
