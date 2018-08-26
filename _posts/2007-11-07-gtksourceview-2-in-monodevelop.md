---
tags:
- mono
- monodevelop
- gtksourceview
layout: journal
title: GtkSourceView 2 in MonoDevelop
created: 1194478796
redirect_from: /node/141
---
I recently added support for GtkSourceView 2 to MonoDevelop, and it can be enabled with the "--enable-gtksourceview2" configure switch. Unfortunately the Boo Binding and the Database Addin depend on GtkSourceView# directly, and aren't compatible with the API changes in 2.0.<!--break--> I may get round to fixing them later. However, I've already switched on GtkSourceView2 support in my [MonoDevelop build repository](/journal/2007/11/07/monodevelop_trunk_builds). The main reason I did this, of course, was the wonderful dark grey colour scheme "oblivion" :-)

The <a href="http://anonsvn.mono-project.com/viewcvs/trunk/gtksourceview2-sharp/">GtkSourceView2#</a> binding isn't officially released yet, and will probably get absorbed into the Gnome# platform bindings, but right now it seems to work fine.
Packages for openSUSE 10.3 are available from my MonoDevelop build repository.

Notable new features are:<ul>
<li>Improved syntax highlighting</li>
<li>Support for colour schemes</li>
</ul>

Notable missing/removed features are:<ul>
<li>Printing</li>
<li>Bookmarks (also used for debugger breakpoints, when the debugger worked)</li>
</ul>

There isn't a UI for changing colour schemes yet, but it can be done manually in the <em>~/.config/MonoDevelop/MonoDevelopProperties.xml</em> file by setting/adding the property <em>&lt;Property key="GtkSourceViewStyleScheme" value="oblivion" /&gt;</em> within the property <em>&lt;Property key="MonoDevelop.TextEditor.Document.Document.DefaultDocumentAggregatorProperties"&gt;</em>.
<!--break-->
