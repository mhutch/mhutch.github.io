---
tags: [ web standards, xhtml, css ]
layout: journal
title: Fluid three-column layout
created: 1148833842
redirect_from:
- /node/96
- /journal/2006/05/28/fluid_three_column_layout
---
Finally, someone found a clean way to do [three-column fluid
layout](http://www.alistapart.com/articles/holygrail) with XHTML and CSS. This
solves just about every three-column layout problem I've ever had. It fixes the
visual elements, keeping the footer at the bottom of the page no matter which
column is the tallest, and resizing without the elements running into each
other.<!--break-->

The visual side of this has been done before &ndash; especially with tables!
&ndash; but what is most important about this version is that is using clean
XHTML, with _no extra non-semantic markup_ needed, though one div tag can be
added for increased browser compatibility. What's more, it allows a good
struture: when it's unstyled, it displays the heading and content before the
navigation. This makes things easier for people with screen readers and older
browsers.

The CSS is pretty clean too, although it's still unbelievable how unintuitive
this is with CSS. It's frustrating that there isn't a simple style to position
elements _relative to the page_, or a way to specify the total width of an
element like IE6 mis-interpreted the CSS box model. The former would be
invaluable for placing fixed-width columns and fixed-height footers, and the
latter would make setting percentage withs a lot easier, especially with the
unintuitive (though useful) way that margins collapse into each other. Some kind
of basic variable substitution with simple arithmetic would be nice too.

*Update: [Matthew Levine](http://www.infocraft.com), the author of this
technique, kindly helped me with a couple of problems. There's a Mozilla bug
that breaks the equal height columns when anchor tags are used, but this feature
can be disabled &ndash; though this limits the design. The second issue was that
self-closing anchor tags break Konqueror's DOM and cause it to move boxes around
strangely. It's also worth reading about the [One True
Layout](http://positioniseverything.net/articles/onetruelayout), on which
Matthew's layout was based.*
