#!/bin/bash

if ! [ -d ~/Downloads ]; then
	mkdir -p ~/Downloads
fi

cd ~/Downloads
wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz 
tar xzvf rubygems-1.8.10.tgz 
rvmsudo ruby ~/Downloads/rubygems-1.8.10/setup.rb
