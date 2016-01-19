# mkoby's Dot Files

## Description

This repository contains my dot files. Configuration files for bash, vim, and anything else I might need later.  It currently contains the following files:

* bashrc - This is my current bashrc file. It's still mostly the Ubuntu default, but I've changed the prompt a bit. It also has some RVM stuff in it as well.
* vimrc - My vimrc file. Again very simple but a lot of Ruby/Rails specific stuff.
* vim (folder) - My vim folder. Again mostly Ruby/Rails centric at the moment.
* setup.sh - A setup script that will remove any existing .vim, .vimrc, .bashrc files/folders and link to the ones in this repo. It will also add some git shortcuts I find useful.

## Setup
First you need to clone the repo correctly.  Because I use submodules for several of the vim plugins in the vim/bundle folder, you'll need to run the following command to pull down the repository correctly:

     git clone git@github.com:mkoby/dotmatrix.git --recursive

After you've cloned the repository you'll need to run the setup script.  Running this script will perform the following actions:

1. Remove existing .vimrc, .bashrc, and .vim folder. If they're symbolic links, it will UNLINK and if they're files, it will REMOVE them.
2. Link the folders in your $HOME folder to the files/folders in your local clone of this repo

This script will delete files/folders or unlink symbolic links.  I want to note that I've tested this script locally and it seems to work as expected. If you find errors or know how to make it better, let me know.

     bash setup.sh

## Setup Ruby Version Manager (RVM)
Note: If you're going to run this on OSX, you'll need to install XCode first to get some of the compiler stuff needed to install RVM.

If you want to setup RVM and you have a Linux or OSX machine, you can run the setup_rvm.sh. This currently only supports the Ubuntu variety of Linux (uses apt-get to install pre-reqs). This new version of the script should work for both Ubuntu or OSX, but it hasn't been throughly tested yet. So use at your own risk.

## VIM Plugins
In order to use the included VIM plugins (as submodules) you'll need to first ensure the plugins have been downloaded. If you didn't clone with ```--recursive``` you'll need to do a ```git submodule update``` to pull down the plugin files.

To get the most out of the vim-fuzzyfinder plugin, you'll need to:

1. Have ctags installed (```sudo apt-get install ctags``` on Ubuntu)
2. Your project will have needed have been ctagged. If you doing a rails project something like ```ctag app/**/*.rb``` should get you get you up and running nicely.

For using vim-rubytest I have it set to defaults, which are:

```<Leader>t```: run test case under cursor
```<Leader>T```: run all tests in a file

## Updating Submodules

You'll need to routinely update the submodules to ensure you have the latest versions of all the vim plugins, do update all the submodules you can type the following:

```git submodule foreach git pull origin master```

## Included Git Shortcuts

```git undo```: This will undo the last commit
```git l```: Displays a nice version of the git log complete with branches, SHA's, and commit messages
```git update```: Pulls origin for the current branch to the current branch (with --rebase), also fetches origin.
```git s```: Gives a branch and submodule status
```git com```: Checkout master brnach
```git po```: Pushes current branch to origin, makes a tracking branch

## Warranty

I offer nor imply the offer of any warranty. The script is plain text and you can look at it to see what it does. If you lose work, files, etc, I am not responsible.
