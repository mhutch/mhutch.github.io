---
tags: [ mono, gpus, linq ]
title: Brahma on Mono
created: 1224828254
redirect_from:
- /node/162
- /journal/2008/10/24/brahma_mono
---
I'm very excited to see that [Ananth](http://www.ananthonline.net), the author
of the [Brahma LINQ-to-GPU](http://brahma.ananthonline.net) provider, now has it
[running on Mono](http://blog.ananthonline.net/?p=25) using OpenGL.<!--break-->

If anyone's not heard of [GPGPU](http://en.wikipedia.org/wiki/GPGPU), it's the
technique of taking a graphic processor unit and using it to run general-purpose
computation. Discrete GPUs are incredibly powerful, so if code is ported
effectively,  it sees a massive speedup. However, the graphics-centric APIs and
ridiculously parallelised architecture make this non-trivial. This is where
Brahma comes in. It takes your C# 3 LINQ expression trees and automagically runs
them on your GPU.

I can't wait to see it running on Linux!