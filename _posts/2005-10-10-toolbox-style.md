---
tags: [ mono, aspnetedit ]
layout: journal
title: Toolbox Style
created: 1128944382
redirect_from: /node/85
---
I'm cleaning up some of AspNetEdit's widgets, the Toolbox and the PropertyGrid.
My original plan was to use GTK#'s TreeView for both, but while working on the
toolbox I realised that it may not be the best solution for this particular
item.<!--break-->

Why? Well, it depends on how people want the toolbox to work. Should the basic
mechanism stay as it is, a TreeView-style list with expandable categories in one
huge scrollable box? Or should it be similar to Outlook, with effectively a
radio-button choice of one category that gets its own scrollable area?

I've used Glade to create a side-by-side mockup of the two approaches: <img
src="/files/images/MonoScreenshots/toolbox-mockup.png" alt="Two different
mockups of the toolbox"/>

I personally prefer the one on the left, but it does raise scalability problems
with large numbers of categories, though this is not likely to be a common
scenario. It would also make it more difficult to reorder categories.

Comments below, please!
