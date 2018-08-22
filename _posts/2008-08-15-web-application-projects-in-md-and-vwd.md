---
tags:
- mono
- monodevelop
- asp.net
- visual web developer express
layout: journal
title: Web Application Projects in MD and VWD
created: 1218829505
redirect_from: /node/158
---
I'm very pleased that <a href="http://www.microsoft.com/express/vwd/">Visual Web Developer Express 2008</a> has now <a href="http://blogs.msdn.com/webdevtools/archive/2008/05/12/visual-studio-2008-sp1-beta.aspx">gained Web Application project support</a> in Service Pack 1. This means that MonoDevelop users will be able to share ASP.NET projects with VWD developers.

For those of you who haven't heard the story behind this, Web Application projects are support for developing your ASP.NET site as a <em>project</em>. Although VS.NET and VS.NET 2003 did this, it was removed in VS 2005 in favour of "Web Sites", which consider a web site to be a <em>directory</em>. As I'm sure you can guess, the latter system is convenient for editing websites in-place &mdash; and they even had FTP support for this purpose &mdash; but in my opinion it's a poor system for well-structured development. Clearly other people thought so, because Web Applications were added back to Visual Studio 2005 as an optional addon, and included in VS 2008. Finally in VS2008 SP1, it's reached the free version. The reason for this is quite simple; it's a necessity for proper <a href="http://www.asp.net/mvc/">ASP.NET MVC</a> development.

At the moment, MD trunk does a passable job of opening projects from VWD 2008 SP1, but building and deployment isn't so great, because when I originally implemented these, I had to work around some of the limitations in MD's build and deployment system. These workarounds aren't quite compatible with the MSBuild projects from VS. I'm currently trying to make this seamless by tweaking our MSBuild loader to more closely match the MSBuild build targets and file copy semantics, making the MD deployment system slightly more generic, and implementing the build and deployment targets "correctly" for ASP.NET projects.

Support for importing Web Sites may come later, but for now, it's good to see that we can now interoperate with Microsoft's free ASP.NET development tool.
<!--break-->
