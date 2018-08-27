---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Renaming Symbols'
created: 1298653200
redirect_from:
- /node/197
- /journal/2011/02/monodevelop_tips_renaming_symbols
---
One of the most useful refactoring commands is "Rename", which renames a symbol
by accurately finding all occurrences and changing them. To rename a symbol,
right click on it and choose _Refactor->Rename_ context menu command, or use the
keybinding: *F2* on Windows and Linux, and *Cmd-R* on Mac.<!--break-->

![The Rename dialog](/files/images/md-tips/rename-dialog.png)

You will be shown a dialog allowing you to enter a new name, then given the
option to either preview all the changes before applying, or apply them
immediately. The preview shows a diff of all changes that will be made in the
solution.

![Rename Preview](/files/images/md-tips/rename-preview.png)

Full renaming can be very slow, because it has to inspect all files in all
projects within the solution. However, when renaming locals, since the changes
only affect the current file, MonoDevelop makes the changes inline in real time.
It selects all of the occurrences of that symbol and links them, so that as you
alter the definition, all the references are immediately updated to match.

![Inline Renaming](/files/images/md-tips/rename-inline.png)

You can hit *Enter* to finish the rename or *Escape* to cancel it.
