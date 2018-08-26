---
tags:
- mono
- gpus
- linq
layout: journal
title: Brahma on Mono
created: 1224828254
redirect_from: /node/162
---
I'm very excited to see that <a href="http://www.ananthonline.net/">Ananth</a>, the author of the <a href="http://brahma.ananthonline.net/">Brahma LINQ-to-GPU</a> provider, now has it <a href="http://blog.ananthonline.net/?p=25">running on Mono</a> using OpenGL.<!--break-->

If anyone's not heard of <a href="http://en.wikipedia.org/wiki/GPGPU">GPGPU</a>, it's the technique of taking a graphic processor unit and using it to run general-purpose computation. Discrete GPUs are incredibly powerful, so if code is ported effectively,  it sees a massive speedup. However, the graphics-centric APIs and ridiculously parallelised architecture make this non-trivial. This is where Brahma comes in. It takes your C# 3 LINQ expression trees and automagically runs them on your GPU. 

I can't wait to see it running on Linux!