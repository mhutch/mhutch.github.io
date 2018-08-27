---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Override Completion'
created: 1298566800
redirect_from:
- /node/196
- /journal/2011/02/monodevelop_tips_override_completion
---
When you type the "override" keyword in a C# class, MonoDevelop will show a
completion list of all abstract or virtual members on base classes that have not
been overridden, and interface members that have not been implemented. You don't
even need to type the modifier (e.g. "public"), you can simply type "override"
directly in the class body.<!--break-->

![Override completion](/files/images/md-tips/override-completion.png)

When you commit a selection from the list, it generates the implementation with
the correct signature, with a single statement &emdash; a call to the base
implementation if appropriate, or a NotImplementedException. This implementation
is selected so you can immediately start replacing it with a real
implementation.

![Generated override
implementation](/files/images/md-tips/override-completed.png)