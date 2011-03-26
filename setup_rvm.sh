#!/bin/bash

#Install the pre-reqs. I'd like to be able to pass a variable at the command 
# line to have it do different things for different OSes/distros (Linux, OSX, 
# Ubuntu, OpenSuse, etc).
sudo apt-get -y install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf curl git-core subversion

#Run the RVM set up command
bash < <( curl -B http://rvm.beginrescueend.com/install/rvm )

#Install various rubies, I use 1.8.7 & 1.9.2 at the moment
rvm install 1.9.2,1.8.7

#Set default to 1.9.2
rvm --default use 1.9.2
