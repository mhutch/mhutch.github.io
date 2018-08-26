---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Opening Multiple Solutions'
created: 1300809600
redirect_from: /node/215
---
Normally, MonoDevelop only allows a single instance of itself to be open, since many of its data files (preferences, code completion databases and so on) are not designed to be accessed by multiple instances at once. However, it is possible to open multiple solutions at once. In the Welcome Page, hold down the Control key while clicking in an item in the Recent Projects list. There is a hint about this feature in the status bar while you hover over these items: "Hold Control key to open in current workspace". Do this, and the solution will be opened without closing the old one.<!--break-->

<a href="http://mjhutchinson.com/files/images/md-tips/multiple-solutions-open.png" rel="lightbox[md_tips_multiple_solutions]" title="Multiple solutions open at the same time"><img src="http://mjhutchinson.com/files/images/md-tips/t/multiple-solutions-open.png" alt="Multiple solutions open at the same time" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

You can also open multiple solutions using the "Open" dialog. If you select a project or solution in the Open dialog, and a project or solution is already open, the dialog will show a "Close the existing workspace" checkbox, which is checked by default. Simply uncheck this, and open the solution.

<a href="http://mjhutchinson.com/files/images/md-tips/open-close-current-workspace.png" rel="lightbox[md_tips_multiple_solutions]" title="The option to close the existing workspace when opening a solution"><img src="http://mjhutchinson.com/files/images/md-tips/t/open-close-current-workspace.png" alt="The option to close the existing workspace when opening a solution" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

The reason these options are named the way they are is that MonoDevelop always has an implicit <a href="http://mjhutchinson.com/journal/2011/03/monodevelop_tips_grouping_related_solutions_workspaces">workspace</a>. Because it's implicit, it's not displayed in the solution pad, as it would just waste space. When you open a solution, MonoDevelop normally closes the existing workspace, and creates a new one for the newly opened solution. These options allow you to override that behaviour, and instead add the newly opened solution to the existing workspace.

