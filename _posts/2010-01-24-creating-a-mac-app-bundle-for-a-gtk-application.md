---
excerpt: "While making the MonoDevelop and MonoDoc packages for Mac I learned a few
  things about adapting GTK# apps for Mac, and I'd like to share them so that anyone
  else who's built a GTK# app on Windows or Linux can provide a nice self-contained
  Mac app bundle for their Mac users. This first part will cover building an app bundle,
  and a later post will cover building platform-specific code paths so that your app
  integrates with the main menu and dock.\r\n\r\n"
categories:
- mono
- mac
- catchup2010
- gtk#
layout: journal
title: Creating a Mac App Bundle for a GTK# Application
created: 1264315200
---
While making the MonoDevelop and MonoDoc packages for Mac I learned a few things about adapting GTK# apps for Mac, and I'd like to share them so that anyone else who's built a GTK# app on Windows or Linux can provide a nice self-contained Mac app bundle for their Mac users. This first part will cover building an app bundle, and a later post will cover building platform-specific code paths so that your app integrates with the main menu and dock.

If you're not a Mac developer, you might be wondering exactly what an app bundle is. Well, it's simply a directory with a "<code>.app</code>" extension that contains an application and everything it needs. The Mac GUI shell treats this folder as a self-contained application that can be run directly. It never has to be "installed" as such, but can simply kept wherever the user wants, typically in the system's  <code>Applications</code> folder, and to "uninstall", it's simply deleted. To look inside an app bundle, use the context menu on the bundle in Finder.

The most important part of the app bundle is the Info.plist manifest, which lives in the <code>Contents</code> subdirectory of your app bundle, and describes the application. A plist ("property list") is an Apple structured data format that can be represented in binary or xml formats. We'll be using the xml format, which is fairly simple, if a little odd. Let's look at a simplified version of the MonoDoc app bundle's manifest:
<code lang="xml">
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>monodoc</string>
	<key>CFBundleIconFile</key>
	<string>monodoc.icns</string>
	<key>CFBundleIdentifier</key>
	<string>com.novell.monodoc</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>MonoDoc</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleShortVersionString</key>
	<string>2.2</string>
	<key>CFBundleSignature</key>
	<string>xmmd</string>
	<key>CFBundleVersion</key>
	<string>2.2</string>
	<key>NSAppleScriptEnabled</key>
	<string>NO</string>
</dict>
</plist>
</code>

As you can see, it simply contains key/value pairs to set properties of the app bundle. This is just a subset of the keys you can set, but they're the important ones for our purposes. If you need more, see <a href="http://developer.apple.com/mac/library/documentation/General/Reference/InfoPlistKeyReference/Introduction/Introduction.html">the Apple docs</a>.

The one you need to change are:
<dl>
<dt><b>CFBundleExecutable</b></dt>
<dd>The name of the executable within the <code>Contents/MacOS</code> subdirectory of your bundle that Launch Services will run when opening your app. We'll be using a shell script to run your real executable using Mono.</dd>
<dt><b>CFBundleIconFile</b></dt>
<dd>The icon of your app bundle, shown in Finder and the Dock. It should be an icns file created using Icon Composer, and placed in the <code>Contents/Resources</code> subdirectory of your bundle.</dd>
<dt><b>CFBundleIdentifier</b></dt>
<dd>A namespaced unique ID for your app.</dd>
<dt><b>CFBundleName</b></dt>
<dd>The name for your app that will be shown by the dock and menu bar.</dd>
<dt><b>CFBundleShortVersionString</b></dt>
<dd>A short display string for your  app bundle's version.</dd>
<dt><b>CFBundleVersion</b></dt>
<dd>Your app bundle's version.</dd>
</dl>
Treat the other keys as boilerplate that must be included. Much of the app bundle layout and properties are designed for apps using the native toolkits; we are using just enough of them to fit in and work correctly.

If you read the descriptions of the keys, you'll see that your app bundle directory should have the following structure:
<ul>
    <li><em>YourAppName</em><code>.app</code>
    <ul>
        <li><code>Contents</code>
        <ul>
            <li><code>Info.plist</code></a>
            <li><code>Resources</code>
            <ul>
                <li><em>yourappname</em><code>.icns</code></li>
            </ul>
            </li>
            <li><code>MacOS</code>
            <ul>
                <li><em>yourappname</em></li>
                <li>Your app's real executable, dll, and other files</li>
            </ul>
            </li>
        </ul>
        </li>
    </ul>
    </li>
