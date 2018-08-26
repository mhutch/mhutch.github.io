---
tags:
- gaming
- mono
- linux
- 64-bit
- igf
layout: journal
title: Dyson, a great game using Mono
created: 1238811079
redirect_from: /node/167
---
Last week, <a href="http://tirania.org/blog">Miguel</a>, <a href="http://beyondfocus.com">Joseph</a> and I went to the <a href="http://gdconf.com/" title="Game Developers Conference">GDC</a> again to promote the use of Mono as a runtime for games. I may write about that at a later time.<!--break-->

While we were there, we went to the [Independent Games Festival](http://www.igf.com) Awards, and there were many interesting-looking games. One in particular that stood out to me was <a href="http://www.dyson-game.com">Dyson</a>, because of its elegant, abstract, procedurally generated art. It's an "ambient real-time strategy" game that involves exploring and conquering asteroid belts with fleets of self-replicating seedlings.

The next day, someone talking to us at our GDC booth mentioned that Dyson runs on Linux using Mono! It uses SDL via the <a href="http://www.taoframework.com/">Tao</a> wrappers. It doesn't run on 64-bit Linux yet; it looks like Tao.Sdl isn't 64-bit safe. Fortunately, I have a 32-bit <a href="http://www.mono-project.com/Parallel_Mono_Environments">parallel Mono environment</a>, which isn't too hard to set up. However, setting up SDL and the dependencies for libgdiplus was nontrivial, so I don't recommend this path.

Anyhow, I got it working. Here you can see an almost-conquered asteroid belt:

 <a href="/files/images/MonoScreenshots/DysonGame.png "><img src="/files/images/MonoScreenshots/DysonGame-thumb.png" alt="The Dyson game running on Linux using Mono" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

And a close-up of fending off an invasion:

<a href="/files/images/MonoScreenshots/DysonGame2.png "><img src="/files/images/MonoScreenshots/DysonGame2-thumb.png" alt="The Dyson game running on Linux using Mono" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

It's a lot of fun, and I'm looking forward to the full game's release! It's already <a href="http://store.steampowered.com/app/900804/">listed on Steam</a> with a July 31st release date, and says there that Linux is a supported platform &mdash; does that mean we'll see Steam on Linux soon?
