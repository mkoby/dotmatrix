mkoby's Dot Files
=================

Description
-----------

This repository contains my dot files. Configuration files for bash, vim, and anything else I might need later.  It currently contains the following files:

* bashrc - This is my current bashrc file. It's still mostly the Ubuntu default, but I've changed the prompt a bit. It also has some RVM stuff in it as well.
* vimrc - My vimrc file. Again very simple but a lot of Ruby/Rails specific stuff.
* vim (folder) - My vim folder. Again mostly Ruby/Rails centric at the moment.
* setup.sh - A setup script that will remove any existing .vim, .vimrc, .bashrc files/folders and link to the ones in this repo.

Setup
-----
Running this script will perform the following actions:

1. Remove existing .vimrc, .bashrc, and .vim folder. If they're symbolic links, it will UNLINK and if they're files, it will REMOVE them.
2. Link the folders in your $HOME folder to the files/folders in your local clone of this repo

I want to note that I've tested this script locally and it seems to work as expected. If you find errors or know how to make it better, let me know.

     bash setup.sh

Warranty
--------

I offer nor imply the offer of any warranty. The script is plain text and you can look at it to see what it does. If you lose work, files, etc, I am not responsible.
