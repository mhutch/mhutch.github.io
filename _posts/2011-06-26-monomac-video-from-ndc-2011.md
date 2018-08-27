---
tags: [ mono ]
layout: journal
title: MonoMac video from NDC 2011
created: 1309131371
redirect_from: /node/225
---
The videos from NDC 2011 are [now
online](http://www.ndc2011.no/agenda.aspx?cat=1071&id=-1&day=3728), including my
talk _Developing .NET Applications for the Mac App Store_ ([direct
link](http://ndc2011.macsimum.no/SAL4/Fredag/Live%20stream%20archive%2010.06.2011%2014.58.wmv)).<!--break-->
You can also download a printable version of [my
presentation](/files/talks/MonoMac-NDC11.pdf). Hopefully there will be an
official torrent of the videos soon, because there were plenty of other sessions
that are worth seeing. Thanks to everyone who helped make it such a great
conference!

_Correction: In the presentation I said that native objects don't retain
references to managed objects, which is incorrect. The problem I intended to
refer to is a common coding error where views are retained but their controllers
are not, e.g. `mainView.AddSubview(new ChildController().View)`._
