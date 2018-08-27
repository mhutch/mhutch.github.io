---
tags: [ mono, monodevelop tips ]
layout: journal
title: 'MonoDevelop Tips: Inline Errors'
created: 1300204800
redirect_from:
- /node/210
- /journal/2011/03/monodevelop_tips_inline_errors
---
In MonoDevelop 2.4, we introduced inline error markers, similar to Xcode. When
you build, errors and warnings are shown inline in the code as _message
bubbles_, though of course they also remain available as a list in the Error
List pad.<!--break-->

![An inline error message bubble](/files/images/md-tips/inline-error-marker.png)

We do our best to make sure the message bubbles don't become too intrusive, but
remain usable. They are normally shown on the end of the line that they affect,
but if they are too long, they will wrap onto a new line. If they are really
long, they ellipsize, but the full error remains available on a tooltip. If
there are multiple errors or warnings on one line, they collapse down to a
single line with an indicator indicating how many there are. Clicking on this
indicator or moving the caret into the line causes the bubble to expand over the
lines below and show all the messages, and clicking on the indicator again or
moving the caret out of the line causes the bubble to collapse.

![A collapsible inline error message
bubble](/files/images/md-tips/inline-error-collapsible.png)

Editing a line with a message bubble causes the bubble to dim slightly, to
indicate that it's probably no longer valid.

By default, message bubbles are shown for both warnings and errors, and
MonoDevelop takes you to the first error immediately after the build. These
behaviours are configurable in _Preferences->Build_, where you can configure
what happens after the build: whether to jump to errors and warnings, or just
errors, or not at all; whether to show the error pad automatically; and whether
to show message bubbles for errors, for errors and warnings, or not at all.

![The inline error options](/files/images/md-tips/inline-error-options.png)

There are several commands for working with message bubbles, accessible from the
_View->Message Bubbles_ menu. The _Hide/Show Message Bubble_ command hides or
shows all the message bubbles, and the _Toggle Message Bubble_ command hides or
shows just the message bubbles on the current line. The latter command is also
accessible via the context menu in the text editor margin. When bubbles are
hidden, the error marker in the margin will remain there until the next build.
