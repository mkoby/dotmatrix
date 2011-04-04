#!/usr/bin/env bash
RVMRC=${HOME}/.rvmrc

#remove $HOME/.rvmrc if exists
if [ -h ${RVMRC} ]; then
	echo ".rvmrc is a LINK, unlinking"
	unlink ${RVMRC}
elif [ -f ${RVMRC} ]; then
	echo ".rvmrc is a FILE, deleting"
	rm -f ${RVMRC}
else
	echo "${RVMRC} was not found"
fi

#Install the pre-reqs. I'd like to be able to pass a variable at the command 
# line to have it do different things for different OSes/distros (Linux, OSX, 
# Ubuntu, OpenSuse, etc).
sudo apt-get -y install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf curl git-core subversion

#Run the RVM set up command
bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )

#Install various rubies, I use 1.8.7 & 1.9.2 at the moment
echo "Installing default rubies"
source "$HOME/.rvm/scripts/rvm"
rvm install 1.9.2,1.8.7

#Set default to 1.9.2
echo "Set default ruby version to 1.9.2"
rvm --default use 1.9.2

#Relinks the rvmrc file to it's proper location
#echo "linking .rvmrc file"
#ln -s `pwd`/rvmrc $RVMRC
