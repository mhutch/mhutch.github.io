---
tags: [ mono, c#, monodevelop, mac, monomac ]
layout: journal
title: Building Mac Applications in MonoDevelop with MonoMac
created: 1276055473
redirect_from:
- /node/180
- /journal/2010/06/09/monomac_in_monodevelop
---
Recently [Miguel announced
MonoMac](http://tirania.org/blog/archive/2010/Apr-19.html), a new Mono binding
for Cocoa & other Objective-C libraries, based on the
[MonoTouch](http://monotouch.net) binding generator and Objective-C bridge.

This is exciting for many people because it allows writing native Mac GUIs using
C# and other .NET languages. I have put together a
[MonoDevelop](https://monodevelop.com) addin that simplifies the process of
creating, developing and debugging a MonoMac application.<!--break-->

I have created a brief walkthrough to show how easy it is to create a simple Mac application with MonoMac, MonoDevelop and Interface Builder.

First, create a new MonoMac C# project using the _New Project_ dialog.

![MonoDevelop New Project dialog showing MonoMac Project types](/files/images/MonoScreenshots/MonoMacHello1.png)

The new project has an entry point, a definition of the main menu and app
delegate, and a window with a controller. The `xib` files are interface
definitions that can be edited with Apple's Interface Builder GUI designer tool.
The `xib.designer.cs` files contain autogenerated partial classes for any
classes, actions and outlets defined in the xib files. The `Info.plist` file is
an application manifest, and MonoDevelop will automatically merge in some
required values when building the app bundle.

![A newly-created MonoMac project in MonoDevelop](/files/images/MonoScreenshots/MonoMacHello2.png)

The `MainWindow.xib` file can be opened in Interface Builder.

![Interface Builder with the MonoMac project's main window](/files/images/MonoScreenshots/MonoMacHello3.png)

After adding an `NSButton` and `NSTextField` to the window, add an outlet of type `NSTextField` to the controller definition in the Library.

![Adding an outlet to the MainWindowController](/files/images/MonoScreenshots/MonoMacHello4.png)

Connect this outlet to the text field on the window by dragging the outlet from the Inspector.

![Connecting the text field to the outlet on the controller](/files/images/MonoScreenshots/MonoMacHello5.png)

Similarly, create an _action_ of type `NSButton`, and connect it to the button on the window.

![Connecting the button to an action on the controller](/files/images/MonoScreenshots/MonoMacHello6.png)

MonoDevelop automatically updates the designer code when it regains focus. The designer partial class contains the new action and outlet.

![The autogenerated designer code for the controller's outlets and actions](/files/images/MonoScreenshots/MonoMacHello7.png)

Implement the action in the controller class. MonoDevelop will automatically complete the partial method signature.

![Implementation of the action in the controller](/files/images/MonoScreenshots/MonoMacHello8.png)

The application is compiled to an app bundle, which can be run or debugged like any other Mono application.

![Debugging the MonoMac application](/files/images/MonoScreenshots/MonoMacHello9.png)

Note that this is an _experimental preview_, the result of a few days' work, and
MonoMac itself is also in an immature state. I make no guarantee about stability
of the MonoMac APIs, the MonoDevelop CodeBehind generator, the project format,
or functionality of any of the usual MonoDevelop features. With these caveats,
you can download a MonoDevelop build with MonoMac included.

*UPDATE:* The addin can now be installed into the latest version of MonoDevelop 2.4 by following [these instructions](http://www.mono-project.com/MonoMac#Obtaining_MonoMac).

This is a community effort, not a commercial product, so *we need your help* improving both MonoMac and the MonoDevelop addin!

* Binding and auditing more Framework APIs.
* Writing samples and templates to set the patterns for MonoMac applications.
* Writing tutorials and documentation.
* Porting Cocoa samples to exercise the bindings and tooling, and prioritize API
  binding.
* Enabling the MonoDevelop addin to expose existing C# classes and project
  resources to Interface Builder.

Email the [mono-osx mailing list](http://lists.ximian.com/mailman/listinfo/mono-osx) to join in!