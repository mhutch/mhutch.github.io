---
tags: [ mono, c#, javascript, aspnetedit, gecko ]
layout: journal
title: Gecko# interaction
created: 1120689861
redirect_from: /node/80
---
Implementing the ASP.NET GUI designer with [Mozilla's](http://www.mozilla.org) Gecko
web rendering engine is an obvious decision: it's open-source, has strong standards
support and a large feature set, is highly extensible and flexible thanks to its
XPCOM component system, and using Gecko# it can be embedded in a GTK# GUI. Mozilla
is becoming an application platform, with XUL for declaratively writting GUIs, and
JavaScript for program logic.<!--break-->

Gecko# wraps [GtkMozEmbed](http://www.mozilla.org/unix/gtk-embedding.html),
which is a C GTK widget, hiding Mozilla's native C++. Understandably this widget
isn't bloated by wrapping the Mozilla DOM or other internals: it claims to exposes
enough functionality for "about 80% of uses". Essentially this means a basic web browser.

However, to do anything interesting I need to interact with Gecko# from my C# code,
and vice versa. There are two obvious ways to approach this:

* _Expose everything_: Open up the whole of Mozilla's internals to Mono code, or at least the DOM and XPConnect for JavaScript interaction. This would be ideal, as it's the most flexible, and would find many other uses. However, wrapping enough functionality to do anything useful is a very significant task in itself.
* _Message-passing_: Simply restrict all of the Mozilla interaction code to JavaScript functions, which can be triggered from C# via a message-passing scheme of some kind. Pragmatic, and not inelegant, as JavaScript is a first-class citizen in the Mozilla world, and is used to write large parts of Mozilla.

So, assuming I choose the second for speed and ease of development, how do I go about implementing it? This time, I have four choices:

Abusing Gecko#
: Relatively harmlessly, we can raise C# events by changing the JavaScript status message. A more serious abuse is to stream the document into Gecko#, then stream in additional elements containing our messages. JavaScript can catch these with the DOMNodeInserted event and act accordingly. Or so I thought. While Gecko will render an open HTML stream, it's not so forgiving in the case of XUL. Oh dear.

Mono-XPCOM bridge
: Yes, there is one, and it would be the most elegant solution... unfortunately it's not nearly complete enough to begin using for a project like this just now, and I'm not familiar enough with XPCOM to fix it up myself. I can see switching to this when it becomes stable enough.

Web server
: This would cause the editor to effectively become an "AJAX" application. Ouch. A horrible hack, and a horribly-named technology. On the upside, this would be relatively quick and easy.

C++ wrapper and P/Invoke
: Similar to the Gecko# abuse, but strangely, more elegant, despite the additional dependecies and build steps this method entails. The handle from Gecko# can be passed to a C/C++ wrapper via Platform Invoke. The wrapper function then uses GtkMozEmbed's "gtk_moz_embed_get_nsIWebBrowser" function to access Gecko's internals, does interesting thisgs to it with XPCOM, and optionally even returns values.

Well, I initially tried the fourth method, until I realised how much easier the first would be, and cursed XPCOM and the days it had taken from my life.

Fate has twisted sense of humour. Two days into the initial implementation of the editor's   high-level architecture, as I began to flesh out the message passing system, I discovered  the fickleness of Gecko#'s streams, and had to revert to XPCOM and P/Invoke.

More on this story later, once I have something working.