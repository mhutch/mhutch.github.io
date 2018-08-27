---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Custom XML Schemas'
created: 1300377600
redirect_from:
- /node/212
- /journal/2011/03/monodevelop_tips_custom_xml_schemas
---
MonoDevelop's XML autocompletion is driven by XML schemas, although there is a
fallback that will use existing nodes in the file to provide  a very basic form
of completion. MonoDevelop keeps a list of known schemas, and when trying to
provide completion for a given namespace, it looks in that list to find one that
matches the namespace. There are built-in schemas for several namespaces, but
it's possible to add your own in _Preferences->Other->XML Schemas_.<!--break-->
Registered schemas must have a unique namespace, since that's how they're
identified.

![The custom XML schemas panel](/files/images/md-tips/custom-xml-schemas.png)

In the option panel there is also a list of file associations. If you add a file
extension to this list, it will be treated as XML, so it will get syntax
highlighting, code folding, code completion. and so on. You can also specify the
default schema for the file, using one of the registered schemas. This will be
used as the schema for the root element, even if it's not explicitly specified
in the file.
