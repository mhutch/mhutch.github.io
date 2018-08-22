---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Subword Navigation'
created: 1297962035
---
Most users are familiar with word navigation, for moving the caret to the next or previous word: <em>Control-Left</em>/<em>Control-Right</em> on Windows and Linux, and <em>Opt-Left</em>/<em>Opt-Right</em> on Mac. A previous post discussed the different modes for <a href="http://mjhutchinson.com/journal/2011/02/monodevelop_tips_word_breaking">word breaking</a>.

A less well-known features is "subword" navigation, which is very similar, except that it breaks in more places, such camelCase boundaries within words and underscores within identifiers. This is really useful for modifying parts of identifiers precisely. The keybinding is <em>Alt-Left</em>/<em>Alt-Right</em> on Windows and Linux, and <em>Control-Left</em>/<em>Control-Right</em> on Mac. As with word navigation, they can be combined with the <em>Shift</em> modifier to modify the current selection range.
<!--break-->
