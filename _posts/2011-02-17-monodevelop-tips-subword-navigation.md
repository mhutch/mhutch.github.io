---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Subword Navigation'
created: 1297962035
redirect_from: /node/191
---
Most users are familiar with word navigation, for moving the caret to the next
or previous word: _Control-Left_/_Control-Right_ on Windows and Linux, and
_Opt-Left_/_Opt-Right_ on Mac. A previous post discussed the different modes for
[word breaking](/journal/2011/02/monodevelop_tips_word_breaking).<!--break-->

A less well-known features is "subword" navigation, which is very similar,
except that it breaks in more places, such camelCase boundaries within words and
underscores within identifiers. This is really useful for modifying parts of
identifiers precisely. The keybinding is _Alt-Left_/_Alt-Right_ on Windows and
Linux, and _Control-Left_/_Control-Right_ on Mac. As with word navigation, they
can be combined with the _Shift_ modifier to modify the current selection range.