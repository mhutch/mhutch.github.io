---
excerpt: "In their recent update of the iOS and Mac developer tools, Apple removed
  the standalone Interface Builder application and integrated the GUI designer functionality
  directly into Xcode 4. This was a very significant change and removed several features
  that were necessary for MonoTouch and MonoMac to integrate with the designer. As
  soon as Xcode 4 went final, we started working on MonoDevelop support for integrating
  MonoTouch with Xcode 4's GUI designer, but it's a complex project and will take
  some time to complete. \r\n\r\n"
categories:
- mono
- monotouch
- xcode 4
layout: journal
title: Preview of Xcode 4 Support for MonoTouch
created: 1304452596
---
In their recent update of the iOS and Mac developer tools, Apple removed the standalone Interface Builder application and integrated the GUI designer functionality directly into Xcode 4. This was a very significant change and removed several features that were necessary for MonoTouch and MonoMac to integrate with the designer. As soon as Xcode 4 went final, we started working on MonoDevelop support for integrating MonoTouch with Xcode 4's GUI designer, but it's a complex project and will take some time to complete. 

For now <a href="http://monotouch.net/News/post.aspx?id=0ba9d233-c65e-4713-b90d-84f233655430">we recommend</a> using Xcode 3's Interface Builder, which can easily be done even <a href="http://blog.sublimeintervention.com/archive/2011/Apr-25.html">while having Xcode 4 installed</a>. However, I understand that many people are concerned how Xcode 4 will be better supported going forward for MonoTouch and MonoMac, so I've made a screencast to introduce MonoDevelop's upcoming Xcode 4 integration and demonstrate how it works.

<a href="/files/screencasts/MonoTouchXcode4Preview.swf"><img src="/files/screencasts/MonoTouchXcode4Preview.png" alt="MonoTouch integration with Xcode 4" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Although XIB files can be opened standalone in Xcode 4, this isn't very useful, as it's no longer possible to define custom types, outlets and actions within the interface designer. Instead the designer is aware of the Objective-C types defined in the Xcode project that contains the XIB file. This means that we have to generate an Xcode project file and synchronize it with the MonoDevelop project. Since Apple doesn't support writing third-party Xcode plugins, we can't make the Xcode designer directly aware of types defined in C# source, so the generated Xcode project also has to contain Objective-C stubs for all the types defined in C#. The Xcode designer now modifies the Objective-C source files when adding outlets or actions, so those changes need to be synchronized back the the MonoDevelop project.

The new model of Xcode integration resolves several outstanding issues in the previous Interface Builder integration. Because the generated project contains all bundle resources (Content and Page files) from the project, they will now be accessible directly from the GUI designer. In addition, all user-defined types are accessible from the designer, not just those defined for the current xib file.

Obviously, synchronizing files and types between two projects in separate applications is complex, and if anything goes wrong it's possible to lose data, so we want to make sure it's as reliable as possible before we release it. We hope to be able to offer a beta of this functionality within the next few weeks.
