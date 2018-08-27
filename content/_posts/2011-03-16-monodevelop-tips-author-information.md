---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Author Information'
created: 1300291200
redirect_from:
- /node/211
- /journal/2011/03/monodevelop_tips_author_information
---
There are many convenient things MonoDevelop can do automatically, but for some
it needs to know a bit about you, such as your name, your email address, and who
owns the copyright on your work. This is used for adding standard file headers,
committing to a VCS repository, creating AssemblyInfo.cs files, and so on. You
can provide this information in the _Author Information_ panel in
Preferences.<!--break-->

![The author information
panel](/files/images/md-tips/author-information-panel.png)

If there is a solution for which you wish to use different information, you can
override the author information for that solution in the Solution Options. This
is stored in the solution's user preferences (the *.userprefs file) so it won't
be shared with other users.
