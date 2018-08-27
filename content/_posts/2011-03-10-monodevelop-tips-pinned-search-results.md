---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Pinned Search Results'
created: 1299776400
redirect_from:
- /node/207
- /journal/2011/03/monodevelop_tips_pinned_search_results
---
Some kinds of [pads](/journal/2011/02/monodevelop_tips_workspace_layout) in
MonoDevelop are transient. They cannot be accessed directly from a menu, but
instead appear when needed to show the results of some operation, such as _Find
in Files_, or _Find References_. Once closed, they can only be recovered by
re-running the operation.<!--break-->

When another operation of the same kind runs again, it re-uses any existing pad
of that kind, so they don't proliferate wildly. However, you can "pin" the pad
by using the pin button in the pad, which means that it will not be re-used this
way. Instead, the next operation will create a new pad. You can pin several
pads, to save several sets of results, and further new pads will be created as
necessary. When you are done, close or unpin the pad.

The following image shows a pinned pad. The pin button is at the bottom on the
right side of the pad. Note that some MonoDevelop builds have a bug that causes
the icon not to appear, but the button is still present and usable &mdash; it
highlights when the mouse move over it, and shows a depressed state when
enabled.

![A pinned Search Results pad](/files/images/md-tips/pinned-search-results.png)