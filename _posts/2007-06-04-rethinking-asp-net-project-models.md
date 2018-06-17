---
excerpt: "I've been thinking again about the compilation and deployment models used
  in MonoDevelop for ASP.NET code, and it isn't easy to come up with a good solution.
  I've written a discussion of the various possibilities and how they mesh with MonoDevelop
  and the Visual Studio way of doing things. \r\n\r"
categories:
- mono
- monodevelop
- asp.net
layout: journal
title: Rethinking ASP.NET Project Models
created: 1180976692
---
I've been thinking again about the compilation and deployment models used in MonoDevelop for ASP.NET code, and it isn't easy to come up with a good solution. I've written a discussion of the various possibilities and how they mesh with MonoDevelop and the Visual Studio way of doing things. 

In VS.NET 2003, the <em>Web Application</em> model necessarily used the 1.1 CodeBehind model. This enforces no constraints on project layout at all; all the compiler has to do is compile all C#/VB.NET files into a library in the bin folder, and deployment is similarly simple. In order for controls in the inheriting pages to be accessible from the CodeBehind class, they must be added as fields to the CodeBehind classes, which the IDE does when the visual designer is used. This is the model that MonoDevelop uses at the moment.

The initial release of Visual Studio 2005 replaced this with the <em>Web Site</em> model. All CodeBehind code is compiled into a library by the server when the relevant page is hit, and any additional code must be in the <em>App_Code</em> directory. The CodeBehind classes are partial classes, and the server's compiler generates another partial class containing all of the controls in the inheriting class, so that they can be accessed by the CodeBehind. Everything gets deployed; alternatively, the site can be edited in place. There is a program called aspnet_compiler.exe, which can be used to precompile all the code, and even the pages, and it can be invoked during the deployment process. The major strength of this model is the capability to perform in-place editing. It is also the only model supported by Visual Studio 2005 Express.

A later addition to Visual Studio 2005 was the <em>Web Application</em> model. This is very similar to the VS.NET 2003 model, except that it uses partial to make inheriting pages' controls accessible from CodeBehind. Since Mono's mcs compiler supports partial classes, MonoDevelop could use this model for websites targeting either the 1.1 or 2.0 runtimes. The downside of this is that it would make compatibility with VS.NET 2003 harder.

The real difficulty of designing the ASP.NET project model in MonoDevelop is in trying to support both the Web Site and Web Application models. In order to appeal to migrating developers, we really need to support both models, especially as Visual Studio will be supporting both models in the future. Do we try to merge them into one? Write a project model that's so flexible that it supports both paradigms, but is horribly confusing? The thing is, the two models are designed for fundamentally different purposes: a Web Site for quick-and-easy projects, or a Web Application for a controlled development cycle.

If I were to design a single project model with no regard for compatibility with Visual Studio projects, I'd have a strict file layout like the Web Site model, with all code in App_Code. The IDE compile phase would then compile all the code that would not be compiled by the Web Site model, allowing more control over compilation where necessary. All CodeBehind would use partial classes.

In summary, the big choice is between having separate Web Application and Web Site project types as Visual Studio does, or folding them into one composite model, or having an overwhelmingly configurable project type allowing all development models as options. The big concerns I have are are usability, and compatibility with Visual Studio, particularly VS.NET 2003/.NET 1.1 as it does not allow the use of partial classes.

I'm not sure how much VS.NET 2003 is used now, and developers can of course port their apps via Visual Studio 2005. I'm leaning towards having separate Web Application and Web Site project types, and only supporting ASP.NET 2.0.

I would welcome any insights and ideas that people can offer. 
