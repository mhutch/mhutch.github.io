---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Code Snippets'
created: 1298480400
redirect_from: /node/195
---
Code snippets (or code templates) are an incredibly useful feature. They allow inserting and editing template blocks of code, which is useful for quickly replicating common patterns, or learning new patterns. This post explains how to use snippets, and a future post will explain how to create snippets.<!--break-->

<h3>Inserting Snippets</h3>

There are three ways to use snippets: the <em>Insert Template</em> command, <em>Tab expansion</em>, and the <em>Toolbox</em>.

<h4>Insert Template Command</h4>

The <strong>Insert Template...</strong> command can be activated from the <em>Edit->Insert Template...</em> menu, or the <strong>Control-T</strong> keybinding on Windows and Linux. It shows a list of all templates valid for the current file type, and you can match them using the same <a href="/journal/2011/02/07/completion_list_filtering">substring matching</a> as the completion list. Select one and hit <strong>Enter</strong> to activate it.

<a href="/files/images/md-tips/template-insert.png" rel="lightbox[md_tips_code_snippets]" title="The Insert Template list"><img src="/files/images/md-tips/template-insert.png" alt="The Insert Template list" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

If there is a selection, then this command will turn into the <strong>Surround With...</strong> command. This only shows templates that have the "Surround With" flag. They will take the current selection and incorporate it into the template. For example, the "for" template will put the selection into the loop body.

<h4>Tab Expansion</h4>

If the snippet has a shortcut, type the shortcut and then hit <strong>Tab</strong>. The shortcut will be in the completion list, so if you pick the item from the completion list you must hit tab twice, once to commit the selection, and once to expand it. The second tab is necessary because snippets may have the same name as keywords or symbols, and if they activated as soon as they were committed, you would not be able to type the keyword or symbols. Indeed, there are built-in snippets for many C# keywords.

<h4>The Toolbox</h4>

When the text editor is focussed, the <strong>Toolbox Pad</strong> shows all of the snippets valid for the current document. Drag one to the text editor to insert it at a specific position, or double-click it to insert it at the caret position.

<a href="/files/images/md-tips/template-toolbox.png" rel="lightbox[md_tips_code_snippets]" title="Code Snippets in the Toolbox"><img src="/files/images/md-tips/template-toolbox.png" alt="Code Snippets in the Toolbox" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

<h3>Using Snippets</h3>

When a snippet is inserted, it may simply insert plain text and move the caret to a location somewhere within it. However, advanced snippets will have linked regions to enable you to customize the usage of the snippet. For example, the C# "for" snippet contains two editable regions, with other regions linked to them.

<a href="/files/images/md-tips/template-for-regions.png" rel="lightbox[md_tips_code_snippets]" title="Expansion of the 'for' template showing linked regions"><img src="/files/images/md-tips/template-for-regions.png" alt="Expansion of the 'for' template showing linked regions" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

When the template is activated, the region with the declaration of the loop variable "i" is selected. You may type a new name, and both other uses of that name will be updated. Then, hit <em>Tab</em> to move to the next editable region. You can now change the value of the upper limit of the loop. <em>Tab</em> and <em>Shift-Tab</em> can be used to cycles between the editable regions, and when you are done, hit <em>Enter</em> or <em>Escape</em> to exit region editing mode and move the caret to the loop body.
