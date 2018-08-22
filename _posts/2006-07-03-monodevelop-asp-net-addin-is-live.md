---
excerpt: "I've just committed a patch to MonoDevelop to enable the use of the AspNetAddIn
  that I committed a couple of days ago. It's not close to fully-featured yet, but
  I'm pleased because it now enables a basic ASP.NET workflow. One can create an ASP.NET
  project and various ASP.NET files, then build and run it. The XSP server will be
  launched, followed by a web browser, and the compiled page can be seen in all its
  glory. In theory all .NET languages supported by MonoDevelop can be used, though
  I have only been able to test C# so far.\r\n\r\n<a href=\"http://mjhutchinson.com/files/images/MonoScreenshots/AspNetAddIn1.png\"><img
  src=\"http://mjhutchinson.com/files/images/MonoScreenshots/AspNetAddIn1-small.png\"
  alt=\"Screenshot of MonoDevelop ASP.NET addin\"/></a>\r"
tags:
- mono
- aspnetedit
- monodevelop
- asp.net
layout: journal
title: MonoDevelop ASP.NET addin is live
created: 1151925884
---
I've just committed a patch to MonoDevelop to enable the use of the AspNetAddIn that I committed a couple of days ago. It's not close to fully-featured yet, but I'm pleased because it now enables a basic ASP.NET workflow. One can create an ASP.NET project and various ASP.NET files, then build and run it. The XSP server will be launched, followed by a web browser, and the compiled page can be seen in all its glory. In theory all .NET languages supported by MonoDevelop can be used, though I have only been able to test C# so far.

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/AspNetAddIn1.png"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspNetAddIn1-small.png" alt="Screenshot of MonoDevelop ASP.NET addin"/></a>

There's also some basic CodeBehind support; for example, in the Solution pad, CodeBehind classes are shown as children of the files that inherit them, and the files containing the CodeBehind classes are hidden. This is more powerful than MS's approach, as it allows one file to contain more than one CodeBehind class, or classes that are used for more than one page. But it wouldn't have been possible without MonoDevelop's powerful code parsing services. In addition, when you run the compilation cycle, all page controls with IDs will automatically be added to the CodeBehind class as fields. Don't worry, I plan to make this more granular at some point!

Currently I'm working on integrating the AspNetEdit graphical designer, separating dependencies, and code that could potentially be shared by other designer.

(Update 2006-07-03, 17:43: added screenshot)
