---
tags: [ mono, aspnetedit, monodevelop, asp.net ]
layout: journal
title: ASP.NET Project Models
created: 1149976866
redirect_from: /node/98
---
One of the most difficult things about developing ASP.NET project support for MonoDevelop is deciding upon a project model to use. Microsoft appears to have this problem too; while having used a "Web Application" (WA) model for VS.NET 2003, and then switched to a "Web Site" (WS) model for Visual Studio 2005, they have just recently brought back the Web Application model for VS2005. Both are sensible and straightforward ways of developing an ASP.NET site, and developers migrating from Windows are familiar with them, so it was clearly a good idea to use them as a starting point when planning how to implement the project support in MonoDevelop.<!--break-->

Initially I aimed to combine the two models, so I first looked at the most obvious difference between them, the implicit/explicit file listing: WA has an explicit list of files, but WS considers all files within its directory to be part of the project. Both behaviours could easily be available in one model as a project option, so no problems so far. The difficulties occur when one considers why WS's implicit listing is useful.

The WS model has a major advantage over WA in that it can be used directly to edit a running site on a remote server. While not ideal for structured development or precise control, this is nonetheless an incredibly useful feature and is, in my opinion, the more useful of the two models. All files present in the application folder on the server are therefore part of the project. One requirement of WS is that there should not be a "project file" on the server, but neither can there be a local project file used to store settings, or different developers working on the same site will get out of synch. On the other hand, WA requires a project file, at the very least to store the file list.

An important question is how the "Web Site" fits into MonoDevelop's project system. As it stands, MonoDevelop relies entirely upon having project files of some kind. Implementing WS would require modifications to the solution system to allow a new kind of "remote directory" project type, an "Open web site" entry on MonoDevelop's File menu, and an "Add Web Site" entry on the Solution menu in the Project Pad. Making this fully useful would require adding remote file support throughout MonoDevelop, which is a fairly major task. However, all of this work would be very useful for adding support for any other web development framework to Monodevelop.

I believe that "Web Site" and "Web Application" are not merely two different project types implemented by Microsoft, but are actually fundamentally project models.

Some readers might also wonder how the various ASP.NET compilation models fit into all of this. I do not think that they present an issue, as any of them could be implemented transparently under either of the project models. ASP.NET allows use of different .NET languages in different pages, so WS has to support this too. This is not an issue for WA; indeed, for a structured app, limitation to one .NET language is good. This does of course simplify the compilation process in WA. Deployment options are of course very similar for both models.

My current plan is to develop a Web Application project type, as this is by far the easier of the two project types to write, and this will allow me to concentrate on other areas like code completion and integrating the AspNetEdit designer. I do like the Web Site model more, so I will aim to make as much of my code as possible usable by a future Web Site implementation.

I'm still not completely certain that I've chosen the right approach, so I would welcome any comments.
