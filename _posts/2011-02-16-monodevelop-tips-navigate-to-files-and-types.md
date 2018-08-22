---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Navigate To Files and Types'
created: 1297875620
redirect_from: /node/190
---
If you know the name of a type or file and want to go straight to it without having to dig through the solution pad and file contents, the <strong>Navigate To...</strong> command is your friend. This command can be activated with <strong>Ctrl-,</strong> on Windows or Linux, and <strong>Ctrl-.</strong>on Mac, or from the <em>Search->Navigate To..</em> menu. It opens a window that shows a list of all the files, types and members in the solution, and you can filter and search these items using the same <a href="http://mjhutchinson.com/journal/2011/02/07/completion_list_filtering">substring matching</a> that the completion list uses. When you find the one you want, hit enter and you will be taken straight to it.

<a href="http://mjhutchinson.com/files/images/md-tips/navigate-to.png" rel="lightbox[md_tips_navigate_to]" title="The document switcher"><img src="http://mjhutchinson.com/files/images/md-tips/t/navigate-to.png" alt="The Navigate To... dialog" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

MonoDevelop also has <strong>Go To File</strong> and <strong>Go to Type</strong> commands, which behave the same way but are restricted to only showing files or types respectively. These predate the Navigate To command, and although its functionality is a superset of both of the older commands combined, they have been kept around because they're noticeably faster for extremely large projects.
