---
tags: [ gaming, mono, linux, 64-bit, igf ]
title: Dyson, a great game using Mono
created: 1238811079
redirect_from:
- /node/167
- /journal/2009/04/04/dyson_game
---
Last week, [Miguel](http://tirania.org/blog), [Joseph](http://beyondfocus.com)
and I went to [GDC](http://gdconf.com) again to promote the use of Mono as a
runtime for games. I may write about that at a later time.<!--break-->

While we were there, we went to the [Independent Games
Festival](http://www.igf.com) Awards, and there were many interesting-looking
games. One in particular that stood out to me was
[Dyson](http://www.dyson-game.com), because of its elegant, abstract,
procedurally generated art. It's an "ambient real-time strategy" game that
involves exploring and conquering asteroid belts with fleets of self-replicating
seedlings.

The next day, someone talking to us at our GDC booth mentioned that Dyson runs
on Linux using Mono! It uses SDL via the [Tao](http://www.taoframework.com)
wrappers. It doesn't run on 64-bit Linux yet; it looks like Tao.Sdl isn't 64-bit
safe. Fortunately, I have a 32-bit [parallel Mono
environment](http://www.mono-project.com/Parallel_Mono_Environments), which
isn't too hard to set up. However, setting up SDL and the dependencies for
libgdiplus was nontrivial, so I don't recommend this path.

Anyhow, I got it working. Here you can see an almost-conquered asteroid belt:

 ![The Dyson game running on Linux using Mono](/files/images/MonoScreenshots/DysonGame.png)

And a close-up of fending off an invasion:

![The Dyson game running on Linux using Mono](/files/images/MonoScreenshots/DysonGame2.png)

It's a lot of fun, and I'm looking forward to the full game's release! It's
already [listed on Steam](http://store.steampowered.com/app/900804) with a July
31st release date, and says there that Linux is a supported platform &mdash;
does that mean we'll see Steam on Linux soon?
