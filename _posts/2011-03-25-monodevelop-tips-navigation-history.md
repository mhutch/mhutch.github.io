---
excerpt: "MonoDevelop keeps track of your navigation history, like a web browser.
  If you jump to another file or another position inside the same file, you can easily
  navigate back. This is particularly useful combined with MonoDevelop's other code
  navigation features that make it easy to jump around your code, such as the \"Go
  to definition\" command and the <a href=\"http://mjhutchinson.com/journal/2011/02/monodevelop_tips_navigate_files_and_types\">Navigate
  To</a> dialog. The Navigation History can get you back to wherever you were before.\r\n\r\n"
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Navigation History'
created: 1301068800
---
MonoDevelop keeps track of your navigation history, like a web browser. If you jump to another file or another position inside the same file, you can easily navigate back. This is particularly useful combined with MonoDevelop's other code navigation features that make it easy to jump around your code, such as the "Go to definition" command and the <a href="/journal/2011/02/monodevelop_tips_navigate_files_and_types">Navigate To</a> dialog. The Navigation History can get you back to wherever you were before.

To navigate back, use <strong>Ctrl-Alt-Left</strong> on Window or Linux, or <strong>Cmd-Opt-Left</strong> on a Mac. To navigate forward, use <strong>Ctrl-Alt-Right</strong> on Window or Linux, or <strong>Cmd-Opt-Right</strong> on a Mac.

These commands are also found in the <em>Search</em> menu, along with the Navigation History list, which shows a list of the last fifteen locations, and allows you to jump directly to any of them. Internally it keeps more history than this, but menu space is limited.

<a href="/files/images/md-tips/nav-history-menu.png" rel="lightbox[md_tips_nav_history]" title="The Navigation History menu"><img src="/files/images/md-tips/t/nav-history-menu.png" alt="The Navigation History menu" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

The commands are also found in the <em>Navigation</em> toolbar.

<a href="/files/images/md-tips/nav-history-toolbar.png" rel="lightbox[md_tips_nav_history]" title="The Navigation History toolbar"><img src="/files/images/md-tips/t/nav-history-toolbar.png" alt="The Navigation History toolbar" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Navigation points are created whenever you use a command that navigates directly to something, such as opening a file, going to a definition, and so on. If you manually move the caret around a file and stay in one area for more than about 10 seconds, it may also log a navigation point there.
