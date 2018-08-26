---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Code Generation Window'
created: 1299603600
redirect_from: /node/205
---
The Code Generation window can be used to automatically generate code for various patterns, based on existing code. It can be triggered from the context menu, or from the _Edit->Show Code Generation Window_ menu. On Windows and Linux the keyboard shortcut is <strong>Alt-Insert</strong> and on Mac there's currently no keybinding (if you'd like to suggest one please use the <a href="http://monodevelop.com/index.php?title=Help_%26_Contact">MonoDevelop mailing list</a>).<!--break-->

The code generation window is shown at the caret location, and its contents are context-dependent. For example, within a method it can generate things like null checks for the method's arguments, and in a class body it can generate things like a constructor with parameters that are assigned to properties and fields in the class.

<a href="/files/images/md-tips/code-generation-window.png" rel="lightbox[md_tips_code_generation]" title="Highlight usages"><img src="/files/images/md-tips/t/code-generation-window.png" alt="Highlight usages" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Navigate up and down in the window using the arrow keys to select the code generator you wish to use, then move to the item list using the enter or tab key. Here you can navigate up and down using the arrow keys and toggle items on and off using the space key. The mouse can be used too, but the keyboard is much faster. if you change you mind about which generator to use, shift-tab will move the focus back up to the list of generators. Finally, press the enter key to generate the code for the items you selected.

Here is the constructor code generated after selecting all three properties in the dialog shown above:.

<a href="/files/images/md-tips/code-generation-ctor.png" rel="lightbox[md_tips_code_generation]" title="Highlight usages"><img src="/files/images/md-tips/t/code-generation-ctor.png" alt=Highlight usages" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

