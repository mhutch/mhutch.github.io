---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Task Comments'
created: 1300464000
redirect_from:
- /node/213
- /journal/2011/03/monodevelop_tips_task_comments
---
A common practice when writing code is to annotate incomplete or questionable
areas with comments prefixed with warnings like TODO, HACK, FIXME, and so on.
MonoDevelop draws attention to these by recognizing them and highlighting
them.<!--break-->

![A task comment highlighted in the source
editor](/files/images/md-tips/task-comments-comment.png)

The Task List pad, accessed from _View->Pads->Task List_, has section that lists
all of these items and allows you to jump directly to them. This is useful if
you're looking for things to fix.

![Task comments in the Task List pad](/files/images/md-tips/task-comments-list.png)

There are several built-in tokens for recognizing task comments, but you can
define your own in _Preferences->Task List_. When you add a task comment token,
comments with that token will be highlighted and listed the same way as the
built-in ones.

![Task comments options](/files/images/md-tips/task-comments-options.png)

You can also set different importance levels for different task tokens, and can
set the colours used in the task list for the different levels.
