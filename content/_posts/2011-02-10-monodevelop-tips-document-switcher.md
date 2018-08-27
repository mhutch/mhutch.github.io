---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Document Switcher'
created: 1297357200
redirect_from:
- /node/186
- /journal/2011/02/monodevelop_tips_document_switcher
---
The document switcher is a quick way to switch focus between open documents and
pads using the keyboard. It's activated by the *Ctrl-tab* or *Ctrl-shift-tab*
combinations, and remains open as long as Control remains held down. While it's
open, you can change the selection &mdash; up arrow or shift-tab moves the
selection up, down arrow or tab moves the selection down, and the left and right
arrows move the selection between the pads and documents lists. When you have
selected the item you want, release Control, and it will be
selected.<!--break-->

![The document switcher](/files/images/md-tips/document-switcher.png)

The documents list is sorted by which have been most recently used, and when the
dialog is opened, the first document it selects is the item _after_ the current
active document, i.e. the document that was focussed before it, since it's
assumed that you don't want to switch to the current document. However, this
also make it very easy to switch between a few documents with minimal
keystrokes.
