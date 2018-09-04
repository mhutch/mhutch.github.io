---
title: Migration to Jekyll
tags: [ site news, jekyll, drupal ]
---

I just finished migrating this site to [Jekyll](https://jekyllrb.com/).

I'm a little sad. I ran Drupal for [over 16 years]({% post_url
2005-01-30-and-so-it-begins %}), and there are few things in my life that have
been constant that long. But all things come to an end, and it served its
purpose well.<!--break-->

It's interesting to come back round to static pages. Before I settled on Drupal,
I briefly wrote my own static site generator, but comments, analytics and online
editing proved too tempting. Now I have them via mechanisms that simply didn't
exist in 2005.

I'd been kicking my Drupal instance and Debian Linode VPS down the road for
years without any issue, but a few months ago a Bitcoin mining worm settled in
my machine, carried in by [Drupalgeddon
2](https://www.drupal.org/sa-core-2018-002). I fixed the vulnerability and did
my best to clear out the infestation, but I didn't trust the machine any more.

Faced with rebuilding a full LAMP installation, I decided instead to smuggle out
my data and set up again elsewhere. I chose Jekyll because I'd used it a few
times, and it's popular and relatively well supported. As it ran on [GitHub
Pages](https://pages.github.com/), I could stop administering my own Linux
server.

Migrating the content with the [Jekyll Drupal
importer](https://import.jekyllrb.com/docs/drupal7) was pretty straightforward,
though I ended up having to do a lot of manual fixup to preserve permalinks and
redirects. I manually migrated years of content from a mismash of HTML and
custom Drupal filters to Markdown and Jekyll Liquid tags, and got a *lot* more
familiar with [VS Code](https://code.visualstudio.com/).

Wading through decades old posts was weird. My writing style, my *self* and the
social environment have all changed. Blogs are still around, but many of the
ways they were used have been replaced by Twitter, Reddit, Tumblr and Facebook.
I almost decided not to allow comments, but during the migration I found some
good discussions in my archives, and so enabled [Disqus](https://disqus.com/).

For theming I started with [Hydeout](https://fongandrew.github.io/hydeout), and
made a lot of minor tweaks. Eventually I want a unique design, and although
that's probably a way off, I'm confident I have a good foundation.

There were a few more unanticipated complications. Recreating my archives and
tags wasn't possible with the sandboxed Jekyll environment supported by GitHub,
so I [set
up](http://joshfrankel.me/blog/deploying-a-jekyll-blog-to-github-pages-with-custom-plugins-and-travisci)
a [Travis CI job](https://travis-ci.org/mhutch/mhutch.github.io) to build and
deploy the site. I also set up Cloudflare as it was the easiest way to port
pattern-based URL redirects from my old domain. Maybe it'll come in handy
someday if I attract the wrong attention.

Now I just need to make time to write more. I've missed it 😊
