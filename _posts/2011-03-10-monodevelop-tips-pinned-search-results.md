---
excerpt: "Some kinds of <a href=\"http://mjhutchinson.com/journal/2011/02/monodevelop_tips_workspace_layout\">pads</a>
  in MonoDevelop are transient. They cannot be accessed directly from a menu, but
  instead appear when needed to show the results of some operation, such as <em>Find
  in Files</em>, or <em>Find References</em>. Once closed, they can only be recovered
  by re-running the operation.\r\n\r"
categories:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Pinned Search Results'
created: 1299776400
---
Some kinds of <a href="http://mjhutchinson.com/journal/2011/02/monodevelop_tips_workspace_layout">pads</a> in MonoDevelop are transient. They cannot be accessed directly from a menu, but instead appear when needed to show the results of some operation, such as <em>Find in Files</em>, or <em>Find References</em>. Once closed, they can only be recovered by re-running the operation.

When another operation of the same kind runs again, it re-uses any existing pad of that kind, so they don't proliferate wildly. However, you can "pin" the pad by using the pin button in the pad, which means that it will not be re-used this way. Instead, the next operation will create a new pad. You can pin several pads, to save several sets of results, and further new pads will be created as necessary. When you are done, close or unpin the pad.

The following image shows a pinned pad. The pin button is at the bottom on the right side of the pad. Note that some MonoDevelop builds have a bug that causes the icon not to appear, but the button is still present and usable &mdash; it highlights when the mouse move over it, and shows a depressed state when enabled.

<a href="http://mjhutchinson.com/files/images/md-tips/pinned-search-results.png" rel="lightbox[md_tips_pinned_search_results]" title="A pinned Search Results pad"><img src="http://mjhutchinson.com/files/images/md-tips/t/pinned-search-results.png" alt="A pinned Search Results pad" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>
