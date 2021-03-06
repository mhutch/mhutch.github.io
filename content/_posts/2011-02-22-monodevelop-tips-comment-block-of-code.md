---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Comment Block of Code'
created: 1298394000
redirect_from:
- /node/194
- /journal/2011/02/monodevelop_tips_comment_block_code
---
While experimenting with code, it can be very useful to comment a block of code
temporarily.

To comment a block of code, use select _Toggle Line Comment(s)_ from the context
menu, or use the *Control-Alt-C* keybinding on Windows and Linux. If the current
line is commented, it will be uncommented, or if it is not commented, it will be
commented. If multiple lines are selected, then if any are not commented, they
will all be commented. If all are commented, they will all be
uncommented.<!--break-->

For C# files, this feature uses line comments, and if lines that are already
commented are commented as part of a larger block, it adds another "level" of
line comments onto those lines. This is useful, because it means that a region
of code can be commented then uncommented, and actual comments within it will be
preserved.

If you prefer to use multiline comments or `#if false` directives, you can use
"surround with" templates, which will be covered tomorrow.
