---
tags:
- mono
- xhtml
- monodevelop
- asp.net
layout: journal
title: Planning ASP.NET Code Completion for MonoDevelop
created: 1203993627
redirect_from: /node/147
---
Now that <a href="http://monodevelop.com/Release_notes_for_MonoDevelop_1.0_Release_Candidate_1">MonoDevelop 1.0 is on the verge of shipping</a>, I have begun to plan the parser that will underpin the ASP.NET code completion and visual designer in upcoming versions of MonoDevelop. During a discussion with our ASP.NET expert <a href="http://grendello.blogspot.com/">Marek</a>, I found out about an obscure ASP.NET feature that currently causes problems for Mono's ASP.NET parser, and is entirely counterintuitive to anyone with any XML knowledge.<!--break-->

Apparently, ASP.NET server tags are able to generate any part of the page that they desire, except for other ASP.NET constructs, and the following vilely ugly code is completely valid on .NET:

```aspx
<div>
    <asp:Literal id="this_is_stupid" runat="server" Text="<p style='color:red'>" />Hello</ p>
</div>
```

When a developer does this, the document's XHTML DOM cannot be parsed at design time unless the parser knows the exact HTML fragment that will be output by each ASP.NET control, and hence this can make HTML completion incredibly difficult. Although the Mono ASP.NET stack needs to support this "feature" for compatibility with .NET, I am firmly of the opinion that anyone doing this should be poked with a sharp stick until they stop.

It makes no sense to support this kind of unbalanced syntax in MonoDevelop, as it will hugely increase the complexity and development time. Indeed, when I investigated this on Windows, I found that VS2008 considers it to be a warnable offence.

The downside to my decision is that it's probably not going to be possible to continue sharing the tokeniser with Mono's ASP.NET stack. It currently tokenises the whole HTML DOM as well as the ASP.NET controls and expressions, but this is not necessary for Mono's ASP.NET parser and only makes it hard to handle these corner cases.
