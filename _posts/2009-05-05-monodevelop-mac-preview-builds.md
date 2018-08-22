---
excerpt: "The past few weeks I've been working on improving the MonoDevelop experience
  on the Mac, making it integrate better with the Mac experience. Along with <a href=\"http://mjhutchinson.com/journal/2009/04/04/monodevelop_aspnet_mvc_mac\">ASP.NET
  MVC support</a> and other soon-to be-announced excitement, I think this makes MonoDevelop
  much more interesting for Mac users.\r\n\r"
tags:
- mono
- monodevelop
- mac
- preview
layout: journal
title: MonoDevelop Mac Preview Builds
created: 1241574651
---
The past few weeks I've been working on improving the MonoDevelop experience on the Mac, making it integrate better with the Mac experience. Along with <a href="http://mjhutchinson.com/journal/2009/04/04/monodevelop_aspnet_mvc_mac">ASP.NET MVC support</a> and other soon-to be-announced excitement, I think this makes MonoDevelop much more interesting for Mac users.

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/MacMainMenu.png "><img src="http://mjhutchinson.com/files/images/MonoScreenshots/MacMainMenu-thumb.png" alt="MonoDevelop with Mac main menu support" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Among other things, I have:
<ul>
<li>Abstracted out the main menu and reimplemented it as a native Mac global menu.</li>
<li>Added handlers for Mac events, such as Quit, Dock Click, Open Files, etc.</li>
<li>Added Mac-specific command accelerators.</li>
<li>Made it possible to capture the Mac Command and Option keyboard modifiers for accelerators.</li>
<li>Made accelerators display everywhere using Mac-style glyphs.</li>
<li>Tweaked the text editor's caret and selection navigation to behave more like a Mac IDE, including Alt/Control word/subword splitting.<li>
</ul>

This has been made difficult by the native GTK+ Mac. Although the basics work very well, there are substantial problems with some of the more advanced things we do, such as key capturing for accelerators, and custom widgets. In the future we will be fixing issues upstream and shipping patched GTK+ builds with Mono, but for now I've been focussing on making everything work with the released Mono 2.4.

To do much of this, I had to build a large set of Carbon P/Invoke signatures and wrappers, and getting these right took some time. It seems to me that this could be the basis of a "Mac Bridge" in the style of the <a href="http://code.msdn.microsoft.com/VistaBridge">Vista Bridge</a>. Having such managed wrappers would make it easier for developers to make their apps integrate more closely with the unique aspects of various platforms.

This work will be released in MonoDevelop 2.2. Right now it's not finished, and is very much an alpha. However, since it's already a substantial improvement for Mac users, I am making available a Mac preview build. This is a <em>trunk build</em> that has undergone no QA testing. I simply update it whenever I feel that trunk is usable and bugfixes or improvements have been made since the previous build. <strong>Use at your own risk</strong>. I have already listed a number of <a href="http://monodevelop.com/Developers/Mac_Support#Known_Issues">known issues</a>.

Download it from the <a href="http://monodevelop.com/Download/Mac_Preview">Mac Preview</a> page on the MonoDevelop website.

If you do run into problems that aren't on the known issues list, please <a href="http://monodevelop.com/Developers#Reporting_Bugs">file  bug reports</a>. And, as ever, contributions are more than welcome.
