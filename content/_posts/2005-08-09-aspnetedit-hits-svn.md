---
tags: [ mono, aspnetedit ]
title: AspNetEdit hits SVN
created: 1123624745
redirect_from:
- /node/83
- /journal/2005/08/09/aspnetedit_hits_svn
- /journal/2005-08-09/aspnetedit_hits_svn
- /journal/2005-09-08/aspnetedit_hits_svn
---
I've finally committed the ASP.NET Graphical Designer to Mono Subversion, module
'aspeditor'. It's unimaginatively codenamed AspNetEdit. If anyone *really* wants
to play with it, please be aware that right now it doesn't do an awful lot. Also
it requires Mono class libraries hot out of SVN. I would advise waiting till an
actual release the beginning of September; I'll keep my blog updated with
screenshots.<!--break--> Here's the latest:

![Screenshot of AspNetEdit](/files/images/MonoScreenshots/AspNetEdit2.png)

As before, you can add controls to the design surface from the toolbox, and
change their properties with the Property Browser. In this screenshot you can
also see the new Collection Editor. All of this has been polished, and you can
now save the document to a .aspx file. However, ASP directives are not suported
yet, and the interactive design surface is still a little way away.