</ul>

After you've written your Info.plist, made an icon file using Icon Composer (from the Apple Developer Tools), and copied all your app's real file into the bundle's <code>MacOS</code> folder, all we're missing is the launch script. The Apple Launch services can run shell scripts, but doesn't know how to open Mono programs directly, so we use a shell script to start Mono. Let's look at the <a href="http://anonsvn.mono-project.com/viewvc/trunk/mono-tools/docbrowser/macbuild/monodoc">MonoDoc launch script</a>:
<code lang="bash">
#!/bin/sh
# Author: Michael Hutchinson (mhutchinson@novell.com)

DIR=$(cd "$(dirname "$0")"; pwd)
MONO_FRAMEWORK_PATH=/Library/Frameworks/Mono.framework/Versions/Current
export DYLD_FALLBACK_LIBRARY_PATH="$DIR:$MONO_FRAMEWORK_PATH/lib:/lib:/usr/lib"
export PATH="$MONO_FRAMEWORK_PATH/bin:$PATH"

exec mono "$DIR/browser.exe"
</code>

This is very straightforward. It simply gets a full path to the bundle's <code>MacOS</code> directory and puts it in the <code>DIR</code> variable so that can be used later in the script, and sets <code>DYLD_FALLBACK_LIBRARY_PATH</code> to include this directory and the Mono framework directory, so that you can P/Invoke native libraries in your <code>MacOS</code> directory and the Mono framework lib directory. It also sets the <code>PATH</code> environment variable to include the official Mono framework's bin directory, ensuring that the official Mono is used. Using the official Mono is important, because it means you avoid issues specific to users who have MacPorts or some other custom Mono in their <code>PATH</code>, which are likely to be difficult to reproduce or fix. It then executes the app using Mono.

This is a simple script, but it has some deficiencies. We can improve it by taking some code and tricks from the <a href="http://anonsvn.mono-project.com/viewvc/trunk/monodevelop/main/build/MacOSX/monodevelop">MonoDevelop Mac launch script</a>.

First, we'll detect whether the Mono Framework is installed, and if it's not, show a message using AppleScript telling the user to download it. This prevents your app from dying silently if Mono isn't installed. Put this in your script before the exec call.
<code lang="bash">
#mono version check

REQUIRED_MAJOR=2
REQUIRED_MINOR=4
APPNAME="MonoDevelop"

VERSION_TITLE="Cannot launch $APPNAME"
VERSION_MSG="$APPNAME requires the Mono Framework version $REQUIRED_MAJOR.$REQUIRED_MINOR or later."
DOWNLOAD_URL="http://www.go-mono.com/mono-downloads/download.html"

MONO_VERSION="$(mono --version | grep 'Mono JIT compiler version ' |  cut -f5 -d\ )"
MONO_VERSION_MAJOR="$(echo $MONO_VERSION | cut -f1 -d.)"
MONO_VERSION_MINOR="$(echo $MONO_VERSION | cut -f2 -d.)"
if [ -z "$MONO_VERSION" ] \
	|| [ $MONO_VERSION_MAJOR -lt $REQUIRED_MAJOR ] \
	|| [ $MONO_VERSION_MAJOR -eq $REQUIRED_MAJOR -a $MONO_VERSION_MINOR -lt $REQUIRED_MINOR ] 
then
	osascript \
	-e "set question to display dialog \"$VERSION_MSG\" with title \"$VERSION_TITLE\" buttons {\"Cancel\", \"Download...\"} default button 2" \
	-e "if button returned of question is equal to \"Download...\" then open location \"$DOWNLOAD_URL\""
	echo "$VERSION_TITLE"
	echo "$VERSION_MSG"
	exit 1
fi
</code>

We can also take some code to use the "-a" argument to exec to set the process name that will be see by the "ps" commandline tool. Note that this doesn't work on OS 10.4, so we check the OS version and define an exec command in a variable that we can use later.
<code lang="bash">
# Work around a limitation in 'exec' in older versions of macosx
OSX_VERSION=$(uname -r | cut -f1 -d.)
if [ $OSX_VERSION -lt 9 ]; then  # If OSX version is 10.4
	MONO_EXEC="exec mono"
else
	MONO_EXEC="exec -a appname mono"
fi
</code>

