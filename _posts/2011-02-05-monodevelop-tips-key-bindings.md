---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Key Bindings'
created: 1296953230
redirect_from: /node/181
---
Key bindings are an important part of an IDE, as they make it possible to work efficiently using the keyboard. A key binding is a combination of keys that, when pressed simultaneously, activates an IDE command directly. This post explains the key binding system in MonoDevelop, how to find out what key bindings are available, and how to customize the bindings to suit your needs.<!--break-->

## The Key Bindings Panel

To find what the key binding for a particular command is, you can look at the menu item for that command, or hover over the toolbar button. However, not all commands are exposed via menus and buttons. For a complete list, go to the <strong>Preferences</strong> dialog (_MonoDevelop->Preferences_ on Mac, _Tools->Options_ on Windows, _Edit->Preferences_ on Linux), then the _General->Key Bindings_ panel. This allows you to find existing key bindings, or modify the keybindings to your liking.

<a href="/files/images/md-tips/keybindings-panel.png" rel="lightbox[md_tips_keybindings]" title="The key bindings panel in MonoDevelop"><img src="/files/images/md-tips/t/keybindings-panel.png" alt="The key bindings panel in MonoDevelop" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

The panel has various parts:

<dl>
<dt><strong>Scheme selector</strong></dt>
<dd>
A key binding scheme is the entire set of key bindings in the IDE. There are various built-in schemes that can be chosen using the combo at the top of the panel. If you would like to contribute a new scheme, or have suggestions for improving one of the built-in schemes, please <a href="http://monodevelop.com/Developers/Reporting_Bugs">file a bug report</a>. MonoDevelop currently does not support saving custom schemes, but you can find the scheme in MonoDevelop's preferences directory. On Mac it's `~/.config/MonoDevelop/KeyBindingsMac.xml`, on Windows it's `AppData\Roaming\MonoDevelop\KeyBindings.xml`, and on Linux it's `~/.config/MonoDevelop/KeyBindings.xml`.
</dd>
<dt><strong>Searchable list of bindings</strong></dt>
<dd>
The list of bindings can be searched to see what commands are available, and what key bindings they have. The search take into account the command's name, description and binding.
</dd>
<dt><strong>Conflict indicator</strong></dt>
<dd>
If multiple commands have the same keybinding, an indicator is shown with a drop-down list of the conflicting bindings. An indicator is also shown when the command is selected in the list.
</dd>
<dt><strong>Binding editor</strong></dt>
<dd>
The binding editor shows the currently selecting binding in the list. To edit the binding, simply place focus in the editor box and type the new keybinding. If you press multiple combinations in succession, it will show a "chord" of two bindings. Press Backspace to clear the binding. When you are happy with the new binding, press the Apply button.
</dd>
</dl>

## Key Combinations and Chords

A key combination is a unique combination of a key and the keyboard modifiers that are active when the key is pressed - any combination of control, shift, alt/opt, super/windows/command. A key combination can be "bound" to a command, and this means that when the combination is pressed, then the command will be run. Keys without modifiers are valid "combinations" for binding too, which is useful for the function keys (F12 etc), arrow keys, the Page Up key, and so on. However it's a bad idea to bind keys that produce text/character input, since key bindings have top priority and therefore will prevent you from entering those characters.

It's not currently possible to bind more than one combination to each command, or more than one command to each unique combination. However, if you start to run out of key combinations, you can use chords. A keybinding chord is composed of two key combinations in succession. The first one, called a "mode" in emacs, can be shared by several chords, but this means it cannot be bound by itself, because that would conflict with the chords. For example, if I bound the command that shows the debugger locals pad to the "Ctrl-D Ctrl-L" chord, then I could not bind "Ctrl-D" by itself, but I could bind "Ctrl-L".  I could create other keybindings using the same mode, such as "Ctrl-D Ctrl-S" for the debugger stack pad.

## The Default Key Bindings

When we design the default key bindings for MonoDevelop, there are several important things we take into consideration.

* It's essential to use the core operating system keybindings where applicable - cut, copy, paste, and so on.
* It's good to have compatibility with other popular IDEs and text editors where possible.
* It's important to use the more accessible keybindings for the common commands that are more likely to be used from the keyboard.
* Unfortunately, not all editors and operating systems have the same keybindings, and they sometimes conflict with each other, so it's difficult to find a good balance.

MonoDevelop's default keybindings for Windows and Linux are the same, since GNOME and Windows have the same core keybindings. Additional bindings are mostly taken from various Visual Studio schemes, the GEdit text editor, Resharper, and SharpDevelop. MonoDevelop's default Mac keybindings are completely different, and mostly based on Xcode, with some from TextMate.
