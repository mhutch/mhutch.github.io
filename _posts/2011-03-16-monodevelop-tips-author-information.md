---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Author Information'
created: 1300291200
redirect_from: /node/211
---
There are many convenient things MonoDevelop can do automatically, but for some it needs to know a bit about you, such as your name, your email address, and who owns the copyright on your work. This is used for adding standard file headers, committing to a VCS repository, creating AssemblyInfo.cs files, and so on. You can provide this information in the <em>Author Information</em> panel in Preferences.<!--break-->

<a href="http://mjhutchinson.com/files/images/md-tips/author-information-panel.png" rel="lightbox[md_tips_author_information]" title="The author information panel"><img src="http://mjhutchinson.com/files/images/md-tips/t/author-information-panel.png" alt="The author information panel" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

If there is a solution for which you wish to use different information, you can override the author information for that solution in the Solution Options. This is stored in the solution's user preferences (the *.userprefs file) so it won't be shared with other users.
