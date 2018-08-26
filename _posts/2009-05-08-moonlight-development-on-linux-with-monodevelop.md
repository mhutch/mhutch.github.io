---
tags:
- photography
- monodevelop
- preview
- moonlight
layout: journal
title: Moonlight Development on Linux with MonoDevelop
created: 1241758162
redirect_from: /node/171
---
Yesterday I made a screencast demonstrating <a href="/journal/2009/05/07/moonlight_development_mac_using_monodevelop">Moonlight Development on Mac using MonoDevelop</a>. Today, I bring you the same thing on Linux:<!--break-->
<div id="mdMoonVidDiv">
	<object data="data:application/x-silverlight-2," type="application/x-silverlight-2" width="600" height="450" style="max-width: 98%; display: block; margin-left: auto; margin-right: auto;">
		<param name="source" value="http://mjhutchinson.com/files/screencasts/SL2VideoPlayerM.xap"/>
		<param name="background" value="white" />
		<param name="enableHtmlAccess" value="True" />
		<param name="initParams" value="m=http://silverlight.services.live.com/99206/Moonlight%20Development%20on%20Linux%20with%20MonoDevelop/video.wmv,thumbnail=http://mjhutchinson.com/files/screencasts/MDMoonDemo.png" />
               <param name="minruntimeversion" value="2.0.31005.0" />
		<a href="http://go.microsoft.com/fwlink/?LinkId=124807" style="text-decoration: none;">
 			<img src="http://go.microsoft.com/fwlink/?LinkId=108181" alt="Get Microsoft Silverlight" style="border-style: none"/>
		</a>
	</object>
</div>
<a href="http://www.go-mono.com/media/MDMoonDemo.ogv" style="display:block;width:100%;text-align:center">Downloadable OGV version</a>

Unfortunately, getting this running isn't quite as simple as the Mac installer. However, if you're on openSUSE/SLED, it's <em>almost</em> as easy, using <a href="http://download.opensuse.org/repositories/home:/MJHutchinson/">my trunk MonoDevelop packages</a> from the openSUSE build service (<a href="http://software.opensuse.org/ymp/home:MJHutchinson/openSUSE_11.1/monodevelop.ymp">1-click install for openSUSE 11.1</a>).

You just have to download and extract my <a href="/files/temp/MoonSDK-Preview-2009-05-05.zip">Moonlight SDK</a>, extract it somewhere, then tell MonoDevelop where it using the MOONLIGHT_2_SDK_PATH environment variable:<code lang="bash">
export MOONLIGHT_2_SDK_PATH=/full/path/to/MoonSDK
monodevelop
</code>


If you don't have openSUSE/SLED, you'll have to use the <a href="http://www.go-mono.com/mono-downloads/download.html">Mono 2.4 VMWare image</a> or build MonoDevelop from trunk. If you build MonoDevelop from trunk, I suggest not installing it, and instead using "make run". If you don't even have Mono 2.4, you'll need to build that too, and please use a <a href="http://www.mono-project.com/Parallel_Mono_Environments">parallel environment</a> if you don't want to risk messing your system up with hard-to-diagnose problems.
