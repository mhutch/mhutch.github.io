---
excerpt: "One of my favourite features that we added to MonoDevelop 2.4 is the \"import
  Type\" command. It is accessed using the keybinding Ctrl-Alt-Space, and shows a
  list of all types in all namespaces in all referenced assemblies:\r\n\r\n<a href=\"http://mjhutchinson.com/files/images/md-tips/import-type.png\"
  rel=\"lightbox[md_tips_import_type]\" title=\"The completion list for the Import
  Type command\"><img src=\"http://mjhutchinson.com/files/images/md-tips/t/import-type.png\"
  alt=\"The completion list for the Import Type command\" style=\"max-width:98%; display:block;margin-left:auto;margin-right:auto;\"
  /></a>\r\n\r"
categories:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Import Type'
created: 1297098009
---
One of my favourite features that we added to MonoDevelop 2.4 is the "import Type" command. It is accessed using the keybinding Ctrl-Alt-Space, and shows a list of all types in all namespaces in all referenced assemblies:

<a href="http://mjhutchinson.com/files/images/md-tips/import-type.png" rel="lightbox[md_tips_import_type]" title="The completion list for the Import Type command"><img src="http://mjhutchinson.com/files/images/md-tips/t/import-type.png" alt="The completion list for the Import Type command" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

You can use our <a href="http://mjhutchinson.com/journal/2011/02/07/completion_list_filtering"/>completion list filtering</a> to find the type you're looking for, then, when you commit the selection from the list, MonoDevelop automatically adds the "using" statement to the file. For example, using StringBuilder is as easy as <ctrl-alt-space>StrB<space> even if you don't yet have <code>using System.Text;</code> at the top of the file.
