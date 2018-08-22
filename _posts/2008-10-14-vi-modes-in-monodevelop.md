---
tags:
- mono
- monodevelop
- vi
layout: journal
title: Vi modes in MonoDevelop
created: 1223960115
redirect_from: /node/160
---
I've recently added simple vi modes emulation to MonoDevelop. It's been a relatively quick and easy hack, though I'm pretty sure I'm now running a deficit of free time. I'm not actually a vi user, but I've been hearing from several of our users that they miss vi navigation and commands. While most editors (for example emacs) can be simulated to some extend through a keybinding theme, it's impossible to replicate even the simplest behaviours of vi this way.

After seeing <a href="http://www.viemu.com/">ViEmu</a>, a successful vi emulation addin for Visual Studio, I realised that a vi mode in MonoDevelop would probably see a lot of use, and, as a challenge, decided to bootstrap it. I'm hoping that real vi/vim users will contribute tweaks and patches to bring it closer to a faithful vi experience.
<!--break-->
Some of you might be wondering why I started from scratch, since over a year ago, <a href="http://ankitjain.org/blog/2007/06/30/integrating-vim-with-monodevelop/">Ankit embedded vim in MonoDevelop</a>. There are several reasons why I don't think this is the best approach. Embedding vim means you have perfect vim support, but you have to manually integrate all of the MonoDevelop features one by one. Integrating code completion is only the first step. Consider integrating language item tooltips, refactoring/navigation commands, error underlining, code folding, language item combos, semantic highlighting, text templates draggable from the toolbox, debugger breakpoint and stepping markers, debugger value inspection tooltips. Even when you finish this, you have to deal with potential future features like per-project editor settings, contexual multi-field templates, and who knows what else. People using vim integration would always be second-class MonoDevelop users.

I don't want to bring MonoDevelop features to vim, I want to bring vi/vim features to MonoDevelop.

Spelunking deep into Mono.TextEditor code, I implemented vi modes and commands at the very core of the text editor. The action-based architecture made this pretty easy to do at the core, though I'm running into a few problems at the higher levels of MonoDevelop, particularly the C# smart indenter, which relies on hooking &lt;Enter&gt; keystrokes. Fortunately it's still very usable. 

The code is in MD SVN, and can be enabled through a checkbox in the Preferences -> Text Editor -> Behaviour panel. Features implemented so far are:
<dl>
<dt><strong>Motions</strong></dt><dd><pre>h j k l w b % 0 ^ _ $ G { }</pre></dd>
<dt><strong>Delete commands</strong></dt><dd><pre>d d{motion} dd D x X</pre></dd>
<dt><strong>Change commands</strong></dt><dd><pre>c c{motion} cc C r R</pre></dd>
<dt><strong>Insert commands</strong></dt><dd><pre>a A i I o O</pre></dd>
<dt><strong>Ex commands</strong></dt><dd><pre> :q :w :qw :q! :{linenumber}</pre></dd>
</dl>

In addition, keyboard directional keys act where appropriate, normal MonoDevelop keyboard shortcuts remain functional, and visual mode is implemented but so far can only be used with normal MonoDevelop keyboard shortcuts.

I have a pretty good idea of what I'd like to see and how I'd like to see them implemented, in particular with regard to refactoring so that macros and repeat commands can be implemented. This will not be easy, but there are many other low-hanging fruit: B W e E ( ) word and sentence navigation, simple search/replace, repeated motions (e.g. d10w), cut/copy/paste. I'd also like to add some ex commands for IDE features, e.g. build project, jump to definition, rename variable, go to base class, implement interface. These are pretty easy too, though naming the commands will take some thought. It might be worth borrowing some ideas from <a href="http://jvi.sourceforge.net/ReadmeNetBeans.html">jVi/NetBeans</a>.

Unfortunately I'm not likely to have any time to spend on vi modes in the near future, but I welcome contributions, and will be glad to provide guidance to anyone who'd like to contribute.
