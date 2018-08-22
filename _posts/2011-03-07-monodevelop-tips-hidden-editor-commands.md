---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Hidden Editor Commands'
created: 1299517200
redirect_from: /node/204
---
The MonoDevelop text editor has many commands are not immediately obvious. Some are accessible from the <em>Edit</em> and <em>Edit->Format</em> menus, and some have default keybindings, but many can only be used if you manually <a href="http://mjhutchinson.com/journal/2011/02/06/key_bindings">add keybindings</a> for them. Some even have keybindings that are <a href="https://github.com/mono/monodevelop/blob/master/main/src/core/Mono.Texteditor/Mono.TextEditor/SimpleEditMode.cs">hardcoded into the text editor</a>, and will be available unless you override it by assigning that some keybinding to some other command.
 
Here is a selection of some that may be useful:

<dl>
<dt><strong>Join Lines</strong></dt>
<dd>Joins the current line with the next line, i.e. removes the next line and appends it to the current line, separated by a space. If multiple lines are selected, it will join them all into one line.</dd>
<dt><strong>Transpose characters</strong></dt>
<dd>Swaps the characters on either side of the caret (<strong>Control-T</strong> on Mac)</dd>
<dt><strong>Delete to end of line</strong></dt>
<dd>Deletes from the caret to the end of the current line (<strong>Control-K</strong> on Mac)</dd>
<dt><strong>Find caret</strong></dt>
<dd>Triggers an animation showing where the caret is (<strong>Command-|</strong> on Mac)</dd>
<dt><strong>Go to matching brace</strong></dt>
<dd>Moves the caret to the counterpart of the adjacent brace or bracket</dd>
<dt><strong>Insert line break after caret</strong></dt>
<dd>Moves the text after the caret onto a new line without moving the caret (<strong>Control-Enter</strong> on all platforms, and also <strong>Control-O</strong> on Mac)</dd>
<dt><strong>Move caret to EOL and insert new line</strong></dt>
<dd>Inserts a new line below the current line and moves the caret to it (<strong>Shift-Enter</strong> on all platforms</dd>
<dt><strong>Recenter editor</strong></dt>
<dd>Moves the scrollbars so that the caret is centered in the editor (<strong>Control-L</strong> on Mac)</dd>
</dl>
