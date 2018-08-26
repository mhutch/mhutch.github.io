---
tags:
- mono
- monodevelop tips
layout: journal
title: 'MonoDevelop Tips: Build Actions'
created: 1299862800
redirect_from: /node/208
---
Files in a MonoDevelop (or Visual Studio) project have a <em>build action</em> which controls what happens to the file during a build. Here are some of the common build actions for C# projects.<!--break-->

<dl>
<dt><strong>Compile</strong></dt>
<dd>The file will be passed to the C# compiler as a source file.
</dd>
<dt><strong>EmbeddedResource</strong></dt>
<dd>The file will be passed to the C# compiler as a resource to be embedded in the assembly. For historical reasons, it's displayed as "Embed as resource".
</dd>
<dt><strong>None</strong></dt>
<dd>The file is not part of the build in any way, it's simply included in the project for easy access from the IDE.
</dd>
<dt><strong>Content</strong></dt>
<dd>For ASP.NET projects, these files will included as part of the site when it's deployed. For MonoTouch and MonoMac projects, they'll be included in the app bundle.
</dd>
<dt><strong>Page</strong></dt>
<dd>In Silverlight/Moonlight projects, this is used for xaml files to be included in the app. In MonoTouch and MonoMac, it's used for xib files.
</dd>
</dl>

You can also define arbitrary build actions, and if your project uses the MSBuild build engine, you can write custom tasks to process files with particular build actions.

There are various ways to set files' build actions. When files are first added to the project from templates, they will have an appropriate build action set by the template. When files are added from the <em>Add Files</em> dialog, they will have the default build action for that file type, unless you explicitly override it using the combobox in the dialog.

<a href="http://mjhutchinson.com/files/images/md-tips/build-action-override-default.png" rel="lightbox[md_tips_build_actions]" title="Overriding the default build action when adding files"><img src="http://mjhutchinson.com/files/images/md-tips/t/build-action-override-default.png" alt="Overriding the default build action when adding files" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

For files that are already in the project, you can change the build action by selecting the file in the solution pad, then using the dropdown in the property pad.

<a href="http://mjhutchinson.com/files/images/md-tips/build-action-property-pad.png" rel="lightbox[md_tips_build_actions]" title="Changing the build action using the property pad"><img src="http://mjhutchinson.com/files/images/md-tips/t/build-action-property-pad.png" alt="Changing the build action using the property pad" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

Common build actions can be set using the solution pad's context menu, which has the advantage that it supports multi-selection, so you can change many files at once.

<a href="http://mjhutchinson.com/files/images/md-tips/build-action-context-menu.png" rel="lightbox[md_tips_build_actions]" title="Changing the build action using the solution pad context menu"><img src="http://mjhutchinson.com/files/images/md-tips/t/build-action-context-menu.png" alt="Changing the build action using the solution pad context menu" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>
