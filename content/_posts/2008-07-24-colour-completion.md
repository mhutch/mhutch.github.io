---
tags: [ mono, monodevelop, asp.net ]
title: Colour Completion
created: 1216925978
redirect_from:
- /node/155
- /journal/2008/07/24/colour_completion
- /journal/2008-07-24/colour_completion
---
When I initially wrote the ASP.NET code completion, I added support for
completing attribute values for enums and bools. More generalised completion
using TypeConverter.GetStandardValues isn't so easy, since I don't want to load
arbitrary types into the MD process, so I skipped this for now. However, I did
special-case System.Drawing.Color, since it's used a lot.<!--break-->

This morning, on a suggestion from [Aaron](http://abock.org), I tweaked it to
generate custom icons for each colour:

!Screenshot of a code completion window showing appropriately coloured icons for each named colour[](/files/images/MonoScreenshots/AspNetColourCompletion.png)

In other news, I landed the new ASP.NET completion parser, which is much more
robust, and is also able to generate a tree, so it will soon replace the DOM
parser too. The new design also means I'll be able to unify it with the XML and
Moonlight (XAML) addins.

I recently returned from a family holiday in Maine, and will post photos when I
got them sorted out and uploaded to Flickr.