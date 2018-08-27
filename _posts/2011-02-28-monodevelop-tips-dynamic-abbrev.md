---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Dynamic Abbrev'
created: 1298912400
redirect_from: /node/199
---
MonoDevelop's code completion for C# provides highly context-sensitive and
accurate suggestions. However, it can't provide completion in plain text, such
as comments or strings. To help with cases like this, and for languages where MD
does not have a completion engine, we've implemented a feature from Emacs called
"dynamic abbrev".<!--break-->

Simply type the start of a word, and then use the dynamic abbrev command to
cycle though the available completions for that word until you get the word you
want. The default key combination is *Alt-/* on Windows or Linux, and
*Command-/* on Mac. It doesn't pop up a completion list, it just replaces the
completed word in place each time you press the combination. The words used for
this autocompletion are found by first looking at all words in the current file,
and then the words in all other files that are open.
