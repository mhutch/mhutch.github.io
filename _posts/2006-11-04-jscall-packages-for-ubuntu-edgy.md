---
tags:
- mono
- aspnetedit
- jscall#
layout: journal
title: JSCall# Packages for Ubuntu Edgy
created: 1162685180
redirect_from: /node/108
---
Now that Ubuntu Edgy has gone final, and I'm no longer tracking the beta, I've made some checkinstall packages for JSCall#. Although <a href="http://svn.myrealbox.com/viewcvs/trunk/jscall-sharp/">JSCall#</a> originated as the native part of AspNetEdit, it has other uses as a limited Gecko-C# bridge. You'll obviously need Firefox, though I don't think there are any other hard dependencies.<!--break-->  If a Firefox update breaks the packages, please add a comment to this post to tell me, and I'll rebuild them. There's an <a href="http://mjhutchinson.com/files/releases/jscall-cil_0.0.2-1_amd64.deb">AMD64</a> and an <a href="http://mjhutchinson.com/files/releases/jscall-cil_0.0.2-1_i386.deb">i386</a> version. 

Anyone who's interested in trying AspNetEdit will still have to build MonoDevelop, but will no longer need the C++/GTK+/FireFox dev stuff (on Ubuntu Edgy anyway).
