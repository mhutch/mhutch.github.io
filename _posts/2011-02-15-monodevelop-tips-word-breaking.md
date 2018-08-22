---
excerpt: "There are various places where the MonoDevelop text editor needs to understand
  where words begin and end, for example, when you use control-left/right to move
  the caret (alt-left/right on Mac). We refer to this as \"word breaking\". Unfortunately,
  word breaking behaviour differs between OSes, and word breaking is often intended
  for text, not code. In addition, people become used to particular kinds of word
  breaking. For these reasons, we allow users to change MonoDevelop's word breaking
  mode in <em>Preferences->Text Editor->Behavior</em>.\r\n\r\n<dl>\r\n<dt><strong>
  SharpDevelop </strong></dt>\r\n<dd>\r"
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Word Breaking'
created: 1297789200
---
There are various places where the MonoDevelop text editor needs to understand where words begin and end, for example, when you use control-left/right to move the caret (alt-left/right on Mac). We refer to this as "word breaking". Unfortunately, word breaking behaviour differs between OSes, and word breaking is often intended for text, not code. In addition, people become used to particular kinds of word breaking. For these reasons, we allow users to change MonoDevelop's word breaking mode in <em>Preferences->Text Editor->Behavior</em>.

<dl>
<dt><strong> SharpDevelop </strong></dt>
<dd>
This mode is like the native behaviour on Windows, breaking on transitions between whitespace, alphanumeric spans and punctuation. Has tweaks to make it more coding-friendly, such as not breaking on underscores within identifiers.
</dd>
<dt><strong>Emacs</strong></dt>
<dd>
Mimics the behaviour of emacs. Words last until punctuation or the end of the next block of whitespace. This is similar to the native behaviour on Mac and Linux (GNOME).
</dd>
<dt><strong> MonoDevelop </strong></dt>
<dd>
Like Emacs mode, but with some tweaks to make it more coding-friendly, such as not breaking on underscores within identifiers. This is the default word breaking mode.
</dd>

In addition, the vi input mode has its own word breaking mode that mimics the behaviour of vim.
