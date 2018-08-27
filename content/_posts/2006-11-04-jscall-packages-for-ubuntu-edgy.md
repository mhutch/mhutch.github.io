---
tags: [ mono, aspnetedit, jscall# ]
title: JSCall# Packages for Ubuntu Edgy
created: 1162685180
redirect_from:
- /node/108
- /journal/2006/11/05/jscall_packages_for_ubuntu_edgy
---
Now that Ubuntu Edgy has gone final, and I'm no longer tracking the beta, I've
made some checkinstall packages for JSCall#. Although
[JSCall#](http://svn.myrealbox.com/viewcvs/trunk/jscall-sharp) originated as the
native part of AspNetEdit, it has other uses as a limited Gecko-C#
bridge.<!--break--> You'll obviously need Firefox, though I don't think there
are any other hard dependencies. If a Firefox update breaks the packages, please
add a comment to this post to tell me, and I'll rebuild them. There's an
[AMD64](/files/releases/jscall-cil_0.0.2-1_amd64.deb) and an
[i386](/files/releases/jscall-cil_0.0.2-1_i386.deb) version.

Anyone who's interested in trying AspNetEdit will still have to build
MonoDevelop, but will no longer need the C++/GTK+/FireFox dev stuff (on Ubuntu
Edgy anyway).
