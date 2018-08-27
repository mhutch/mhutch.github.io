---
tags: [ mono, monodevelop tips ]
title: 'MonoDevelop Tips: Preferences, Policies and Project Options'
created: 1300896000
redirect_from:
- /node/216
- /journal/2011/03/monodevelop_tips_preferences_policies_and_project_options
---
There are several different kinds of settings in MonoDevelop &mdash;
Preferences, Policies and Project Options &mdash; and the distinction between
them is not immediately clear. This post aims to provide an explanation of them
and what they're used for.<!--break-->

## Preferences

Preferences control MonoDevelop's behaviour and appearance, but do not directly
affect projects' code or output. This means that they are user-specific, and are
stored in the user profile. Examples of preferences are the text editor's colour
scheme, whether the text editor shows line numbers, the font used for output
pads, whether MonoDevelop jumps to errors after a build, and so on.

The Preferences dialog can be accessed from the _MonoDevelop->Preferences_ menu
item on Mac, the _Tools->Options_ menu item on Windows, and the
_Edit->Preferences_ menu item on Linux. This is consistent with other
applications on these platforms.

## Project and Solution Options

Project Options are specific to projects, and affect how they're built and run.
This includes things like compiler options, the name of the output file, the
arguments used when running the project, and so on. These options are stored in
the project file, so other users will be able to build and run the project
correctly. Where possible, they are mapped to the options used by Visual Studio
and the MSBuild/xbuild command-line build tools.

The Project Options dialog can be accessed from the _Project->{Project Name}
Options_ menu item, or from the _Options_ context menu item on the project in
the solution pad, or by double-clicking on the project in the solution pad.

Some options are part of a project _configuration_. Projects can have multiple
configurations, so by switching between them you can build different outputs.
Configurations will be covered in a future post.

Solution Options are similar to Project Options, but for solutions. The Solution
Options dialog can be accessed from the _Project-> Solution Options_ menu item,
or from the _Options_ context menu item on the solution in the solution pad, or
by double-clicking on the solution in the solution pad.

## Policies

Policies are settings that affect how projects and code are formatted and
organized, such as code formatting settings, naming conventions, and so on. In
many other IDEs these settings are user-specific preferences, which means that
different users working on the same project do things inconsistently, or have to
change their preferences depending on which project they're working. Policies
ensure that these settings are consistent for different users working on a
project, and make it easy to manage sets of policies across projects.

Because most policies are invariant across all projects within a solution,
projects can be set to inherit the policy of their their parent solution or
solution folder, and this is the default setting. This means that in most cases,
policies only need to be edited on the solution, and these changes will be
picked up by the projects. Policies settings panels are shown in the Project
Options and Solution Options dialogs. They can be recognized by the "Policy"
combo box at the top of the panel, which allows you to pick a policy to use, or
set the item to inherit the policy from its parent. Alternatively, you can
customize the settings, and the combo will show "Custom".

When a solution is first created, or a solution without policies is saved, it
will take its initial policies from the user's default policies. From that point
on, they are only stored in the solution and are not affected by changes in the
user's default policies, else solutions could not be shared between users and
maintain consistent policies.

While Preferences and Project Options are familiar to users of many other IDEs,
policies are something unique to MonoDevelop, and hence they sometimes cause
confusion. Another post will explore the policies system in more detail.
