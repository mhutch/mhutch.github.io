---
tags: [ mono ]
title: MSBuild Code Generation in VS2015
created: 1461041943
redirect_from:
- /node/236
- /journal/2016/04/19/msbuild_code_generation_vs2015
---
A couple of weeks ago I was helping [Jason Smith](http://xfcomplete.net) debug
an issue with the build-time code generation in Xamarin.Forms. The build targets
were based on my [Build Time Code Generation in
MSBuild](/journal/2015/06/30/build_time_code_generation_msbuild) post, but in
recent Visual Studio 2015 versions the generated classes would occasionally
disappear from IntelliSense.<!--break-->

Eventually we figured out that this happened after a very specific sequence of
circumstances: when the project was cleaned, then closed and reopened.

I verified that the `CoreCompile` target is still run on each project when first
opening a solution in Visual Studio. However, it wasn't getting run when the
solution was closed and reopened unless the project file had changed, or the SUO
files were deleted. All of this pointed to Visual Studio caching the `Csc`
inputs in the solution options in order to improve solution load performance by
eliminating the need to run `CoreCompile`.

This is a fine optimization, except for one minor detail. The cache was not
getting flushed when the project was cleaned. This is a HUGE problem when the
`CoreCompile` target creates input files for `Csc`, and the `Clean` targets
correctly cleans them up. If the solution is closed and reopened after a clean,
and no build has taken place since the clean, the input files will be missing!

For now, a reasonable workaround is simply not to incrementally clean generated
files, and I've updated my original post with this. As long as you regenerate
and collect the generated files correctly, skipping cleaning them shouldn't
cause any problems except wasting a tiny bit of disk space.
