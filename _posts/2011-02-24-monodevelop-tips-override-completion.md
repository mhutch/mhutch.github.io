---
excerpt: "When you type the \"override\" keyword in a C# class, MonoDevelop will show
  a completion list of all abstract or virtual members on base classes that have not
  been overridden, and interface members that have not been implemented. You don't
  even need to type the modifier (e.g. \"public\"), you can simply type \"override\"
  directly in the class body.\r\n\r"
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Override Completion'
created: 1298566800
redirect_from: /node/196
---
When you type the "override" keyword in a C# class, MonoDevelop will show a completion list of all abstract or virtual members on base classes that have not been overridden, and interface members that have not been implemented. You don't even need to type the modifier (e.g. "public"), you can simply type "override" directly in the class body.

<a href="http://mjhutchinson.com/files/images/md-tips/override-completion.png" rel="lightbox[md_tips_override]" title="Override completion"><img src="http://mjhutchinson.com/files/images/md-tips/t/override-completion.png" alt="Override completion" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

When you commit a selection from the list, it generates the implementation with the correct signature, with a single statement &emdash; a call to the base implementation if appropriate, or a NotImplementedException. This implementation is selected so you can immediately start replacing it with a real implementation.

<a href="http://mjhutchinson.com/files/images/md-tips/override-completed.png" rel="lightbox[md_tips_override]" title="Generated override implementation"><img src="http://mjhutchinson.com/files/images/md-tips/t/override-completed.png" alt="Generated override implementation" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>
