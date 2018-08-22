---
excerpt: "MonoDevelop's XML autocompletion is driven by XML schemas, although there
  is a fallback that will use existing nodes in the file to provide  a very basic
  form of completion. MonoDevelop keeps a list of known schemas, and when trying to
  provide completion for a given namespace, it looks in that list to find one that
  matches the namespace. There are built-in schemas for several namespaces, but it's
  possible to add your own in <em>Preferences->Other->XML Schemas</em>. Registered
  schemas must have a unique namespace, since that's how they're identified.\r\n\r"
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Custom XML Schemas'
created: 1300377600
---
MonoDevelop's XML autocompletion is driven by XML schemas, although there is a fallback that will use existing nodes in the file to provide  a very basic form of completion. MonoDevelop keeps a list of known schemas, and when trying to provide completion for a given namespace, it looks in that list to find one that matches the namespace. There are built-in schemas for several namespaces, but it's possible to add your own in <em>Preferences->Other->XML Schemas</em>. Registered schemas must have a unique namespace, since that's how they're identified.

<a href="http://mjhutchinson.com/files/images/md-tips/custom-xml-schemas.png" rel="lightbox[md_tips_custom_xml_schemas]" title="The custom XML schemas panel"><img src="http://mjhutchinson.com/files/images/md-tips/t/custom-xml-schemas.png" alt="The custom XML schemas panel" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

In the option panel there is also a list of file associations. If you add a file extension to this list, it will be treated as XML, so it will get syntax highlighting, code folding, code completion. and so on. You can also specify the default schema for the file, using one of the registered schemas. This will be used as the schema for the root element, even if it's not explicitly specified in the file.
