---
tags:
- mono
- monodevelop
- code navigation
layout: journal
title: Building an IDE Navigation History
created: 1217884730
redirect_from: /node/156
---
MonoDevelop has a code navigation history. When you switch views, or jump around between definitions, it logs the history, and you can browse back and forth like a web browser. However, it has some major issues -- the history it generates is unintuitive and erratic. It seems like it should be a really useful feature, but in practice is frustrating to use, so I recently decided to give it an overhaul.<!--break-->

Unfortunately, navigation isn't an easy thing to get right in an IDE. It's easy to log too many points. For example, if navigation points are logged every time the user switches between all their open document tabs looking for something, it gets very cluttered.

The most important thing is how it fits into the users' code navigation, so I decided to blog in order to get some feedback on my current thoughts.

In my opinion the following actions _should not_ trigger logging of navigation points:
<ul>
<li>Switching through files by control-tabbing or clicking on the tabs.</li>
<li>Jumping using the search pad or the error pad</li>
<li>Navigation between items using the document outline or the class browser</li>
<li>Moving the cursor around with the keys and/or mouse (but this should alter/update the existing nav point)</li>
</ul>

Whereas the following points _should_ be logged:
<ul>
<li>The destination of a "Go to definition" command</li>
<li>The point that's left behind when executing a "Go to definition" command, if it's not too close to the current point</li>
<li>A jump to an event handler from a designer</li>
<li>Locations in which text is edited, though these points should be carefully pruned so that there are no more than one or two per file</li>
</ul>

In summary, only direct interaction with the document -- and in particular, large jumps -- should be logged.

How will this fit into _your_ coding flow?

