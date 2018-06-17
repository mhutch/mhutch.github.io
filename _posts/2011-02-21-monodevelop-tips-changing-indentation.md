---
excerpt: "It's easy to increase or decrease indentation of a block of code in MonoDevelop.
  Hit the <strong>Tab</strong> key while there is a selection, and the selected lines'
  indentation will be increased. Similarly, hit <strong>Shift-Tab</strong> and the
  indentation will be decreased.\r\n\r"
categories:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Changing Indentation'
created: 1298307600
---
It's easy to increase or decrease indentation of a block of code in MonoDevelop. Hit the <strong>Tab</strong> key while there is a selection, and the selected lines' indentation will be increased. Similarly, hit <strong>Shift-Tab</strong> and the indentation will be decreased.

There is also a command to do this. The indent command can be found in the <em>Edit->Format->Indent Selection</em> menu, with the keybinding <strong>Control-Alt-End</strong> on Windows and Linux, and <strong>Cmd-]</strong> on Mac.  The unindent command is <em>Edit->Format->Unindent Selection</em>, with the keybinding <strong>Control-Alt-Home</strong> on Windows and Linux, and <strong>Cmd-[</strong> on Mac. 

MonoDevelop can also set the indentation to the "correct" value (as determined by the smart indenter) when tab is pressed, like emacs does. This can be enabled with <em>Preferences->Behavior->Interpret tab as reindent command</em>. For some reason, this command isn't keybindable.
