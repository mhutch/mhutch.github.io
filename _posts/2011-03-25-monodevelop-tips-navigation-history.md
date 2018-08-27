---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Navigation History'
created: 1301068800
redirect_from: /node/218
---
MonoDevelop keeps track of your navigation history, like a web browser. If you
jump to another file or another position inside the same file, you can easily
navigate back. This is particularly useful combined with MonoDevelop's other
code navigation features that make it easy to jump around your code, such as the
"Go to definition" command and the [Navigate
To](/journal/2011/02/monodevelop_tips_navigate_files_and_types) dialog. The
Navigation History can get you back to wherever you were before.<!--break-->

To navigate back, use *Ctrl-Alt-Left* on Window or Linux, or *Cmd-Opt-Left* on a
Mac. To navigate forward, use *Ctrl-Alt-Right* on Window or Linux, or
*Cmd-Opt-Right* on a Mac.

These commands are also found in the _Search_ menu, along with the Navigation
History list, which shows a list of the last fifteen locations, and allows you
to jump directly to any of them. Internally it keeps more history than this, but
menu space is limited.

![The Navigation History menu](/files/images/md-tips/nav-history-menu.png)

The commands are also found in the _Navigation_ toolbar.

![The Navigation History toolbar](/files/images/md-tips/nav-history-toolbar.png)

Navigation points are created whenever you use a command that navigates directly
to something, such as opening a file, going to a definition, and so on. If you
manually move the caret around a file and stay in one area for more than about
10 seconds, it may also log a navigation point there.
