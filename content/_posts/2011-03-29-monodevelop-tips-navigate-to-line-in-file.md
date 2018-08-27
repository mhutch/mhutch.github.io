---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Navigate to Line in File'
created: 1301414400
redirect_from:
- /node/219
- /journal/2011/03/monodevelop_tips_navigate_line_file
---
In an earlier post, I introduced the [Navigate
To](/journal/2011/02/monodevelop_tips_navigate_files_and_types) dialog, which
allows quickly navigating to any file or type in the solution. It has a couple
more useful capabilities which are not immediately obvious.<!--break-->

Firstly, it's possible to go directly to a specific line in the selected file by
typing a colon followed by the line number. As soon as the colon is typed, the
list will narrow down to only contain files, not types or members. When you hit
Enter to navigate to the file, you will be taken directly to the specified line,
if it's valid.

![Navigating to a specific line](/files/images/md-tips/navigate-to-line.png)

This also works in the more specialized _Go to File_ dialog.

Another hidden feature is that it's possible to access several options by
clicking on the search icon in the search box.

![The Navigate To options](/files/images/md-tips/navigate-to-options.png)

The options that constrain the list's contents are fairly obvious. Disabling
"complex matching" makes the searching faster but makes the fuzzy/acronym
matching poorer.
