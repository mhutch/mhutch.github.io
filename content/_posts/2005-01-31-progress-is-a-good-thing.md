---
tags: [ site news, drupal, css, spam, postgresql ]
title: Progress is a good thing
created: 1107211772
redirect_from:
- /node/5
- /journal/2005/01/31/progress_good_thing
- /journal/2005-01-31/progress_is_a_good_thing
- /journal/2005-31-01/progress_is_a_good_thing
---
I wasn't quite as far as I thought I was.

There were still a few PostgreSQL bugs in Drupal that I had to fix before
getting on with theming the site. This turned out to be too big a task for an
evening so I modified the [Drupal port](http://drupal.org/project/kubrick) of
Michael Heilemann's [Kubrick](http://binarybonsai.com/kubrick) theme, changing
the title picture (anyone recogise the mountain?) and the footer, hacking the
template so that the sidebar vanishes if it has no content, and making a few
other tweaks. Personally I still have my reservations about a fixed-width layout
like this - even though it's _very_ pretty - so when I have time I'll fix it up
to use relative units.<!--break-->

Additional modules I've installed now are
the[PHPTemplate](http://drupal.org/project/phptemplate) theming engine, the
[Article](http://drupal.org/project/article),
[Trackback](http://drupal.org/project/trackback), [Wiki
Markup](http://drupal.org/project/wiki) and [Project
Management](http://drupal.org/project/project). There's not really much else I
need, though I'd like to be able to add screenshots and documentation to the
projects.

I turned on comments for completeness, though I don't  expect to recieve any
yet. It does mean I'll have to be on the watch for comment spam but I don't
think the spammers know about my site yet. Anyway, Drupal offers a Bayesian spam
filter when I need it.
