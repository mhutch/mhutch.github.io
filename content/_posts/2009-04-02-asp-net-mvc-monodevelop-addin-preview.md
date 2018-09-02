---
tags: [ mono, monodevelop, asp.net, asp.net mvc, ms-pl ]
title: ASP.NET MVC MonoDevelop Addin Preview
created: 1238711069
redirect_from:
- /node/166
- /journal/2009/04/02/aspnet_mvc_monodevelop_addin_preview
- /journal/2009-04-02/aspnet_mvc_monodevelop_addin_preview
---
The past month or two, in addition to bugfixing for our recent [MonoDevelop
2.0](http://monodevelop.com) release, I've been quietly hacking on a MonoDevelop
Addin to support writing [ASP.NET MVC](https://asp.net/mvc) applications. Those
of you [following me on Twitter](https://twitter.com/mjhutchinson) may have
picked up a few hints...<!--break-->

Now that Microsoft has released [ASP.NET MVC under the MS-PL
licence](http://weblogs.asp.net/scottgu/archive/2009/04/01/asp-net-mvc-1-0.aspx),
I'm making a preview release of the ASP.NET MVC addin for people who'd like to
start playing with this exciting new tech on Mono. It's relatively immature, so
don't expect everything to work perfectly, but it handles creating and running a
VS-compatible ASP.NET MVC project just fine.

You'll need MonoDevelop 2.0 and Mono 2.4 or later. Make sure you have the
package that contains System.Web.Abstractions/Extensions/Routing; on SUSE this
is currently mono-extras. The addin includes a copy of the System.Web.Mvc.dll,
so you don;t need to do anything special for that.

The addin is in the default MonoDevelop addin repositories (though I may be
releasing updated versions from {% file_link_removed /mdrepo my own repo %},
so open MonoDevelop, click on the _Tools->Add-in Manager_ menu, and click the
_Install add-ins..._ button. Select the ASP.NET MVC addin, and complete the
installation.

![Installing the ASP.NET MVC Addin](/files/images/MonoScreenshots/AspMvcAddin-1-Installation.png)

Restart MonoDevelop, as there seems to be a minor issue with reference
assemblies updating dynamically.

Now you can create new ASP.NET MVC projects.

![Creating a new ASP.NET MVC project](/files/images/MonoScreenshots/AspMvcAddin-2-NewSolution.png)

When you create a new project, you'll see a project with all the basics set up,
but minimal content, so that you don't have to worry about stripping out things
you don't need. If even the "Hello World" view is too much, there's also an
"Empty ASP.NET MVC Application" template.

There's an "Add View" command on the context menu for the Views folder, and an
"Add Controller" command on the context menu for the Controllers folder.

![The Add View Menu](/files/images/MonoScreenshots/AspMvcAddin-3-AddView.png)

Similarly to the [Visual Studio ASP.NET MVC
tooling](http://weblogs.asp.net/scottgu/archive/2009/01/27/asp-net-mvc-1-0-release-candidate-now-available.aspx),
you can add custom T4 templates for the "Add View" command. As part of
developing this feature, I implemented an open-source T4 engine from scratch,
which [Miguel already blogged
about](http://tirania.org/blog/archive/2009/Mar-10.html). I also added some
syntax highlighting, code folding, and a document outline, and T4 compilation
errors are reported in the error pad so you can jump to the error location.

![The Add View dialog showing a custom TT
template](/files/images/MonoScreenshots/AspMvcAddin-4-CustomTT.png)

I'm not happy with the restrictive nature of the ASP.NET MVC T4 host, but
initially I went for compatibility with MS' version. In future I'd like a way
for these templates to be able to output multiple files and expose additional
properties to the GUI, and for the GUI to hide settings that the templates don't
support. Note also that the "Strongly Typed" model class option is disabled, as
the ASP.NET MVC T4 host exposes a type object for this, whereas MD doesn't load
actual types. I'm trying to figure out a way around this.

And the proof that it works with Mono and MD? Hit F5 to build and run.

![Running the default Hello World
view](/files/images/MonoScreenshots/AspMvcAddin-5-Run.png)

There are many more exciting features that I'd like to add, though I have many
other things on my plate right now, such as improving MD's Mac support, so
contributions are very much welcome.
