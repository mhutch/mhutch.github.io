---
tags:
- mono
- mac
- catchup2010
- gtk#
layout: journal
title: Integrating a GTK# Application with the Mac
created: 1264402242
redirect_from: /node/177
---
In this follow-up to my post on <a href="/journal/2010/01/24/creating_mac_app_bundle_for_gtk_app">turning a GTK# app into a Mac app bundle</a>, I describe how to integrate your application with Mac-specific features such as the main menu, the dock, and file/URL events. This is based on the work I did to integrate MonoDevelop and MonoDoc with the Mac, and largely involves cherry-picking code snippets from these projects. Although it would be nice to isolate this code into a library, I don't have the time at the moment to maintain such a library myself.<!--break-->

<a href="/files/images/MonoScreenshots/MonoDocOnMac.png"><img src="/files/images/MonoScreenshots/MonoDocOnMac.png" alt="MonoDevelop with Mac main menu support" style="max-width:98%; display:block;margin-left:auto;margin-right:auto;" /></a>

GTK# is a nice toolkit, and in my opinion the best cross-platform toolkit for Mono/.NET, but there are some things that just don't have direct cross-platform analogues, such as the Mac main menu. To integrate with such features, you need to implement platform-specific code paths. MonoDevelop does this in some cases using runtime checks:

```csharp
if (PropertyService.IsMac) {
    //some mac-specific behaviour
} else if (PropertyService.IsWindows)
    //some windows-specific behaviour
} else {
    //some default behaviour
}
```

This is great when the platform-specific code doesn't introduce any dependencies, because you have one binary that works across all platforms. However, you can't rely on <a href="https://bugzilla.novell.com/show_bug.cgi?id=433108#c4">checking `System.PlatformID.MacOSX`</a> so we have to use some other techniques for platform detection. In <a href="https://raw.github.com/mono/monodevelop/master/main/src/core/MonoDevelop.Core/MonoDevelop.Core/PropertyService.cs">MonoDevelop's PropertyService</a> we can find code based on Mono's `Managed.Windows.Forms/XplatUI` that detects whether the program is running on Mac or Windows. Here are the pertinent parts, copied into a new class:

```csharp
public static class PlatformDetection
{
    public readonly static bool IsWindows;
    public readonly static bool IsMac;

    static PlatformDetection ()
    {
        IsWindows = Path.DirectorySeparatorChar == '\\';
        IsMac = !IsWindows && IsRunningOnMac();
    }

    //From Managed.Windows.Forms/XplatUI
    static bool IsRunningOnMac ()
    {
        IntPtr buf = IntPtr.Zero;
        try {
            buf = System.Runtime.InteropServices.Marshal.AllocHGlobal (8192);
            // This is a hacktastic way of getting sysname from uname ()
            if (uname (buf) == 0) {
                string os = System.Runtime.InteropServices.Marshal.PtrToStringAnsi (buf);
                if (os == "Darwin")
                    return true;
            }
        } catch {
        } finally {
            if (buf != IntPtr.Zero)
                System.Runtime.InteropServices.Marshal.FreeHGlobal (buf);
        }
        return false;
    }

    [System.Runtime.InteropServices.DllImport ("libc")]
    static extern int uname (IntPtr buf);
}
```

For certain other cases in MonoDevelop, particularly ones that introduce dependencies that only exist on some platforms, we have a "platform service" extension point using Mono.Addins, where a platform-specific addins can provide a platform-specific implementation of our `PlatformService` abstract class, and if none is found we fall back to a default implementation. This means that just one of our binaries is platform-specific. It's also nice because a lot of the platform-specific code is in one place. But there are still many places where certain platforms just need a small behavioural tweak and the overhead of pulling something out into this abstraction layer isn't worthwhile. In such cases we use a quick runtime check instead.

A third option is do build a different version of your binary for Mac, using ifdefs. This is what I did for MonoDoc, because it was easier for a quick hack, but I'll probably go back later and change it to use runtime checks.

```csharp
#if MACOS
    //some mac-specific behaviour that only gets included when you pass /define:MACOS to the C# compiler
#endif
```

The first platform-specific codepath we'll add is the main menu, because that's the one your users are going to notice. There is a GTK library called ige-mac-integration that provides some platform integration features for the main menu and dock, and is included in the Mono framework for Mac. If you exported the DYLD_FALLBACK_LIBRARY_PATH like I described in my post about building the app bundle, you should be able to P/Invoke it. Unfortunately it's quite limited in what it can do, so we don't use it at all in MonoDevelop, but its menu integration is effective for simpler apps like MonoDoc. In the MonoDoc source you can find a <a href="https://raw.github.com/mono/mono-tools/master/docbrowser/macbuild/IgeMacMenuGlobal.cs">small IGE wrapper</a> in a single file that you can copy into your app. Since P/Invokes are only resolved at runtime if they're used, you can include the code on all platforms provided you only call it on Mac .

