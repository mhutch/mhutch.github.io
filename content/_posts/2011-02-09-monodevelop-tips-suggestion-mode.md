---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Suggestion Mode'
created: 1297270825
redirect_from:
- /node/185
- /journal/2011/02/monodevelop_tips_suggestion_mode
---
The default mode of the code completion list is to _complete_ the symbol that's
being typed. Whenever the completion engine can determine that you are typing an
existing symbol (such as a type name, variable name or member name), it
automatically triggers the completion list and populates it with all the values
that are valid at that point. As you type while the list is open, the list's
selection updates to match what best fits what you're typing, and you can
manually change the selection using the up/down arrow keys.<!--break--> When you
press space, enter, tab, or any punctuation, the completion list "commits" the
selection into the document, so you don't have to type the rest of the word
manually. This is incredibly useful when you get used to it.

Sometimes the completion engine cannot provide a complete list of valid values,
for example when you are defining a lambda at the point that you pass it to a
method. In such cases, when you need to type a value that's not in the list, it
would be very irritating for the list to commit its best match and overwrite
what you're typing. Instead, the completion list goes into _suggestion_ mode.

In suggestion mode, the selection highlight in the list is a rectangle around
the selection, not a solid block. When the list is in suggestion mode, it will
only commit on tab or enter, so you won't commit accidentally while typing a
word. If you use arrow keys to change the selection, the list will go back into
completion mode and the highlight will become solid.

![The completion list in suggestion mode](/files/images/md-tips/suggestion-mode.png)

Some users like to write code out of order, for example using symbols that don't
yet exist, and then defining them symbols later, or writing code that does not
parse correctly and fixing it up. Completion mode really makes that style of
coding hard to do. The answer is a command that toggles the list into suggestion
mode. You can access it via the _Edit->Toggle Completion Suggestion Mode_ menu
item, or the *Alt-Shift-Space* key binding. Once the list is toggled into
suggestion mode, it will stay that was until you toggle it back. This it useful
because you can switch back and forth as it suits you.
