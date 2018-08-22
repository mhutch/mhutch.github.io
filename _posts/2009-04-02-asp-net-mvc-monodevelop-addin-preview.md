---
tags:
- mono
- monodevelop
- asp.net
- asp.net mvc
- ms-pl
layout: journal
title: ASP.NET MVC MonoDevelop Addin Preview
created: 1238711069
redirect_from: /node/166
---
The past month or two, in addition to bugfixing for our recent <a href="http://monodevelop.com">MonoDevelop 2.0</a> release, I've been quietly hacking on a MonoDevelop Addin to support writing <a href="http://asp.net/mvc">ASP.NET MVC</a> applications. Those of you following me on <a href="http://twitter.com/mjhutchinson">Twitter</a> may have picked up a few hints...

Now that Microsoft has released <a href="http://weblogs.asp.net/scottgu/archive/2009/04/01/asp-net-mvc-1-0.aspx">ASP.NET MVC under the MS-Pl licence</a>, I'm making a preview release of the ASP.NET MVC addin for people who'd like to start playing with this exciting new tech on Mono. It's relatively immature, so don't expect everything to work perfectly, but it handles creating and running a VS-compatible ASP.NET MVC project just fine.
<!--break-->
You'll need MonoDevelop 2.0 and Mono 2.4 or later. Make sure you have the package that contains System.Web.Abstractions/Extensions/Routing; on SUSE this is currently mono-extras. The addin includes a copy of the System.Web.Mvc.dll, so you don;t need to do anything special for that.

The addin is in the default MonoDevelop addin repositories (though I may be releasing updated versions from my own repo at http://mjhutchinson.com/mdrepo), so open MonoDevelop, click on the <em>Tools->Add-in Manager</em> menu, and click the <em>Install add-ins...</em> button. Select the ASP.NET MVC addin, and complete the installation.

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-1-Installation.png "><img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-1-Installation-thumb.png" alt="Installing the ASP.NET MVC Addin" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Restart MonoDevelop, as there seems to be a minor issue with reference assemblies updating dynamically.

Now you can create new ASP.NET MVC projects.

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-2-NewSolution.png"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-2-NewSolution-thumb.png" alt="Creating a new ASP.NET MVC project" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

When you create a new project, you'll see a project with all the basics set up, but minimal content, so that you don't have to worry about stripping out things you don't need. If even the "Hello World" view is too much, there's also an "Empty ASP.NET MVC Application" template.

There's an "Add View" command on the context menu for the Views folder, and an "Add Controller" command on the context menu for the Controllers folder.

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-3-AddView.png"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-3-AddView-thumb.png" alt="The Add View Menu" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Similarly to the <a href="http://weblogs.asp.net/scottgu/archive/2009/01/27/asp-net-mvc-1-0-release-candidate-now-available.aspx">Visual Studio ASP.NET MVC tooling</a>, you can add custom T4 templates for the "Add View" command. As part of developing this feature, I implemented an open-source T4 engine from scratch, which <a href="http://tirania.org/blog/archive/2009/Mar-10.html">Miguel already blogged about</a>. I also added some syntax highlighting, code folding, and a document outline, and T4 compilation errors are reported in the error pad so you can jump to the error location.

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-4-CustomTT.png"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-4-CustomTT-thumb.png" alt="The Add View dialog showing a custom TT template" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

I'm not happy with the restrictive nature of the ASP.NET MVC T4 host, but initially I went for compatibility with MS' version. In future I'd like a way for these templates to be able to output multiple files and expose additional properties to the GUI, and for the GUI to hide settings that the templates don't support. Note also that the "Strongly Typed" model class option is disabled, as the ASP.NET MVC T4 host exposes a type object for this, whereas MD doesn't load actual types. I'm trying to figure out a way around this.

And the proof that it works with Mono and MD? Hit F5 to build and run.

<a href="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-5-Run.png"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspMvcAddin-5-Run-thumb.png" alt="Running the default Hello World view" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

There are many more exciting features that I'd like to add, though I have many other things on my plate right now, such as improving MD's Mac support, so contributions are very much welcome.
