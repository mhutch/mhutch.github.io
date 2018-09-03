---
tags: []
layout: page
title: MonoDevelop.AddinMaker 1.2.1
created: 1427170055
permalink: /addinmaker/1.2.1/
redirect-from: /node/232
---
This release adds several new features that make it easier to create addins,
including code completion for manifests.

Update from the MD/XS Addin Manager, or view the source [on
GitHub](https://github.com/mhutch/MonoDevelop.AddinMaker).

## Release Notes

* Addin manifest files now have code completion. There is completion for all
  elements and attributes except node sets, conditions, and extension points
  declared in the same addin.
* File templates are now provided for file and project templates, though they
  must still be registered manually in the manifest.
* Some very simple code completion for file/project templates is now provided.
* A new `AddinFile` build action is now available. File with this build action
  are automatically copied to the output folder and transparently included in
  the `Runtime` manifest section.
* A `MD_X` define is now provided, where `X` is the `CompatVersion` of the
  MonoDevelop/Xamarin Studio against which it is built. For example, for 5.x
  releases this is `MD_5_0`
* The addin now sets the `MDAddinsDir`, `MDConfigDir`, and `MDBinDir` MSBuild
  properties on the build host so that the addin will target the MonoDevelop
  instance that is used to build it (currently only works on 6.0+).