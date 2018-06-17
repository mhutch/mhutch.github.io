---
categories: []
layout: page
title: MonoDevelop.AddinMaker 1.2.1
created: 1427170055
---
This release adds several new features that make it easier to create addins, including code completion for manifests.

Update from the MD/XS Addin Manager, or view the source <a href="https://github.com/mhutch/MonoDevelop.AddinMaker">on GitHub</a>.

<h3>Release Notes</h3>

<ul>
<li>Addin manifest files now have code completion. There is completion for all elements and attributes except node sets, conditions, and extension points declared in the same addin.
</li>
<li>
File templates are now provided for file and project templates, though they must still be registered manually in the manifest.
</li>
<li>
Some very simple code completion for file/project templates is now provided.
</li>
<li>
A new <code>AddinFile</code> build action is now available. File with this build action are automatically copied to the output folder and transparently included in the <code>Runtime</code> manifest section.
</li>
<li>
A <code>MD_X</code> define is now provided, where <code>X</code> is the <code>CompatVersion</code> of the MonoDevelop/Xamarin Studio against which it is built. For example, for 5.x releases this is <code>MD_5_0</code>
</li>
<li>The addin now sets the <code>MDAddinsDir</code>, <code>MDConfigDir</code>, and <code>MDBinDir</code> MSBuild properties on the build host so that the addin will target the MonoDevelop instance that is used to build it (currently only works on 6.0+).
</ul>
