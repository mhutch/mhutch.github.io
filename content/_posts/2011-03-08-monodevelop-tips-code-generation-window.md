---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Code Generation Window'
created: 1299603600
redirect_from:
- /node/205
- /journal/2011/03/monodevelop_tips_code_generation
---
The Code Generation window can be used to automatically generate code for
various patterns, based on existing code. It can be triggered from the context
menu, or from the _Edit->Show Code Generation Window_ menu. On Windows and Linux
the keyboard shortcut is *Alt-Insert* and on Mac there's currently no keybinding
(if you'd like to suggest one please use the [MonoDevelop mailing
list](http://monodevelop.com/index.php?title=Help_%26_Contact)).<!--break-->

The code generation window is shown at the caret location, and its contents are
context-dependent. For example, within a method it can generate things like null
checks for the method's arguments, and in a class body it can generate things
like a constructor with parameters that are assigned to properties and fields in
the class.

![Code generation window](/files/images/md-tips/code-generation-window.png)

Navigate up and down in the window using the arrow keys to select the code
generator you wish to use, then move to the item list using the enter or tab
key. Here you can navigate up and down using the arrow keys and toggle items on
and off using the space key. The mouse can be used too, but the keyboard is much
faster. if you change you mind about which generator to use, shift-tab will move
the focus back up to the list of generators. Finally, press the enter key to
generate the code for the items you selected.

Here is the constructor code generated after selecting all three properties in
the dialog shown above:.

![Generated constructor code](/files/images/md-tips/code-generation-ctor.png)
