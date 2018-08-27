---
tags: [ mono, templates, razor, monodevelop ]
layout: journal
title: Razor Preprocessed Templates
created: 1355012546
redirect_from:
- /node/228
- /journal/2012/12/08/razor_preprocessed_templates
---
When [Miguel](https://twitter.com/migueldeicaza) asked me to investigate making
MonoDevelop support using
[Razor](http://weblogs.asp.net/scottgu/archive/2010/07/02/introducing-razor.aspx)
templates in [MonoTouch](http://xamarin.com/monotouch) and [Mono for
Android](http://xamarin.com/monoforandroid) apps, I realized that it could be
done simply and with very few dependencies by taking the same approach as [T4
preprocessed templates](http://msdn.microsoft.com/en-us/library/ee844259.aspx),
which I implemented for MonoDevelop a couple of years ago.<!--break-->
Fortunately, this time the hard part was already done: I could use [Microsoft's
open-source Razor parser](http://aspnetwebstack.codeplex.com) instead of writing
my own parser. I also found a Visual Studio extension called [Razor
Generator](http://razorgenerator.codeplex.com) that was very close in
functionality to what I wanted, and was able to use this as a basis for my work.
I was able to hook it it into the fantastic Razor editing and code completion
support written by [Piotr Dowgiallo](http://pdowgiallo.pl/gsoc/) in the Google
Summer of Code this year.

After a few days work implementing, tweaking and tuning (and bouncing ideas off
[Bojan Rajković](https://twitter.com/bojanrajkovic)), I present Razor
Preprocessed Templates in MonoDevelop.

As a basis for this demo, I created new a MonoTouch iPhone Single View
application, added a UIWebView to the View's xib, and connected it to an outlet
on the controller called `csharpwebview`. However, you can use these templates
in any project type.

Just add a new _Text Templating -> Preprocessed Razor Template_ file to the project:

![Adding a new Preprocessed Razor Template](/files/images/MonoScreenshots/PreprocessedRazor-1-NewFile.png)

You will see that this adds a cshtml Razor C# file to the project, grouped with
a C# file that contains the generated code. Like T4 files, this uses the "custom
tool" extensibility mechanism. By setting the custom tool property on the
`cshtml` file set to "RazorTemplatePreprocessor", it causes MonoDevelop to use
this new custom tool to regenerate the `cs` file whenever the `cshtml` file is
saved.

![The files added by the Preprocessed Razor Template](/files/images/MonoScreenshots/PreprocessedRazor-2-AddedFile.png)

I wrote a simple Razor page to demonstrate the power of Razor. It uses a simple
Razor helper to demonstrate that Razor helpers work correctly. The page also
demonstrates using the `@model` directive to specify the type for a Model
property, which easily allows us to pass data into the template before running
it. Since this demo is very simple, I just used an `int` as the model instead of
defining a proper model class.

```csharp
@model int

@helper boldtd (int i) {
<td><b>@i</b></td>
}

<html>
    <head>
        <title>Multiplication Table</title>
    </head>
    <body>
        <h1>Multiplication Table</h1>
        <table>
            @* Header row *@
            <tr>
                <td/>
            @for (int i = 1; i <= Model; i++) {
                @boldtd(i)
            }
            </tr>
            @* Main table *@
            @for (int i = 1; i <= Model; i++) {
            <tr>
                @boldtd(i)
                @for (int j = 1; j <= Model; j++) {
                <td>@(j * i)</td>
                }
            </tr>
            }
        </table>
    </body>
</html>
```

When writing this, the Razor code completion was very helpful. It has full C#
completion, including locals, helpers and members from the generated class and
base class, including the generated `Model` property:

![/files/images/MonoScreenshots/PreprocessedRazor-3-CSharpBaseCompletion.png](Code completion for C# in Razor Templates)

There's also HTML completion and on-the-fly underlining of HTML and Razor errors:

![/files/images/MonoScreenshots/PreprocessedRazor-4-HtmlCompletion.png](Code completion and error underlining for HTML in Razor Templates)

After saving the `cshtml` file, you can look at the generated `cs` file. It's
pretty messy, so I won't show it here, but note that it includes a
well-commented generated base class. If you want, you can specify a base class
using the `@inherits` directive, so you can pull that generated base class out
and share it between multiple templates, or customize it. The template's only
dependency is `Action<System.IO.TextWriter>`, and the default base class's
dependencies are only `System.Web.HttpUtility.HtmlEncode(string)` and
`System.IO.StringWriter`, so it can easily be made to run anywhere. If your
target framework lacks the one potentially awkward dependency,
`HttpUtility.HtmlEncode(string)`, you can provide an alternative implementation
via a custom base class.

More documentation on the generated class and the available directives can be
found [on the MonoDevelop
website](http://monodevelop.com/Documentation/Preprocessed_Razor_Templates).

To use the template, I simply added two lines to my `ViewDidLoad` method to
instantiate the template, generate a string using the `Generate()` method, and
load it into the `UIWebView`:

```csharp
public override void ViewDidLoad ()
{
    base.ViewDidLoad ();

    var template = new MultiplicationTable () { Model = 12 };
    webview.LoadHtmlString (template.GenerateString (), null);
}
```

Then run the app, and you can see it in action:

![Razor Template running on iPhone](/files/images/MonoScreenshots/PreprocessedRazor-5-RunningOnPhone.png)

This is a fantastic way to generate HTML pages without pulling in the whole
System.Web stack, and I hope you're as excited about it as I am. It isn't
available today, unless you build MonoDevelop from source, however the code is
committed to [MonoDevelop master](http://github.com/monodevelop) and should make
it into the next 3.x release.
