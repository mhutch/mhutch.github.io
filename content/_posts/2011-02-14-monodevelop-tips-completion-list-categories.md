---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Completion List Categories'
created: 1297702811
redirect_from:
- /node/188
- /journal/2011/02/monodevelop_tips_completion_list_categories
---
When using code completion to explore a new API, it's often useful to know where
in the type hierarchy members are defined. For example, when looking for things
you can do with a button, the members on the button are more interesting than
the members on its superclasses. MonoDevelop makes it easier to do this with a
featured called _categorized mode_. The completion list can be toggled into
categorized mode using *Ctrl-Space*, and will stay in this mode until it is
toggled off. While in this mode, items may be be grouped by the completion
engine into categories, depending on context. For example, when listing members
of types, they will be grouped by the class on which they're defined. Other
groupings may be added in future.

![Completion list categories](/files/images/md-tips/completion-categories.png)

When navigating the list with arrow keys, you can jump directly between groups
using *Shift-Up* and *Shift-Down*. If the list is not in completion mode, these
combinations will toggle it on.

Completion categories is not the default behaviour because it makes the ordering and
filtering of the list less straightforward.
