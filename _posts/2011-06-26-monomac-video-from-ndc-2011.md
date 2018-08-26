---
tags:
- mono
layout: journal
title: MonoMac video from NDC 2011
created: 1309131371
redirect_from: /node/225
---
The videos from NDC 2011 are <a href="http://www.ndc2011.no/agenda.aspx?cat=1071&id=-1&day=3728">now online</a>, including my talk <em>Developing .NET Applications for the Mac App Store</em> (<a href="http://ndc2011.macsimum.no/SAL4/Fredag/Live%20stream%20archive%2010.06.2011%2014.58.wmv">direct link</a>).<!--break--> You can also download a printable version of <a href="/files/talks/MonoMac-NDC11.pdf">my presentation</a>. Hopefully there will be an official torrent of the videos soon, because there were plenty of other sessions that are worth seeing. Thanks to everyone who helped make it such a great conference!

<em>Correction: In the presentation I said that native objects don't retain references to managed objects, which is incorrect. The problem I intended to refer to is a common coding error where views are retained but their controllers are not, e.g. <code>mainView.AddSubview(new ChildController().View)</code>.</em>
