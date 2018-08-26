---
tags:
- university
- css
- drupal
- st john's
- internet explorer
layout: journal
title: St John's College JCR Website goes live
created: 1155809841
redirect_from: /node/107
---
I've just launched the new website for St John's College JCR at <a href="http://johnsjcr.org.uk/">http://johnsjcr.org.uk/</a>. It's based on Drupal 4.7.3 with a lot of extra modules added, but mainly based on the Organic Groups module. This helps to organise all of our little subcommunities and groups. I also hacked together a custom module called groupforums, which displays listings of one of the OG node types as conventional forums, in order to help people get used to the site.<!--break-->

I was surprised how effectively I was able to theme the site just by modifying the default BlueMarine theme. On a site like this it's important that it's accessible by as many people as possible, so unfortunately I just had to go with a table-based layout. For the same reason I also had to avoid transparent PNGs. The world would be a much better place without the legacy of IE6, and IE7 isn't exactly perfect either, as its CSS layout is still slightly broken. The worst of it is that IE7 is similar enough that it breaks on some IE6 workarounds. IE conditional comments seem to be the way to go, but it's a huge pain having to code for different browsers.