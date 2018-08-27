---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Import Type'
created: 1297098009
redirect_from:
- /node/183
- /journal/2011/02/08/monodevelop_tips_import_type
---
One of my favourite features that we added to MonoDevelop 2.4 is the "import
Type" command. It is accessed using the keybinding _Ctrl-Alt-Space_, and shows a
list of all types in all namespaces in all referenced assemblies.<!--break-->

![The completion list for the Import Type
command](/files/images/md-tips/import-type.png)

You can use our [completion list
filtering](/journal/2011/02/07/completion_list_filtering) to find the type
you're looking for, then, when you commit the selection from the list,
MonoDevelop automatically adds the "using" statement to the file. For example,
using StringBuilder is as easy as `<ctrl-alt-space>StrB<space>` even if you
don't yet have `using System.Text;` at the top of the file.
