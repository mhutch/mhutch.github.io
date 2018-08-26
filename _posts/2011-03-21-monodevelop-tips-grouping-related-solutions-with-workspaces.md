---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Grouping Related Solutions with Workspaces'
created: 1300723200
redirect_from: /node/214
---
Workspaces can be used to organize related solutions, and provide a convenient way to open several solutions at once. Unlike projects in a solution, which can have references and build interdependencies on other project within the solution, solutions in a workspace are independent, and can be opened and built independently of the workspace and the other solutions in it.<!--break-->

To create a workspace, use the command <em>File->New->Workspace</em>, enter the desired name of the workspace, and select the location. The workspace will be saved as a <em>mdw</em> (MonoDevelop Workspace) file. To add existing items to workspace, right-click on it in the solution pad, and use <em>Add->Existing Item</em>. This allows you to add workspaces as well as solutions, since workspaces can be nested. There are also commands to <em>Add->New Solution</em> and <em>Add->New Workspace</em>, which create a new solution or workspace and add it to the workspace directly.

<a href="/files/images/md-tips/workspaces-monodevelop.png" rel="lightbox[md_tips_workspaces]" title="A workspace with a child workspace and child solutions"><img src="/files/images/md-tips/t/workspaces-monodevelop.png" alt="A workspace with a child workspace and child solutions" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>
