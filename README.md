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
First you need to clone the repo correctly.  Because I use submodules for several of the vim plugins in the vim/bundle folder, you'll need to run the following command to pull down the repository correctly:

     git clone git@github.com:mkoby/dotmatrix.git --recursive

After you've cloned the repository you'll need to run the setup script.  Running this script will perform the following actions:

1. Remove existing .vimrc, .bashrc, and .vim folder. If they're symbolic links, it will UNLINK and if they're files, it will REMOVE them.
2. Link the folders in your $HOME folder to the files/folders in your local clone of this repo

This script will delete files/folders or unlink symbolic links.  I want to note that I've tested this script locally and it seems to work as expected. If you find errors or know how to make it better, let me know.

     bash setup.sh

Setup Ruby Version Manager (RVM)
--------------------------------
Note: If you're going to run this on OSX, you'll need to install XCode first to get some of the compiler stuff needed to install RVM.

If you want to setup RVM and you have a Linux or OSX machine, you can run the setup_rvm.sh. This currently only supports the Ubuntu variety of Linux (uses apt-get to install pre-reqs). This new version of the script should work for both Ubuntu or OSX, but it hasn't been throughly tested yet. So use at your own risk.

Warranty
--------

I offer nor imply the offer of any warranty. The script is plain text and you can look at it to see what it does. If you lose work, files, etc, I am not responsible.
