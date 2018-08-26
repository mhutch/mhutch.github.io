---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Renaming Symbols'
created: 1298653200
redirect_from: /node/197
---
One of the most useful refactoring commands is "Rename", which renames a symbol by accurately finding all occurrences and changing them. To rename a symbol, right click on it and choose _Refactor->Rename_ context menu command, or use the keybinding: <strong>F2</strong> on Windows and Linux, and <strong>Cmd-R</strong> on Mac.<!--break-->

<a href="/files/images/md-tips/rename-dialog.png" rel="lightbox[md_tips_rename]" title="The Rename dialog"><img src="/files/images/md-tips/t/rename-dialog.png" alt="The Rename dialog" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

You will be shown a dialog allowing you to enter a new name, then given the option to either preview all the changes before applying, or apply them immediately. The preview shows a diff of all changes that will be made in the solution.

<a href="/files/images/md-tips/rename-preview.png" rel="lightbox[md_tips_rename]" title="Rename Preview"><img src="/files/images/md-tips/t/rename-preview.png" alt="Rename Preview" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Full renaming can be very slow, because it has to inspect all files in all projects within the solution. However, when renaming locals, since the changes only affect the current file, MonoDevelop makes the changes inline in real time. It selects all of the occurrences of that symbol and links them, so that as you alter the definition, all the references are immediately updated to match.

<a href="/files/images/md-tips/rename-inline.png" rel="lightbox[md_tips_rename]" title="Inline Renaming"><img src="/files/images/md-tips/t/rename-inline.png" alt="Inline Renaming" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

You can hit <strong>Enter</strong> to finish the rename or <strong>Escape</strong> to cancel it.
