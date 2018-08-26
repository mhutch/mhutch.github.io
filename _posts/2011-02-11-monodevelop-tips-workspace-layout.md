---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Workspace Layout'
created: 1297443657
redirect_from: /node/187
---
The MonoDevelop workspace consists of a central document surrounded by <em>pads</em> containing complementary information, tools and navigation aids. Pads can be accessed from the <em>View->Pads</em> and <em>View->Debug Windows</em> menus, and closed when they are not needed. They may be assigned keybindings, which will open the pad if necessary then bring keyboard focus to it. Pads may also be opened automatically by various commands, such as the "Find in Files" command, which opens a pad of search results.<!--break-->

<h3>Arranging Pads</h3>

You can drag pads around to arrange them however is most useful to your workflow. Pads can be docked on any side of the document editor, or adjacent to any other pad. If a pad is docked in the same position as another pad, tabs will be added to enable you to switch which of the two pads is visible.

You can even undock pads and move them to float beside MD or on another monitor. Pads that you use less frequently but still wish to be easily accessible can be "auto-hidden" using the "-" button at the top right of the pad. Auto-hidden pads are shown as a little indicator at the side of where the pad was previously docked, and when you hover over this indicator, the pad will be shown again. When the mouse and keyboard focus leaves it, it will hide again.

<h3>Layouts</h3>

Which pads are is useful is something that's generally dependent on the current context. For example when debugging, it is useful to have the debugger pads for viewing the stack, locals, etc. When using the visual designer, the toolbox and property grid pads are very important. For this reason, the state of the open pads is represented by a <em>layout</em>, and you can switch between layouts to suit your current needs.

Layouts are very simple. There is always one active layout, and any changes you make to the pads change only the active layout. The current active layout can be changed using the list in the <em>View</em> menu, or the Layouts combo box in the toolbar. A new layout can be created using <em>View->New Layout</em>.

There are several built-in layouts that MonoDevelop switches between automatically based on the current context. The <strong>Default</strong> layout is shown when MD opens, and when a single single is loaded. The <strong>Solution</strong> layout is activated while a solution is open. The <em>Debug</em> layout is activated while debugging. There is also a <em>GUI Designer</em> layout that can be activated while using the GTK# designer, but this is optional, and an be enabled in <em>Preferences->Visual Style->GTK# Designer</em>.
