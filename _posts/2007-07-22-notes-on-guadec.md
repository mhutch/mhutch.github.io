---
tags: [ mono, technology, gnome, guadec ]
layout: journal
title: Notes on GUADEC
created: 1185146538
redirect_from:
- /node/135
- /journal/2007/07/22/notes_guadec
---
First of all I'd like so say what a great experience GUADEC was. It was great to
talk to cool people, see the amazing software people are writing, and hear talks
from inspiring speakers. It really emphasised for me why having such a diverse
yet coherent community has made GNOME the awesome ecosystem it is today.

I'm a little disappointed I could only attend the Core days, but I think they
were enough for me. I'm currently away and it's not easy to write or post to my
journal, but I've patched together some notes on the talks I
attended.<!--break-->

## Tuesday: Core I

[OpenMoko](http://guadec.org/node/591): I can't wait to get one and put Mono on
it. There will be loads of incredible applications.

[LibGnomeDB](http://guadec.org/node/550): This looks like a good start to do
bespoke data apps in C or C++, but it's not even close to the kind of
databinding we need in GTK# to compete with SWF.

Ari Jaaksi's Keynote: An interesting perspective on F/OSS from Nokia's
viewpoint. It's worth bearing in mind that support and training costs prevent
commercial concerns from being as agile as hackers.

[Telepathy and Tubes](http://guadec.org/node/553): Great stuff. This should be
everywhere. Could F-Spot use it for photo sharing? Could Banshee-NG-DBus use
tubes to replace DAAP?

[Metadata Overview](http://guadec.org/node/614): Joe explained the current state
of metadata on the Desktop and made a good case for aggregating separate
metadata stores rather than using Tracker's approach of squeezing everything
into a one-size-fits-all solution.

Havoc's and Bryan's Keynote: I fully agree that integration with online services
is key to the continued success of GNOME, and could be a good way to expand our
user base. But beware of getting people locked into proprietary services.

## Wednesday: Core II

Keynote: Disappointed the speaker wasn't there, as I dashed to make it on time.
However, Michael Meeks' replacement talk on using a simulated disc to calculate
reproducible I/O times was pretty cool.

[New Main Menu](http://guadec.org/node/635): Jim gave a nice account of the
reasoning behind the cool new Main Menu. I like the way the 'tiles' are being
used elsewhere; they should be part of the platform. One thing I'd like to see
is a huge main menu instead of the desktop...

[Lowfat](http://guadec.org/node/541): MacSlow demonstated his really cool user
interface, but I see it as having a limited scope. Why limit ourselves to
physical metaphors? My real desktop is often a mess. I would love to abolish the
"desktop" metaphor completely. It's a horribly inefficient use of screen
real-estate, so I certainly don't think it'll ever filter down to small mobile
devices.

Alex Graveley's Keynote: Pyro Desktop is an awesome hack, and I'd love to see
web developers welcomed to the desktop. However, I don't think desktop
developers should move that far towards web-style inefficiency...

Lightning Talks: In particular I remember the Giver/Tomboy note sharing over
Avahi. It's simple, yet I imagine it could be very useful. It would be nice to
have this on every electronic device I own. I also saw Banter, which I'd love to
be able to try myself (segfaults from unmanaged land have prevented me thus
far). The short version of Michael Meeks' talk with Federico was fun.

[GTK+ Status](http://guadec.org/node/596): Looks like there are some nice
improvements to look forward to, but nothing earth-shattering.

[GTK+ 3.0 Discussion](http://guadec.org/node/615): No progress at all. A small
group of people argued over what we can't do. What I took away from this was
'there will be no GTK 3.0'. The only way to make it workable in my view is to
write a separate canvas-based toolkit library that can be embedded in GTK and
vice versa. Eventually some apps will be able to drop the GTK dependency. I
suspect that an ABI-stable GTK 2.x will stay around for a very long time.

## Thursday: Core III

Robert Love's Keynote: Nice presentation of the wonderful Summer of Code
program, though little was news to me. Shame about the fire alarm.

[Clutter](http://guadec.org/node/579): Cool. I need to play with the Mono
bindings. Wish I had time to write a widget set on top of it, with a widget
interface/theme separation. This would be a good start for GTK 3.0. Indeed, why
not write a toolkit like Moonlight, in that managed code is only binding to
unmanaged code at an intermediate level?

Stormy Peters' Keynote: Nice presentation, though we already know that
developers are creators. Good luck getting this across to companies!

[Tracker](http://guadec.org/node/567): The metadata store sounds like a cool
idea, and once you start thinking in terms of triples it's extremely tempting to
extend them to everything. I almost fell victim to a similar hubris a few years
ago. But you can't know everything about everyone's data. It's just not
possible. There will always be different ways of doing things, and the key is to
aggregate them intelligently, not reinvent everyone's wheels.

Doc Searls' Keynote: VRM is a nice idea, but I'm not quite sure how it fits into
GNOME... It was a good keynote though.

Federico's Surprise Closing Keynote: Inspiring, and great to hear about GNOME's
roots. We really need to think about new kinds of apps and "desktops", as we
pretty much have the best "conventional" desktop in the world. How can we go
beyond this?

## Conclusion

The best thing about GUADEC was meeting people: Gabriel, Patrick, Rodney, Toms,
Aidan, Aaron, Jim, Joe, Fabian, and many others. Thanks for making it a fun
place to be!

GUADEC has a great experience and made me think a lot about the future desktop
and mobile devices, and how Mono fits in with them. My opinion on how
proprietary online services affect the Free desktop, which is something I've
been thinking about a lot for a few months, has now developed to the point at
which I'm prepared to write publicly about it. I shall be posting a series of
discussions and ideas over the next month or two.
