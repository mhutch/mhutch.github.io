---
tags: [ mono, monodevelop, msbuild ]
title: The State of MSBuild Support in MonoDevelop
created: 1345352230
redirect_from:
- /node/227
- /journal/2012/08/19/state_msbuild_support_monodevelop
---
I occasionally get questions about support for advanced MSBuild features, and my
answers are usually fairly short. This post aims to be a more comprehensive
description of the current state state of MSBuild support in MonoDevelop, so I
can refer people to it. If you've never hand-edited custom targets for an
MSBuild file, this doesn't affect you at all, but feel free to read it if you're
curious.<!--break-->

[MSBuild](http://msdn.microsoft.com/en-us/library/dd393574") is the
Microsoft build engine that was introduced with .NET 2.0 and Visual Studio 2005.
It's the format for the project files of Visual Studio 2005 and later, and has
been MonoDevelop's default/native file format since MonoDevelop 2.0. It's
XML-based, so it can be handled easily and reliably by tools such as IDEs. It's
essentially intended to be consumed primarily by IDEs &mdash; but it also has
the power of an advanced, extensible build system that lets you do pretty much
anything if you're willing to get your hands dirty. Calling it "Makefiles in
XML" wouldn't be too far off the mark.

The MSBuild engine and hosting API are part of the .NET framework. Mono has its
own implementation called xbuild, which runs on Mac, Linux and Windows. The core
features of xbuild are solid, but it's missing some of the advanced features
added to MSBuild in .NET 3.5 and 4.0, and some of the common targets such as the
ASP.NET web project targets.

MSBuild is extremely complex and exposing all its features in the MonoDevelop
GUI would be practically impossible. However, the projects created by the IDE by
default use the "common targets" to build the project, which understand a
certain number of properties (e.g. "OutputPath") and item types (e.g. "Compile",
"EmbeddedResource"), and implement certain targets (e.g. "Build", "Clean") that
operate on these items and are controlled by these properties. They also make
very limited use of conditions, by conventionally having several groups of
properties conditional upon the value of the "Configuration" and "Platform"
variables. To edit projects that haven't been hand-modified, the IDE only really
has to understand the item types, properties, and targets used by the common
targets.

MonoDevelop has an internal project model that represents the projects and their
properties and items. When loading the project, MD deserializes the MSBuild file
into its internal model, and ignores the items, properties and imports it does
not understand. When saving MSBuild projects, MD serializes its internal model
into the MSBuild format and substitutes them for the parts of the MSBuild file
it understood, thereby preserving the parts of the file that it did not
understand: custom items, properties, targets, conditions, and imports.

There are a couple of things the serialization doesn't handle &mdash; when
hand-edited projects use properties or items as _values_ of any of the standard
properties or items.  MonoDevelop does not evaluate these &mdash; doing so would
require a full MSBuild engine &mdash; and even if it did, it would not easily be
able to present them cleanly in the UI and serialize back any changes to the
values. It might be possible to special-case some things, but it's not something
that can be fully solved in a generic way. Probably the best we could get would
be to have MonoDevelop detect property/item values it cannot handle, evaluate
them via the MSBuild engine when loading, make them non-editable with a warning
flag in the Project Options GUI, and skip them when serializing.

Wildcards in items paths are a similar problem. For example, evaluating a
wildcard in an item when deserializng would result in adding several items to
MD's internal model. And in simple cases, we could match all those items back to
the wildcard MSBuild item when serializing. So far so good. But what happens if
a new file is added on disk outside of MD while the project is open? What
happens if the user manually removed a single item in the solution tree? What
happens if the user changes the metadata of a single item? In all of these
cases, the items can no longer be mapped back to the single wildcard MSBuild
item. It would probably be possible to remove the wildcard item and serialize
all the items to MSBuild individually &mdash; but that might not be what the
user expected. This is just one example of how supporting a simple MSBuild
feature in the IDE might not be as simple as it looks.

For building the projects, MonoDevelop's story is much better, because it has
the ability to build the projects using the actual MSBuild/xbuild engine,
thereby supporting all features that MSBuild/xbuild does. There are currently
two build codepaths in MonoDevelop: the old internal build engine, and the
MSBuild engine. The internal build engine is very old, and predates the
existence of MSBuild. It operates directly on MonoDevelop's internal project
model, and is extensible via the addin system. The MSBuild engine loads the
actual project files into a builder process and builds them using the MSBuild
hosting API.

By default MonoDevelop uses the old engine, but the addins for individual
project types can opt into using the MSBuild engine for just those projects
&mdash; Mono for Android does this. Enabling the experimental option "Compile
projects using MSBuild/XBuild" in MonoDevelop's preferences (and restarting
MonoDevelop) causes the MSBuild engine to be used for all projects. This is
marked experimental because it does not work for all project types &mdash; for
example, there are no MSBuild targets for MonoTouch, MonoMac or ASP.NET projects
yet. User projects that depend on MonoDevelop's old custom build command system
will not build correctly with the MSBuild engine. And some of the old
MonoDevelop custom project types such as translation projects and C/C++ projects
would need to be migrated to a new file format before they could even have
MSBuild targets.

In general, expansion of the MSBuild support in MonoDevelop is not a high
priority for the MonoDevelop team, since these advanced build features are of
interest to a very small subset of users, and there are other things that could
be done to improve the IDE experience for a much greater number of users.
However, it's an area of ongoing improvement and will likely become more
important in the future.
