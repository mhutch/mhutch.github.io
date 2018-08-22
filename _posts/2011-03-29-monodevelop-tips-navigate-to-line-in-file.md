---
excerpt: "In an earlier post, I introduced the <a href=\"http://mjhutchinson.com/journal/2011/02/monodevelop_tips_navigate_files_and_types\">Navigate
  To</a> dialog, which allows quickly navigating to any file or type in the solution.
  It has a couple more useful capabilities which are not immediately obvious.\r\n\r"
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Navigate to Line in File'
created: 1301414400
redirect_from: /node/219
---
In an earlier post, I introduced the <a href="http://mjhutchinson.com/journal/2011/02/monodevelop_tips_navigate_files_and_types">Navigate To</a> dialog, which allows quickly navigating to any file or type in the solution. It has a couple more useful capabilities which are not immediately obvious.

Firstly, it's possible to go directly to a specific line in the selected file by typing a colon followed by the line number. As soon as the colon is typed, the list will narrow down to only contain files, not types or members. When you hit Enter to navigate to the file, you will be taken directly to the specified line, if it's valid. 

<a href="http://mjhutchinson.com/files/images/md-tips/navigate-to-line.png" rel="lightbox[md_tips_navigate_to_adv]" title="Navigating to a specific line"><img src="http://mjhutchinson.com/files/images/md-tips/t/navigate-to-line.png" alt="Navigating to a specific line" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

This also works in the more specialized <em>Go to File</em> dialog.

Another hidden feature is that it's possible to access several options by clicking on the search icon in the search box.

<a href="http://mjhutchinson.com/files/images/md-tips/navigate-to-options.png" rel="lightbox[md_tips_navigate_to_adv]" title="The Navigate To options"><img src="http://mjhutchinson.com/files/images/md-tips/t/navigate-to-options.png" alt="The Navigate To options" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

The options that constrain the list's contents are fairly obvious. Disabling "complex matching" makes the searching faster but makes the fuzzy/acronym matching poorer.
