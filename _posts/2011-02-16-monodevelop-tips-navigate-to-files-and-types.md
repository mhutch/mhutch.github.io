---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Navigate To Files and Types'
created: 1297875620
redirect_from:
- /node/190
- /journal/2011/02/monodevelop_tips_navigate_files_and_types
---
If you know the name of a type or file and want to go straight to it without
having to dig through the solution pad and file contents, the *Navigate To...*
command is your friend. This command can be activated with *Ctrl-,* on Windows
or Linux, and *Ctrl-.*on Mac, or from the _Search->Navigate To.._ menu. It opens
a window that shows a list of all the files, types and members in the solution,
and you can filter and search these items using the same [substring
matching](/journal/2011/02/07/completion_list_filtering) that the completion
list uses. When you find the one you want, hit enter and you will be taken
straight to it.

![The document switcher](/files/images/md-tips/navigate-to.png)

MonoDevelop also has *Go To File* and *Go to Type* commands, which behave the
same way but are restricted to only showing files or types respectively. These
predate the Navigate To command, and although its functionality is a superset of
both of the older commands combined, they have been kept around because they're
noticeably faster for extremely large projects.
