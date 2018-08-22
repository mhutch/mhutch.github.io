---
tags:
- pc hardware
- data loss
- hard disc
- failure
- motherboard
layout: journal
title: When South Bridges Go Bad
created: 1175367760
redirect_from: /node/118
---
A couple of years ago I upgraded my computer, and passed the old one on to someone else. I'd had it for over 5 years &mdash; a reliable old Pentium III 733EB plugged into a Soyo 6VCA Slot1 motherboard via a slocket (Slot->Socket converter), with 64MB of PC133 SDRAM and a 20GB Maxtor HDD. Over its lifetime it had gained another 512Mb of RAM, Sapphire Radeon 9000 64MB graphics card with VIVO, a slot loading Pioneer DVD drive, a network card, and a couple of other extras &mdash; and that's only the internals. I'd even licensed an OEM copy of Windows XP Pro (this was well before I converted to Ubuntu).

So why the reminiscing? Well, my trusty old PIII has died. Horribly. The first sign was a burning smell, which was eventually traced to the south bridge on the motherboard. It had overloaded somehow, and melted its package, and the system wouldn't boot at all. This implied that the motherboard was in a very bad way...

After acquiring another Socket 370 motherboard and performing further diagnostics, I realised that although the processor and RAM had miraculously survived, the graphics card was dead. It looks like the sound card and networks card have been fried too. But worst of all, the south bridge seems to have killed the DVD drive and hard disc. It's a data recovery nightmare -- it might be possible to recover the data from the hard disc by sacrificing an identical model for its electronics, but they're hard to come by cheaply. If only I could find one that'd failed mechanically, as most HDDs do.

It's a sobering thought that a catastrophic failure on the motherboard can take out most of the rest of a computer, especially the hard discs. Although my own machine has an extra HDD dedicated to backups, this has made me worried. I need to look at getting removable and off-site backups.
