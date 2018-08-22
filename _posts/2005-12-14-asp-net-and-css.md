---
tags:
- mono
- web standards
- css
- aspnetedit
layout: journal
title: ASP.NET and CSS
created: 1134572138
---
I've been thinking about how the ASP.NET Visual Designer should work with CSS and good semantic markup, and I've been thinking a lot about the role of both of these in the Web. In particular, what part do they play with ASP.NET?

I believe that the content of a document should be kept separate from its presentation. Semantic markup is good; structured content is easier for a machine to interpret and convert, as well as being cleaner and more elegant. CSS allows us to style a document without affecting its markup, and the same stylesheets can be applied to multiple documents for consistency and efficiency.  Good semantic design also improves maintainability and accessibility. 

So far, so good. But what about web applications? HTML originated as a document markup language, but via forms-and-CGI based search interfaces, the web has evolved into a complete UI platform. It's simple enough to send one view at a time, abusing HTML to make it look like a UI, and using dynamic HTML and JavaScript quite a complex user experience can be crafted. Everything stored on the server, and anyone and everyone with a web browser can access it. This is what ASP.NET is targeting, as it is essentially an HTML UI framework.

But where does semantic HTML fit into this? A UI and a document are different things, and should be separated. I don't really care how semantically correct a UI is on principle, though it does have some advantages, especially accessibility. But the semantics of a UI and of a document  are different. If only there were a 'document' tag that could be inserted into HTML to show which bits are documents or document fragments, and another set of tags for panels and menus and so on.

Usually the solution is to use CSS classes, with some kind of &lt;div id="content"&gt; containing the document. But what kind of CSS design system works well with this? I have considered a couple of approaches.

<ol>
<li>ASP.NET has a theming system for its own controls, and I'd like to have a "content" control with a designer that would allow you to style a piece of placeholder text and would generates stylesheet from that.</li>

<li>A general-purpose stylesheet designer that lets you view a document and see the breakdown of the rules cascade on any element, and edit them.</li>
</ol>

I think that both would be useful, actually. In both cases, however, I think it's important to keep the style design distinct from the document design, even if the "document" is a UI. I'm tempted to remove all the font size and style, italic, bold, indent etc. toolbar options from AspNetEdit and replace them with a CSS style selector and semantic element buttons like "em". Though I'm also considering ways of enforcing which types of elements different CSS classes can be applied to, maybe some kind of stylesheet schema, and a way to use schemas to enforce structured document design.

As an aside, I've often wondered why there isn't a "semantic word processor" that enforces document structure and styles, and removes the temptation to fiddle with the details.

Anyway, if anyone has any ideas about this, comments are welcome as always. I've already begun to implement some of the changes to the toolbox discussed last time; I decided to go with a simple treeview with a filtering box at the time. Unfortunately I'm very busy with academic work right now, but look for developments sometime next term!

<em>Update:</em>I recently came across <a href="http://www.microformats.org/wiki/microformats">microformats</a>, which look cool. Nice semantically, meaningfully, defined structures. I'd love to have an HTML graphical editor driven by some sort of schema to restrict editing in certain regions of a page to particular formats like these.
<!--break-->
