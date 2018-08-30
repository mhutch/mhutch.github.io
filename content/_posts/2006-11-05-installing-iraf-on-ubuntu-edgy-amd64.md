---
tags: [ university, iraf, ubuntu, edgy, amd64 ]
title: Installing IRAF on Ubuntu Edgy amd64
created: 1162729217
redirect_from:
- /node/109
- /journal/2006/11/05/install_iraf_on_ubuntu_edgy_amd64
- /journal/2006-11-05/install_iraf_on_ubuntu_edgy_amd64
- /journal/2006-05-11/install_iraf_on_ubuntu_edgy_amd64
---
A major part of my final year project depends on using [IRAF](http://iraf.net),
the Image Reduction and Analysis Facility from [NOAO](http://www.noao.edu).
Although it's installed on the university's UNIX Service, the servers it's on
are not particularly fast and have quite a few users, so the interactive bits
like DS9 are barely usable over SSH X11 forwarding. Anyway, I thought I'd
install it on my own machine to make things easier.<!--break-->

I'm using Ubuntu Edgy (6.10) AMD64, but IRAF is not 64-bit safe, so I can't
compile it. Also it has no recent Debian/Ubuntu packages, partially due to
licence issues as far as I can tell, and the most recent ones I tried didn't
work when I installed them. I've therefore decided to document the process of
installing the latest IRAF.NET Red Hat binaries on Edgy. It should work fine on
i386 and AMD64.
<!-- break -->

## History of this Document

The basic procedure is mainly based on
[https://docs.astro.columbia.edu/wiki/IRAF](https://docs.astro.columbia.edu/wiki/IRAF),
with some help from
[http://iraf.net/phpBB2/viewtopic.php?p=135221](http://iraf.net/phpBB2/viewtopic.php?p=135221),
and lots of experimentation.

14 Nov 06
: Added X11IRAF installation instructions and updated launch script.

19 Nov 06
: Changed installation directory from /usr/local/iraf to /iraf, removed need
  for a chroot on amd64, changed architecture to name "linux" though still using
  "redhat" binaries, tidied up commands.

20 Nov 06
: Added additional 32-bit dependencies, fixed typo in an untar command, and
  corrected launch script. Thanks to Mihály Váradi for this.

26 Dec 06
: Fixed typo in launch script.

18 May 07
: Updated DS9 download location to new version.

7 Jun 07
: Another typo; missed a  'mkdir'.

12 Oct 2008
: Added a note about using xlibs-static-dev instead of xlibs-dev on Hardy.

## Install the prequisites

First you'll need the tcsh or csh shell:

```bash
sudo apt-get install tcsh
```

Next you'll need to install the 32-bit termcap-compat, because the enhanced CL
needs it. It's not in the Edgy repositories, so you'll need to download it and
its dependencies from the Breezy repos.

Install them with

```bash
wget http://archive.ubuntu.com/ubuntu/pool/universe/t/termcap-compat/termcap-compat_1.2.3_i386.deb http://archive.ubuntu.com/ubuntu/pool/universe/libc/libc/libc5_5.4.46-15_i386.deb http://archive.ubuntu.com/ubuntu/pool/universe/l/ld.so/ldso_1.9.11-15_i386.deb
sudo dpkg -i ldso_1.9.11-15_i386.deb
sudo dpkg -i libc5_5.4.46-15_i386.deb
sudo dpkg -i termcap-compat_1.2.3_i386.deb
```

If you're on amd64, you'll need to add the "--force-architecture" switch after
each "dpkg". You'll also need to install the 32-bit compatibility libraries:

```bash
sudo apt-get install ia32-libs ia32-libs-gtk linux32
```

_NOTE: a reader has informed me that the xlibs-dev package is no longer
available on Hardy, and so users will needed to install xlibs-static-dev
instead. Presumably 64-bit users not using a chroot will have to force-install
the i386 version._

## Notes for a 32-bit chroot on amd64

If you are using the amd64 version of Edgy, this guide will work fine as-is if
you heed the occasional amd64-specific notes. However, if you ever want to
_build_ code that links against 32-bit libraries, or is not 64-bit safe, you
will need to install a 32-bit chroot and install IRAF inside that. To set up a
chroot, start with [this](http://ubuntuforums.org/showthread.php?t=24575) but
add the extra fstab entries from
[here](http://process-of-elimination.net/wiki/Ubuntu_32bit_CHROOT_for_AMD64).
You will need to install a lot of other libraries into the chroot, including
xlibs, but I don't recall the exact list right now. You can switch into the
chroot with "dchroot -d".

It's possible to install the same binaries both in the chroot and outside it, by
mounting "/iraf" into the same point in the chroot, with a /etc/fstab entry
similar to

```bash
/iraf    /chroot/iraf    none bind 0 0
```

You will need to run all the install tasks in the chroot as well. To compile C
code, you'll need to use GCC-3.4 as your C compiler, not the default GCC-4.1.
Once the binaries are built in the chroot, they should hopefully work directly
from amd64.

As using a chroot is not necessary in most cases, I will not document it
further.

## Create the IRAF user

Use _System>Administration>Users and Groups_ to create an account with username
"iraf", real name "IRAF Maintenance", home directory "/iraf/iraf/local", shell
"/bin/tcsh", and a secure password. Give it administration privileges for the
duration of the installation, so that you can use "sudo" from the IRAF account,
but don't forget to remove them later.

Open a new terminal, create the base IRAF directory and assign ownership to the
IRAF maintenance user:

```bash
sudo mkdir /iraf
sudo chown -R iraf:iraf /iraf
```

Everything else should now be done from the IRAF maintenance user account,
unless specified otherwise. You can do this by switching user from a terminal

```bash
su iraf
```

or by switching into a virtual terminal with _Ctrl+Alt+F2_ and logging in as the IRAF user.

## Create the directory structure

Create the default folder structure and recursively assign ownership to the IRAF user:

```bash
mkdir /iraf
mkdir /iraf/iraf/local
mkdir /iraf/irafbin
mkdir /iraf/irafbin/bin.linux
mkdir /iraf/irafbin/noao.bin.linux
mkdir /iraf/x11iraf
mkdir /iraf/extern
```

## Download and extract the packages

We'll be using the latest 2.13b2 packages, because they come with the enhanced
command line, ecl. I've combined downloading and extracting them into a single
script.

```bash
#download and extract the source
cd /iraf/iraf
wget http://iraf.net/ftp/iraf/V2.13-BETA/as.pcix.gen.gz
tar -zxf as.pcix.gen.gz
rm as.pcix.gen.gz

#move the redhat binaries to the linux directory
cd /iraf/iraf/unix/bin.redhat/
mv * ../bin.linux/

#download and extract the redhat IRAF binaries
cd /iraf/irafbin/bin.linux
wget http://iraf.net/ftp/iraf/V2.13-BETA/ib.rhux.x86.gz
tar -zxpf ib.rhux.x86.gz
rm ib.rhux.x86.gz

#download and extract the redhat NOAO binaries
cd /iraf/irafbin/noao.bin.linux
wget http://iraf.net/ftp/iraf/V2.13-BETA/nb.rhux.x86.gz
tar -zxpf nb.rhux.x86.gz
rm nb.rhux.x86.gz
```

## Install the packages

Initialise the environment for installation

```bash
setenv iraf /iraf/iraf/
cd $iraf/unix/hlib
source irafuser.csh
```

Test the install script

```bash
./install -n
```

Walk through the installer and check that everything works. The defaults should
be fine except that you'll probably want to disable the tape drive and
networking.

Now run it as root for the real install

```bash
sudo ./install
```

## Install X11IRAF

XGTerm is essential for using IRAF's graphical plotting features. It comes as
part of the X11IRAF package, whih also includes other useful things like images
servers and ximtool (though ximtool won't work on Edgy due to a binary
incompatibility).

First you'll need to install the right version of the ncurses library. This
varies depending whether you're on i386 or amd64:

```bash
#on 32-bit it's easy
sudo apt-get install libncurses4

#on amd64 we have to download the package directly
wget http://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses4.2/libncurses4_4.2-10_i386.deb
sudo dpkg --force-architecture -i libncurses4_4.2-10_i386.deb
```

Download the Red Hat binaries for X11IRAF and extract them, then run the installer.

```bash
#download and extract x11iraf
cd /iraf/x11iraf/
wget http://iraf.noao.edu/iraf/ftp/iraf/x11iraf/x11iraf-v1.3.1-bin.redhat.tar.gz
tar -zxf x11iraf-v1.3.1-bin.redhat.tar.gz
rm x11iraf-v1.3.1-bin.redhat.tar.gz

#move redhat binaries to linux directory
mv lib.redhat lib.linux
mv bin.redhat bin.linux

#run the install script as root
sudo ./install
```

Follow through the install script, accepting all the default options except for the app-defaults directory, which should be "/etc/X11/app-defaults". You probably won't need CDL either.

## Install DS9

DS9 is important for viewing and manipulating images, but the version that comes
with Ubuntu Edgy segfaults when communicating with IRAF. Install the latest
Linux version from
[http://hea-www.harvard.edu/RD/ds9](http://hea-www.harvard.edu/RD/ds9/) by
copying it to `/usr/local/bin`.

```bash
#EITHER for amd64
wget http://hea-www.harvard.edu/saord/download/ds9/linux64/ds9.linux64.4.12.tar.gz
tar -zxf ds9.linux64.4.12.tar.gz
rm ds9.linux64.4.12.tar.gz

#OR for i386
wget http://hea-www.harvard.edu/saord/download/ds9/linux/ds9.linux.4.12.tar.gz
tar -zxf ds9.linux.4.12.tar.gz
rm ds9.linux.4.12.tar.gz

#copy to the local bin directory
sudo mv ds9 /usr/local/bin/
```

## Log into IRAF

Any user on the machine can now use IRAF. Before using IRAF for the first time,
you must run mkiraf in your personal iraf directory:

```bash
mkdir ~/iraf
cd ~/iraf
mkiraf
```

Select "xgterm" as your IRAF shell when prompted.

To use IRAF, run xgterm, and from there

```bash
cd ~/iraf
ds9&
ecl
```

## Convenience scripts

Create a file in /usr/local/bin/irafshell and make it executable. It should contain

```bash
#!/bin/bash
PID=`pidof ds9`
if [ ! $PID ]; then
    ds9 &
fi
pushd ~/iraf > /dev/null
xgterm -iconic -geometry 80x24 -sb -title "IRAF" -bg "lemon chiffon" -fg "black" -e "ecl" &
popd > /dev/null
```

The command `irafshell` will then launch a complete IRAF session containing DS9,
xgterm and ecl, based in `~/iraf`.