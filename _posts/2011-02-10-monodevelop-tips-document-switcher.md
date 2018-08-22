---
excerpt: "The document switcher is a quick way to switch focus between open documents
  and pads using the keyboard. It's activated by the <strong>Ctrl-tab</strong> or
  <strong>Ctrl-shift-tab</strong>  combinations, and remains open as long as Control
  remains held down. While it's open, you can change the selection &mdash; up arrow
  or shift-tab moves the selection up, down arrow or tab moves the selection down,
  and the left and right arrows move the selection between the pads and documents
  lists. When you have selected the item you want, release Control, and it will be
  selected.\r\n\r"
tags:
- mono
- monodevelop
layout: journal
title: 'MonoDevelop Tips: Document Switcher'
created: 1297357200
---
The document switcher is a quick way to switch focus between open documents and pads using the keyboard. It's activated by the <strong>Ctrl-tab</strong> or <strong>Ctrl-shift-tab</strong>  combinations, and remains open as long as Control remains held down. While it's open, you can change the selection &mdash; up arrow or shift-tab moves the selection up, down arrow or tab moves the selection down, and the left and right arrows move the selection between the pads and documents lists. When you have selected the item you want, release Control, and it will be selected.

<a href="http://mjhutchinson.com/files/images/md-tips/document-switcher.png" rel="lightbox[md_tips_document_switcher]" title="The document switcher"><img src="http://mjhutchinson.com/files/images/md-tips/t/document-switcher.png" alt="The document switcher" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

The documents list is sorted by which have been most recently used, and when the dialog is opened, the first document it selects is the item <em>after</em> the current active document, i.e. the document that was focussed before it, since it's assumed that you don't want to switch to the current document. However, this also make it very easy to switch between a few documents with minimal keystrokes.
