---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Task Comments'
created: 1300464000
redirect_from: /node/213
---
A common practice when writing code is to annotate incomplete or questionable areas with comments prefixed with warnings like TODO, HACK, FIXME, and so on. MonoDevelop draws attention to these by recognizing them and highlighting them.<!--break-->

<a href="/files/images/md-tips/task-comments-comment.png" rel="lightbox[md_tips_task_comments]" title="A task comment highlighted in the source editor"><img src="/files/images/md-tips/t/task-comments-comment.png" alt="A task comment highlighted in the source editor" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

The Task List pad, accessed from _View->Pads->Task List_, has section that lists all of these items and allows you to jump directly to them. This is useful if you're looking for things to fix.

<a href="/files/images/md-tips/task-comments-list.png" rel="lightbox[md_tips_task_comments]" title="Task comments in the Task List pad"><img src="/files/images/md-tips/t/task-comments-list.png" alt="Task comments in the Task List pad" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

There are several built-in tokens for recognizing task comments, but you can define your own in _Preferences->Task List_. When you add a task comment token, comments with that token will be highlighted and listed the same way as the built-in ones.

<a href="/files/images/md-tips/task-comments-options.png" rel="lightbox[md_tips_task_comments]" title="Task comments options"><img src="/files/images/md-tips/t/task-comments-options.png" alt=Task comments options" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

You can also set different importance levels for different task tokens, and can set the colours used in the task list for the different levels.
