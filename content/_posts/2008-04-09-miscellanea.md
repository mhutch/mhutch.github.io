---
tags: [ gaming, personal, mono, summer of code, monodevelop, ghop, axiom, hack week ]
layout: journal
title: Miscellanea
created: 1207785204
redirect_from:
- /node/150
- /journal/2008/04/09/miscellanea
---
Here's a quick summary of interesting things from the past few months that I
haven't blogged. Unfortunately I can't give each topic the time it deserves, but
I think that's better than not mentioning them at all.<!--break-->

## GHOP Results

The [Google Highly Open
Participation](http://code.google.com/opensource/ghop/2007-8) contest finished,
and was a great success, with [40 completed
tasks](http://code.google.com/p/google-highly-open-participation-mono/issues/list?can=1&q=status:Closed&sort=claimedby&colspec=ID%20Status%20Owner%20ClaimedBy%20DueDate%20Summary),
a great improvement over my [earlier
post](/journal/2007/12/19/monodevelop_ghop). Of particular note was the huge
number of rules implemented for Gendarme. I'd like to thank all of our
successful students and their mentors, and congratulations to Dan Abramov, our
Grand Prize winner. I'd also like to single out Andreas Noever, another
absolutely stellar student who very narrowly missed out on the top spot.

## Novell Hack Week

During [Novell Hack Week](http://tirania.org/blog/archive/2008/Feb-23.html) I
worked on an [automatic error reporting
system](http://idea.opensuse.org/content/ideas/error-reporting-library-and-infrastructure)
that I intend to use in MonoDevelop at some point. I got rather hung up on
collecting as much system and process information as I could, so it
unfortunately wasn't completed.

However, I did have fun "architecting" a client/server/webserver data channel,
which I planned to re-use for several other purposes: reporting problems'
solutions back to the user, and collecting [application usage
data](http://www.snorp.net/log/2008/01/18/application-usage-monitoring). Now
that I've seen how useful such data can be, in [Jensen Harris's awesome
presentation](http://blogs.msdn.com/jensenh/archive/2008/03/12/the-story-of-the-ribbon.aspx)
on how the Microsoft Office ribbon was developed, I'm particularly interested in
having something similar in MonoDevelop.

## Game Developers Conference

Towards the end of February some of us on the Mono team went to the [Game
Developers Conference](http://gdconf.com) in San Francisco to promote Mono as a
game scripting engine, and find out what games developers need to make this work
for them. All in all it was great fun, and very successful. Miguel has [a longer
writeup](http://tirania.org/blog/archive/2008/Feb-26.html).

I would be interested to find out what we could do to make Mono more attractive
for gaming, both for embedding as a scripting engine, and as a portable runtime,
and how this could be supported by MonoDevelop. One of the real strengths of
Mono is the development tools, and I would like MonoDevelop to become part of
the gaming development ecosystem. One suggestion would be an
"[Axiom](https://archive.codeplex.com/?p=axiom) Studio" addin for MonoDevelop as
an alternative to XNA.

## MonoDevelop 1.0 Release

After [years of development](http://tirania.org/blog/archive/2008/Mar-14.html),
we [released MonoDevelop 1.0](http://monodevelop.com/MonoDevelop_1.0_Released)
alongside Mono 1.9, and work is already well underway on the next release. I'm
already working on [ASP.NET code
completion](/journal/2008/04/08/an_apologetic_sneak_peek), which is coming along
quite nicely. I've also updated and integrated [Matt Ward's XML
Editor](http://md-xed.sourceforge.net) into MonoDevelop trunk.

## Google Summer of Code

MonoDevelop is once again taking part in the [Google Summer of
Code](http://code.google.com/soc/2008) under [Mono's
umbrella](http://tirania.org/blog/archive/2008/Mar-24.html). I really enjoyed
mentoring [Marcos](http://mdmagsoc.blogspot.com) last year, and I'm looking
forward to doing some mentoring this year.

## Visit to the UK

These past couple of weeks I was in the UK visiting family and friends. it was
nice to see people again after 5 months in another continent!