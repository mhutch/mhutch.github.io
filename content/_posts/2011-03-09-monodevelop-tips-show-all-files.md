---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Show All Files'
created: 1299690000
redirect_from:
- /node/206
- /journal/2011/03/monodevelop_tips_show_all_files
---
The MonoDevelop Solution Pad shows projects and folders that correspond to real
folders on disk, but by default it only shows files and folders within them that
have been included in the project. This behaviour can be changed using the
_Display Options->Show All Files_ toggle option in the Solution Pad context
menu.<!--break--> The option is contextual &mdash; it applies only to the item
on which it is toggled, and recursively applies to all its children. To have it
apply to the whole Solution Pad, toggle it on the root solution or workspace.

When Show All Files is enabled, files that are not included in the project will
be shown in the folder hierarchy, but with semi-transparent icons to indicate
their status. They can be edited and moved and so on, though they will not be
included in the code completion system. Perhaps the most useful thing that this
option enables is the _Include in project_ context menu command on non-included
files, which can be used to include them in the project quickly and easily.
