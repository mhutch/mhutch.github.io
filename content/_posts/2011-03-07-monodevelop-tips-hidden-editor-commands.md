---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Hidden Editor Commands'
created: 1299517200
redirect_from:
- /node/204
- /journal/2011/03/monodevelop_tips_hidden_editor_commands
---
The MonoDevelop text editor has many commands are not immediately obvious. Some
are accessible from the _Edit_ and _Edit->Format_ menus, and some have default
keybindings, but many can only be used if you manually [add
keybindings](/journal/2011/02/06/key_bindings) for them. Some even have
keybindings that are [hardcoded into the text
editor](https://github.com/mono/monodevelop/blob/master/main/src/core/Mono.Texteditor/Mono.TextEditor/SimpleEditMode.cs),
and will be available unless you override it by assigning that some keybinding
to some other command.

Here is a selection of some that may be useful:

Join Lines
: Joins the current line with the next line, i.e. removes the next line and
  appends it to the current line, separated by a space. If multiple lines are
  selected, it will join them all into one line.

Transpose characters
: Swaps the characters on either side of the caret (*Control-T* on Mac)

Delete to end of line
: Deletes from the caret to the end of the current line (*Control-K* on Mac)

Find caret
: Triggers an animation showing where the caret is (*Command-|* on Mac)

Go to matching brace
: Moves the caret to the counterpart of the adjacent brace or bracket

Insert line break after caret
: Moves the text after the caret onto a new line without moving the caret
  (*Control-Enter* on all platforms, and also *Control-O* on Mac)

Move caret to EOL and insert new line
: Inserts a new line below the current line and moves the caret to it
  (*Shift-Enter* on all platforms

Recenter editor
: Moves the scrollbars so that the caret is centered in the editor
  (*Control-L* on Mac)
