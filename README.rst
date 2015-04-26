~~~~~~~~~~~~~~~~~~~~~~~~
Pietro Albini's dotfiles
~~~~~~~~~~~~~~~~~~~~~~~~

This repository contains all the dotfiles I need to keep synced between
different machines and servers. Feel free to use any of these snippets, but
some of them may be under an open source license: always check the top of the
source file to be sure.

==========================
Applying the configuration
==========================

If you want to apply this configuration to a machine, you should run the
``apply.sh`` script::

   $ ./apply.sh

That script will **erase all the existing dotfiles matching the ones it will
install**, and install the dotfiles in their final location, using symlinks.
Also, the first time you run it, it will install a git post-receive hook which
will execute the script itself on each pull you make.
