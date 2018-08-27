---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Build Actions'
created: 1299862800
redirect_from:
- /node/208
- /journal/2011/03/monodevelop_tips_build_actions
---
Files in a MonoDevelop (or Visual Studio) project have a _build action_ which
controls what happens to the file during a build. Here are some of the common
build actions for C# projects.<!--break-->

Compile
: The file will be passed to the C# compiler as a source file.

EmbeddedResource
: The file will be passed to the C# compiler as a resource to be
  embedded in the assembly. For historical reasons, it's displayed as
  "Embed as resource".

None
: The file is not part of the build in any way, it's simply included
  in the project for easy access from the IDE.

Content
: For ASP.NET projects, these files will included as part of the site
  when it's deployed. For MonoTouch and MonoMac projects, they'll be
  included in the app bundle.

Page
: In Silverlight/Moonlight projects, this is used for xaml files to be
  included in the app. In MonoTouch and MonoMac, it's used for xib files.

You can also define arbitrary build actions, and if your project uses the
MSBuild build engine, you can write custom tasks to process files with
particular build actions.

There are various ways to set files' build actions. When files are first added
to the project from templates, they will have an appropriate build action set by
the template. When files are added from the _Add Files_ dialog, they will have
the default build action for that file type, unless you explicitly override it
using the combobox in the dialog.

![Overriding the default build action when adding
files](/files/images/md-tips/build-action-override-default.png)

For files that are already in the project, you can change the build action by
selecting the file in the solution pad, then using the dropdown in the property
pad.

![Changing the build action using the property
pad](/files/images/md-tips/build-action-property-pad.png)

Common build actions can be set using the solution pad's context menu, which has
the advantage that it supports multi-selection, so you can change many files at
once.

![Changing the build action using the solution pad context
menu](/files/images/md-tips/build-action-context-menu.png)
