---
tags: [ university, iraf, edgy, pyraf, python, stsdas, tables, stsci_python ]
title: Adding PyRAF to IRAF on Ubuntu Edgy
created: 1163464282
redirect_from:
- /node/110
- /journal/2006/11/14/adding_pyraf_to_iraf_on_ubuntu_edgy
---
Following up on my earlier post on [installing IRAF on Ubuntu
Edgy](/journal/2006-05-11/install_iraf_on_ubuntu_edgy_amd64), here's a
walkthrough for installing
[PyRAF](http://www.stsci.edu/resources/software_hardware/pyraf), a Python shell
for IRAF. As part of this we'll have to install STSDAS and TABLES, two popular
IRAF packages from [STSCI](http://www.stsci.edu/resources/software_hardware).
<!--break-->

## History of this Document

This is largely based on the [STSDAS installation
instructions](http://www.stsci.edu/resources/software_hardware/stsdas/install)
and the
[stsci_python](http://www.stsci.edu/resources/software_hardware/pyraf/stsci_python/Installation)
installation instructions, adapted and shortened for a simple binary
installation on Ubuntu Edgy.

19 Nov 06
: Changed installation directory from `/usr/local/iraf` to `/iraf`, removed
  need for a chroot on amd64, changed architecture to name `linux` though
  still using `redhat` binaries, tidied up commands, updated to STSDAS/TABLES
  3.6 and stsci_python 2.4.

20 Nov 06
: Added warning about following previous guide, fixed launch script.

24 Nov 06
: Added ipyraf and fixed launch script (again).

26 Dec 06
: Fixed typo in launch script.

15 Jan 07
: Fixed lots of little problems.

7 June 07
: Missed `install` in an `apt-get`.

## Preliminary steps

Throughout this guide I will be working on the assumption that you have followed
my previous walkthrough for installing [IRAF on Ubuntu
Edgy](/journal/2006-05-11/install_iraf_on_ubuntu_edgy_amd64). If this is not the
case you may have to correct some of the install locations.

The installations should be done logged in as the IRAF maintenance user, "iraf".
This can be done using the command "su iraf" from another user's terminal. If
you're working in a chroot, this all must take place within the chroot using
"dchroot -d" or similar. Also, the iraf user must have admin privileges for the
duration of the installation so that the "sudo" command can be used.

First create the folders in the IRAF extern directory. These folders should
already be defined as the location of TABLES and STSDAS in the file
"$hlib/extern.pkg.NOAO"; if not, add them.

```bash
cd /iraf/extern/
mkdir tables stsdas
```

## Install TABLES and STSDAS

Download and extract TABLES

```bash
#download source
cd /iraf/extern/tables/
wget ftp://ftp.stsci.edu/pub/software/stsdas/tables_v3.6/source/tables36.tar.gz
tar -zxf tables36.tar.gz
rm tables36.tar.gz

#download redhat binaries
cd bin.linux/
wget ftp://ftp.stsci.edu/pub/software/stsdas/tables_v3.6/binaries/tables36.bin.rh.tar.gz
tar -zxf tables36.bin.rh.tar.gz
rm tables36.bin.rh.tar.gz
```

Download and extract STSDAS. It also requires compilation of some Python code, but this works fine on amd64.

```bash
#download source
cd /iraf/extern/stsdas
wget ftp://ftp.stsci.edu/pub/software/stsdas/stsdas_v3.6/source/stsdas36.tar.gz
tar -zxf stsdas36.tar.gz
rm stsdas36.tar.gz

#download redhat binaries
cd bin.linux
wget ftp://ftp.stsci.edu/pub/software/stsdas/stsdas_v3.6/binaries/stsdas36.bin.rh.tar.gz
tar -zxf stsdas36.bin.rh.tar.gz
rm stsdas36.bin.rh.tar.gz
```

Now you'll need to compile some of the Python components of STSDAS.

```bash
cd /iraf/extern/stsdas
python python/compileall.py ./python
python python/compileall.py ./python/*
```

## Installing stsci_python and PyRAF

[PyRAF](http://www.stsci.edu/resources/software_hardware/pyraf) comes as part of
[stsci_python](http://www.stsci.edu/resources/software_hardware/pyraf/stsci_python/current/download).

First make sure that you have all of the prerequisites.

```bash
sudo apt-get install python python-numeric tk8.4 libreadline5 python-pmw python-dev python2.4-scipy
```

SciPy is not strictly necessary but it's a useful library of scientific Python code.

Now download and extract stsci_python

```bash
#download and extract
cd /iraf
wget ftp://ra.stsci.edu/pub/pyraf/v2.4/stsci_python-2.4.tar.gz
tar -zxf stsci_python-2.4.tar.gz
rm stsci_python-2.4.tar.gz
cd stsci_python-2.4
```

On i386 we can get libf2c from the repositories,

```bash
#i386 only
sudo apt-get install libf2c2 libf2c2-dev
```

but on amd64 we must download and build it

```bash
#amd64 only
wget ftp://ra.stsci.edu/pub/pyraf/support_pyraf/libf2c.tar.gz
tar -zxf libf2c.tar.gz
rm libf2c.tar.gz
cd libf2c_stsci/
make -f makefile.linux64
```

Though numarray is available from the Edgy repositories, we need to install a
newer version. Be aware that this will overwrite the existing version.

```bash
#install numarray
cd /iraf/stsci_python-2.4/numarray-1.5.2
sudo python setup.py config install --gencode
```

The setup script must then be run, pointed at the correct libf2c. This varies
depending whether we built in (on amd64) or downloaded it (on i386).

```bash
cd /iraf/stsci_python-2.4
#EITHER amd64 version
sudo python setup.py install --with-f2c=/iraf/stsci_python-2.4/libf2c_stsci/
#OR i386 version
sudo python setup.py install --with-f2c=/usr
```

I couldn't find an uninstaller, so I'm not happy that everything is being
installed to /usr instead of /usr/local, but I still haven't worked out the
options needed to do it correctly.

We'll now create a convenience script to launch pyraf in an xgterm with ds9, in
the ~/iraf folder. Create a new file "/usr/local/bin/pyrafshell" containing the
following code, and make it world-executable.

```bash
#!/bin/bash
PID=`pidof ds9`
if [ ! $PID ]; then
    ds9 &
fi
pushd ~/iraf > /dev/null;
xgterm -iconic -geometry 80x24 -sb -title "IRAF" -bg "lemon chiffon" -fg "black" -e pyraf &
popd > /dev/null;
```

If you're in a chroot, you can run this from the host system with the command
'dchroot -d "pyrafshell"'.

Optionally you may create a variant of this script that uses the more advanced
interactive python shell, ipython. This gives you tab completion on python
objects and lots of other useful features, and is due to become the default for
pyraf at some point.

```bash
#install ipython
sudo apt-get install ipython
#create a copy of the existing script
sudo cp /usr/local/bin/pyrafshell /usr/local/bin/ipyrafshell
sudo chmod +x /usr/local/bin/ipyrafshell
```

Edit the new file, "/usr/local/bin/ipyrafshell", and change "-e pyraf" to "-e
pyraf --ipython". If you have not yet run ipython, run it before running
ipyrafshell so that it can create you a profile.

That's it! Log out of the "iraf" account and don't forget to remove its admin
privileges.

You can now run PyRAF with the command "pyraf", STSDAS and TABLES will be usable
from within IRAF and PyRAF, and the command "pyrafshell" will launch a complete
PyRAF session. You may find the [PyRAF Programmer's
Guide](http://stsdas.stsci.edu/pyraf/doc/pyraf_guide) useful, and there's a
[SciPy tutorial](http://www.scipy.org/wikis/topical_software/Tutorial) that also
makes use of PyRAF and PyFITS.
