---
categories:
- mono
- aspnetedit
- summer of code
layout: journal
title: AspNetEdit ready for release
created: 1156234108
---
Well, the Summer of Code is now ended. The ASP.NET MonoDevelop addin is now open to testing, and although it doesn't look any better than my <a href="/journal/2006-03-07/monodevelop_asp_net_addin_is_live">previous</a> <a href="/journal/2006-27-07/aspnetedit_in_monodevelop_teaser">screenshots</a>, it's quite a bit more stable.

If you want to build the AspNetAddIn, just build MonoDevelop <a href= "http://monodevelop.com/Download">from SVN</a> with the --enable-aspnet configure option. To enable the AspNetEdit Visual Designer you will need to build and install the jscall-sharp library (available from Mono SVN) and you will additionally need the MD configure option --enable-aspnetedit. The addin will probably be in the upcoming MonoDevelop 0.12 release, although it won't be built by default, so it may be worth waiting for that.

As well as testing, I welcome bugfixing and new features. If it's something big, please <a href="http://mjhutchinson.com/contact">check with me</a> first to make sure that someone else is not working on it already. I personally have a load of feature additions lined up for the future, but right now I need to spend a couple of weeks sorting a lot of stuff out, including this site, and sleeping :).

The Summer of Code has been fantastic. I've gained a lot of experience of working with a large and very well-designed codebase, which I think has improved my own coding a lot. I'd like to thank my mentor Lluis, who has been more than helpful with my many MD-related questions. Thanks also to Miguel and the rest of the Mono community for their help and support; this is a great community to work in, and I plan on sticking around.

And of course thanks to Google for running such a brilliant programme. Not only am I getting paid to do something I enjoy, but most of my favourite open-source projects (<a href="http://mono-project.com">Mono</a>, <a href="http://www.gnome.org/">Gnome</a>, <a href="http://www.gimp.org/">GIMP</a>, <a href="http://inkscape.org/">Inkscape</a>, <a href="http://www.ogre3d.org/">OGRE</a> and <a href="http://drupal.org/">Drupal</a>, to name a few) have gained lots of exciting new features!

<em>Update:</em>
Here are some known issues with AspNetEdit:
<ol>
<li>To get some items in the toolbox, you'll need to add $PREFIX/lib/mono/2.0/System.Web.dll using the button on the toolbox toolbar.</li>
<li>On Firefox 1.5+ the control selection handles disappear after a few seconds. Mozilla 1.7 works fine.</li>
<li>The code from the design view <em>can't be saved</em> with older releases of Mono. This is caused by a bug in Mono's 2.0 classlib (or runtime) that has been fixed in SVN HEAD as of 11 Sept 2006.</li>
<li>The XUL/JS addin needs to be registered with your global Mozilla/Firefox profile. This happens when you install MonoDevelop, but if don't want to install the rest of Monodevelop (e.g. if you use 'make run') then you can just 'sudo make install' in the Extras/AspNetEdit/chrome directory.</li>
</ol>
<!--break-->
