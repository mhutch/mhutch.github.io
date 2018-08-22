---
tags:
- mono
- xhtml
- monodevelop
- code completion
layout: journal
title: HTML Completion
created: 1226956189
---
The main thing I've been working on for the upcoming MonoDevelop 2.0 release is ASP.NET code completion, and I'm pretty happy with its current state. Recently I've been "downporting" this code into base classes to make it easier to write XML completion and HTML completion editor extensions. A while back I wrote a hybrid XML/ASP.NET/HTML parser, which I've been using in MonoDevelop for triggering ASP.NET code completion. The aims of this parser were to be extensible and to have good error recovery. This makes sharing code between XML-like completion extensions very easy &mdash; the completion triggering code and the path bar code are entirely shared between the editors.

After moving the HTML code down to a common base class, I decided to expose this functionality for actual HTML files, rather than just ASP.NET, and wrote an HTML text editor extension to handle this.
<!--break-->
As well as parsing a path, for code completion, the parser can also parse a complete document into a tree. This is useful for code folding, error underlining, and the document outline. The ASP.NET extension does not yet use it in this mode, instead using the older and better-tested Mono ASP.NET parser, so the first time this saw use was in XAML completion (about which I still need to blog). I recently (and trivially) "crossported" this code over to the HTML text editor.

The final piece of the puzzle was to write an HTML tag state for the parser to enable it to recognise and implicitly close tags when appropriate. Putting this all together, we get to the most important thing: the screenshot.

<img src="http://mjhutchinson.com/files/images/MonoScreenshots/HtmlAutoClose.png" alt="Screenshot of an HTML file in MonoDevelop showing the warning underlines on implicitly closed elements." style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" />

The blue underlines are warnings, when a tag has been implicitly closed. Note that the document outline is still correctly formed. The red underline is of course an error, and the parser has recovered from that too.
