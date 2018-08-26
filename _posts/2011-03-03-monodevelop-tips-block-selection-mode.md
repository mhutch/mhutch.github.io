---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Block Selection Mode'
created: 1299171600
redirect_from: /node/202
---
Sometimes it's useful to be able to edit multiple lines at once in a similar way. This is possible in MonoDevelop using block selections. To make a block selection, drag the mouse between the start and end points while holding down the <strong>Alt</strong> key on Linux or Windows, or <strong>Command</strong> key on Mac. Alternatively, you can make a normal selection, then use the _Edit->Toggle block selection mode_ to toggle the selection into a block selection with the same start and end points.<!--break-->

<a href="/files/images/md-tips/block-selection.png" rel="lightbox[md_tips_block_selection]" title="A block selection in the MD text editor"><img src="/files/images/md-tips/block-selection.png" alt="A block selection in the MD text editor" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Block selections can be cut or copied, and when pasted will paste as a block. Block selections can also be edited, to modify text on multiple lines at once. An side effect of this is that a zero-width block selection can be used an a sort of multi-line caret, to type identical text on multiple lines.