Finally, change the exec call from the original version to use our new <code>MONO_EXEC</code> variable, write all console output to a log file in a subdirectory of <code>~/Library/Logs</code>, and pass the value of the <code>MONO_OPTIONS</code> environment variable to Mono. The <code>MONO_OPTIONS</code> environment variable is useful to enable you to to pass diagnostic options to the Mono runtime, such as "--debug", without altering your script.
<code lang="bash">
EXE_PATH="$DIR\appname.exe"
LOG_FILE="$HOME/Library/Logs/$APPNAME/$APPNAME.log"
mkdir -p "`dirname \"$LOG_FILE\"`"
$MONO_EXEC $MONO_OPTIONS "$EXE_PATH" $* 2>&1 1> "$LOG_FILE"
</code>

Let's tidy this all up into a single script, with all the values you need to change for your specific app in one place at the top.
<code lang="bash">
#!/bin/sh

#get the bundle's MacOS directory full path
DIR=$(cd "$(dirname "$0")"; pwd)

#change these values to match your app
EXE_PATH="$DIR\appname.exe"
PROCESS_NAME=appname
APPNAME="AppName"

#set up environment
MONO_FRAMEWORK_PATH=/Library/Frameworks/Mono.framework/Versions/Current
export DYLD_FALLBACK_LIBRARY_PATH="$DIR:$MONO_FRAMEWORK_PATH/lib:/lib:/usr/lib"
export PATH="$MONO_FRAMEWORK_PATH/bin:$PATH"

#mono version check
REQUIRED_MAJOR=2
REQUIRED_MINOR=4

VERSION_TITLE="Cannot launch $APPNAME"
VERSION_MSG="$APPNAME requires the Mono Framework version $REQUIRED_MAJOR.$REQUIRED_MINOR or later."
DOWNLOAD_URL="http://www.go-mono.com/mono-downloads/download.html"

MONO_VERSION="$(mono --version | grep 'Mono JIT compiler version ' |  cut -f5 -d\ )"
MONO_VERSION_MAJOR="$(echo $MONO_VERSION | cut -f1 -d.)"
MONO_VERSION_MINOR="$(echo $MONO_VERSION | cut -f2 -d.)"
if [ -z "$MONO_VERSION" ] \
	|| [ $MONO_VERSION_MAJOR -lt $REQUIRED_MAJOR ] \
	|| [ $MONO_VERSION_MAJOR -eq $REQUIRED_MAJOR -a $MONO_VERSION_MINOR -lt $REQUIRED_MINOR ] 
then
	osascript \
	-e "set question to display dialog \"$VERSION_MSG\" with title \"$VERSION_TITLE\" buttons {\"Cancel\", \"Download...\"} default button 2" \
	-e "if button returned of question is equal to \"Download...\" then open location \"$DOWNLOAD_URL\""
	echo "$VERSION_TITLE"
	echo "$VERSION_MSG"
	exit 1
fi

#get an exec command that will work on the current OS version
OSX_VERSION=$(uname -r | cut -f1 -d.)
if [ $OSX_VERSION -lt 9 ]; then  # If OSX version is 10.4
	MONO_EXEC="exec mono"
else
	MONO_EXEC="exec -a \"$PROCESS_NAME\" mono"
fi

#create log file directory if it doesn't exist
LOG_FILE="$HOME/Library/Logs/$APPNAME/$APPNAME.log"
mkdir -p "`dirname \"$LOG_FILE\"`"

#run app using mono
$MONO_EXEC $MONO_OPTIONS "$EXE_PATH" $* 2>&1 1> "$LOG_FILE"
</code>

Now open a terminal, make the script executable, and execute it.
<code lang="bash">
chmod +x AppName.app/Contents/MacOS/scriptname
./AppName.app/Contents/MacOS/scriptname
</code>

It's useful to run the script directly like this because you will immediately see the result of any errors in it. Assuming the script worked, your app bundle is complete, and you can double-click on it to run it.

In my <a href="http://mjhutchinson.com/journal/2010/01/25/integrating_gtk_application_mac">follow-up post</a> I cover writing platform-specific code paths to integrate your new bundle better with the platform, including using the Mac main menu, and handling Apple events, which will enable your app to handle files and URLs.

<em>This is part of the <a href="http://mjhutchinson.com/tags/catchup2010">Catchup 2010</a> series of posts</a></em>.

