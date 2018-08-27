---
tags: [ mono, monodevelop, asp.net ]
title: Completing ASP.NET Collection Properties
created: 1227146849
redirect_from:
- /node/164
- /journal/2008/11/20/aspnet_collection_properties
---
I've recently been tweaking the ASP.NET completion, adding support for resolving
valid children for a control. These can be properties, a property, or controls.
More difficult was resolving the valid children for properties, but this is now
done.<!--break-->

![Screenshot of an ASP.NET file in MonoDevelop showing autocompletion on the
children of a collection
property.](/files/images/MonoScreenshots/AspCollectionProperties.png)

Unfortunately, there aren't actually any designer or parser attributes for
limiting the children of a property, so in order to resolve the children, I
assume it's a collection, and look for an Add method with a single parameter
derived from Control. If this exists, I use its parameter to filter the types in
the control completion list. It's an ugly hack, but it works perfectly for
tables and wizards. In the worst case, MonoDevelop falls back to showing all
controls.

With this done, the ASP.NET completion is essentially feature-complete.