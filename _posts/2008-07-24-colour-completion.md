---
tags:
- mono
- monodevelop
- asp.net
layout: journal
title: Colour Completion
created: 1216925978
redirect_from: /node/155
---
When I initially wrote the ASP.NET code completion, I added support for completing attribute values for enums and bools. More generalised completion using TypeConverter.GetStandardValues isn't so easy, since I don't want to load arbitrary types into the MD process, so I skipped this for now. However, I did special-case System.Drawing.Color, since it's used a lot.

This morning, on a suggestion from <a href="http://abock.org">Aaron</a>, I tweaked it to generate custom icons for each colour:

<img src="http://mjhutchinson.com/files/images/MonoScreenshots/AspNetColourCompletion.png" alt="Screenshot of a code completion window showing appropriately coloured icons for each named colour." style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" />

In other news, I landed the new ASP.NET completion parser, which is much more robust, and is also able to generate a tree, so it will soon replace the DOM parser too. The new design also means I'll be able to unify it with the XML and Moonlight (XAML) addins.

I recently returned from a family holiday in Maine, and will post photos when I got them sorted out and uploaded to Flickr.
<!--break-->
