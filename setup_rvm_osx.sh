#!/usr/bin/env bash
RVMRC=${HOME}/.rvmrc

#remove $HOME/.rvmrc if exists
function remove_rvmrc_file {
  if [ -h ${RVMRC} ]; then
	echo ".rvmrc is a LINK, unlinking"
	unlink ${RVMRC}
  elif [ -f ${RVMRC} ]; then
	echo ".rvmrc is a FILE, deleting"
	rm -f ${RVMRC}
  else
	echo "${RVMRC} was not found"
  fi
}

remove_rvmrc_file
#Install the pre-reqs. I'd like to be able to pass a variable at the command 
# line to have it do different things for different OSes/distros (Linux, OSX, 
# Ubuntu, OpenSuse, etc).
ruby -e "$(curl -fsSL https://gist.github.com/raw/323731/install_homebrew.rb)" #install homebrew
brew install wget git bash-completion

#Run the RVM set up command
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

#Install various rubies, I use 1.8.7 & 1.9.2 at the moment
echo "Installing default rubies"
source "$HOME/.rvm/scripts/rvm"
rvm install 1.9.2,1.8.7

#Set default to 1.9.2
echo "Set default ruby version to 1.9.2"
rvm --default use 1.9.2
remove_rvmrc_file

#Relinks the rvmrc file to it's proper location
echo "linking .rvmrc file"
ln -s `pwd`/rvmrc $RVMRC
