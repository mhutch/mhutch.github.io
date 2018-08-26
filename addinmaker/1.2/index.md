---
tags: []
layout: page
title: MonoDevelop.AddinMaker 1.2
created: 1427170055
permalink: /addinmaker/1.2
redirect-from: /node/229
---
MonoDevelop.AddinMaker 1.2 is the biggest AddinMaker release yet. Although it has few new features, the core is completely rewritten, laying the foundation for future improvements.

Update from the MD/XS Addin Manager, or view the source [on GitHub](https://github.com/mhutch/MonoDevelop.AddinMaker).

### Release Notes

* Build system now uses MSBuild/xbuild, enabling advanced customization, and paving the way for future improvements.
* Addins can now be built with commandline MSBuild/xbuild, using build targets downloaded via NuGet.
* Addin dependencies are now specified on the project, and implicitly reference the addins' assemblies.
* MonoDevelop.Core, MonoDevelop.Ide and all core MD/XS assemblies are referenced automatically.

_Release song: Eye of the Tiger_

### Migrating from Older Versions

Since this is an in-my-free-time project, and the addin has relatively few users, I have not written an automatic migration system. I intend to spend the saved time improving the addin. Instead, here are the steps to migrate your project manually:

1. Open the project as text. Right-click it in the Solution Pad, _Tools->Edit File_.
2. Find the `ProjectTypeGuids` element. Replace the `{7DBEB09D-BB9F-4D92-A141-A009135475EF}` GUID with `{86F6BF2A-E449-4B3E-813B-9ACC37E5545F}`
3. In the main `PropertyGroup`, set `<TargetFrameworkVersion>v4.5</TargetFrameworkVersion>`
4. Reload the project. Right-click it in the Solution Pad, _Reload_.
5. Right-click on the project in the Solution Pad, choose _Add->Add NuGet Packages.._. Search for the _monodevelop.addins_ package and add it.
6. You will see a new "Addin References" virtual folder in your project in the Solution Pad. Double-click on it, and add any addin dependencies that your addin has (note that MonoDevelop.Core and MonoDevelop.Ide are always referenced). This will reference their assemblies and add dependencies automatically.
7. Open your addin manifest, and remove any explicit addin dependencies. The addin references automatically handle dependencies.

Thanks for bearing with these changes. They will help to enable lots of cool new features!