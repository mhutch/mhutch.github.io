---
tags:
- mono
- templates
- razor
- monodevelop
layout: journal
title: Razor Preprocessed Templates
created: 1355012546
redirect_from: /node/228
---
When <a href="https://twitter.com/migueldeicaza">Miguel</a> asked me to investigate making MonoDevelop support using <a href="http://weblogs.asp.net/scottgu/archive/2010/07/02/introducing-razor.aspx">Razor</a> templates in <a href = "http://xamarin.com/monoforandroid">MonoTouch</a> and <a href="http://xamarin.com/monotouch">Mono for Android</a> apps, I realized that it could be done simply and with very few dependencies by taking the same approach as <a href="http://msdn.microsoft.com/en-us/library/ee844259.aspx">T4 preprocessed templates</a>, which I implemented for MonoDevelop a couple of years ago. Fortunately, this time the hard part was already done: I could use <a href="http://aspnetwebstack.codeplex.com/">Microsoft's open-source Razor parser</a> instead of writing my own parser. I also found a Visual Studio extension called <a href="http://razorgenerator.codeplex.com/">Razor Generator</a> that was very close in functionality to what I wanted, and was able to use this as a basis for my work. I was able to hook it it into the fantastic Razor editing and code completion support written by <a href="http://pdowgiallo.pl/gsoc/">Piotr Dowgiallo</a> in the Google Summer of Code this year.

After a few days work implementing, tweaking and tuning (and bouncing ideas off <a href="https://twitter.com/bojanrajkovic">Bojan Rajković</a>), I present Razor Preprocessed Templates in MonoDevelop.
<!--break-->

As a basis for this demo, I created new a MonoTouch iPhone Single View application, added a UIWebView to the View's xib, and connected it to an outlet on the controller called <csharp>webview</csharp>. However, you can use these templates in any project type.

Just add a new <em>Text Templating -> Preprocessed Razor Template</em> file to the project:

<a href="https://mhut.ch/files/images/MonoScreenshots/PreprocessedRazor-1-NewFile.png" rel="lightbox[md_preprocessedrazor]" title="Adding a new Preprocessed Razor Template"><img src="https://mhut.ch/files/images/MonoScreenshots/t/PreprocessedRazor-1-NewFile.png" alt="Adding a new Preprocessed Razor Template" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

You will see that this adds a cshtml Razor C# file to the project, grouped with a C# file that contains the generated code. Like T4 files, this uses the "custom tool" extensibility mechanism. By setting the custom tool property on the <code>cshtml</code> file set to "RazorTemplatePreprocessor", it causes MonoDevelop to use this new custom tool to regenerate the <code>cs</code> file whenever the <code>cshtml</code> file is saved.
 
<a href="https://mhut.ch/files/images/MonoScreenshots/PreprocessedRazor-2-AddedFile.png" rel="lightbox[md_preprocessedrazor]" title="The files added by the Preprocessed Razor Template"><img src="https://mhut.ch/files/images/MonoScreenshots/t/PreprocessedRazor-2-AddedFile.png" alt="The files added by the Preprocessed Razor Template" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

I wrote a simple Razor page to demonstrate the power of Razor. It uses a simple Razor helper to demonstrate that Razor helpers work correctly. The page also demonstrates using the <code>@model</code> directive to specify the type for a Model property, which easily allows us to pass data into the template before running it. Since this demo is very simple, I just used an <csharp>int</csharp> as the model instead of defining a proper model class.

<csharp>
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
</csharp>

When writing this, the Razor code completion was very helpful. It has full C# completion, including locals, helpers and members from the generated class and base class, including the generated <csharp>Model</csharp> property:

<a href="https://mhut.ch/files/images/MonoScreenshots/PreprocessedRazor-3-CSharpBaseCompletion.png" rel="lightbox[md_preprocessedrazor]" title="Code completion for C# in Razor Templates"><img src="https://mhut.ch/files/images/MonoScreenshots/t/PreprocessedRazor-3-CSharpBaseCompletion.png" alt="Code completion for C# in Razor Templates" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

There's also HTML completion and on-the-fly underlining of HTML and Razor errors:

<a href="https://mhut.ch/files/images/MonoScreenshots/PreprocessedRazor-4-HtmlCompletion.png" rel="lightbox[md_preprocessedrazor]" title="Code completion and error underlining for HTML in Razor Templates"><img src="https://mhut.ch/files/images/MonoScreenshots/t/PreprocessedRazor-4-HtmlCompletion.png" alt="Code completion and error underlining for HTML in Razor Templates" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

After saving the <code>cshtml</code> file, you can look at the generated <code>cs</code> file. It's pretty messy, so I won't show it here, but note that it includes a well-commented generated base class. If you want, you can specify a base class using the <code>@inherits</code> directive, so you can pull that generated base class out and share it between multiple templates, or customize it. The template's only dependency is <code>Action<System.IO.TextWriter></code>, and the default base class's dependencies are only <code>System.Web.HttpUtility.HtmlEncode(string)</code> and <code>System.IO.StringWriter</code>, so it can easily be made to run anywhere. If your target framework lacks the one potentially awkward dependency, <code>HttpUtility.HtmlEncode(string)</code>, you can provide an alternative implementation via a custom base class.

More documentation on the generated class and the available directives can be found <a href="http://monodevelop.com/Documentation/Preprocessed_Razor_Templates">on the MonoDevelop website</a>.

To use the template, I simply added two lines to my <code>ViewDidLoad</code> method to instantiate the template, generate a string using the <code>Generate()</code> method, and load it into the <csharp>UIWebView</csharp>:

<csharp>
public override void ViewDidLoad ()
{
    base.ViewDidLoad ();

    var template = new MultiplicationTable () { Model = 12 };
    webview.LoadHtmlString (template.GenerateString (), null);
}
</csharp>

Then run the app, and you can see it in action:

<a href="https://mhut.ch/files/images/MonoScreenshots/PreprocessedRazor-5-RunningOnPhone.png" rel="lightbox[md_preprocessedrazor]" title="Razor Template running on iPhone"><img src="https://mhut.ch/files/images/MonoScreenshots/t/PreprocessedRazor-5-RunningOnPhone.png" alt="Razor Template running on iPhone" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

This is a fantastic way to generate HTML pages without pulling in the whole System.Web stack, and I hope you're as excited about it as I am. It isn't available today, unless you build MonoDevelop from source, however the code is committed to <a href="http://github.com/monodevelop">MonoDevelop master</a> and should make it into the next 3.x release.
