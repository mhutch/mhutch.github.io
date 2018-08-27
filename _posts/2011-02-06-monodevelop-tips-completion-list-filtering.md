---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Completion List Filtering'
created: 1297044027
redirect_from:
- /node/182
- /journal/2011/02/07/completion_list_filtering
---
MonoDevelop makes it really easy to search the code completion list. As you
type, it breaks down the string you enter into word fragments on camelCase
boundaries, then matches these fragments against the beginnings of the words in
the completion list. The list is filtered to show only the items that match, and
the matched parts are helpfully highlighted in blue.<!--break-->

![Completion list filtering](/files/images/md-tips/completion-matching.png)

This makes it much faster to select items from the list, since you can uniquely
select items in the list without typing them out in full or using the arrow
keys. For example, "StBu" will match "StringBuilder". It's also very useful for
searching for items in the list if you're not sure what you need. For example
"Str" will match both "StringComparison" and "ToString" and anything else with
"Str" in its name.

If you use completion matching to filter the list then refine your selection
with the arrow keys, when you commit an item from the list (using space, enter,
tab, etc.), MonoDevelop will remember your choice. The next time you type the
same string, it will automatically select the item you chose the previous time.
However, if you type the exact name of something in the completion list, it will
always match that item.
