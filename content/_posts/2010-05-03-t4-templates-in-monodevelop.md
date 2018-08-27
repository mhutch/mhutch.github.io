---
tags: [ mono, monodevelop, catchup2010, t4, templates ]
title: T4 Templates in MonoDevelop
created: 1272900437
redirect_from:
- /node/179
- /journal/2010/05/03/t4_templates_monodevelop
---
A few weeks ago, I travelled to GDC and MIX. While in planes, airports and in
spare moments in the conference, I implemented a feature I've wanted for some
time - integrated T4 templating. This takes the T4 engine that I wrote for
ASP.NET MVC templates, and exposed it within the IDE as a "custom tool", like
Visual Studio does.<!--break-->

This also meant I had to implement a simple version of VS-style custom tools, or
generators. Set the file's "custom tool" property to
"TextTemplatingFileGenerator" using the property pad, then whenever you save it,
MD will run the generator on the file.

Unlike VS, there is also a file template for the T4 file:

![MonoDevelop New File dialog with T4 template](/files/images/MonoScreenshots/integrated-t4-1.png).

The T4 syntax is very like ASP.NET's render blocks, expressions and directives. Here you can see a simple example that generates a countdown:

![T4 template in MonoDevelop generating a countdown](/files/images/MonoScreenshots/integrated-t4-2.png)

When this is saved, it generates the output file:

![T4 output file in MonoDevelop](/files/images/MonoScreenshots/integrated-t4-3.png)

It's also integrated with MonoDevelop 2.4's new error bubbles, so any errors in T4 code show up in the editor as soon as the file is saved:

![Error bubbles in T4 template in MonoDevelop](/files/images/MonoScreenshots/integrated-t4-4.png)

This is very much a side project for me, so contributions in this area would be
very helpful. It would be great to have support for viewing generators' message
output and cancelling long-running generators, support for T4 custom directives,
debugging T4, code completion in T4 files, and generating template class files
that can be compiled into apps.

_This is part of the [Catchup 2010](/tags/catchup2010) series of posts_.