```csharp
if (PlatformDetection.IsMac) {
    //enable the global key handler for keyboard shortcuts
    IgeMainMenu.GlobalKeyHandlerEnabled = true;

    //Tell the IGE library to use your GTK menu as the Mac main menu
    IgeMainMenu.MenuBar = yourGtkMenuBar;

    //tell IGE which menu item should be used for the app menu's quit item
    IgeMainMenu.QuitMenuItem = yourQuitMenuItem;

    //add a new group to the app menu, and add some items to it
    var appGroup = IgeMainMenu.AddAppMenuGroup ();
    appGroup.AddMenuItem (yourAboutItem, "About FooApp...");
    appGroup.AddMenuItem (yourPrefsItem, "Preferences...");

    //hide the menu bar so it no longer displays within the window
    yourGtkMenuBar.Hide ();
}
```

The IGE library automatically converts your menu's shortcuts to use Command instead of Control, but if you explicitly check modifiers elsewhere in your code, for example in custom widgets, you may wish to make Mac-specific tweaks to behaviour. If you do need to access modifiers from key events directly, beware that the Mac GTK modifier mappings are very strange; see the MapRawKeys method on MonoDevelop's <a href="https://raw.github.com/mono/monodevelop/master/main/src/core/MonoDevelop.Ide/MonoDevelop.Components.Commands/KeyBindingManager.cs">KeyBindingManager</a> for details.

Next we'll handle the Apple Events that Mac applications in App Bundle form are expected to handle.

The Quit event is sent when the Quit command on your app's the Dock icon is used (among other things), and obviously should cause your app to quit. The Reopen event is sent when the dock is clicked, and should cause your app to show its windows if they're hidden, or if you follow the Mac document-per-window model and no document is open, optionally create a new empty document.

The strange events for developers from other OSes are the file open and URL open events that your app gets set if it's registered to handle file types or URL types. Because the Mac only expects to have a single instance of a bundle app running at once, each app handling multiple documents, Launch Services sends the files or URLs as events to the running instance of the app, or if the app is not running, starts it then sends the events. They are not ever passed to your app as command-line arguments.

MonoDevelop's MacPlatform addin has a wrapper for these events that exposes them as simple static .NET events on a static class called `OSXIntegration.Framework.ApplicationEvents`. Simply copy the entire contents of the <a href="https://github.com/mono/monodevelop/tree/master/main/src/addins/MacPlatform/MacInterop">`MacPlatform/MacInterop`</a> directory and include it in your app, then connect handlers to the `ApplicationEvents` class's static events sometime before starting the GTK mainloop:

```csharp
if (PlatformDetection.IsMac) {
    ApplicationEvents.Quit += delegate (object sender, ApplicationEventArgs e) {
        Application.Quit ();
        e.Handled = true;
    };

    ApplicationEvents.Reopen += delegate (object sender, ApplicationEventArgs e) {
        mainWindow.Deiconify ();
        mainWindow.Visible = true;
        e.Handled = true;
    };

    //optional, only need this if your Info.plist registers to handle urls
    ApplicationEvents.OpenUrls += delegate (object sender, ApplicationUrlEventArgs e) {
        if (e.Urls != null || e.Urls.Count > 0) {
            OpenUrls (e.Urls);
        }
        e.Handled = true;
    };

    //optional, only need this if your Info.plist registers to handle files
    ApplicationEvents.OpenFiles += delegate (object sender, ApplicationFileEventArgs e) {
        if (e.Files != null || e.Files.Count > 0) {
            OpenUrls (e.Files);
        }
        e.Handled = true;
    };
}
```

You might wonder how to register to handle files and URLs in your `Info.plist`. The <a href="http://developer.apple.com/mac/library/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html">Apple docs</a> have the full details, but we can look at the <a href="https://raw.github.com/mono/mono-tools/master/docbrowser/macbuild/Info.plist">MonoDoc Info.plist</a> and the <a href="https://raw.github.com/mono/monodevelop/master/main/build/MacOSX/Info.plist.in">MonoDevelop Info.plist</a> for some basics.

To register URLs, add the `CFBundleURLTypes` key to the Info.plist's main dictionary. Its value should be an array of URL types, where each one is a dictionary defining the name and the schemes (prefixes):

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>MonoDoc</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>monodoc</string>
        </array>
    </dict>
</array>
```

Notice that you're not just registering to handle the URL types, you're also defining them. Launch Services automatically scans app bundles on the system and in the user's directory to build system-wide and per-user databases of URL types and their handlers. So, as soon as your app is present, it could be used to handle the things it claims. You can even define the icon, as an `icns` file to be loaded from your app's `Resources` directory, just like the bundle's icon, and this will show up in Finder.

Registering file types is similar, but there are more keys. You can also register whether your bundle is the default editor, and whether it's an editor or viewer.

```xml
<key>CFBundleDocumentTypes</key>
<array>
    <dict>
        <key>CFBundleTypeIconFile</key>
        <string>monodevelop.sln.icns</string>
        <key>CFBundleTypeExtensions</key>
        <array>
            <string>sln</string>
        </array>
        <key>CFBundleTypeName</key>
        <string>MonoDevelop Solution</string>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>LSIsAppleDefaultForType</key>
        <true/>
    </dict>
</array>
```

With these examples, you should now be able to make your application fit in much better on Mac.

I'm still investigating other Mac integration points for MonoDevelop, such as native file dialogs, but that's likely to take some time, as binding the native toolkits and getting them to play nicely with the GTK mainloop is likely to be difficult, and there are other important things keeping me busy. When they're done I'll be sure to share that code too.

_This is part of the <a href="/tags/catchup2010">Catchup 2010</a> series of posts</a>_.
