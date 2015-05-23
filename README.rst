~~~~~~~~~~~~~~~~~~~~~~~~
Pietro Albini's dotfiles
~~~~~~~~~~~~~~~~~~~~~~~~

This repository contains all the dotfiles I need to keep synced between
different machines and servers.

Except when otherwise specified, all the files in this repository are
released under the terms of the UNLICENSE_ license. This means you can do
anything you want with them, but I can't ensure you'll find them useful, or
that they won't harm your system. Remember to take a look at the header of
each file: if that file has a different license, it's written there.

==========================
Applying the configuration
==========================

If you want to apply this configuration to a machine, you should run the
``apply.sh`` script::

   $ ./apply.sh

That script will **erase all the existing dotfiles matching the ones it will
install**, and install the dotfiles in their final location, using symlinks.

The whole process will take a while, especially because the vim configuration
contains quite a few nested submodules, and it will require compilation of some
binary vim extensions (vimproc and youcompleteme).

Because of that, the first time you apply the dotfiles you may need to install
some dependencies, which are a C compiler, cmake, Python 2 and some headers.
You can install them in Debian/Ubuntu with the following command::

   $ apt install build-essentials cmake python python-dev

.. _UNLICENSE: http://unlicense.org/
