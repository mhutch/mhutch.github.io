---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Show Next/Previous Result'
created: 1299085200
redirect_from: /node/201
---
One of the most useful pairs of commands in MonoDevelop is _Show Next Result_
and _Show Previous Result_. These commands move through items in the most
recently active navigation list. Right after building, they will cycle though
the build errors and warnings; after searching, they cycle through the search
results; after running unit tests, they cycle though the test failures, and so
on.<!--break-->

The commands can be found in the _Search_ menu as _Show Previous_ and _Show
Next_, and the names change to indicate which type of result is active. The
keyboard shortcuts on Windows and Linux are *F4* to move to the next result, and
*Shift-F4* to move to the previous result. On Mac, they're *Command-=* and
*Command-+* respectively.
