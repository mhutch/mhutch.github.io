---
excerpt: "A few week ago, I travelled to GDC and MIX. While in planes, airports and
  in spare moments in the conference, I implemented a feature I've wanted for some
  time - integrated T4 templating. This takes the T4 engine that I wrote for ASP.NET
  MVC templates, and exposed it within the IDE as a \"custom tool\", like Visual Studio
  does.\r\n\r\nThis also meant I had to implement a simple version of VS-style custom
  tools, or generators. Set the file's \"custom tool\" property to \"TextTemplatingFileGenerator\"
  using the property pad, then whenever you save it, MD will run the generator on
  the file.\r\n\r"
tags:
- mono
- monodevelop
- catchup2010
- t4
- templates
layout: journal
title: T4 Templates in MonoDevelop
created: 1272900437
---
A few week ago, I travelled to GDC and MIX. While in planes, airports and in spare moments in the conference, I implemented a feature I've wanted for some time - integrated T4 templating. This takes the T4 engine that I wrote for ASP.NET MVC templates, and exposed it within the IDE as a "custom tool", like Visual Studio does.

This also meant I had to implement a simple version of VS-style custom tools, or generators. Set the file's "custom tool" property to "TextTemplatingFileGenerator" using the property pad, then whenever you save it, MD will run the generator on the file.

Unlike VS, there is also a file template for the T4 file:
<a href="http://mjhutchinson.com/files/images/MonoScreenshots/integrated-t4-1.png" rel="lightbox[md_t4]" title="MonoDevelop New File dialog with T4 template "><img src="http://mjhutchinson.com/files/images/MonoScreenshots/integrated-t4-1-t.png" alt="MonoDevelop New File dialog with T4 template" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

The T4 syntax is very like ASP.NET's render blocks, expressions and directives. Here you can see a simple example that generates a countdown:
<a href="http://mjhutchinson.com/files/images/MonoScreenshots/integrated-t4-2.png" rel="lightbox[md_t4]" title="T4 template in MonoDevelop generating a countdown"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/integrated-t4-2-t.png" alt="T4 template in MonoDevelop generating a countdown" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

When this is saved, it generates the output file:
<a href="http://mjhutchinson.com/files/images/MonoScreenshots/integrated-t4-3.png" rel="lightbox[md_t4]" title="T4 output file in MonoDevelop"><img src="http://mjhutchinson.com/files/images/MonoScreenshots/integrated-t4-3-t.png" alt="T4 output file in MonoDevelop" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

It's also integrated with MonoDevelop 2.4's new error bubbles, so any errors in T4 code show up in the editor as soon as the file is saved:
<a href="http://mjhutchinson.com/files/images/MonoScreenshots/integrated-t4-4.png" rel="lightbox[md_t4]" title=><img src="http://mjhutchinson.com/files/images/MonoScreenshots/integrated-t4-4-t.png" alt="Error bubbles in T4 template in MonoDevelop" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

This is very much a side project for me, so contributions in this area would be very helpful. It would be great to have support for viewing generators' message output and cancelling long-running generators, support for T4 custom directives, debugging T4, code completion in T4 files, and generating template class files that can be compiled into apps. 

<em>This is part of the <a href="http://mjhutchinson.com/tags/catchup2010">Catchup 2010</a> series of posts</a></em>.
