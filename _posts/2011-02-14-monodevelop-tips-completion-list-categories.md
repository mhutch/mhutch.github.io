---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Completion List Categories'
created: 1297702811
redirect_from: /node/188
---
When using code completion to explore a new API, it's often useful to know where in the type hierarchy members are defined. For example, when looking for things you can do with a button, the members on the button are more interesting than the members on its superclasses. MonoDevelop makes it easier to do this with a featured called _categorized mode_. The completion list can be toggled into categorized mode using <strong>Ctrl-Space</strong>, and will stay in this mode until it is toggled off. While in this mode, items may be be grouped by the completion engine into categories, depending on context. For example, when listing members of types, they will be grouped by the class on which they're defined. Other groupings may be added in future.

<a href="/files/images/md-tips/completion-categories.png" rel="lightbox[md_tips_completion_categories]" title="Completion list categories"><img src="/files/images/md-tips/completion-categories.png" alt="Completion list categories" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

When navigating the list with arrow keys, you can jump directly between groups using <strong>Shift-Up</strong> and <strong>Shift-Down</strong>. If the list is not in completion mode, these combinations will toggle it on.

Completion mode is not the default behaviour because it makes the ordering and filtering of the list less straightforward.
