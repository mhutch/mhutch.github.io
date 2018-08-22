---
tags:
- gaming
- personal
- mono
- summer of code
- monodevelop
- ghop
- axiom
- hack week
layout: journal
title: Miscellanea
created: 1207785204
---
Here's a quick summary of interesting things from the past few months that I haven't blogged. Unfortunately I can't give each topic the time it deserves, but I think that's better than not mentioning them at all.

<h3>GHOP Results</h3>
The <a href="http://code.google.com/opensource/ghop/2007-8/">Google Highly Open Participation</a> contest finished, and was a great success, with <a href="http://code.google.com/p/google-highly-open-participation-mono/issues/list?can=1&q=status:Closed&sort=claimedby&colspec=ID%20Status%20Owner%20ClaimedBy%20DueDate%20Summary">40 completed tasks</a>, a great improvement over my <a href="http://mjhutchinson.com/journal/2007/12/19/monodevelop_ghop">earlier post</a>. Of particular note was the huge number of rules implemented for Gendarme. I'd like to thank all of our successful students and their mentors, and congratulations to Dan Abramov, our Grand Prize winner. I'd also like to single out Andreas Noever, another absolutely stellar student who very narrowly missed out on the top spot.

<h3>Novell Hack Week</h3>
During <a href="http://tirania.org/blog/archive/2008/Feb-23.html">Novell Hack Week</a> I worked on an <a href="http://idea.opensuse.org/content/ideas/error-reporting-library-and-infrastructure">automatic error reporting system</a> that I intend to use in MonoDevelop at some point. I got rather hung up on collecting as much system and process information as I could, so it unfortunately wasn't completed. 

However, I did have fun "architecting" a client/server/webserver data channel, which I planned to re-use for several other purposes: reporting problems' solutions back to the user, and collecting  <a href="http://www.snorp.net/log/2008/01/18/application-usage-monitoring/">application usage data</a>. Now that I've seen how useful such data can be, in <a href="http://blogs.msdn.com/jensenh/archive/2008/03/12/the-story-of-the-ribbon.aspx"> Jensen Harris's awesome presentation</a> on how the Microsoft Office ribbon was developed, I'm particularly interested in having something similar in MonoDevelop.

<h3>Game Developer's Conference</h3>
Towards the end of February some of us on the Mono team went to the <a href="http://gdconf.com/">Game Developers Conference</a> in San Francisco to promote Mono as a game scripting engine, and find out what games developers need to make this work for them. All in all it was great fun, and very successful. Miguel has <a href="http://tirania.org/blog/archive/2008/Feb-26.html">a longer writeup</a>.

I would be interested to find out what we could do to make Mono more attractive for gaming, both for embedding as a scripting engine, and as a portable runtime, and how this could be supported by MonoDevelop. One of the real strengths of Mono is the development tools, and I would like MonoDevelop to become part of the gaming development ecosystem. One suggestion would be an "<a href="http://tirania.org/blog/archive/2008/Feb-26.html">Axiom</a> Studio" addin for MonoDevelop as an alternative to XNA.

<h3>MonoDevelop 1.0 Release</h3>
After <a href="http://tirania.org/blog/archive/2008/Mar-14.html">years of development</a>, we <a href="http://monodevelop.com/MonoDevelop_1.0_Released">released MonoDevelop 1.0</a> alongside Mono 1.9, and work is already well underway on the next release. I'm already working on <a href="http://mjhutchinson.com/journal/2008/04/08/an_apologetic_sneak_peek">ASP.NET code completion</a>, which is coming along quite nicely. I've also updated and integrated <a href="http://md-xed.sourceforge.net/">Matt Ward's XML Editor</a> into MonoDevelop trunk.

<h3>Google Summer of Code</h3>
MonoDevelop is once again taking part in the <a href="http://code.google.com/soc/2008/">Google Summer of Code</a> under <a href="http://tirania.org/blog/archive/2008/Mar-24.html">Mono's umbrella</a>. I really enjoyed mentoring <a href="http://mdmagsoc.blogspot.com/">Marcos</a> last year, and I'm looking forward to doing some mentoring this year.

<h3>Visit to the UK</h3>
These past couple of weeks I was in the UK visiting family and friends. it was nice to see people again after 5 months in another continent!
<!--break-->
