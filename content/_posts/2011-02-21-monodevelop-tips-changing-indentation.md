---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Changing Indentation'
created: 1298307600
redirect_from:
- /node/193
- /journal/2011/02/monodevelop_tips_changing_indentation
---
It's easy to increase or decrease indentation of a block of code in MonoDevelop.
Hit the *Tab* key while there is a selection, and the selected lines'
indentation will be increased. Similarly, hit *Shift-Tab* and the indentation
will be decreased.<!--break-->

There is also a command to do this. The indent command can be found in the
_Edit->Format->Indent Selection_ menu, with the keybinding *Control-Alt-End* on
Windows and Linux, and *Cmd-]* on Mac.  The unindent command is
_Edit->Format->Unindent Selection_, with the keybinding *Control-Alt-Home* on
Windows and Linux, and *Cmd-[* on Mac.

MonoDevelop can also set the indentation to the "correct" value (as determined
by the smart indenter) when tab is pressed, like emacs does. This can be enabled
with _Preferences->Behavior->Interpret tab as reindent command_. For some
reason, this command isn't keybindable.
