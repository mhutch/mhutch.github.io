---
tags:
- mono
- monodevelop
- asp.net
layout: journal
title: Progress on ASP.NET Source Editing
created: 1209659656
redirect_from: /node/152
---
I have been making good progress on ASP.NET source editing, as evidenced by the following screenshot. Yes, that is code folding, error underlining, and a path bar.<!--break--> <strike>However, the document outline pad isn't hooked up yet for ASP.NET</strike>[Update 2008/5/2: outlining implemented].

<img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspNetCodeFolding.png" alt="Screenshot of an ASP.NET file in MonoDevelop with error underlining, code folding and a path bar." style="max-width:98%" />

I've been getting a lot of practical experience with handwritten parsers recently. The ASP.NET addin has two parsers; the first builds a full DOM, and the second provides document path information very efficiently.

The path parser is designed to accept individual characters as the user types them, instantly providing information about the current context. This is very useful for code completion and smart indentation, and is obviously near-ideal for the path bar too. It's about as robust as I can make it, recovering effectively from most errors. However, I wrote a state-based XML parser where each state was a path object, which has proved rather unwieldy to extend cleanly for ASP.NET, so this may well get replaced soon.

The DOM parser was originally written for the CodeBehind field generation. It's based on Mono's ASP.NET tokeniser, which makes it rather fragile; when it encounters a syntax error, it dies. For its original use, this is sensible behaviour, but for a text editor it needs to be much more robust, so I intend to modify the path parser to build this DOM instead.

I plan to roll a lot of this back into the XML addin, which will provide a solid base for XAML completion for Moonlight apps.
