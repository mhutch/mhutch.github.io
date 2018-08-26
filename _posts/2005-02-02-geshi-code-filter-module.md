---
tags: [ drupal, geshicodefilter, syntax highlighting ]
layout: journal
title: GeSHi Code Filter module
created: 1107367932
redirect_from: /node/6
---
I couldn't find a Drupal module to syntax highlight C# code, so I made one. I'm using the Generic Syntax Highlighter, <a href="http://qbnz.com/highlighter/">GeSHi</a>, to drive a filter loosely based on the <a href="http://drupal.org/project/codefilter">codefilter</a> module. While doing this, I discovered Nonstop Bits' <a href="http://www.nonstopbits.org/node/151">Nonstop HiLighter</a> module, which highlight many more languages, but I think GeSHi produces prettier output colours :). The next version will be supporting mixed-language files, such as PHP, CSS and JavaScript in XHTML, which <a href="http://qbnz.com/highlighter/tests/demo-new-parser-index-full.html">looks amazing</a>. It's also very configurable and can output line numbers and XHTML Strict/CSS code, and it wouldn't be hard to add options to the filter to turn these options on.

Using the filter's fairly simple. Once it's installed and registered to an input format, just surround your code with &lt;code _language_&gt;...&lt;/code&gt; tags. Supported languages are actionscript, ada, apache, asm, asp, bash, caddcl, cadlisp, c, c_mac, cpp, csharp, css, delphi, html4strict, java, javascript, lisp, lua, nsis, objc, oobas, pascal, perl, php-brief, php, python, qbasic, smarty, sql, vb, vbnet, visualfoxpro, xml.

Here's some PHP:

```php
function GeSHicodefilter_process_code($matches) {
  // Include the GeSHi library
  include_once('geshi.php');

  // Make a new GeSHi object, with the source, language and path set
  $path = module_get_path('geshicodefilter').'/geshicodefilter/geshi/';
  $geshi = new GeSHi($matches[2], $matches[1], $path);

  //GeSHi settings
  $geshi->set_header_type(GESHI_HEADER_DIV);
  //$geshi->enable_classes();

  //dump the code!
  return $geshi->parse_code();
}
```

And some C#:

```csharp
///<summary>Resizes the world</summary>
public void ResizeWorld(int w, int h)
{
    gridWidth = w;
    gridHeight = h;

    //Setup new grid
    CellGrid = new int[gridWidth, gridHeight];
    oldCellGrid = new int[gridWidth, gridHeight];

    //configure drawing bitmaps
    OnSizeChanged(null);

    //seed the world with cells
    Seed(4);
}
```

Pretty, isn't it? You can get the module from its [project page](/project/GeSHicodefilter).

I also found a modified [wiki module](http://www.petersblog.org/node/484) that uses GeShi to highlight a couple of languages, but it's not completely general. I think I'll just modify the Wiki module to ignore anything inside a `<code>` block (it insists on escaping it all at the moment!) and the GeSHi filter can sort out whatever comes out.
